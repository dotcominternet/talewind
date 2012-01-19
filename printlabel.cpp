#include <cups/cups.h>
#include <cups/ppd.h>
#include <string>
#include <iostream>
#include <stdio.h>
#include <map>
#include <exception>

using namespace std;

class Error: public exception
{
public:
  Error(const string& Message): exception(), Message_(Message) {}
  virtual ~Error() throw() {}
  virtual const char* what() const throw() { return Message_.c_str(); }
private:
  string Message_;
};

map <string, string> gPaperNames;
typedef pair<string, string> str_pair;

static void
FindPapersOptions(ppd_option_t& o)
{
  if (!strcmp(o.keyword, "PageSize"))
  {
    for (int i = 0; i < o.num_choices; ++i)
    {
      ppd_choice_t& c = o.choices[i];

      gPaperNames.insert(str_pair(c.choice, c.text));
    }
  }
}

static void
FindPapersGroup(ppd_group_t& g)
{
  for (int i = 0; i < g.num_options; ++i)
    FindPapersOptions(g.options[i]);
}

static void
FindPapers(ppd_group_t* group, int num_groups)
{
  for (int i = 0; i < num_groups; ++i)
    FindPapersGroup(group[i]);
}

int main(int argc, char** argv)
{
  try
  {
    if (argc < 2)
      throw Error("Usage: test_label <PrinterName>");

    int             num_options = 0;
    cups_option_t*  options = NULL;

    num_options = cupsAddOption("PageSize", "w167h288", num_options, &options);
    num_options = cupsAddOption("scaling", "100", num_options, &options);
    num_options = cupsAddOption("landscape", "yes", num_options, &options);
    num_options = cupsAddOption("DymoHalftoning", "ErrorDiffusion", num_options, &options);
    num_options = cupsAddOption("DymoPrintQuality", "Graphics", num_options, &options);
    //    num_options = cupsAddOption("orientation-requested", "1", num_options, &options);
      

    cupsPrintFile(argv[1], "test.pdf", "TaleWind docket", num_options, options);
    cupsFreeOptions(num_options, options);
  
    return 0;
  }
  catch(std::exception& e)
  {
    std::cerr << e.what() << std::endl;
    return 1;
  }
}
