#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class MsHtml {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLESHEETSCOLLECTION_NAMED_MAX => 1999999

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ALIGNBOTTOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ALIGNHORIZONTALCENTERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ALIGNLEFT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ALIGNRIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ALIGNTOGRID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ALIGNTOP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ALIGNVERTICALCENTERS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ARRANGEBOTTOM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ARRANGERIGHT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BRINGFORWARD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BRINGTOFRONT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CENTERHORIZONTALLY => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CENTERVERTICALLY => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CODE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DELETE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FONTNAME => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FONTSIZE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GROUP => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HORIZSPACECONCATENATE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HORIZSPACEDECREASE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HORIZSPACEINCREASE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HORIZSPACEMAKEEQUAL => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSERTOBJECT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MULTILEVELREDO => 30

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SENDBACKWARD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SENDTOBACK => 33

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWTABLE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SIZETOCONTROL => 35

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SIZETOCONTROLHEIGHT => 36

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SIZETOCONTROLWIDTH => 37

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SIZETOFIT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SIZETOGRID => 39

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SNAPTOGRID => 40

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TABORDER => 41

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TOOLBOX => 42

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MULTILEVELUNDO => 44

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNGROUP => 45

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_VERTSPACECONCATENATE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_VERTSPACEDECREASE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_VERTSPACEINCREASE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_VERTSPACEMAKEEQUAL => 49

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_JUSTIFYFULL => 50

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BACKCOLOR => 51

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BOLD => 52

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BORDERCOLOR => 53

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FLAT => 54

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FORECOLOR => 55

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ITALIC => 56

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_JUSTIFYCENTER => 57

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_JUSTIFYGENERAL => 58

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_JUSTIFYLEFT => 59

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_JUSTIFYRIGHT => 60

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RAISED => 61

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SUNKEN => 62

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNDERLINE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CHISELED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ETCHED => 65

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHADOWED => 66

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FIND => 67

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWGRID => 69

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST0 => 72

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST1 => 73

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST2 => 74

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST3 => 75

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST4 => 76

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST5 => 77

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST6 => 78

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST7 => 79

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST8 => 80

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLIST9 => 81

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECTVERBLISTLAST => 81

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CONVERTOBJECT => 82

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CUSTOMCONTROL => 83

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CUSTOMIZEITEM => 84

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RENAME => 85

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IMPORT => 86

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NEWPAGE => 87

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MOVE => 88

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CANCEL => 89

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FONT => 90

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STRIKETHROUGH => 91

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DELETEWORD => 92

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_EXECPRINT => 93

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_JUSTIFYNONE => 94

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TRISTATEBOLD => 95

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TRISTATEITALIC => 96

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TRISTATEUNDERLINE => 97

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FORWARDDELETE => 98

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FOLLOW_ANCHOR => 2008

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSINPUTIMAGE => 2114

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSINPUTBUTTON => 2115

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSINPUTRESET => 2116

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSINPUTSUBMIT => 2117

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSINPUTUPLOAD => 2118

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSFIELDSET => 2119

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PASTEINSERT => 2120

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REPLACE => 2121

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_EDITSOURCE => 2122

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BOOKMARK => 2123

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HYPERLINK => 2124

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNLINK => 2125

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BROWSEMODE => 2126

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_EDITMODE => 2127

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNBOOKMARK => 2128

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TOOLBARS => 2130

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STATUSBAR => 2131

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FORMATMARK => 2132

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TEXTONLY => 2133

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OPTIONS => 2135

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FOLLOWLINKC => 2136

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FOLLOWLINKN => 2137

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_VIEWSOURCE => 2139

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ZOOMPOPUP => 2140

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BASELINEFONT1 => 2141

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BASELINEFONT2 => 2142

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BASELINEFONT3 => 2143

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BASELINEFONT4 => 2144

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BASELINEFONT5 => 2145

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HORIZONTALLINE => 2150

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LINEBREAKNORMAL => 2151

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LINEBREAKLEFT => 2152

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LINEBREAKRIGHT => 2153

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LINEBREAKBOTH => 2154

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NONBREAK => 2155

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SPECIALCHAR => 2156

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HTMLSOURCE => 2157

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IFRAME => 2158

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HTMLCONTAIN => 2159

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TEXTBOX => 2161

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TEXTAREA => 2162

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CHECKBOX => 2163

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RADIOBUTTON => 2164

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DROPDOWNBOX => 2165

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LISTBOX => 2166

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BUTTON => 2167

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IMAGE => 2168

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OBJECT => 2169

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_1D => 2170

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IMAGEMAP => 2171

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FILE => 2172

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COMMENT => 2173

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCRIPT => 2174

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_JAVAAPPLET => 2175

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PLUGIN => 2176

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PAGEBREAK => 2177

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HTMLAREA => 2178

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PARAGRAPH => 2180

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FORM => 2181

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MARQUEE => 2182

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LIST => 2183

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ORDERLIST => 2184

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNORDERLIST => 2185

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INDENT => 2186

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OUTDENT => 2187

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PREFORMATTED => 2188

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDRESS => 2189

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BLINK => 2190

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DIV => 2191

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TABLEINSERT => 2200

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RCINSERT => 2201

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CELLINSERT => 2202

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CAPTIONINSERT => 2203

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CELLMERGE => 2204

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CELLSPLIT => 2205

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CELLSELECT => 2206

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ROWSELECT => 2207

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COLUMNSELECT => 2208

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TABLESELECT => 2209

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TABLEPROPERTIES => 2210

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CELLPROPERTIES => 2211

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ROWINSERT => 2212

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COLUMNINSERT => 2213

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HELP_CONTENT => 2220

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HELP_ABOUT => 2221

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HELP_README => 2222

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REMOVEFORMAT => 2230

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PAGEINFO => 2231

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TELETYPE => 2232

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETBLOCKFMTS => 2233

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BLOCKFMT => 2234

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWHIDE_CODE => 2235

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TABLE => 2236

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COPYFORMAT => 2237

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PASTEFORMAT => 2238

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GOTO => 2239

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CHANGEFONT => 2240

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CHANGEFONTSIZE => 2241

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CHANGECASE => 2246

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWSPECIALCHAR => 2249

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SUBSCRIPT => 2247

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SUPERSCRIPT => 2248

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CENTERALIGNPARA => 2250

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LEFTALIGNPARA => 2251

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RIGHTALIGNPARA => 2252

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REMOVEPARAFORMAT => 2253

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_APPLYNORMAL => 2254

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_APPLYHEADING1 => 2255

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_APPLYHEADING2 => 2256

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_APPLYHEADING3 => 2257

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DOCPROPERTIES => 2260

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDFAVORITES => 2261

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COPYSHORTCUT => 2262

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVEBACKGROUND => 2263

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETWALLPAPER => 2264

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COPYBACKGROUND => 2265

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CREATESHORTCUT => 2266

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PAGE => 2267

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVETARGET => 2268

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWPICTURE => 2269

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVEPICTURE => 2270

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DYNSRCPLAY => 2271

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DYNSRCSTOP => 2272

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PRINTTARGET => 2273

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IMGARTPLAY => 2274

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IMGARTSTOP => 2275

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IMGARTREWIND => 2276

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PRINTQUERYJOBSPENDING => 2277

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETDESKTOPITEM => 2278

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CONTEXTMENU => 2280

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GOBACKWARD => 2282

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GOFORWARD => 2283

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PRESTOP => 2284

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GOTOCLIPBOARDADDRESS => 2285

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GOTOCLIPBOARDTEXT => 2286

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MP_MYPICS => 2287

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MP_EMAILPICTURE => 2288

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MP_PRINTPICTURE => 2289

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CREATELINK => 2290

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COPYCONTENT => 2291

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LANGUAGE => 2292

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETPRINTTEMPLATE => 2295

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETPRINTTEMPLATE => 2296

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TEMPLATE_PAGESETUP => 2298

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REFRESH => 2300

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STOPDOWNLOAD => 2301

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ENABLE_INTERACTION => 2302

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LAUNCHDEBUGGER => 2310

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BREAKATNEXT => 2311

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSINPUTHIDDEN => 2312

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSINPUTPASSWORD => 2313

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OVERWRITE => 2314

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PARSECOMPLETE => 2315

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HTMLEDITMODE => 2316

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REGISTRYREFRESH => 2317

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COMPOSESETTINGS => 2318

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWALLTAGS => 2327

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWALIGNEDSITETAGS => 2321

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWSCRIPTTAGS => 2322

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWSTYLETAGS => 2323

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWCOMMENTTAGS => 2324

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWAREATAGS => 2325

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWUNKNOWNTAGS => 2326

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWMISCTAGS => 2320

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWZEROBORDERATDESIGNTIME => 2328

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_AUTODETECT => 2329

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCRIPTDEBUGGER => 2330

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETBYTESDOWNLOADED => 2331

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NOACTIVATENORMALOLECONTROLS => 2332

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NOACTIVATEDESIGNTIMECONTROLS => 2333

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NOACTIVATEJAVAAPPLETS => 2334

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NOFIXUPURLSONPASTE => 2335

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_EMPTYGLYPHTABLE => 2336

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDTOGLYPHTABLE => 2337

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REMOVEFROMGLYPHTABLE => 2338

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REPLACEGLYPHCONTENTS => 2339

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWWBRTAGS => 2340

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PERSISTSTREAMSYNC => 2341

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETDIRTY => 2342

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RUNURLSCRIPT => 2343

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ZOOMRATIO => 2344

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETZOOMNUMERATOR => 2345

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETZOOMDENOMINATOR => 2346

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DIRLTR => 2350

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DIRRTL => 2351

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BLOCKDIRLTR => 2352

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BLOCKDIRRTL => 2353

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INLINEDIRLTR => 2354

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INLINEDIRRTL => 2355

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ISTRUSTEDDLG => 2356

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSERTSPAN => 2357

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LOCALIZEEDITOR => 2358

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVEPRETRANSFORMSOURCE => 2370

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_VIEWPRETRANSFORMSOURCE => 2371

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_HERE => 2380

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_TOP => 2381

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_BOTTOM => 2382

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_PAGEUP => 2383

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_PAGEDOWN => 2384

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_UP => 2385

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_DOWN => 2386

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_LEFTEDGE => 2387

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_RIGHTEDGE => 2388

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_PAGELEFT => 2389

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_PAGERIGHT => 2390

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_LEFT => 2391

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SCROLL_RIGHT => 2392

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MULTIPLESELECTION => 2393

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_2D_POSITION => 2394

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_2D_ELEMENT => 2395

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_1D_ELEMENT => 2396

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ABSOLUTE_POSITION => 2397

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LIVERESIZE => 2398

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ATOMICSELECTION => 2399

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_AUTOURLDETECT_MODE => 2400

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IE50_PASTE => 2401

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IE50_PASTE_MODE => 2402

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETIPRINT => 2403

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DISABLE_EDITFOCUS_UI => 2404

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RESPECTVISIBILITY_INDESIGN => 2405

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CSSEDITING_LEVEL => 2406

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UI_OUTDENT => 2407

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UPDATEPAGESTATUS => 2408

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_IME_ENABLE_RECONVERSION => 2409

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_KEEPSELECTION => 2410

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNLOADDOCUMENT => 2411

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OVERRIDE_CURSOR => 2420

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PEERHITTESTSAMEINEDIT => 2423

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TRUSTAPPCACHE => 2425

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BACKGROUNDIMAGECACHE => 2430

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETUSERACTIONTIME => 2431

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BEGINUSERACTION => 2432

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ENDUSERACTION => 2433

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETCUSTOMCURSOR => 2434

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FOLLOWLINKT => 2435

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CARETBROWSINGMODE => 2436

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STYLEMENU_SETNOSTYLE => 2437

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STYLEMENU_GETNOSTYLE => 2438

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STYLEMENU_GETPREFSTYLE => 2439

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STYLEMENU_CHANGESELECTEDSTYLE => 2440

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYPAUSE => 2441

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_MUTEUNMUTE => 2442

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAY => 2443

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PAUSE => 2444

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_STOP => 2445

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_FULLSCREEN_TOGGLE => 2446

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_FULLSCREEN_EXIT => 2447

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_VOLUME_UP => 2448

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_VOLUME_DOWN => 2449

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SEEK_TO_START => 2450

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SEEK_TO_END => 2451

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SEEK_FWD_SMALL => 2452

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SEEK_BACK_SMALL => 2453

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SEEK_FWD_LARGE => 2454

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SEEK_BACK_LARGE => 2455

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_RATE_FASTER => 2456

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_RATE_SLOWER => 2457

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SHOWCONTROLS_TOGGLE => 2458

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_ZOOMMODE_TOGGLE => 2459

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_FRAMESTEP_FWD => 2460

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_FRAMESTEP_BACK => 2461

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_MUTE => 2462

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_UNMUTE => 2463

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SHOW_AUDIO_ACCESS => 2464

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_SHOW_SUBTITLE_ACCESS => 2465

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE0 => 2480

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE1 => 2481

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE2 => 2482

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE3 => 2483

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE4 => 2484

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE5 => 2485

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE6 => 2486

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE7 => 2487

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE8 => 2488

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MEDIA_PLAYRATE9 => 2489

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PASTECONTENTONLY => 2500

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PASTETEXTONLY => 2501

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSERTHTML => 2502

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DEFAULTBLOCK => 6046

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MIMECSET__FIRST__ => 3609

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MIMECSET__LAST__ => 3699

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MENUEXT_FIRST__ => 3700

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MENUEXT_LAST__ => 3732

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MENUEXT_COUNT => 3733

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDCONSOLEMESSAGERECEIVER => 3800

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REMOVECONSOLEMESSAGERECEIVER => 3801

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STARTDIAGNOSTICSMODE => 3802

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETSCRIPTENGINE => 3803

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDDEBUGCALLBACKRECEIVER => 3804

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REMOVEDEBUGCALLBACKRECEIVER => 3805

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DEFAULTPARAGRAPHSEPARATOR => 3900

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BEGINUNDOUNIT => 3901

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ENDUNDOUNIT => 3902

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CLEARUNDO => 3903

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSPECTELEMENT => 3904

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHAREPICTURE => 3905

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ENABLE_OBJECT_RESIZING => 3906

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INSERTTEXT => 3907

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_LAUNCHURICALLBACK => 3908

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FOLLOWLINKN_INPRIVATE => 3909

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FOLLOWLINKT_INPRIVATE => 3910

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FOLLOWLINKEDGE => 3911

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OPEN => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NEW => 2001

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVEAS => 71

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVECOPYAS => 2002

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PRINTPREVIEW => 2003

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWPRINT => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWPAGESETUP => 2011

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PRINT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PAGESETUP => 2004

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SPELL => 2005

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PASTESPECIAL => 2006

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CLEARSELECTION => 2007

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PROPERTIES => 28

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REDO => 29

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UNDO => 43

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SELECTALL => 31

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ZOOMPERCENT => 50

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETZOOM => 68

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_STOP => 2138

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_COPY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PASTE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SAVEPDF => 99

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_TOGGLEREADINGBAR => 15209

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDPDFHIGHLIGHT => 15210

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DELETEPDFHIGHLIGHT => 15211

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDPDFNOTE => 15212

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OPENPDFNOTE => 15213

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_EDITPDFHIGHLIGHT => 15214

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PINKHIGHLIGHT => 15215

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_BLUEHIGHLIGHT => 15216

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GREENHIGHLIGHT => 15217

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_YELLOWHIGHLIGHT => 15218

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NONEHIGHLIGHT => 15219

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PDFREADALOUD => 15220

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHAREPDF => 15221

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PDFDEFINE => 15222

    /**
     * @type {Integer (Int32)}
     */
    static CMD_ZOOM_PAGEWIDTH => -1

    /**
     * @type {Integer (Int32)}
     */
    static CMD_ZOOM_ONEPAGE => -2

    /**
     * @type {Integer (Int32)}
     */
    static CMD_ZOOM_TWOPAGES => -3

    /**
     * @type {Integer (Int32)}
     */
    static CMD_ZOOM_SELECTION => -4

    /**
     * @type {Integer (Int32)}
     */
    static CMD_ZOOM_FIT => -5

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CONTEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_HWND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NEW_TOPLEVELWINDOW => 7050

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PRESERVEUNDOALWAYS => 6049

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PERSISTDEFAULTVALUES => 7100

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PROTECTMETATAGS => 7101

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETFRAMEZONE => 6037

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_REFRESH_THIS => 6042

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_MENUEXT_PLACEHOLDER => 6047

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FIRE_PRINTTEMPLATEUP => 15000

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_FIRE_PRINTTEMPLATEDOWN => 15001

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETPRINTHANDLES => 15002

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_CLEARAUTHENTICATIONCACHE => 15003

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETUSERINITFLAGS => 15004

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETDOCDLGFLAGS => 15005

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_OLEWINDOWSTATECHANGED => 15006

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ACTIVEXINSTALLSCOPE => 15007

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETSESSIONDOCUMENTMODE => 15008

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETSESSIONDOCUMENTMODE => 15009

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETPROFILINGONSTART => 15010

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETPROFILINGONSTART => 15011

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETSCRIPTCONSOLE => 15012

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETNAVIGATEEVENTSINK => 15013

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETDEVTOOLBARCONSOLE => 15016

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_POPSTATEEVENT => 15017

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETPARTIALLAYOUTSTATUS => 15021

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETPARTIALLAYOUTSTATUS => 15022

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ADDPARTIALTESTSTEPCOUNT => 15023

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETL9QUIRKSEMULATIONENABLED => 15024

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETL9QUIRKSEMULATIONENABLED => 15025

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETPOINTERLOCKCONSENT => 15026

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETDEFAULTZOOMLEVEL => 15027

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETELEMENTBOUNDINGBOX => 15028

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETGEOLOCATIONCONSENT => 15029

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ACTIVEXFILTERINGENABLED => 15030

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHARE => 15031

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHAREAPPCACHEEVENT => 15033

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETPRINTMANAGERDOCSOURCE => 15038

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETEXTRAHEADERS => 15039

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETACCESSIBILITYNAME => 15040

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_UPDATESETTINGSFROMREGISTRY => 15041

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_PERFORMEDITACTIVATION => 15042

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETDEFAULTBACKGROUNDCOLOR => 15043

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETDEFAULTBACKGROUNDCOLOR => 15044

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NOTIFYZOOMANDSCROLLANIMATIONEND => 15045

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_NOTIFYCONTEXTMENUDISMISSED => 15046

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETPRINTMANAGERDOCSOURCEASYNC => 15047

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SETPAGEACTIONALLOWEDFLAGS => 15100

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_INVOKEFLIPAHEADTARGET => 15200

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_ENABLEFLIPAHEADTARGET => 15201

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DEBUGGERDYNAMICATTACH => 15202

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DEBUGGERDYNAMICDETACH => 15203

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_DEBUGGERDYNAMICATTACHSOURCERUNDOWN => 15204

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_GETDEBUGGERSTATE => 15205

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SELECTIONSEARCH => 15206

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_SHOWSHAREUI => 15207

    /**
     * @type {Integer (UInt32)}
     */
    static IDM_RUNFLASH => 15208

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CELEMENTCLASSCACHE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECT => 66036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ELEMENT => 66536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITE => 67536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OBJECT => 68536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLE => 69536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BASE_STYLE => 70036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ATTRS => 70536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVENTS => 71536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XOBJ_EXPANDO => 72536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XOBJ_ORDINAL => 73536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ACTIVEX_EXPANDO_BASE => 72536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ACTIVEX_EXPANDO_MAX => 73535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OBJECT_ORDINAL_BASE => 73536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OBJECT_ORDINAL_MAX => 74535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_COLLECTION_MIN => 1000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_COLLECTION_MAX => 2999999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLESHEETSCOLLECTION_NAMED_BASE => 1000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLESHEETSCOLLECTION_ORDINAL_BASE => 2000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLESHEETSCOLLECTION_ORDINAL_MAX => 2999999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EXPANDO_BASE => 3000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EXPANDO_MAX => 3999999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVENTHOOK_SENSITIVE_BASE => 4000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVENTHOOK_SENSITIVE_MAX => 4499999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVENTHOOK_INSENSITIVE_BASE => 4500000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVENTHOOK_INSENSITIVE_MAX => 4999999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PEER_HOLDER_BASE => 5000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASPIXELARRAY_BASE => 5000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASPIXELARRAY_MAX => 2000000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTNAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTSIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTBOLD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTITAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTUNDER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTSTRIKE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTWEIGHT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTCHARSET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTSUPERSCRIPT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CommonCtrl_FONTSUBSCRIPT => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MSDATASRCINTERFACE => -3900

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ADVISEDATASRCCHANGEEVENT => -3901

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDLG => 25000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDLGMODEL => 26000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLPOPUP => 27000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLAPP => 5000

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_INDEX => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_IE3XOBJ_OBJECTALIGN => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_BASEHREF => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_LEFT => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_TOP => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_VISIBLE => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_PARENT => 65544

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_DRAGMODE => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_DRAGICON => 65546

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_TAG => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_TABSTOP => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_TABINDEX => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_HELPCONTEXTID => 65586

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_DEFAULT => 65591

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_CANCEL => 65592

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_LEFTNORUN => 65593

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_TOPNORUN => 65594

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_ALIGNPERSIST => 65596

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_LINKTIMEOUT => 65597

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_LINKTOPIC => 65598

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_LINKITEM => 65599

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_LINKMODE => 65600

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_DATACHANGED => 65601

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_DATAFIELD => 65602

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_DATASOURCE => 65603

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_WHATSTHISHELPID => 65604

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_CONTROLTIPTEXT => 65605

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_STATUSBARTEXT => 65606

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_APPLICATION => 65607

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_BLOCKALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_CONTROLALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_STYLE => 65610

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_COUNT => 65611

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_RIGHT => 65613

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_BOTTOM => 65614

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROPID_XOBJ_GETSVGDOCUMENT => 65615

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONFOCUS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_BEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_AFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONMOUSEOVER => 65544

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONMOUSEOUT => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONHELP => 65546

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDRAGSTART => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONSELECTSTART => 65548

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONFILTER => 65553

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONLOSECAPTURE => 65554

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONPROPERTYCHANGE => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDRAG => 65556

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDRAGEND => 65557

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDRAGENTER => 65558

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDRAGOVER => 65559

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDRAGLEAVE => 65560

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONDROP => 65561

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONCUT => 65562

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONCOPY => 65563

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONPASTE => 65564

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONBEFORECUT => 65565

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONBEFORECOPY => 65566

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONBEFOREPASTE => 65567

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static STDDISPID_XOBJ_ONCELLCHANGE => 65570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NORMAL_FIRST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_NORMAL_FIRST => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ANCHOR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BLOCK => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BODY => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BGSOUND => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DD => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DIR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DIV => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EFONT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FORM => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HEADER => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HEDELEMS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LABEL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LI => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMGBASE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMG => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INPUTIMAGE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INPUT => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INPUTTEXTBASE => 3000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INPUTTEXT => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MENU => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PARA => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SELECT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SELECTOBJ => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TABLE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TEXTSITE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TEXTAREA => 5000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MARQUEE => 6000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RICHTEXT => 7000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BUTTON => 8000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_UL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PHRASE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_UNKNOWNPDL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_COMMENTPDL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TABLECELL => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RANGE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SELECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OPTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_1D => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MAP => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AREA => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PARAM => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TABLESECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TABLEROW => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TABLECOL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SCRIPT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLESHEET => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLERULE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BASE_STYLERULE => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLEPAGE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLESHEETS_COL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLERULES_COL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLEPAGES_COL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MEDIALIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MIMETYPES_COL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PLUGINS_COL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_2D => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OMWINDOW => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVENTOBJ => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PERSISTDATA => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OLESITE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FRAMESET => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LINK => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLEELEMENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FILTERS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OMRECT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMATTRIBUTE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMTEXTNODE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GENERIC => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_URN_COLL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAMESPACE_COLLECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAMESPACE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TAGNAMES_COLLECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLHTTPREQUEST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLSERIALIZER => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMPARSER => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOCUMENTCOMPATIBLEINFO_COLLECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOCUMENTCOMPATIBLEINFO => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XDOMAINREQUEST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMSTORAGEITEM => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMSTORAGE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMSTORAGELIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RULESAPPLIED => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RULESAPPLIED_COLLECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLESHEETRULESAPPLIED_COLLECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROCESSINGINSTRUCTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERPOINT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WEBSOCKET => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_APPLICATIONCACHE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMEVENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMUIEVENT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMOUSEEVENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMOUSEWHEELEVENT => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMWHEELEVENT => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMTEXTEVENT => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMKEYBOARDEVENT => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMCOMPOSITIONEVENT => 1175

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMCUSTOMEVENT => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMUTATIONEVENT => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMFOCUSEVENT => 1250

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGZOOMEVENT => 1275

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMSITEMODEEVENT => 1300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMESSAGEEVENT => 1325

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMSTORAGEEVENT => 1350

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMBEFOREUNLOADEVENT => 1375

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMDRAGEVENT => 1400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMSPOINTEREVENT => 1425

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMSGESTUREEVENT => 1450

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMSTRANSITIONEVENT => 1475

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMSANIMATIONEVENT => 1500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMMSMANIPULATIONEVENT => 1525

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMPROGRESSEVENT => 1550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMCLOSEEVENT => 1525

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OMDOCUMENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DATATRANSFER => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDECL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOCFRAG => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ILINEINFO => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMRANGE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSELECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMTRAVERSAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMEXCEPTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGEXCEPTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RANGEEXCEPTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVENTEXCEPTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOCUMENTTYPE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MEDIA => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MEDIAERROR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TIMERANGES => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOURCE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TRACK => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AUDIO => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_VIDEO => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STYLEMEDIA => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROGRESS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PLAYTO => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PLAYTODEVICE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SCREEN => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FRAMESCOLLECTION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HISTORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LOCATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAVIGATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CLIENTCAPS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TEMPLATE_PRINTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTMANAGER_TEMPLATE_PRINTER => 501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_COLLECTION => 1500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OPTIONS_COL => 1500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CHECKBOX => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RADIO => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FRAMESITE => 68536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FRAME => 69536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IFRAME => 69536

    /**
     * @type {Integer (UInt32)}
     */
    static WEBOC_DISPIDBASE => 70536

    /**
     * @type {Integer (UInt32)}
     */
    static WEBOC_DISPIDMAX => 70636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROTECTEDELEMENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DEFAULTS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MARKUP => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOMIMPLEMENTATION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MEDIAQUERY => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTML5ATTRIBUTESELECTORCI => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGMIXINS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGELEMENT => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGELEMENT_BASE => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGAELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGALTGLYPHDEFELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGALTGLYPHELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGALTGLYPHITEMELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANGLE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATECOLORELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDANGLE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDBOOLEAN => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDENUMERATION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDINTEGER => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDLENGTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDLENGTHLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDNUMBER => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDNUMBERLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDPOINTS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDRECT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDSTRING => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEMOTIONELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATETRANSFORMELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGCIRCLEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGCLIPPATHELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGCOLOR_PROFILEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGCURSORELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGDEFINITION_SRCELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGDEFSELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGDESCELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGELEMENTINSTANCE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGELEMENTINSTANCELIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGELLIPSEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEBLENDELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFECOLORMATRIXELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFECOMPONENTTRANSFERELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGCOMPONENTTRANSFERFUNCTIONELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFECOMPOSITEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFECONVOLVEMATRIXELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEDIFFUSELIGHTINGELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEDISPLACEMENTMAPELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEDISTANTLIGHTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEFLOODELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEFUNCAELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEFUNCBELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEFUNCGELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEFUNCRELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEGAUSSIANBLURELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEIMAGEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEMERGEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEMERGENODEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEMORPHOLOGYELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEOFFSETELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFEPOINTLIGHTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFESPECULARLIGHTINGELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFESPOTLIGHTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFETILEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFETURBULENCEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFILTERELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFONT_FACE_FORMATELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFONT_FACE_NAMEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFONT_FACE_SRCELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFONT_FACE_URIELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFONT_FACEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFONTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFOREIGNOBJECTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGGELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGGLYPHELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGGLYPHREFELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGGRADIENTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGHKERNELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGIMAGEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLENGTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLENGTHLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPRESERVEASPECTRATIO => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDPRESERVEASPECTRATIO => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPOINT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPOINTLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLINEARGRADIENTELEMENT => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLINEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGMARKERELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGMASKELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGMETADATAELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGMISSING_GLYPHELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGMPATHELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGNUMBER => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGNUMBERLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATTERNELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPOLYGONELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPOLYLINEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGRADIALGRADIENTELEMENT => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGRECT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGRECTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSCRIPTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSETELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSTOPELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSTRINGLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSTYLEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSVGELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSWITCHELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSYMBOLELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTITLEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTREFELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTEXTCONTENTELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTEXTCONTENTELEMENT_BASE => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTEXTPOSITIONINGELEMENT => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTEXTPOSITIONINGELEMENT_BASE => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTEXTELEMENT => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTSPANELEMENT => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTEXTPATHELEMENT => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGUSEELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGVIEWELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGVKERNELEMENT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGMATRIX => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTRANSFORM => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTRANSFORMLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGANIMATEDTRANSFORMLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEG => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEG_BASE => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGLIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGARCABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGARCREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCLOSEPATH => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGMOVETOABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGMOVETOREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGLINETOABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGLINETOREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOCUBICABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOCUBICREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOCUBICSMOOTHABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOCUBICSMOOTHREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOQUADRATICABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOQUADRATICREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOQUADRATICSMOOTHABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGCURVETOQUADRATICSMOOTHREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGLINETOHORIZONTALABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGLINETOHORIZONTALREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGLINETOVERTICALABS => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGPATHSEGLINETOVERTICALREL => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASELEMENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASRENDERCONTEXT2D => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASGRADIENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASTEXTMETRICS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASIMAGEDATA => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANVASPIXELARRAY => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PERFORMANCE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PERFORMANCENAVIGATION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PERFORMANCETIMING => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSHTMLWEBVIEWELEMENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WEBGEOLOCATION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WEBGEOPOSITION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WEBGEOCOORDINATES => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WEBGEOPOSITION_ERROR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DATALIST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_ANCHOR => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_AREA => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_BASE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_BODY => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_FORM => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_HEAD => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_IMG => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_INPUT => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_LINK => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_MOD => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_SCRIPT => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_ATTR => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_NAMEDNODEMAP => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_COLLECTION => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_PARAM => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_EMBED => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_BLOCK => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_META => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_STYLE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_SELECT => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_ELEMENTBASE => 66736

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_ELEMENTMAX => 66776

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_ELEMENT => 66736

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_FRAMESITEBASE => 69656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_FRAMEMAX => 70535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_FRAME => 69656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_IFRAME => 69656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_OBJECTBASE => 68566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_OBJECTMAX => 69535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE8_OBJECT => 68566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9_ELEMENTBASE => 66786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9_ELEMENTMAX => 66821

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9_ELEMENT => 66786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE10_ELEMENTBASE => 66822

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE10_ELEMENTMAX => 67535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE10_ELEMENT => 66822

    /**
     * @type {Integer (UInt32)}
     */
    static DISP10_IE10_XMSARIAFLOWFROM => 66835

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_WINDOWOBJECT => -5500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_PERFORMANCEOBJECT => -5505

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_LOCATIONOBJECT => -5506

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HISTORYOBJECT => -5507

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_NAVIGATOROBJECT => -5508

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SECURITYCTX => -5511

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_DLCONTROL => -5512

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_USERAGENT => -5513

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SECURITYDOMAIN => -5514

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DEBUG_ISSECUREPROXY => -5515

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DEBUG_TRUSTEDPROXY => -5516

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DEBUG_INTERNALWINDOW => -5517

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DEBUG_ENABLESECUREPROXYASSERTS => -5518

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_DLIMAGES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_VIDEOS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_BGSOUNDS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_SCRIPTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_JAVA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_RUNACTIVEXCTLS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_DLACTIVEXCTLS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_DOWNLOADONLY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_FRAMEDOWNLOAD => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_RESYNCHRONIZE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_PRAGMA_NO_CACHE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_BEHAVIORS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_METACHARSET => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_URL_ENCODING_DISABLE_UTF8 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_URL_ENCODING_ENABLE_UTF8 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NOFRAMES => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_FORCEOFFLINE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_NO_CLIENTPULL => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_SILENT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_OFFLINEIFNOTCONNECTED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DLCTL_OFFLINE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSUBMIT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONUNLOAD => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONBOUNCE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONFINISH => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSTART => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONLAYOUT => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSCROLL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONRESET => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONRESIZE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONBEFOREUNLOAD => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCHANGEFOCUS => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCHANGEBLUR => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPERSIST => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPERSISTSAVE => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPERSISTLOAD => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCONTEXTMENU => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONBEFOREPRINT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONAFTERPRINT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSTOP => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONBEFOREEDITFOCUS => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMOUSEHOVER => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCONTENTREADY => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONLAYOUTCOMPLETE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPAGE => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONLINKEDOVERFLOW => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMOUSEWHEEL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONBEFOREDEACTIVATE => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMOVE => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCONTROLSELECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSELECTIONCHANGE => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMOVESTART => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMOVEEND => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONRESIZESTART => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONRESIZEEND => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMOUSEENTER => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMOUSELEAVE => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONACTIVATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONDEACTIVATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMULTILAYOUTCLEANUP => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONBEFOREACTIVATE => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONFOCUSIN => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONFOCUSOUT => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONVALUECHANGE => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSELECTADD => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSELECTREMOVE => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSELECTWITHIN => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSYSTEMSCROLLINGSTART => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSYSTEMSCROLLINGEND => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONOBJECTCONTENTSCROLLED => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSTORAGE => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSTORAGECOMMIT => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSHOW => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONHIDE => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONALERT => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPOPUPMENUSTART => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPOPUPMENUEND => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONONLINE => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONOFFLINE => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONHASHCHANGE => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMESSAGE => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONDOMMUTATION => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLOAD => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGUNLOAD => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGABORT => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGERROR => 1072

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGRESIZE => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSCROLL => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGZOOM => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERDOWN => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERMOVE => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERUP => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTEROVER => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTEROUT => 1080

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERCANCEL => 1081

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERHOVER => 1082

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGESTURESTART => 1083

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGESTURECHANGE => 1084

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGESTUREEND => 1085

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGESTUREHOLD => 1086

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGESTURETAP => 1087

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGESTUREDOUBLETAP => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSINERTIASTART => 1089

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSLOSTPOINTERCAPTURE => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGOTPOINTERCAPTURE => 1091

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSTRANSITIONSTART => 1092

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSTRANSITIONEND => 1093

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSANIMATIONSTART => 1094

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSANIMATIONEND => 1095

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSANIMATIONITERATION => 1096

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSGESTUREINIT => 1097

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSMANIPULATIONSTATECHANGED => 1098

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONOPEN => 1099

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCLOSE => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERENTER => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSPOINTERLEAVE => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MSORIENTATIONCHANGE => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONDEVICEORIENTATION => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONDEVICEMOTION => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPAGESHOW => 1106

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONPAGEHIDE => 1107

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONCOMPASSNEEDSCALIBRATION => 1108

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FIRST => 70536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MIN => 70536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MAX => 71535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKGROUNDIMAGE => 70537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTTRANSFORM => 70540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_NOWRAP => 70541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LINEHEIGHT => 70542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTINDENT => 70543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LETTERSPACING => 70544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LANG => 70545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OVERFLOW => 70546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PADDING => 70547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PADDINGTOP => 70548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PADDINGRIGHT => 70549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PADDINGBOTTOM => 70550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PADDINGLEFT => 70551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLEAR => 70552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LISTTYPE => 70553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTFACE => 70554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTSIZE => 70555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTDECORATIONLINETHROUGH => 70556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTDECORATIONUNDERLINE => 70557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTDECORATIONBLINK => 70558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTDECORATIONNONE => 70559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTSTYLE => 70560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTVARIANT => 70561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BASEFONT => 70562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTWEIGHT => 70563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TABLEBORDERCOLOR => 70564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TABLEBORDERCOLORLIGHT => 70565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TABLEBORDERCOLORDARK => 70566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TABLEVALIGN => 70567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKGROUND => 70568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKGROUNDPOSX => 70569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKGROUNDPOSY => 70570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTDECORATION => 70571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARGIN => 70572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARGINTOP => 70573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARGINRIGHT => 70574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARGINBOTTOM => 70575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARGINLEFT => 70576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONT => 70577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTSIZEKEYWORD => 70578

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTSIZECOMBINE => 70579

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKGROUNDREPEAT => 70580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKGROUNDATTACHMENT => 70581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKGROUNDPOSITION => 70582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WORDSPACING => 70583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_VERTICALALIGN => 70584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDER => 70585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERTOP => 70586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERRIGHT => 70587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERBOTTOM => 70588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERLEFT => 70589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERCOLOR => 70590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERTOPCOLOR => 70591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERRIGHTCOLOR => 70592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERBOTTOMCOLOR => 70593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERLEFTCOLOR => 70594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERWIDTH => 70595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERTOPWIDTH => 70596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERRIGHTWIDTH => 70597

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERBOTTOMWIDTH => 70598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERLEFTWIDTH => 70599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERSTYLE => 70600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERTOPSTYLE => 70601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERRIGHTSTYLE => 70602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERBOTTOMSTYLE => 70603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERLEFTSTYLE => 70604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTDECORATIONOVERLINE => 70605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLOAT => 70606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DISPLAY => 70607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LISTSTYLETYPE => 70608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LISTSTYLEPOSITION => 70609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LISTSTYLEIMAGE => 70610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LISTSTYLE => 70611

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WHITESPACE => 70612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PAGEBREAKBEFORE => 70613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PAGEBREAKAFTER => 70614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLL => 70615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_VISIBILITY => 70616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HIDDEN => 70617

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FILTER => 70618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DEFAULTVALUE => 70619

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERCOLLAPSE => 70620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_POSITION => 70626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ZINDEX => 70627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLIP => 70628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLIPRECTTOP => 70629

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLIPRECTRIGHT => 70630

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLIPRECTBOTTOM => 70631

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLIPRECTLEFT => 70632

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTFACESRC => 70633

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TABLELAYOUT => 70634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STYLETEXT => 70635

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LANGUAGE => 70636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CURSOR => 70638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_EVENTSINK => 70639

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PROPNOTIFYSINK => 70640

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ROWSETNOTIFYSINK => 70641

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_INLINESTYLEAA => 70642

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CSTYLEPTRCACHE => 70643

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CRUNTIMESTYLEPTRCACHE => 70644

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_INVOKECONTEXT => 70645

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BGURLIMGCTXCACHEINDEX => 70646

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LIURLIMGCTXCACHEINDEX => 70647

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ROWSETASYNCHNOTIFYSINK => 70648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_FILTERPTRCACHE => 70649

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ROWPOSITIONCHANGESINK => 70650

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BEHAVIOR => 70651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DIR => 70653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_UNICODEBIDI => 70654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DIRECTION => 70655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_IMEMODE => 70656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_RUBYALIGN => 70657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_RUBYPOSITION => 70658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_RUBYOVERHANG => 70659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ONBEHAVIOR_CONTENTREADY => 70660

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ONBEHAVIOR_DOCUMENTREADY => 70661

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CDOMCHILDRENPTRCACHE => 70662

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LAYOUTGRIDCHAR => 70663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LAYOUTGRIDLINE => 70664

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LAYOUTGRIDMODE => 70665

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LAYOUTGRIDTYPE => 70666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LAYOUTGRID => 70667

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTAUTOSPACE => 70668

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LINEBREAK => 70669

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WORDBREAK => 70670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTJUSTIFY => 70671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTJUSTIFYTRIM => 70672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTKASHIDA => 70673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OVERFLOWX => 70675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OVERFLOWY => 70676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HTCDISPATCHITEM_VALUE => 70677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DOCFRAGMENT => 70678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HTCDD_ELEMENT => 70679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HTCDD_CREATEEVENTOBJECT => 70680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_URNATOM => 70681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_UNIQUEPEERNUMBER => 70682

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ACCELERATOR => 70683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ONBEHAVIOR_APPLYSTYLE => 70684

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_RUNTIMESTYLEAA => 70685

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HTCDISPATCHITEM_VALUE_SCRIPTSONLY => 70686

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_EXTENDEDTAGDESC => 70687

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ROTATE => 70688

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ZOOM => 70689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HTCDD_PROTECTEDELEMENT => 70690

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LAYOUTFLOW => 70691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_FILTERNATIVEINFOPTRCACHE => 70692

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HTCDD_ISMARKUPSHARED => 70693

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WORDWRAP => 70694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTUNDERLINEPOSITION => 70695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HASLAYOUT => 70696

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIA => 70697

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_EDITABLE => 70698

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HIDEFOCUS => 70699

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_LAYOUTRECTREGISTRYPTRCACHE => 70700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_HTCDD_DEFAULTS => 70701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTLINETHROUGHSTYLE => 70702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTUNDERLINESTYLE => 70703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTEFFECT => 70704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTBACKGROUNDCOLOR => 70705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_RENDERINGPRIORITY => 70706

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_DWNPOSTPTRCACHE => 70707

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CODEPAGESETTINGSPTRCACHE => 70708

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_DWNDOCPTRCACHE => 70709

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_DATABINDTASKPTRCACHE => 70710

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_URLLOCATIONCACHE => 70711

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARYELEMENTRELEASENOTIFYPTRCACHE => 70712

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_PEERFACTORYURLMAPPTRCACHE => 70713

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_STMDIRTYPTRCACHE => 70714

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_COMPUTEFORMATSTATECACHE => 70715

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBARBASECOLOR => 70716

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBARFACECOLOR => 70717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBAR3DLIGHTCOLOR => 70718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBARSHADOWCOLOR => 70719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBARHIGHLIGHTCOLOR => 70720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBARDARKSHADOWCOLOR => 70721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBARARROWCOLOR => 70722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ONBEHAVIOR_CONTENTSAVE => 70723

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DEFAULTTEXTSELECTION => 70724

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTDECORATIONCOLOR => 70725

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTCOLOR => 70726

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STYLETEXTDECORATION => 70727

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WRITINGMODE => 70728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_MEDIA_REFERENCE => 70729

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_GENERICCOMPLUSREF => 70730

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_FOCUSITEMS => 70731

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SCROLLBARTRACKCOLOR => 70732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_DWNHEADERCACHE => 70733

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FROZEN => 70734

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_VIEWINHERITSTYLE => 70735

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_FRAMESCOLLECTION => 70736

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BGURLIMGCTXCACHEINDEX_FLINE => 70737

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BGURLIMGCTXCACHEINDEX_FLETTER => 70738

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTALIGNLAST => 70739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTKASHIDASPACE => 70740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_FONTHISTORYINDEX => 70741

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ALLOWTRANSPARENCY => 70742

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_URLSEARCHCACHE => 70743

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ISBLOCK => 70744

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTOVERFLOW => 70745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CATTRIBUTECOLLPTRCACHE => 70746

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MINHEIGHT => 70747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_INVOKECONTEXTDOCUMENT => 70748

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_INTERPOLATION => 70749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MAXHEIGHT => 70750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MINWIDTH => 70751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MAXWIDTH => 70752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARYOBJECTRELEASECLEANUPPTRCACHE => 70753

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CONTENT => 70754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CAPTIONSIDE => 70755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COUNTERINCREMENT => 70756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COUNTERRESET => 70757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OUTLINE => 70758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OUTLINEWIDTH => 70759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OUTLINESTYLE => 70760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OUTLINECOLOR => 70761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BOXSIZING => 70762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERSPACING => 70763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ORPHANS => 70764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WIDOWS => 70765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PAGEBREAKINSIDE => 70766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_BEHAVIOR => 70767

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBARBASECOLOR => 70768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBARFACECOLOR => 70769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBAR3DLIGHTCOLOR => 70770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBARSHADOWCOLOR => 70771

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBARHIGHLIGHTCOLOR => 70772

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBARDARKSHADOWCOLOR => 70773

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBARARROWCOLOR => 70774

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLBARTRACKCOLOR => 70775

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTALIGNLAST => 70776

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTOVERFLOW => 70777

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTUNDERLINEPOSITION => 70778

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_WRITINGMODE => 70779

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_IMEMODE => 70780

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_BACKGROUNDPOSX => 70781

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_BACKGROUNDPOSY => 70782

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ACCELERATOR => 70783

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_LAYOUTFLOW => 70784

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ZOOM => 70785

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_EMPTYCELLS => 70786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_BLOCKPROGRESSION => 70787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_QUOTES => 70788

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_BGURLIMGCTXCACHEINDEX_GCBEFORE => 70789

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_BGURLIMGCTXCACHEINDEX_GCAFTER => 70790

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_BGURLIMGCTXCACHEINDEX_URLBEFORE => 70791

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_BGURLIMGCTXCACHEINDEX_URLAFTER => 70792

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AAHEADER => 70793

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_GETTERSETTERCOLLECTION => 70794

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_LAYOUTGRIDCHAR => 70795

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_LAYOUTGRIDLINE => 70796

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_LAYOUTGRIDMODE => 70797

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_LAYOUTGRIDTYPE => 70798

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_LAYOUTGRID => 70799

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_LINEBREAK => 70800

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FILTER => 70801

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_OVERFLOWX => 70802

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_OVERFLOWY => 70803

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTAUTOSPACE => 70804

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTJUSTIFY => 70805

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTKASHIDASPACE => 70806

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_WORDBREAK => 70807

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_WORDWRAP => 70808

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_URIBEFOREREDIRECT => 70809

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ALIGNMENTBASELINE => 70814

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BASELINESHIFT => 70815

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DOMINANTBASELINE => 70816

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTSIZEADJUST => 70817

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTSTRETCH => 70818

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_OPACITY => 70819

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLIPPATH => 70820

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLIPRULE => 70821

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FILL => 70822

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FILLOPACITY => 70823

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FILLRULE => 70824

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_KERNING => 70825

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARKER => 70826

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARKEREND => 70827

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARKERMID => 70828

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MARKERSTART => 70829

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MASK => 70830

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_POINTEREVENTS => 70831

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STOPCOLOR => 70832

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STOPOPACITY => 70833

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKE => 70834

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKEDASHARRAY => 70835

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKEDASHOFFSET => 70836

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKELINECAP => 70837

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKELINEJOIN => 70838

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKEMITERLIMIT => 70839

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKEOPACITY => 70840

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_STROKEWIDTH => 70841

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTANCHOR => 70842

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_GLYPHORIENTATIONHORIZONTAL => 70843

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_GLYPHORIENTATIONVERTICAL => 70844

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CSSFLOAT => 70845

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERRADIUS => 70846

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERTOPLEFTRADIUS => 70847

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERTOPRIGHTRADIUS => 70848

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERBOTTOMRIGHTRADIUS => 70849

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERBOTTOMLEFTRADIUS => 70850

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSFORM => 70851

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_IE9_BACKGROUNDCLIP => 70852

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_IE9_BACKGROUNDORIGIN => 70853

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_IE9_BACKGROUNDSIZE => 70854

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_IE9_BOXSHADOW => 70855

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSFORMORIGIN => 70861

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSFORMORIGINX => 70862

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSFORMORIGINY => 70863

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTSIZEADJUST => 70864

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSITIONPROPERTY => 70866

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSITIONDURATION => 70867

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSITIONTIMINGFUNCTION => 70868

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSITIONDELAY => 70869

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSITION => 70870

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNS => 70871

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNCOUNT => 70872

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNWIDTH => 70873

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNGAP => 70874

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNFILL => 70875

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNSPAN => 70876

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNRULE => 70877

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNRULESTYLE => 70878

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNRULEWIDTH => 70879

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLUMNRULECOLOR => 70880

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BREAKBEFORE => 70881

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BREAKAFTER => 70882

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BREAKINSIDE => 70883

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSFORMORIGINZ => 70884

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_PERSPECTIVE => 70885

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_PERSPECTIVEORIGIN => 70886

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_PERSPECTIVEORIGINX => 70887

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_PERSPECTIVEORIGINY => 70888

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TRANSFORMSTYLE => 70889

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_BACKFACEVISIBILITY => 70890

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLCHAINING => 70891

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMING => 70892

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMSNAPTYPE => 70893

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLRAILS => 70894

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMCHAINING => 70895

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLSNAPTYPE => 70896

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMLIMIT => 70897

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMSNAP => 70898

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMSNAPPOINTS => 70899

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMFACTOR => 70900

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMLIMITMIN => 70901

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_CONTENTZOOMLIMITMAX => 70902

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLSNAPX => 70903

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLSNAPY => 70904

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLSNAPPOINTSX => 70905

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLSNAPPOINTSY => 70906

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_SPELLCHECK => 70907

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDCOLUMN => 70908

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDCOLUMNALIGN => 70909

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDCOLUMNS => 70910

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDCOLUMNSPAN => 70911

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDROW => 70913

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDROWALIGN => 70914

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDROWS => 70915

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_GRIDROWSPAN => 70916

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONNAME => 70917

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONDURATION => 70918

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONTIMINGFUNCTION => 70919

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONDELAY => 70920

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONDIRECTION => 70921

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONPLAYSTATE => 70922

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONITERATIONCOUNT => 70923

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATION => 70924

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_ANIMATIONFILLMODE => 70925

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLOODCOLOR => 70926

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLOODOPACITY => 70927

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_COLORINTERPOLATIONFILTERS => 70928

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_LIGHTINGCOLOR => 70929

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLLIMITXMIN => 70930

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLLIMITYMIN => 70931

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLLIMITXMAX => 70932

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLLIMITYMAX => 70933

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLLIMIT => 70934

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_OVERFLOWSTYLE => 70935

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TEXTSHADOW => 70936

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_WRAPTHROUGH => 70937

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLOWFROM => 70938

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLOWINTO => 70939

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_HYPHENS => 70940

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_HYPHENATE_LIMIT_ZONE => 70941

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_HYPHENATE_LIMIT_CHARS => 70942

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_HYPHENATE_LIMIT_LINES => 70943

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DRAGGABLE => 70944

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_HIGHCONTRASTADJUST => 70945

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ENABLEBACKGROUND => 70946

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_WRAPMARGIN => 70947

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_WRAPFLOW => 70949

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FONTFEATURESETTINGS => 70950

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_USERSELECT => 70951

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TOUCHACTION => 70952

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_CLASSLIST => 70953

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_SCROLLTRANSLATION => 70954

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEX => 70955

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXPOSITIVE => 70956

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXNEGATIVE => 70957

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXPREFERREDSIZE => 70958

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXFLOW => 70959

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXDIRECTION => 70960

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXWRAP => 70961

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXALIGN => 70962

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXITEMALIGN => 70963

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXPACK => 70964

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXLINEPACK => 70965

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_FLEXORDER => 70966

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSFORM => 70967

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSFORMORIGIN => 70968

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSITIONPROPERTY => 70969

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSITIONDURATION => 70970

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSITIONTIMINGFUNCTION => 70971

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSITIONDELAY => 70972

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSITION => 70973

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PERSPECTIVE => 70974

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PERSPECTIVEORIGIN => 70975

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSFORMSTYLE => 70976

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BACKFACEVISIBILITY => 70977

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONNAME => 70978

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONDURATION => 70979

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONTIMINGFUNCTION => 70980

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONDELAY => 70981

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONDIRECTION => 70982

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONPLAYSTATE => 70983

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONITERATIONCOUNT => 70984

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATION => 70985

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ANIMATIONFILLMODE => 70986

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FONTFEATURESETTINGS => 70987

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSFORMORIGINX => 70988

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSFORMORIGINY => 70989

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TRANSFORMORIGINZ => 70990

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PERSPECTIVEORIGINX => 70992

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_PERSPECTIVEORIGINY => 70993

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TOUCHSELECT => 70994

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ERRORPAGEREFRESHURL => 70995

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ERRORPAGEREASON => 70996

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ERRORPAGEDWNPOST => 70997

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLEXDIRECTION => 70998

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLEXWRAP => 70999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLEXFLOW => 71000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ORDER => 71001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLEX => 71002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLEXGROW => 71003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLEXSHRINK => 71004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_FLEXBASIS => 71005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_JUSTIFYCONTENT => 71006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ALIGNITEMS => 71007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ALIGNSELF => 71008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ALIGNCONTENT => 71009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERIMAGE => 71010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERIMAGESOURCE => 71011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERIMAGESLICE => 71012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERIMAGEWIDTH => 71013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERIMAGEOUTSET => 71014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BORDERIMAGEREPEAT => 71015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_DATASET => 71016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_IMEALIGN => 71017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MS_TEXTCOMBINEHORIZONTAL => 71018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_TOUCHACTION => 71019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_APPEARANCE => 71020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BOXALIGN => 71021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BOXORDINALGROUP => 71022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BOXPACK => 71023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BOXFLEX => 71024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BOXORIENT => 71025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BOXDIRECTION => 71026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONFILLMODE => 71027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSFORM => 71028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDSIZE => 71029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKFACEVISIBILITY => 71030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BOXSIZING => 71031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_USERSELECT => 71032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATION => 71033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSITION => 71034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONNAME => 71035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONDURATION => 71036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONTIMINGFUNCTION => 71037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONDELAY => 71038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONITERATIONCOUNT => 71039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONDIRECTION => 71040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_ANIMATIONPLAYSTATE => 71041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSITIONPROPERTY => 71042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSITIONDURATION => 71043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSITIONTIMINGFUNCTION => 71044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSITIONDELAY => 71045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDATTACHMENT => 71046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDCOLOR => 71047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDCLIP => 71048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDIMAGE => 71049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDREPEAT => 71050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDORIGIN => 71051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDPOSITION => 71052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDPOSITIONX => 71053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUNDPOSITIONY => 71054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BACKGROUND => 71055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSFORMORIGIN => 71056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSFORMORIGINX => 71057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSFORMORIGINY => 71058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TRANSFORMORIGINZ => 71059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_TEXTSIZEADJUST => 71060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BORDERIMAGE => 71061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BORDERIMAGESOURCE => 71062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BORDERIMAGESLICE => 71063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BORDERIMAGEWIDTH => 71064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BORDERIMAGEOUTSET => 71065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_WEBKIT_BORDERIMAGEREPEAT => 71066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_FIRST => 71136

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_BACKGROUNDDEFINITION => 71137

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAORIENTATION => 71138

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXWIDTH => 71139

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINWIDTH => 71140

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAWIDTH => 71141

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXHEIGHT => 71142

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINHEIGHT => 71143

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAHEIGHT => 71144

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXDEVICEWIDTH => 71145

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINDEVICEWIDTH => 71146

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIADEVICEWIDTH => 71147

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXDEVICEHEIGHT => 71148

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINDEVICEHEIGHT => 71149

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIADEVICEHEIGHT => 71150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXASPECTRATIO => 71151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINASPECTRATIO => 71152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAASPECTRATIO => 71153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXDEVICEASPECTRATIO => 71154

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINDEVICEASPECTRATIO => 71155

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIADEVICEASPECTRATIO => 71156

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXCOLOR => 71157

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINCOLOR => 71158

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIACOLOR => 71159

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXCOLORINDEX => 71160

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINCOLORINDEX => 71161

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIACOLORINDEX => 71162

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXMONOCHROME => 71163

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINMONOCHROME => 71164

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMONOCHROME => 71165

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMAXRESOLUTION => 71166

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMINRESOLUTION => 71167

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIARESOLUTION => 71168

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CATTRIBUTEPTRCACHE => 71169

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_FONTFACEUNICODERANGE => 71170

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_TOUCHTARGETHANDLER => 71171

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_PAGEFLOWCOLLECTION => 71172

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_NAMEDFLOWCOLLECTION => 71173

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMSHIGHCONTRAST => 71174

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_A_MS_HYPHENATE_LIMIT_WORDS => 71175

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_A_MS_HYPHENATE_LIMIT_BEFORE => 71176

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_A_MS_HYPHENATE_LIMIT_AFTER => 71177

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAMSVIEWSTATE => 71178

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIAATOMIC => 71179

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIAAUTOCOMPLETE => 71180

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIADROPEFFECT => 71181

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIAGRABBED => 71182

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIALABEL => 71183

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIAMULTILINE => 71184

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIAORIENTATION => 71185

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIASORT => 71186

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_ARIAVALUETEXT => 71187

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAGRID => 71188

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIASCAN => 71189

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ACCEVENTRECORDID_START => 71190

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_ACCEVENTRECORDID_END => 71209

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_REQUIRED => 71210

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CSS_PARSEDARY => 71211

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_SOURCELOCATION => 71212

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INTERNAL_CSS_TRACEDSTYLES => 71213

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_BDURLIMGCTXCACHEINDEX => 71214

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAWEBKITDEVICEPIXELRATIO => 71215

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAWEBKITMAXDEVICEPIXELRATIO => 71216

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_A_MEDIAWEBKITMINDEVICEPIXELRATIO => 71217

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGSTYLABLE_CLASSNAME_PROP => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLOCATABLE_NEARESTVIEWPORTELEMENT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLOCATABLE_FARTHESTVIEWPORTELEMENT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLOCATABLE_GETBBOX => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLOCATABLE_GETCTM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLOCATABLE_GETSCREENCTM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLOCATABLE_GETTRANSFORMTOELEMENT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTRANSFORMABLE_TRANSFORM_ATTR => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTRANSFORMABLE_TRANSFORM_PROP => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTESTS_REQUIREDFEATURES_ATTR => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTESTS_REQUIREDFEATURES_PROP => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTESTS_REQUIREDEXTENSIONS_ATTR => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTESTS_REQUIREDEXTENSIONS_PROP => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTESTS_SYSTEMLANGUAGE_ATTR => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTESTS_SYSTEMLANGUAGE_PROP => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGTESTS_HASEXTENSION => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLANGSPACE_XMLLANG => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGLANGSPACE_XMLSPACE => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGEXTERNALRESOURCESREQUIRED_EXTERNALRESOURCESREQUIRED_ATTR => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGEXTERNALRESOURCESREQUIRED_EXTERNALRESOURCESREQUIRED_PROP => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFITTOVIEWBOX_VIEWBOX_ATTR => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFITTOVIEWBOX_VIEWBOX_PROP => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFITTOVIEWBOX_PRESERVEASPECTRATIO_ATTR => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGFITTOVIEWBOX_PRESERVEASPECTRATIO_PROP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGZOOMANDPAN_ZOOMANDPAN => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SVGURIREFERENCE_HREF => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEOVER => 71536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOUSEOVER => 65544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEOUT => 71537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOUSEOUT => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEDOWN => 71538

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONMOUSEDOWN => -605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEUP => 71539

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONMOUSEUP => -607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEMOVE => 71540

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONMOUSEMOVE => -606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONKEYDOWN => 71541

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONKEYDOWN => -602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONKEYUP => 71542

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONKEYUP => -604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONKEYPRESS => 71543

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONKEYPRESS => -603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCLICK => 71544

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONCLICK => -600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDBLCLICK => 71545

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONDBLCLICK => -601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSUBMIT => 71547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSUBMIT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONRESET => 71548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONRESET => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONHELP => 71549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONHELP => 65546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONFOCUS => 71550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONFOCUS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBLUR => 71551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONROWEXIT => 71554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONROWENTER => 71555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBOUNCE => 71556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBOUNCE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREUPDATE => 71557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONAFTERUPDATE => 71558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONAFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREDRAGOVER => 71559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREDROPORPASTE => 71560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVMETH_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONFINISH => 71562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONFINISH => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSTART => 71563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSTART => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONABORT => 71564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSCROLL => 71567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSCROLL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONUNLOAD => 71569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONUNLOAD => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONLAYOUT => 71570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONLAYOUT => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDRAGSTART => 71571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDRAGSTART => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONRESIZE => 71572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONRESIZE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSELECTSTART => 71573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSELECTSTART => 65548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONERRORUPDATE => 71574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREUNLOAD => 71575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFOREUNLOAD => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDATASETCHANGED => 71576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDATAAVAILABLE => 71577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDATASETCOMPLETE => 71578

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONFILTER => 71579

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONFILTER => 65553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCHANGEFOCUS => 71580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCHANGEFOCUS => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCHANGEBLUR => 71581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCHANGEBLUR => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONLOSECAPTURE => 71582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONLOSECAPTURE => 65554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPROPERTYCHANGE => 71583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONPROPERTYCHANGE => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPERSISTSAVE => 71584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONPERSISTSAVE => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDRAG => 71585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDRAG => 65556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDRAGEND => 71586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDRAGEND => 65557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDRAGENTER => 71587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDRAGENTER => 65558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDRAGOVER => 71588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDRAGOVER => 65559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDRAGLEAVE => 71589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDRAGLEAVE => 65560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDROP => 71590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDROP => 65561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCUT => 71591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCUT => 65562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCOPY => 71592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCOPY => 65563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPASTE => 71593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONPASTE => 65564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFORECUT => 71594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFORECUT => 65565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFORECOPY => 71595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFORECOPY => 65566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREPASTE => 71596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFOREPASTE => 65567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPERSISTLOAD => 71597

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONPERSISTLOAD => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONROWSDELETE => 71598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONROWSINSERTED => 71599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCELLCHANGE => 71600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCELLCHANGE => 65570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCONTEXTMENU => 71601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCONTEXTMENU => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREPRINT => 71602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFOREPRINT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONAFTERPRINT => 71603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONAFTERPRINT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSTOP => 71604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSTOP => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREEDITFOCUS => 71605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFOREEDITFOCUS => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONATTACHEVENT => 71606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEHOVER => 71607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOUSEHOVER => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCONTENTREADY => 71608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCONTENTREADY => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONLAYOUTCOMPLETE => 71609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONLAYOUTCOMPLETE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPAGE => 71610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONPAGE => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONLINKEDOVERFLOW => 71611

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONLINKEDOVERFLOW => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEWHEEL => 71612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOUSEWHEEL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREDEACTIVATE => 71613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFOREDEACTIVATE => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOVE => 71614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOVE => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCONTROLSELECT => 71615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONCONTROLSELECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSELECTIONCHANGE => 71616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSELECTIONCHANGE => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOVESTART => 71617

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOVESTART => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOVEEND => 71618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOVEEND => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONRESIZESTART => 71619

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONRESIZESTART => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONRESIZEEND => 71620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONRESIZEEND => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSEENTER => 71621

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOUSEENTER => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMOUSELEAVE => 71622

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMOUSELEAVE => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONACTIVATE => 71623

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONACTIVATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDEACTIVATE => 71624

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDEACTIVATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMULTILAYOUTCLEANUP => 71625

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMULTILAYOUTCLEANUP => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBEFOREACTIVATE => 71626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONBEFOREACTIVATE => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONFOCUSIN => 71627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONFOCUSIN => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONFOCUSOUT => 71628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONFOCUSOUT => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONVALUECHANGE => 71629

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONVALUECHANGE => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSELECTADD => 71630

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSELECTADD => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSELECTREMOVE => 71631

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSELECTREMOVE => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSELECTWITHIN => 71632

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSELECTWITHIN => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSYSTEMSCROLLINGSTART => 71633

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSYSTEMSCROLLINGSTART => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSYSTEMSCROLLINGEND => 71634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSYSTEMSCROLLINGEND => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONOBJECTCONTENTSCROLLED => 71635

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONOBJECTCONTENTSCROLLED => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSTORAGE => 71636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSTORAGE => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSTORAGECOMMIT => 71637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSTORAGECOMMIT => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSHOW => 71638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONSHOW => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONHIDE => 71639

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONHIDE => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONALERT => 71640

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONALERT => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPOPUPMENUSTART => 71641

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONPOPUPMENUSTART => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPOPUPMENUEND => 71642

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONPOPUPMENUEND => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONONLINE => 71643

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONONLINE => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONOFFLINE => 71644

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONOFFLINE => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONHASHCHANGE => 71645

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONHASHCHANGE => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMESSAGE => 71646

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONMESSAGE => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDOMMUTATION => 71647

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVMETH_ONDOMMUTATION => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SINKLIMIT => 71647

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_TIMEOUT => 71648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_WHEEL => 71649

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SVGLOAD => 71650

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SVGUNLOAD => 71651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SVGABORT => 71652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SVGERROR => 71653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SVGRESIZE => 71654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SVGSCROLL => 71655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SVGZOOM => 71656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSTHUMBNAILCLICK => 71657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_COMPOSITIONSTART => 71658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_COMPOSITIONUPDATE => 71659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_COMPOSITIONEND => 71660

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DOMATTRMODIFIED => 71661

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DOMCONTENTLOADED => 71662

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_INPUT => 71663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DOMCHARDATAMODIFIED => 71664

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_TEXTINPUT => 71665

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSSITEMODEJUMPLISTITEMREMOVED => 71666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DOMNODEINSERTED => 71667

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DOMNODEREMOVED => 71668

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DOMSUBTREEMODIFIED => 71669

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_CANPLAY => 71670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_CANPLAYTHROUGH => 71671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DURATIONCHANGE => 71672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_EMPTIED => 71673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ENDED => 71674

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_LOADEDDATA => 71675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_LOADEDMETADATA => 71676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_LOADSTART => 71677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_PAUSE => 71678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_PLAY => 71679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_PLAYING => 71680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_PROGRESS => 71681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_RATECHANGE => 71682

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SEEKED => 71683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SEEKING => 71684

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_STALLED => 71685

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_SUSPEND => 71686

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_TIMEUPDATE => 71687

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_VOLUMECHANGE => 71688

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_WAITING => 71689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTERDOWN => 71690

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTERMOVE => 71691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTERUP => 71692

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTEROVER => 71693

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTEROUT => 71694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTERCANCEL => 71695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTERHOVER => 71696

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSCONNECT => 71697

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSDISCONNECT => 71698

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSGESTURESTART => 71699

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSGESTURECHANGE => 71700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSGESTUREEND => 71701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSGESTUREHOLD => 71702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSGESTURETAP => 71703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSGESTUREDOUBLETAP => 71704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSINERTIASTART => 71705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSLOSTPOINTERCAPTURE => 71706

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSGOTPOINTERCAPTURE => 71707

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSCONTENTZOOM => 71708

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONTRANSITIONSTART => 71709

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONTRANSITIONEND => 71710

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONANIMATIONSTART => 71711

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONANIMATIONEND => 71712

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONANIMATIONITERATION => 71713

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSMANIPULATIONSTATECHANGED => 71714

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONOPEN => 71715

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCLOSE => 71716

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_CHECKING => 71717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_NOUPDATE => 71718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_DOWNLOADING => 71719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_UPDATEREADY => 71720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_CACHED => 71721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_OBSOLETE => 71722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_LOADEND => 71723

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_INVALID => 71724

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSUCCESS => 71725

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONBLOCKED => 71726

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCOMPLETE => 71727

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPOPSTATE => 71728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCUECHANGE => 71729

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONENTER => 71730

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONEXIT => 71731

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_VISIBILITYCHANGE => 71732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSREGIONUPDATE => 71733

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONUPGRADENEEDED => 71734

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSVIDEOFORMATCHANGED => 71735

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ADDTRACK => 71736

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSVIDEOFRAMESTEPCOMPLETED => 71737

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSHOLDVISUAL => 71738

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSVIDEOOPTIMALLAYOUTCHANGED => 71739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSFULLSCREENCHANGE => 71740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSFULLSCREENERROR => 71741

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSELEMENTRESIZE => 71742

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSOURCEOPEN => 71743

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSOURCECLOSE => 71744

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONSOURCEENDED => 71745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONADDSOURCEBUFFER => 71746

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONREMOVESOURCEBUFFER => 71747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSNEEDKEY => 71748

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSKEYMESSAGE => 71749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSKEYERROR => 71750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSKEYADDED => 71751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONDOMCONTENTLOADED => 71752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONCONTENTLOADING => 71753

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONNAVIGATIONSTARTING => 71754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONNAVIGATIONCOMPLETED => 71755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONFRAMEDOMCONTENTLOADED => 71756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONFRAMECONTENTLOADING => 71757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONFRAMENAVIGATIONSTARTING => 71758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONFRAMENAVIGATIONCOMPLETED => 71759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONSCRIPTNOTIFY => 71760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONUNVIEWABLECONTENT => 71761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONUNSAFECONTENTWARNINGDISPLAYING => 71762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONLONGRUNNINGSCRIPTDETECTED => 71763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_WEBGLCONTEXTLOST => 71764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_WEBGLCONTEXTRESTORED => 71765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONUPDATESTART => 71766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONUPDATE => 71767

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONUPDATEEND => 71768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTERENTER => 71769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSPOINTERLEAVE => 71770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSSITEPINNED => 71771

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSORIENTATIONCHANGE => 71772

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDEVICEORIENTATION => 71773

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDEVICEMOTION => 71774

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPAGESHOW => 71775

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONPAGEHIDE => 71776

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSCANDIDATEWINDOWSHOW => 71777

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSCANDIDATEWINDOWUPDATE => 71778

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONMSCANDIDATEWINDOWHIDE => 71779

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_HTML5ONREADYSTATECHANGE => 71780

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_REMOVETRACK => 71781

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONCOMPASSNEEDSCALIBRATION => 71782

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_MSHTMLWEBVIEW_ONCONTAINSFULLSCREENELEMENTCHANGED => 71783

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONTOUCHSTART => 71784

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONTOUCHEND => 71785

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONTOUCHMOVE => 71786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONTOUCHCANCEL => 71787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONWEBKITTRANSITIONEND => 71788

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONWEBKITANIMATIONSTART => 71789

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONWEBKITANIMATIONEND => 71790

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONWEBKITANIMATIONITERATION => 71791

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_WEBGLCONTEXTCREATIONERROR => 71792

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDOMFOCUSIN => 71793

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ONDOMFOCUSOUT => 71794

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROP_ORIENTATIONCHANGE => 71795

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EVPROPS_COUNT => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFILTERSCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLFILTERSCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFILTERSCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMCONSTRUCTOR_CONSTRUCTOR => 66045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LENGTH => 70037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PARENTRULE => 70038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_GETPROPERTYVALUE => 70039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_GETPROPERTYPRIORITY => 70040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_REMOVEPROPERTY => 70041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SETPROPERTY => 70042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONTFAMILY => 70554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONTSTYLE => 70560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONTVARIANT => 70561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONTWEIGHT => 70563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONTSIZE => 70555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONT => 70577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_COLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUND => 70568

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDIMAGE => 70537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDREPEAT => 70580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDATTACHMENT => 70581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDPOSITION => 70582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDPOSITIONX => 70569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDPOSITIONY => 70570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_WORDSPACING => 70583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LETTERSPACING => 70544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTDECORATION => 70571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_VERTICALALIGN => 70584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTTRANSFORM => 70540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTINDENT => 70543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LINEHEIGHT => 70542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARGINTOP => 70573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARGINRIGHT => 70574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARGINBOTTOM => 70575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARGINLEFT => 70576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARGIN => 70572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PADDINGTOP => 70548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PADDINGRIGHT => 70549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PADDINGBOTTOM => 70550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PADDINGLEFT => 70551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PADDING => 70547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDER => 70585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERTOP => 70586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERRIGHT => 70587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERBOTTOM => 70588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERLEFT => 70589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERCOLOR => 70590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERTOPCOLOR => 70591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERRIGHTCOLOR => 70592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERBOTTOMCOLOR => 70593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERLEFTCOLOR => 70594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERWIDTH => 70595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERTOPWIDTH => 70596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERRIGHTWIDTH => 70597

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERBOTTOMWIDTH => 70598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERLEFTWIDTH => 70599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERSTYLE => 70600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERTOPSTYLE => 70601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERRIGHTSTYLE => 70602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERBOTTOMSTYLE => 70603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERLEFTSTYLE => 70604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STYLEFLOAT => 70606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLEAR => 70552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_DISPLAY => 70607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_VISIBILITY => 70616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LISTSTYLETYPE => 70608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LISTSTYLEPOSITION => 70609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LISTSTYLEIMAGE => 70610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LISTSTYLE => 70611

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_WHITESPACE => 70612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TOP => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LEFT => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_ZINDEX => 70627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OVERFLOW => 70546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PAGEBREAKBEFORE => 70613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PAGEBREAKAFTER => 70614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CSSTEXT => 70635

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CURSOR => 70638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLIP => 70628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FILTER => 70618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TABLELAYOUT => 70634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERCOLLAPSE => 70620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_DIRECTION => 70655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BEHAVIOR => 70651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_POSITION => 70626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_UNICODEBIDI => 70654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BOTTOM => 65614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_RIGHT => 65613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_IMEMODE => 70656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_RUBYALIGN => 70657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_RUBYPOSITION => 70658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_RUBYOVERHANG => 70659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LAYOUTGRIDCHAR => 70663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LAYOUTGRIDLINE => 70664

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LAYOUTGRIDMODE => 70665

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LAYOUTGRIDTYPE => 70666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LAYOUTGRID => 70667

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTAUTOSPACE => 70668

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_WORDBREAK => 70670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LINEBREAK => 70669

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTJUSTIFY => 70671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTJUSTIFYTRIM => 70672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTKASHIDA => 70673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OVERFLOWX => 70675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OVERFLOWY => 70676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_ACCELERATOR => 70683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_LAYOUTFLOW => 70691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_ZOOM => 70689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_WORDWRAP => 70694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTUNDERLINEPOSITION => 70695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBARBASECOLOR => 70716

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBARFACECOLOR => 70717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBAR3DLIGHTCOLOR => 70718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBARSHADOWCOLOR => 70719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBARHIGHLIGHTCOLOR => 70720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBARDARKSHADOWCOLOR => 70721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBARARROWCOLOR => 70722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_SCROLLBARTRACKCOLOR => 70732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_WRITINGMODE => 70728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTALIGNLAST => 70739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTKASHIDASPACE => 70740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTOVERFLOW => 70745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MINHEIGHT => 70747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MSINTERPOLATIONMODE => 70749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MAXHEIGHT => 70750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MINWIDTH => 70751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MAXWIDTH => 70752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CONTENT => 70754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CAPTIONSIDE => 70755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_COUNTERINCREMENT => 70756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_COUNTERRESET => 70757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OUTLINE => 70758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OUTLINEWIDTH => 70759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OUTLINESTYLE => 70760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OUTLINECOLOR => 70761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BOXSIZING => 70762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERSPACING => 70763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_ORPHANS => 70764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_WIDOWS => 70765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_PAGEBREAKINSIDE => 70766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_EMPTYCELLS => 70786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MSBLOCKPROGRESSION => 70787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_QUOTES => 70788

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_ALIGNMENTBASELINE => 70814

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BASELINESHIFT => 70815

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_DOMINANTBASELINE => 70816

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONTSIZEADJUST => 70817

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FONTSTRETCH => 70818

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_OPACITY => 70819

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLIPPATH => 70820

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLIPRULE => 70821

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FILL => 70822

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FILLOPACITY => 70823

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_FILLRULE => 70824

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_KERNING => 70825

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARKER => 70826

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARKEREND => 70827

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARKERMID => 70828

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MARKERSTART => 70829

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MASK => 70830

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_POINTEREVENTS => 70831

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STOPCOLOR => 70832

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STOPOPACITY => 70833

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKE => 70834

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKEDASHARRAY => 70835

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKEDASHOFFSET => 70836

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKELINECAP => 70837

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKELINEJOIN => 70838

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKEMITERLIMIT => 70839

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKEOPACITY => 70840

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_STROKEWIDTH => 70841

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_TEXTANCHOR => 70842

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_GLYPHORIENTATIONHORIZONTAL => 70843

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_GLYPHORIENTATIONVERTICAL => 70844

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERRADIUS => 70846

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERTOPLEFTRADIUS => 70847

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERTOPRIGHTRADIUS => 70848

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERBOTTOMRIGHTRADIUS => 70849

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BORDERBOTTOMLEFTRADIUS => 70850

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLIPTOP => 70629

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLIPRIGHT => 70630

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLIPBOTTOM => 70631

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CLIPLEFT => 70632

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_CSSFLOAT => 70845

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDCLIP => 70852

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDORIGIN => 70853

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BACKGROUNDSIZE => 70854

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_BOXSHADOW => 70855

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MSTRANSFORM => 70851

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION_MSTRANSFORMORIGIN => 70861

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLCHAINING => 70891

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMING => 70892

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMSNAPTYPE => 70893

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLRAILS => 70894

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMCHAINING => 70895

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLSNAPTYPE => 70896

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMLIMIT => 70897

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMSNAP => 70898

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMSNAPPOINTS => 70899

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMLIMITMIN => 70901

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSCONTENTZOOMLIMITMAX => 70902

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLSNAPX => 70903

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLSNAPY => 70904

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLSNAPPOINTSX => 70905

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLSNAPPOINTSY => 70906

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDCOLUMN => 70908

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDCOLUMNALIGN => 70909

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDCOLUMNS => 70910

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDCOLUMNSPAN => 70911

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDROW => 70913

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDROWALIGN => 70914

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDROWS => 70915

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSGRIDROWSPAN => 70916

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSWRAPTHROUGH => 70937

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSWRAPMARGIN => 70947

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSWRAPFLOW => 70949

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONNAME => 70917

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONDURATION => 70918

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONTIMINGFUNCTION => 70919

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONDELAY => 70920

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONDIRECTION => 70921

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONPLAYSTATE => 70922

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONITERATIONCOUNT => 70923

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATION => 70924

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSANIMATIONFILLMODE => 70925

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLORINTERPOLATIONFILTERS => 70928

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNCOUNT => 70872

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNWIDTH => 70873

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNGAP => 70874

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNFILL => 70875

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNSPAN => 70876

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNS => 70871

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNRULE => 70877

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNRULECOLOR => 70880

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNRULESTYLE => 70878

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_COLUMNRULEWIDTH => 70879

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_BREAKBEFORE => 70881

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_BREAKAFTER => 70882

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_BREAKINSIDE => 70883

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_FLOODCOLOR => 70926

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_FLOODOPACITY => 70927

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_LIGHTINGCOLOR => 70929

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLLIMITXMIN => 70930

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLLIMITYMIN => 70931

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLLIMITXMAX => 70932

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLLIMITYMAX => 70933

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLLIMIT => 70934

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TEXTSHADOW => 70936

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLOWFROM => 70938

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLOWINTO => 70939

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSHYPHENS => 70940

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSHYPHENATELIMITZONE => 70941

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSHYPHENATELIMITCHARS => 70942

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSHYPHENATELIMITLINES => 70943

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSHIGHCONTRASTADJUST => 70945

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ENABLEBACKGROUND => 70946

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFONTFEATURESETTINGS => 70950

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSUSERSELECT => 70951

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSOVERFLOWSTYLE => 70935

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTRANSFORMSTYLE => 70889

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSBACKFACEVISIBILITY => 70890

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSPERSPECTIVE => 70885

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSPERSPECTIVEORIGIN => 70886

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTRANSITIONPROPERTY => 70866

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTRANSITIONDURATION => 70867

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTRANSITIONTIMINGFUNCTION => 70868

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTRANSITIONDELAY => 70869

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTRANSITION => 70870

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTOUCHACTION => 70952

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSSCROLLTRANSLATION => 70954

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEX => 70955

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXPOSITIVE => 70956

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXNEGATIVE => 70957

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXPREFERREDSIZE => 70958

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXFLOW => 70959

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXDIRECTION => 70960

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXWRAP => 70961

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXALIGN => 70962

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXITEMALIGN => 70963

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXPACK => 70964

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXLINEPACK => 70965

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSFLEXORDER => 70966

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_MSTOUCHSELECT => 70994

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSFORM => 70967

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSFORMORIGIN => 70968

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSFORMSTYLE => 70976

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_BACKFACEVISIBILITY => 70977

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_PERSPECTIVE => 70974

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_PERSPECTIVEORIGIN => 70975

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSITIONPROPERTY => 70969

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSITIONDURATION => 70970

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSITIONTIMINGFUNCTION => 70971

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSITIONDELAY => 70972

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_TRANSITION => 70973

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_FONTFEATURESETTINGS => 70987

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONNAME => 70978

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONDURATION => 70979

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONTIMINGFUNCTION => 70980

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONDELAY => 70981

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONDIRECTION => 70982

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONPLAYSTATE => 70983

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONITERATIONCOUNT => 70984

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATION => 70985

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION2_ANIMATIONFILLMODE => 70986

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_FLEX => 71002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_FLEXDIRECTION => 70998

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_FLEXWRAP => 70999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_FLEXFLOW => 71000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_FLEXGROW => 71003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_FLEXSHRINK => 71004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_FLEXBASIS => 71005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_JUSTIFYCONTENT => 71006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_ALIGNITEMS => 71007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_ALIGNSELF => 71008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_ALIGNCONTENT => 71009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_BORDERIMAGE => 71010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_BORDERIMAGESOURCE => 71011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_BORDERIMAGESLICE => 71012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_BORDERIMAGEWIDTH => 71013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_BORDERIMAGEOUTSET => 71014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_BORDERIMAGEREPEAT => 71015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_MSIMEALIGN => 71017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_MSTEXTCOMBINEHORIZONTAL => 71018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION3_TOUCHACTION => 71019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITAPPEARANCE => 71020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITUSERSELECT => 71032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBOXALIGN => 71021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBOXORDINALGROUP => 71022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBOXPACK => 71023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBOXFLEX => 71024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBOXORIENT => 71025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBOXDIRECTION => 71026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTRANSFORM => 71028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDSIZE => 71029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKFACEVISIBILITY => 71030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATION => 71033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTRANSITION => 71034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONNAME => 71035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONDURATION => 71036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONTIMINGFUNCTION => 71037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONDELAY => 71038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONITERATIONCOUNT => 71039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONDIRECTION => 71040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONPLAYSTATE => 71041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTRANSITIONPROPERTY => 71042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTRANSITIONDURATION => 71043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTRANSITIONTIMINGFUNCTION => 71044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTRANSITIONDELAY => 71045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDATTACHMENT => 71046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDCOLOR => 71047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDCLIP => 71048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDIMAGE => 71049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDREPEAT => 71050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDORIGIN => 71051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDPOSITION => 71052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDPOSITIONX => 71053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUNDPOSITIONY => 71054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBACKGROUND => 71055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTRANSFORMORIGIN => 71056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_MSTEXTSIZEADJUST => 70864

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITTEXTSIZEADJUST => 71060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBORDERIMAGE => 71061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBORDERIMAGESOURCE => 71062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBORDERIMAGESLICE => 71063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBORDERIMAGEWIDTH => 71064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBORDERIMAGEOUTSET => 71065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBORDERIMAGEREPEAT => 71066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITBOXSIZING => 71031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSSTYLEDECLARATION4_WEBKITANIMATIONFILLMODE => 71027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEENABLED_MSGETPROPERTYENABLED => 70043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEENABLED_MSPUTPROPERTYENABLED => 70044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_FONTFAMILY => 70554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_FONTSTYLE => 70560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_FONTVARIANT => 70561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_FONTWEIGHT => 70563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_FONTSIZE => 70555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_FONT => 70577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_COLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUND => 70568

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUNDCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUNDIMAGE => 70537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUNDREPEAT => 70580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUNDATTACHMENT => 70581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUNDPOSITION => 70582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUNDPOSITIONX => 70569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BACKGROUNDPOSITIONY => 70570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_WORDSPACING => 70583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_LETTERSPACING => 70544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTDECORATION => 70571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTDECORATIONNONE => 70559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTDECORATIONUNDERLINE => 70557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTDECORATIONOVERLINE => 70605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTDECORATIONLINETHROUGH => 70556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTDECORATIONBLINK => 70558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_VERTICALALIGN => 70584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTTRANSFORM => 70540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TEXTINDENT => 70543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_LINEHEIGHT => 70542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_MARGINTOP => 70573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_MARGINRIGHT => 70574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_MARGINBOTTOM => 70575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_MARGINLEFT => 70576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_MARGIN => 70572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PADDINGTOP => 70548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PADDINGRIGHT => 70549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PADDINGBOTTOM => 70550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PADDINGLEFT => 70551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PADDING => 70547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDER => 70585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERTOP => 70586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERRIGHT => 70587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERBOTTOM => 70588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERLEFT => 70589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERCOLOR => 70590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERTOPCOLOR => 70591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERRIGHTCOLOR => 70592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERBOTTOMCOLOR => 70593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERLEFTCOLOR => 70594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERWIDTH => 70595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERTOPWIDTH => 70596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERRIGHTWIDTH => 70597

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERBOTTOMWIDTH => 70598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERLEFTWIDTH => 70599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERSTYLE => 70600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERTOPSTYLE => 70601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERRIGHTSTYLE => 70602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERBOTTOMSTYLE => 70603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_BORDERLEFTSTYLE => 70604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_STYLEFLOAT => 70606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_CLEAR => 70552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_DISPLAY => 70607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_VISIBILITY => 70616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_LISTSTYLETYPE => 70608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_LISTSTYLEPOSITION => 70609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_LISTSTYLEIMAGE => 70610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_LISTSTYLE => 70611

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_WHITESPACE => 70612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TOP => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_LEFT => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_POSITION => 70626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_ZINDEX => 70627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_OVERFLOW => 70546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PAGEBREAKBEFORE => 70613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PAGEBREAKAFTER => 70614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_CSSTEXT => 70635

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PIXELTOP => 69536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PIXELLEFT => 69537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PIXELWIDTH => 69538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_PIXELHEIGHT => 69539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_POSTOP => 69540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_POSLEFT => 69541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_POSWIDTH => 69542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_POSHEIGHT => 69543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_CURSOR => 70638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_CLIP => 70628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_FILTER => 70618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_SETATTRIBUTE => 66037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_GETATTRIBUTE => 66038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_REMOVEATTRIBUTE => 66039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE_TOSTRING => 69544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_TABLELAYOUT => 70634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_BORDERCOLLAPSE => 70620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_DIRECTION => 70655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_BEHAVIOR => 70651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_SETEXPRESSION => 66040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_GETEXPRESSION => 66041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_REMOVEEXPRESSION => 66042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_POSITION => 70626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_UNICODEBIDI => 70654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_BOTTOM => 65614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_RIGHT => 65613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_PIXELBOTTOM => 69545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_PIXELRIGHT => 69546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_POSBOTTOM => 69547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_POSRIGHT => 69548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_IMEMODE => 70656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_RUBYALIGN => 70657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_RUBYPOSITION => 70658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_RUBYOVERHANG => 70659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_LAYOUTGRIDCHAR => 70663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_LAYOUTGRIDLINE => 70664

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_LAYOUTGRIDMODE => 70665

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_LAYOUTGRIDTYPE => 70666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_LAYOUTGRID => 70667

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_WORDBREAK => 70670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_LINEBREAK => 70669

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_TEXTJUSTIFY => 70671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_TEXTJUSTIFYTRIM => 70672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_TEXTKASHIDA => 70673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_TEXTAUTOSPACE => 70668

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_OVERFLOWX => 70675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_OVERFLOWY => 70676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE2_ACCELERATOR => 70683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_LAYOUTFLOW => 70691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_ZOOM => 70689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_WORDWRAP => 70694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_TEXTUNDERLINEPOSITION => 70695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBARBASECOLOR => 70716

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBARFACECOLOR => 70717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBAR3DLIGHTCOLOR => 70718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBARSHADOWCOLOR => 70719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBARHIGHLIGHTCOLOR => 70720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBARDARKSHADOWCOLOR => 70721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBARARROWCOLOR => 70722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_SCROLLBARTRACKCOLOR => 70732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_WRITINGMODE => 70728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_TEXTALIGNLAST => 70739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE3_TEXTKASHIDASPACE => 70740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE4_TEXTOVERFLOW => 70745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE4_MINHEIGHT => 70747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE5_MSINTERPOLATIONMODE => 70749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE5_MAXHEIGHT => 70750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE5_MINWIDTH => 70751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE5_MAXWIDTH => 70752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_CONTENT => 70754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_CAPTIONSIDE => 70755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_COUNTERINCREMENT => 70756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_COUNTERRESET => 70757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_OUTLINE => 70758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_OUTLINEWIDTH => 70759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_OUTLINESTYLE => 70760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_OUTLINECOLOR => 70761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_BOXSIZING => 70762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_BORDERSPACING => 70763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_ORPHANS => 70764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_WIDOWS => 70765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_PAGEBREAKINSIDE => 70766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_EMPTYCELLS => 70786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_MSBLOCKPROGRESSION => 70787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLE6_QUOTES => 70788

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_FONTFAMILY => 70554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_FONTSTYLE => 70560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_FONTVARIANT => 70561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_FONTWEIGHT => 70563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_FONTSIZE => 70555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_FONT => 70577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_COLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUND => 70568

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUNDCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUNDIMAGE => 70537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUNDREPEAT => 70580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUNDATTACHMENT => 70581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUNDPOSITION => 70582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUNDPOSITIONX => 70569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BACKGROUNDPOSITIONY => 70570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_WORDSPACING => 70583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_LETTERSPACING => 70544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTDECORATION => 70571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTDECORATIONNONE => 70559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTDECORATIONUNDERLINE => 70557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTDECORATIONOVERLINE => 70605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTDECORATIONLINETHROUGH => 70556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTDECORATIONBLINK => 70558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_VERTICALALIGN => 70584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTTRANSFORM => 70540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TEXTINDENT => 70543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_LINEHEIGHT => 70542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_MARGINTOP => 70573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_MARGINRIGHT => 70574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_MARGINBOTTOM => 70575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_MARGINLEFT => 70576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_MARGIN => 70572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_PADDINGTOP => 70548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_PADDINGRIGHT => 70549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_PADDINGBOTTOM => 70550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_PADDINGLEFT => 70551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_PADDING => 70547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDER => 70585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERTOP => 70586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERRIGHT => 70587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERBOTTOM => 70588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERLEFT => 70589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERCOLOR => 70590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERTOPCOLOR => 70591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERRIGHTCOLOR => 70592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERBOTTOMCOLOR => 70593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERLEFTCOLOR => 70594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERWIDTH => 70595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERTOPWIDTH => 70596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERRIGHTWIDTH => 70597

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERBOTTOMWIDTH => 70598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERLEFTWIDTH => 70599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERSTYLE => 70600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERTOPSTYLE => 70601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERRIGHTSTYLE => 70602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERBOTTOMSTYLE => 70603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_BORDERLEFTSTYLE => 70604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_STYLEFLOAT => 70606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_CLEAR => 70552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_DISPLAY => 70607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_VISIBILITY => 70616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_LISTSTYLETYPE => 70608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_LISTSTYLEPOSITION => 70609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_LISTSTYLEIMAGE => 70610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_LISTSTYLE => 70611

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_WHITESPACE => 70612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_TOP => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_LEFT => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_POSITION => 70626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_ZINDEX => 70627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_OVERFLOW => 70546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_PAGEBREAKBEFORE => 70613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_PAGEBREAKAFTER => 70614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_CSSTEXT => 70635

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_CURSOR => 70638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_CLIP => 70628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_FILTER => 70618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_SETATTRIBUTE => 66037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_GETATTRIBUTE => 66038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE_REMOVEATTRIBUTE => 66039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_TABLELAYOUT => 70634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_BORDERCOLLAPSE => 70620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_DIRECTION => 70655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_BEHAVIOR => 70651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_POSITION => 70626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_UNICODEBIDI => 70654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_BOTTOM => 65614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_RIGHT => 65613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_PIXELBOTTOM => 69545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_PIXELRIGHT => 69546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_POSBOTTOM => 69547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_POSRIGHT => 69548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_IMEMODE => 70656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_RUBYALIGN => 70657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_RUBYPOSITION => 70658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_RUBYOVERHANG => 70659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_LAYOUTGRIDCHAR => 70663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_LAYOUTGRIDLINE => 70664

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_LAYOUTGRIDMODE => 70665

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_LAYOUTGRIDTYPE => 70666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_LAYOUTGRID => 70667

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_TEXTAUTOSPACE => 70668

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_WORDBREAK => 70670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_LINEBREAK => 70669

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_TEXTJUSTIFY => 70671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_TEXTJUSTIFYTRIM => 70672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_TEXTKASHIDA => 70673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_OVERFLOWX => 70675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_OVERFLOWY => 70676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE2_ACCELERATOR => 70683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_LAYOUTFLOW => 70691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_ZOOM => 70689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_WORDWRAP => 70694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_TEXTUNDERLINEPOSITION => 70695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBARBASECOLOR => 70716

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBARFACECOLOR => 70717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBAR3DLIGHTCOLOR => 70718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBARSHADOWCOLOR => 70719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBARHIGHLIGHTCOLOR => 70720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBARDARKSHADOWCOLOR => 70721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBARARROWCOLOR => 70722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_SCROLLBARTRACKCOLOR => 70732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_WRITINGMODE => 70728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_TEXTALIGNLAST => 70739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE3_TEXTKASHIDASPACE => 70740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE4_TEXTOVERFLOW => 70745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE4_MINHEIGHT => 70747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE5_MSINTERPOLATIONMODE => 70749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE5_MAXHEIGHT => 70750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE5_MINWIDTH => 70751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE5_MAXWIDTH => 70752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_CONTENT => 70754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_CAPTIONSIDE => 70755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_COUNTERINCREMENT => 70756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_COUNTERRESET => 70757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_OUTLINE => 70758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_OUTLINEWIDTH => 70759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_OUTLINESTYLE => 70760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_OUTLINECOLOR => 70761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_BOXSIZING => 70762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_BORDERSPACING => 70763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_ORPHANS => 70764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_WIDOWS => 70765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_PAGEBREAKINSIDE => 70766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_EMPTYCELLS => 70786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_MSBLOCKPROGRESSION => 70787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRULESTYLE6_QUOTES => 70788

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSRULE_TYPE => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSRULE_CSSTEXT => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSRULE_PARENTRULE => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSRULE_PARENTSTYLESHEET => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSIMPORTRULE_HREF => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSIMPORTRULE_MEDIA => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSIMPORTRULE_STYLESHEET => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIARULE_MEDIA => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIARULE_CSSRULES => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIARULE_INSERTRULE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIARULE_DELETERULE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIALIST_MEDIATEXT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIALIST_LENGTH => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIALIST_ITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIALIST_APPENDMEDIUM => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSMEDIALIST_DELETEMEDIUM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSNAMESPACERULE_NAMESPACEURI => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCSSNAMESPACERULE_PREFIX => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSCSSKEYFRAMERULE_KEYTEXT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSCSSKEYFRAMERULE_STYLE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSCSSKEYFRAMESRULE_NAME => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSCSSKEYFRAMESRULE_CSSRULES => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSCSSKEYFRAMESRULE_APPENDRULE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSCSSKEYFRAMESRULE_DELETERULE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSCSSKEYFRAMESRULE_FINDRULE => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_TEXTLINETHROUGHSTYLE => 70702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_TEXTUNDERLINESTYLE => 70703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_TEXTEFFECT => 70704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_TEXTCOLOR => 70726

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_TEXTBACKGROUNDCOLOR => 70705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_TEXTDECORATIONCOLOR => 70725

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_RENDERINGPRIORITY => 70706

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_DEFAULTTEXTSELECTION => 70724

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRENDERSTYLE_TEXTDECORATION => 70727

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_POSITION => 70626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_STYLEFLOAT => 70606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_COLOR => 70538

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BACKGROUNDCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_FONTFAMILY => 70554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_FONTSTYLE => 70560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_FONTVARIANT => 70561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_FONTWEIGHT => 70563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_FONTSIZE => 70555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BACKGROUNDIMAGE => 70537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BACKGROUNDPOSITIONX => 70569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BACKGROUNDPOSITIONY => 70570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BACKGROUNDREPEAT => 70580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERLEFTCOLOR => 70594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERTOPCOLOR => 70591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERRIGHTCOLOR => 70592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERBOTTOMCOLOR => 70593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERTOPSTYLE => 70601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERRIGHTSTYLE => 70602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERBOTTOMSTYLE => 70603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERLEFTSTYLE => 70604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERTOPWIDTH => 70596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERRIGHTWIDTH => 70597

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERBOTTOMWIDTH => 70598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERLEFTWIDTH => 70599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LEFT => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TOP => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_PADDINGLEFT => 70551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_PADDINGTOP => 70548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_PADDINGRIGHT => 70549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_PADDINGBOTTOM => 70550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTDECORATION => 70571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_DISPLAY => 70607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_VISIBILITY => 70616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_ZINDEX => 70627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LETTERSPACING => 70544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LINEHEIGHT => 70542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTINDENT => 70543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_VERTICALALIGN => 70584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BACKGROUNDATTACHMENT => 70581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_MARGINTOP => 70573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_MARGINRIGHT => 70574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_MARGINBOTTOM => 70575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_MARGINLEFT => 70576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_CLEAR => 70552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LISTSTYLETYPE => 70608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LISTSTYLEPOSITION => 70609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LISTSTYLEIMAGE => 70610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_CLIPTOP => 70629

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_CLIPRIGHT => 70630

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_CLIPBOTTOM => 70631

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_CLIPLEFT => 70632

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_OVERFLOW => 70546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_PAGEBREAKBEFORE => 70613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_PAGEBREAKAFTER => 70614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_CURSOR => 70638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TABLELAYOUT => 70634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERCOLLAPSE => 70620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_DIRECTION => 70655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BEHAVIOR => 70651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_GETATTRIBUTE => 66038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_UNICODEBIDI => 70654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_RIGHT => 65613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BOTTOM => 65614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_IMEMODE => 70656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_RUBYALIGN => 70657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_RUBYPOSITION => 70658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_RUBYOVERHANG => 70659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTAUTOSPACE => 70668

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LINEBREAK => 70669

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_WORDBREAK => 70670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTJUSTIFY => 70671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTJUSTIFYTRIM => 70672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTKASHIDA => 70673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BLOCKDIRECTION => 70653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LAYOUTGRIDCHAR => 70663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LAYOUTGRIDLINE => 70664

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LAYOUTGRIDMODE => 70665

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_LAYOUTGRIDTYPE => 70666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERSTYLE => 70600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERCOLOR => 70590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_BORDERWIDTH => 70595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_PADDING => 70547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_MARGIN => 70572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_ACCELERATOR => 70683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_OVERFLOWX => 70675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_OVERFLOWY => 70676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE_TEXTTRANSFORM => 70540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_LAYOUTFLOW => 70691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_WORDWRAP => 70694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_TEXTUNDERLINEPOSITION => 70695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_HASLAYOUT => 70696

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBARBASECOLOR => 70716

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBARFACECOLOR => 70717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBAR3DLIGHTCOLOR => 70718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBARSHADOWCOLOR => 70719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBARHIGHLIGHTCOLOR => 70720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBARDARKSHADOWCOLOR => 70721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBARARROWCOLOR => 70722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_SCROLLBARTRACKCOLOR => 70732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_WRITINGMODE => 70728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_ZOOM => 70689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_FILTER => 70618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_TEXTALIGNLAST => 70739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_TEXTKASHIDASPACE => 70740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE2_ISBLOCK => 70744

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE3_TEXTOVERFLOW => 70745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE3_MINHEIGHT => 70747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE3_WORDSPACING => 70583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE3_WHITESPACE => 70612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE4_MSINTERPOLATIONMODE => 70749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE4_MAXHEIGHT => 70750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE4_MINWIDTH => 70751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE4_MAXWIDTH => 70752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_CAPTIONSIDE => 70755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_OUTLINE => 70758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_OUTLINEWIDTH => 70759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_OUTLINESTYLE => 70760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_OUTLINECOLOR => 70761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_BOXSIZING => 70762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_BORDERSPACING => 70763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_ORPHANS => 70764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_WIDOWS => 70765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_PAGEBREAKINSIDE => 70766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_EMPTYCELLS => 70786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_MSBLOCKPROGRESSION => 70787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCURRENTSTYLE5_QUOTES => 70788

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECT_LEFT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECT_TOP => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECT_RIGHT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECT_BOTTOM => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECT2_WIDTH => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECT2_HEIGHT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECTCOLLECTION_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLRECTCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLRECTCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_NODETYPE => 66582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_PARENTNODE => 66583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_HASCHILDNODES => 66584

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_CHILDNODES => 66585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_ATTRIBUTES => 66586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_INSERTBEFORE => 66587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_REMOVECHILD => 66588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_REPLACECHILD => 66589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_CLONENODE => 66597

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_REMOVENODE => 66602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_SWAPNODE => 66604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_REPLACENODE => 66603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_APPENDCHILD => 66609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_NODENAME => 66610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_NODEVALUE => 66611

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_FIRSTCHILD => 66612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_LASTCHILD => 66613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_PREVIOUSSIBLING => 66614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE_NEXTSIBLING => 66615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE2_OWNERDOCUMENT => 66649

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_PREFIX => 66656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_LOCALNAME => 66654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_NAMESPACEURI => 66655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_TEXTCONTENT => 66663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_ISEQUALNODE => 66657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_LOOKUPNAMESPACEURI => 66658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_LOOKUPPREFIX => 66659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_ISDEFAULTNAMESPACE => 66660

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_IE9_APPENDCHILD => 66804

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_IE9_INSERTBEFORE => 66805

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_IE9_REMOVECHILD => 66806

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_IE9_REPLACECHILD => 66807

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_ISSAMENODE => 66661

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_COMPAREDOCUMENTPOSITION => 66662

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMNODE3_ISSUPPORTED => 66813

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE_NODENAME => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE_NODEVALUE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE_SPECIFIED => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_NAME => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_VALUE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_EXPANDO => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_NODETYPE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_PARENTNODE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_CHILDNODES => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_FIRSTCHILD => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_LASTCHILD => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_PREVIOUSSIBLING => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_NEXTSIBLING => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_ATTRIBUTES => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_OWNERDOCUMENT => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_INSERTBEFORE => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_REPLACECHILD => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_REMOVECHILD => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_APPENDCHILD => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_HASCHILDNODES => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE2_CLONENODE => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE3_IE8_NODEVALUE => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE3_IE8_VALUE => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE3_IE8_SPECIFIED => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE3_OWNERELEMENT => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_NODEVALUE => 1159

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_NODENAME => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_NAME => 1161

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_VALUE => 1162

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_FIRSTCHILD => 1163

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_LASTCHILD => 1164

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_CHILDNODES => 1165

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_HASATTRIBUTES => 1166

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_HASCHILDNODES => 1167

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_NORMALIZE => 1170

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMATTRIBUTE4_IE9_SPECIFIED => 1171

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE_DATA => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE_TOSTRING => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE_LENGTH => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE_SPLITTEXT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE2_SUBSTRINGDATA => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE2_APPENDDATA => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE2_INSERTDATA => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE2_DELETEDATA => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE2_REPLACEDATA => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_IE9_SUBSTRINGDATA => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_IE9_INSERTDATA => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_IE9_DELETEDATA => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_IE9_REPLACEDATA => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_IE9_SPLITTEXT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_WHOLETEXT => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_REPLACEWHOLETEXT => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_HASATTRIBUTES => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMTEXTNODE3_NORMALIZE => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMIMPLEMENTATION_HASFEATURE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMIMPLEMENTATION2_CREATEDOCUMENTTYPE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMIMPLEMENTATION2_CREATEDOCUMENT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMIMPLEMENTATION2_CREATEHTMLDOCUMENT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMIMPLEMENTATION2_IE9_HASFEATURE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION2_GETNAMEDITEM => 1501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION2_SETNAMEDITEM => 1502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION2_REMOVENAMEDITEM => 1503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION3_IE8_GETNAMEDITEM => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION3_IE8_SETNAMEDITEM => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION3_IE8_REMOVENAMEDITEM => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION3_IE8_ITEM => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION3_IE8_LENGTH => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_GETNAMEDITEMNS => 1155

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_SETNAMEDITEMNS => 1156

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_REMOVENAMEDITEMNS => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_IE9_GETNAMEDITEM => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_IE9_SETNAMEDITEM => 1159

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_IE9_REMOVENAMEDITEM => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_IE9_ITEM => 1161

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLATTRIBUTECOLLECTION4_IE9_LENGTH => 1162

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMCHILDRENCOLLECTION_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLDOMCHILDRENCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMCHILDRENCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMCHILDRENCOLLECTION2_IE9_ITEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_SETATTRIBUTE => 66037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_GETATTRIBUTE => 66038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_REMOVEATTRIBUTE => 66039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_CLASSNAME => 66537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ID => 66538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_TAGNAME => 66540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_PARENTELEMENT => 65544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_STYLE => 65610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONHELP => 71549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONCLICK => 71544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONDBLCLICK => 71545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONKEYDOWN => 71541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONKEYUP => 71542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONKEYPRESS => 71543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONMOUSEOUT => 71537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONMOUSEOVER => 71536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONMOUSEMOVE => 71540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONMOUSEDOWN => 71538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONMOUSEUP => 71539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_DOCUMENT => 66554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_TITLE => 65605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_LANGUAGE => 70636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONSELECTSTART => 71573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_SCROLLINTOVIEW => 66555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_CONTAINS => 66556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_SOURCEINDEX => 66560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_RECORDNUMBER => 66561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_LANG => 70545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_OFFSETLEFT => 66544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_OFFSETTOP => 66545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_OFFSETWIDTH => 66546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_OFFSETHEIGHT => 66547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_OFFSETPARENT => 66548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_INNERHTML => 66562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_INNERTEXT => 66563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_OUTERHTML => 66564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_OUTERTEXT => 66565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_INSERTADJACENTHTML => 66566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_INSERTADJACENTTEXT => 66567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_PARENTTEXTEDIT => 66568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ISTEXTEDIT => 66570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_CLICK => 66569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_FILTERS => 66571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONDRAGSTART => 71571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_TOSTRING => 66572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONBEFOREUPDATE => 71557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONAFTERUPDATE => 71558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONERRORUPDATE => 71574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONROWEXIT => 71554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONROWENTER => 71555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONDATASETCHANGED => 71576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONDATAAVAILABLE => 71577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONDATASETCOMPLETE => 71578

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ONFILTERCHANGE => 71579

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_CHILDREN => 66573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT_ALL => 66574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_SCOPENAME => 66575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_SETCAPTURE => 66576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_RELEASECAPTURE => 66577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONLOSECAPTURE => 71582

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_COMPONENTFROMPOINT => 66578

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_DOSCROLL => 66579

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONSCROLL => 71567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONDRAG => 71585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONDRAGEND => 71586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONDRAGENTER => 71587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONDRAGOVER => 71588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONDRAGLEAVE => 71589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONDROP => 71590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONBEFORECUT => 71594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONCUT => 71591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONBEFORECOPY => 71595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONCOPY => 71592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONBEFOREPASTE => 71596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONPASTE => 71593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CURRENTSTYLE => 66543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONPROPERTYCHANGE => 71583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_GETCLIENTRECTS => 66580

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_GETBOUNDINGCLIENTRECT => 66581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_SETEXPRESSION => 66040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_GETEXPRESSION => 66041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_REMOVEEXPRESSION => 66042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_TABINDEX => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_FOCUS => 67536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ACCESSKEY => 67541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONBLUR => 71551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONFOCUS => 71550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONRESIZE => 71572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_BLUR => 67538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ADDFILTER => 67553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_REMOVEFILTER => 67554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CLIENTHEIGHT => 67555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CLIENTWIDTH => 67556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CLIENTTOP => 67557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CLIENTLEFT => 67558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ATTACHEVENT => 66043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_DETACHEVENT => 66044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONROWSDELETE => 71598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONROWSINSERTED => 71599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONCELLCHANGE => 71600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_DIR => 70653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CREATECONTROLRANGE => 66592

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_SCROLLHEIGHT => 66593

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_SCROLLWIDTH => 66594

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_SCROLLTOP => 66595

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_SCROLLLEFT => 66596

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CLEARATTRIBUTES => 66598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_MERGEATTRIBUTES => 66599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONCONTEXTMENU => 71601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_INSERTADJACENTELEMENT => 66605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_APPLYELEMENT => 66601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_GETADJACENTTEXT => 66606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_REPLACEADJACENTTEXT => 66607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_CANHAVECHILDREN => 66608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ADDBEHAVIOR => 66616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_REMOVEBEHAVIOR => 66617

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_RUNTIMESTYLE => 66600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_BEHAVIORURNS => 66618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_TAGURN => 66619

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_ONBEFOREEDITFOCUS => 71605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_READYSTATEVALUE => 66620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT2_GETELEMENTSBYTAGNAME => 66621

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_MERGEATTRIBUTES => 66632

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ISMULTILINE => 66633

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_CANHAVEHTML => 66634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONLAYOUTCOMPLETE => 71609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONPAGE => 71610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_INFLATEBLOCK => 66636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONBEFOREDEACTIVATE => 71613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_SETACTIVE => 66637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_CONTENTEDITABLE => 70698

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ISCONTENTEDITABLE => 66638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_HIDEFOCUS => 70699

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ISDISABLED => 66641

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONMOVE => 71614

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONCONTROLSELECT => 71615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_FIREEVENT => 66642

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONRESIZESTART => 71619

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONRESIZEEND => 71620

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONMOVESTART => 71617

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONMOVEEND => 71618

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONMOUSEENTER => 71621

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONMOUSELEAVE => 71622

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONACTIVATE => 71623

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_ONDEACTIVATE => 71624

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_DRAGDROP => 66643

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT3_GLYPHMODE => 66644

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_ONMOUSEWHEEL => 71612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_NORMALIZE => 66648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_GETATTRIBUTENODE => 66645

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_SETATTRIBUTENODE => 66646

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_REMOVEATTRIBUTENODE => 66647

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_ONBEFOREACTIVATE => 71626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_ONFOCUSIN => 71627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT4_ONFOCUSOUT => 71628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IELEMENTSELECTOR_QUERYSELECTOR => 66650

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IELEMENTSELECTOR_QUERYSELECTORALL => 66651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLUNIQUENAME_UNIQUENUMBER => 66590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLUNIQUENAME_UNIQUEID => 66591

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_IE8_GETATTRIBUTENODE => 66736

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_IE8_SETATTRIBUTENODE => 66737

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_IE8_REMOVEATTRIBUTENODE => 66738

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_HASATTRIBUTE => 66739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ROLE => 66740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIABUSY => 66741

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIACHECKED => 66742

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIADISABLED => 66743

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAEXPANDED => 66744

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAHASPOPUP => 66745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAHIDDEN => 66746

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAINVALID => 66747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAMULTISELECTABLE => 66748

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAPRESSED => 66749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAREADONLY => 66750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAREQUIRED => 66751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIASECRET => 66752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIASELECTED => 66753

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_IE8_GETATTRIBUTE => 66754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_IE8_SETATTRIBUTE => 66755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_IE8_REMOVEATTRIBUTE => 66756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_IE8_ATTRIBUTES => 66757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAVALUENOW => 66758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAPOSINSET => 66759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIASETSIZE => 66760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIALEVEL => 66761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAVALUEMIN => 66762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAVALUEMAX => 66763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIACONTROLS => 66764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIADESCRIBEDBY => 66765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAFLOWTO => 66766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIALABELLEDBY => 66767

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAACTIVEDESCENDANT => 66768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIAOWNS => 66769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_HASATTRIBUTES => 66770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIALIVE => 66771

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT5_ARIARELEVANT => 66772

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_GETATTRIBUTENS => 66789

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_SETATTRIBUTENS => 66790

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_REMOVEATTRIBUTENS => 66791

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_GETATTRIBUTENODENS => 66786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_SETATTRIBUTENODENS => 66787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_HASATTRIBUTENS => 66788

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_GETATTRIBUTE => 66796

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_SETATTRIBUTE => 66797

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_REMOVEATTRIBUTE => 66798

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_GETATTRIBUTENODE => 66792

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_SETATTRIBUTENODE => 66793

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_REMOVEATTRIBUTENODE => 66794

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_HASATTRIBUTE => 66795

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_GETELEMENTSBYTAGNAMENS => 66799

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_TAGNAME => 66801

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_NODENAME => 66802

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_GETELEMENTSBYCLASSNAME => 66803

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_MSMATCHESSELECTOR => 66814

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONABORT => 71564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONCANPLAY => 71670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONCANPLAYTHROUGH => 71671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONDURATIONCHANGE => 71672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONEMPTIED => 71673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONENDED => 71674

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONINPUT => 71663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONLOADEDDATA => 71675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONLOADEDMETADATA => 71676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONLOADSTART => 71677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONPAUSE => 71678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONPLAY => 71679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONPLAYING => 71680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONPROGRESS => 71681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONRATECHANGE => 71682

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONRESET => 71548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONSEEKED => 71683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONSEEKING => 71684

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONSTALLED => 71685

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONSUBMIT => 71547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONSUSPEND => 71686

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONTIMEUPDATE => 71687

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONVOLUMECHANGE => 71688

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_ONWAITING => 71689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT6_IE9_HASATTRIBUTES => 66815

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSPOINTERDOWN => 71690

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSPOINTERMOVE => 71691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSPOINTERUP => 71692

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSPOINTEROVER => 71693

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSPOINTEROUT => 71694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSPOINTERCANCEL => 71695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSPOINTERHOVER => 71696

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSLOSTPOINTERCAPTURE => 71706

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSGOTPOINTERCAPTURE => 71707

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSGESTURESTART => 71699

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSGESTURECHANGE => 71700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSGESTUREEND => 71701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSGESTUREHOLD => 71702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSGESTURETAP => 71703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSGESTUREDOUBLETAP => 71704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSINERTIASTART => 71705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_MSSETPOINTERCAPTURE => 66822

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_MSRELEASEPOINTERCAPTURE => 66823

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSTRANSITIONSTART => 71709

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSTRANSITIONEND => 71710

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSANIMATIONSTART => 71711

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSANIMATIONEND => 71712

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSANIMATIONITERATION => 71713

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONINVALID => 71724

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_XMSACCELERATORKEY => 66834

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_SPELLCHECK => 70907

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONMSMANIPULATIONSTATECHANGED => 71714

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENT7_ONCUECHANGE => 71729

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTAPPLIEDSTYLES_MSGETRULESAPPLIED => 66652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTAPPLIEDSTYLES_MSGETRULESAPPLIEDWITHANCESTOR => 66653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IELEMENTTRAVERSAL_FIRSTELEMENTCHILD => 66808

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IELEMENTTRAVERSAL_LASTELEMENTCHILD => 66809

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IELEMENTTRAVERSAL_PREVIOUSELEMENTSIBLING => 66810

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IELEMENTTRAVERSAL_NEXTELEMENTSIBLING => 66811

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IELEMENTTRAVERSAL_CHILDELEMENTCOUNT => 66812

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATABINDING_DATAFLD => 66557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATABINDING_DATASRC => 66558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATABINDING_DATAFORMATAS => 66559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONRESET => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONSELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONSUBMIT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS4_ONMSCONTENTZOOM => 71708

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS3_ONONLINE => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS3_ONOFFLINE => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONHELP => 65546

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONCLICK => -600

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDBLCLICK => -601

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONKEYPRESS => -603

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONKEYDOWN => -602

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONKEYUP => -604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSEOUT => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSEOVER => 65544

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSEMOVE => -606

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSEDOWN => -605

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSEUP => -607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONSELECTSTART => 65548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONFILTERCHANGE => 65553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDRAGSTART => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONBEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONAFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONLOSECAPTURE => 65554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONPROPERTYCHANGE => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONSCROLL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONFOCUS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONRESIZE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDRAG => 65556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDRAGEND => 65557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDRAGENTER => 65558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDRAGOVER => 65559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDRAGLEAVE => 65560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDROP => 65561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONBEFORECUT => 65565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONCUT => 65562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONBEFORECOPY => 65566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONCOPY => 65563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONBEFOREPASTE => 65567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONPASTE => 65564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONCONTEXTMENU => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONCELLCHANGE => 65570

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONLAYOUTCOMPLETE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONPAGE => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSEENTER => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSELEAVE => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONACTIVATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONDEACTIVATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONBEFOREDEACTIVATE => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONBEFOREACTIVATE => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONFOCUSIN => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONFOCUSOUT => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOVE => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONCONTROLSELECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOVESTART => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOVEEND => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONRESIZESTART => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONRESIZEEND => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS2_ONMOUSEWHEEL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONHELP => 65546

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONCLICK => -600

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDBLCLICK => -601

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONKEYPRESS => -603

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONKEYDOWN => -602

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONKEYUP => -604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSEOUT => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSEOVER => 65544

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSEMOVE => -606

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSEDOWN => -605

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSEUP => -607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONSELECTSTART => 65548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONFILTERCHANGE => 65553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDRAGSTART => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONBEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONAFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONLOSECAPTURE => 65554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONPROPERTYCHANGE => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONSCROLL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONFOCUS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONRESIZE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDRAG => 65556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDRAGEND => 65557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDRAGENTER => 65558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDRAGOVER => 65559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDRAGLEAVE => 65560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDROP => 65561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONBEFORECUT => 65565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONCUT => 65562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONBEFORECOPY => 65566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONCOPY => 65563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONBEFOREPASTE => 65567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONPASTE => 65564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONCONTEXTMENU => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONCELLCHANGE => 65570

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONBEFOREEDITFOCUS => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONLAYOUTCOMPLETE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONPAGE => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONBEFOREDEACTIVATE => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONBEFOREACTIVATE => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOVE => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONCONTROLSELECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOVESTART => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOVEEND => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONRESIZESTART => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONRESIZEEND => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSEENTER => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSELEAVE => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONMOUSEWHEEL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONACTIVATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONDEACTIVATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONFOCUSIN => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLELEMENTEVENTS_ONFOCUSOUT => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_STYLE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_TABSTOP => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_VIEWINHERITSTYLE => 70735

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_VIEWMASTERTAB => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_SCROLLSEGMENTX => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_SCROLLSEGMENTY => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_ISMULTILINE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_CONTENTEDITABLE => 70698

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_CANHAVEHTML => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_VIEWLINK => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTDEFAULTS_FROZEN => 70734

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCDEFAULTDISPATCH_ELEMENT => 70679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCDEFAULTDISPATCH_CREATEEVENTOBJECT => 70680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCDEFAULTDISPATCH_DEFAULTS => 70701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCDEFAULTDISPATCH_DOCUMENT => 70678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCPROPERTYBEHAVIOR_FIRECHANGE => 66036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCPROPERTYBEHAVIOR_VALUE => 70677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCEVENTBEHAVIOR_FIRE => 66036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCATTACHBEHAVIOR_FIREEVENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCATTACHBEHAVIOR_DETACHEVENT => 66036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCATTACHBEHAVIOR2_FIREEVENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCDESCBEHAVIOR_URN => 66036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTCDESCBEHAVIOR_NAME => 66037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLURNCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLURNCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLGENERICELEMENT_RECORDSET => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLGENERICELEMENT_NAMEDRECORDSET => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULE_SELECTORTEXT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULE_STYLE => 65610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULE_READONLY => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULEAPPLIED_MSSPECIFICITY => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULEAPPLIED_MSGETSPECIFICITY => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULE2_IE9_SELECTORTEXT => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESCOLLECTION2_IE9_LENGTH => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESCOLLECTION2_IE9_ITEM => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETPAGE_SELECTOR => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETPAGE_PSEUDOCLASS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETPAGE2_SELECTORTEXT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETPAGE2_STYLE => 65610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETPAGESCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETPAGESCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_TITLE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_PARENTSTYLESHEET => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_OWNINGELEMENT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_READONLY => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_IMPORTS => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_HREF => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_TYPE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_ID => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_ADDIMPORT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_ADDRULE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_REMOVEIMPORT => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_REMOVERULE => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_MEDIA => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_CSSTEXT => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET_RULES => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET2_PAGES => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET2_ADDPAGERULE => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET3_IE8_HREF => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET3_ISALTERNATE => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET3_ISPREFALTERNATE => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_IE9_TYPE => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_IE9_HREF => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_IE9_TITLE => 1155

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_OWNERNODE => 1156

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_OWNERRULE => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_CSSRULES => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_IE9_MEDIA => 1159

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_INSERTRULE => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEET4_DELETERULE => 1161

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETSCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLSTYLESHEETSCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETSCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETSCOLLECTION2_IE9_ITEM => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_HREF => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_REL => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_REV => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_TYPE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_STYLESHEET => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT_MEDIA => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT2_TARGET => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT3_CHARSET => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT3_HREFLANG => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT4_IE8_HREF => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLINKELEMENT5_SHEET => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLLINKELEMENTEVENTS2_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLLINKELEMENTEVENTS2_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLLINKELEMENTEVENTS_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLLINKELEMENTEVENTS_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_HTMLTEXT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_TEXT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_PARENTELEMENT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_DUPLICATE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_INRANGE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_ISEQUAL => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_SCROLLINTOVIEW => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_COLLAPSE => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_EXPAND => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_MOVE => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_MOVESTART => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_MOVEEND => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_SELECT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_PASTEHTML => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_MOVETOELEMENTTEXT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_SETENDPOINT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_COMPAREENDPOINTS => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_FINDTEXT => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_MOVETOPOINT => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_GETBOOKMARK => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_MOVETOBOOKMARK => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_QUERYCOMMANDSUPPORTED => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_QUERYCOMMANDENABLED => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_QUERYCOMMANDSTATE => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_QUERYCOMMANDINDETERM => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_QUERYCOMMANDTEXT => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_QUERYCOMMANDVALUE => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_EXECCOMMAND => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGE_EXECCOMMANDSHOWHELP => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS_OFFSETTOP => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS_OFFSETLEFT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS_BOUNDINGTOP => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS_BOUNDINGLEFT => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS_BOUNDINGWIDTH => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS_BOUNDINGHEIGHT => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS2_GETCLIENTRECTS => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTRANGEMETRICS2_GETBOUNDINGCLIENTRECT => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGECOLLECTION_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLTXTRANGECOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGECOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_STARTCONTAINER => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_STARTOFFSET => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_ENDCONTAINER => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_ENDOFFSET => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_COLLAPSED => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_COMMONANCESTORCONTAINER => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SETSTART => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SETEND => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SETSTARTBEFORE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SETSTARTAFTER => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SETENDBEFORE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SETENDAFTER => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_COLLAPSE => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SELECTNODE => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SELECTNODECONTENTS => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_COMPAREBOUNDARYPOINTS => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_DELETECONTENTS => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_EXTRACTCONTENTS => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_CLONECONTENTS => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_INSERTNODE => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_SURROUNDCONTENTS => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_CLONERANGE => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_TOSTRING => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_DETACH => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_GETCLIENTRECTS => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOMRANGE_GETBOUNDINGCLIENTRECT => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_ACTION => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_DIR => 70653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_ENCODING => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_METHOD => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_ELEMENTS => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_TARGET => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_ONSUBMIT => 71547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_ONRESET => 71548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_SUBMIT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_RESET => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLFORMELEMENT__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT_TAGS => 1502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT2_ACCEPTCHARSET => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT2_URNS => 1505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT3_NAMEDITEM => 1506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSUBMITDATA_APPENDNAMEVALUEPAIR => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSUBMITDATA_APPENDNAMEFILEPAIR => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSUBMITDATA_APPENDITEMSEPARATOR => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFORMELEMENT4_IE8_ACTION => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLFORMELEMENTEVENTS2_ONSUBMIT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLFORMELEMENTEVENTS2_ONRESET => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLFORMELEMENTEVENTS_ONSUBMIT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLFORMELEMENTEVENTS_ONRESET => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_TABINDEX => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_FOCUS => 67536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_ACCESSKEY => 67541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_ONBLUR => 71551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_ONFOCUS => 71550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_ONRESIZE => 71572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_BLUR => 67538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_ADDFILTER => 67553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_REMOVEFILTER => 67554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_CLIENTHEIGHT => 67555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_CLIENTWIDTH => 67556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_CLIENTTOP => 67557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLELEMENT_CLIENTLEFT => 67558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTCONTAINER_CREATECONTROLRANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTCONTAINER_SCROLLHEIGHT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTCONTAINER_SCROLLWIDTH => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTCONTAINER_SCROLLTOP => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTCONTAINER_SCROLLLEFT => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTCONTAINER_ONSCROLL => 71567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLTEXTCONTAINEREVENTS2_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLTEXTCONTAINEREVENTS2_ONSELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLTEXTCONTAINEREVENTS_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLTEXTCONTAINEREVENTS_ONSELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_SELECT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_ADD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_REMOVE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_SCROLLINTOVIEW => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_QUERYCOMMANDSUPPORTED => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_QUERYCOMMANDENABLED => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_QUERYCOMMANDSTATE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_QUERYCOMMANDINDETERM => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_QUERYCOMMANDTEXT => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_QUERYCOMMANDVALUE => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_EXECCOMMAND => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_EXECCOMMANDSHOWHELP => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_COMMONPARENTELEMENT => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE_LENGTH => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCONTROLRANGE2_ADDELEMENT => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_ISMAP => 2002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_USEMAP => 2008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_MIMETYPE => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_FILESIZE => 2011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_FILECREATEDDATE => 2012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_FILEMODIFIEDDATE => 2013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_FILEUPDATEDDATE => 2014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_PROTOCOL => 2015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_HREF => 2016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_NAMEPROP => 2017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_BORDER => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_VSPACE => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_HSPACE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_ALT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_SRC => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_LOWSRC => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_VRML => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_DYNSRC => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_COMPLETE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_LOOP => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_ONABORT => 71564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT_START => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT2_LONGDESC => 2019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT3_IE8_LONGDESC => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT3_IE8_VRML => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT3_IE8_LOWSRC => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT3_IE8_DYNSRC => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT4_NATURALWIDTH => 1155

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMGELEMENT4_NATURALHEIGHT => 1156

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSIMGELEMENT_MSPLAYTODISABLED => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSIMGELEMENT_MSPLAYTOPRIMARY => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIMAGEELEMENTFACTORY_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLIMGEVENTS2_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLIMGEVENTS2_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLIMGEVENTS2_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLIMGEVENTS_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLIMGEVENTS_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLIMGEVENTS_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_BACKGROUND => 70537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_BGPROPERTIES => 70581

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_LEFTMARGIN => 70576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_TOPMARGIN => 70573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_RIGHTMARGIN => 70574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_BOTTOMMARGIN => 70575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_NOWRAP => 70541

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLBODYELEMENT_BGCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_TEXT => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_LINK => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_VLINK => 2012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_ALINK => 2011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_ONUNLOAD => 71569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_SCROLL => 70615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_ONBEFOREUNLOAD => 71575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT_CREATETEXTRANGE => 2013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT2_ONBEFOREPRINT => 71602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT2_ONAFTERPRINT => 71603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT3_IE8_BACKGROUND => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT3_ONONLINE => 71643

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT3_ONOFFLINE => 71644

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT3_ONHASHCHANGE => 71645

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT4_ONMESSAGE => 71646

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT4_ONSTORAGE => 71636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBODYELEMENT5_ONPOPSTATE => 71728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTELEMENT_COLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTELEMENT_FACE => 70554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTELEMENT_SIZE => 70555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_HREF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_TARGET => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_REL => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_REV => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_URN => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_METHODS => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_HOST => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_HOSTNAME => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_PATHNAME => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_PORT => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_PROTOCOL => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_SEARCH => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_HASH => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_ONBLUR => 71551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_ONFOCUS => 71550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_ACCESSKEY => 67541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_PROTOCOLLONG => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_MIMETYPE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_NAMEPROP => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_TABINDEX => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_FOCUS => 67536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT_BLUR => 67538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT2_CHARSET => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT2_COORDS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT2_HREFLANG => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT2_SHAPE => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT2_TYPE => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT3_IE8_SHAPE => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT3_IE8_COORDS => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLANCHORELEMENT3_IE8_HREF => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLABELELEMENT_HTMLFOR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLABELELEMENT_ACCESSKEY => 67541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLABELELEMENT2_FORM => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLISTELEMENT2_COMPACT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLULISTELEMENT_COMPACT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLULISTELEMENT_TYPE => 70553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOLISTELEMENT_COMPACT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOLISTELEMENT_START => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOLISTELEMENT_TYPE => 70553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLIELEMENT_TYPE => 70553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLIELEMENT_VALUE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBLOCKELEMENT_CLEAR => 70552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBLOCKELEMENT2_CITE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBLOCKELEMENT2_WIDTH => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBLOCKELEMENT3_IE8_CITE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIVELEMENT_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIVELEMENT_NOWRAP => 70541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDDELEMENT_NOWRAP => 70541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDTELEMENT_NOWRAP => 70541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBRELEMENT_CLEAR => 70552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDLISTELEMENT_COMPACT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHRELEMENT_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHRELEMENT_COLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHRELEMENT_NOSHADE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHRELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHRELEMENT_SIZE => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAELEMENT_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION_TOSTRING => 1501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION_TAGS => 1502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION2_URNS => 1505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION3_NAMEDITEM => 1506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION4_IE8_LENGTH => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION4_IE8_ITEM => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLELEMENTCOLLECTION4_IE8_NAMEDITEM => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHEADERELEMENT_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_SIZE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_MULTIPLE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_OPTIONS => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_SELECTEDINDEX => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_TYPE => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_VALUE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_ADD => 1503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_REMOVE => 1504

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLSELECTELEMENT__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT_TAGS => 1502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT2_URNS => 1505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT4_NAMEDITEM => 1506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT5_IE8_ADD => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT6_IE9_ADD => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTELEMENT6_IE9_VALUE => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSELECTELEMENTEVENTS2_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSELECTELEMENTEVENTS_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTIONOBJECT_CREATERANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTIONOBJECT_EMPTY => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTIONOBJECT_CLEAR => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTIONOBJECT_TYPE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTIONOBJECT2_CREATERANGECOLLECTION => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTIONOBJECT2_TYPEDETAIL => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_ANCHORNODE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_ANCHOROFFSET => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_FOCUSNODE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_FOCUSOFFSET => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_ISCOLLAPSED => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_COLLAPSE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_COLLAPSETOSTART => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_COLLAPSETOEND => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_SELECTALLCHILDREN => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_DELETEFROMDOCUMENT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_RANGECOUNT => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_GETRANGEAT => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_ADDRANGE => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_REMOVERANGE => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_REMOVEALLRANGES => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSELECTION_TOSTRING => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT_SELECTED => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT_VALUE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT_DEFAULTSELECTED => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT_INDEX => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT_TEXT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT_FORM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT3_LABEL => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENT4_IE9_VALUE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONELEMENTFACTORY_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_STATUS => 2001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_SIZE => 2002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_MAXLENGTH => 2003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_SELECT => 2004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_DEFAULTVALUE => 70619

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_READONLY => 2005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_CREATETEXTRANGE => 2006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_INDETERMINATE => 2007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_DEFAULTCHECKED => 2008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_CHECKED => 2009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_BORDER => 2012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_VSPACE => 2013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_HSPACE => 2014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_ALT => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_SRC => 2011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_LOWSRC => 2015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_VRML => 2016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_DYNSRC => 2017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_COMPLETE => 2018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_LOOP => 2019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_ONABORT => 71564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT_START => 2020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT2_ACCEPT => 2022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT2_USEMAP => 2023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT3_IE8_SRC => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT3_IE8_LOWSRC => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT3_IE8_VRML => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTELEMENT3_IE8_DYNSRC => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTBUTTONELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTBUTTONELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTBUTTONELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTBUTTONELEMENT_STATUS => 2021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTBUTTONELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTBUTTONELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTBUTTONELEMENT_CREATETEXTRANGE => 2006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTHIDDENELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTHIDDENELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTHIDDENELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTHIDDENELEMENT_STATUS => 2021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTHIDDENELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTHIDDENELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTHIDDENELEMENT_CREATETEXTRANGE => 2006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_STATUS => 2021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_DEFAULTVALUE => 70619

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_SIZE => 2002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_MAXLENGTH => 2003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_SELECT => 2004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_READONLY => 2005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT_CREATETEXTRANGE => 2006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT2_SELECTIONSTART => 2025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT2_SELECTIONEND => 2026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTTEXTELEMENT2_SETSELECTIONRANGE => 2027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_STATUS => 2021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_SIZE => 2002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_MAXLENGTH => 2003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_SELECT => 2004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTFILEELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_CHECKED => 2009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_DEFAULTCHECKED => 2008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_STATUS => 2001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_INDETERMINATE => 2007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONBUTTONELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_BORDER => 2012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_VSPACE => 2013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_HSPACE => 2014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_ALT => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_SRC => 2011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_LOWSRC => 2015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_VRML => 2016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_DYNSRC => 2017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_COMPLETE => 2018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_LOOP => 2019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_ONABORT => 71564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTIMAGE_START => 2020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_ALT => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_MIN => 2028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_MAX => 2029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_STEP => 2030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_VALUEASNUMBER => 2031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_STEPUP => 2033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLINPUTRANGEELEMENT_STEPDOWN => 2032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS2_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS2_ONSELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS2_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS2_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS2_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTIMAGEEVENTS2_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTIMAGEEVENTS2_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTIMAGEEVENTS2_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS_ONCHANGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS_ONSELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTTEXTELEMENTEVENTS_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTIMAGEEVENTS_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTIMAGEEVENTS_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLINPUTIMAGEEVENTS_ONABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_STATUS => 2001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_DEFAULTVALUE => 70619

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_SELECT => 7005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_READONLY => 7004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_ROWS => 7001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_COLS => 7002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_WRAP => 7003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT_CREATETEXTRANGE => 7006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT2_SELECTIONSTART => 7007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT2_SELECTIONEND => 7008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTEXTAREAELEMENT2_SETSELECTIONRANGE => 7009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT_TYPE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT_VALUE => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT_STATUS => 8001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT_CREATETEXTRANGE => 8002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBUTTONELEMENT2_IE9_TYPE => 8003

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_BGCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_SCROLLDELAY => 6000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_DIRECTION => 6001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_BEHAVIOR => 6002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_SCROLLAMOUNT => 6003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_LOOP => 6004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_VSPACE => 6005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_HSPACE => 6006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_ONFINISH => 71562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_ONSTART => 71563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_ONBOUNCE => 71556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_TRUESPEED => 6007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_START => 6010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMARQUEEELEMENT_STOP => 6011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLMARQUEEELEMENTEVENTS2_ONBOUNCE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLMARQUEEELEMENTEVENTS2_ONFINISH => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLMARQUEEELEMENTEVENTS2_ONSTART => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLMARQUEEELEMENTEVENTS_ONBOUNCE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLMARQUEEELEMENTEVENTS_ONFINISH => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLMARQUEEELEMENTEVENTS_ONSTART => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHTMLELEMENT_VERSION => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHEADELEMENT_PROFILE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLHEADELEMENT2_IE8_PROFILE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTITLEELEMENT_TEXT => 70637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMETAELEMENT_HTTPEQUIV => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMETAELEMENT_CONTENT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMETAELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMETAELEMENT_URL => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMETAELEMENT_CHARSET => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMETAELEMENT2_SCHEME => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMETAELEMENT3_IE8_URL => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBASEELEMENT_HREF => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBASEELEMENT_TARGET => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBASEELEMENT2_IE8_HREF => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLISINDEXELEMENT_PROMPT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLISINDEXELEMENT_ACTION => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLISINDEXELEMENT2_FORM => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNEXTIDELEMENT_N => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBASEFONTELEMENT_COLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBASEFONTELEMENT_FACE => 70554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBASEFONTELEMENT_SIZE => 70562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMHISTORY_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMHISTORY_BACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMHISTORY_FORWARD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMHISTORY_GO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_ADDREQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_CLEARREQUEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_DOREQUEST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_GETATTRIBUTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_SETATTRIBUTE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_COMMITCHANGES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_ADDREADREQUEST => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_DOREADREQUEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPSPROFILE_DOWRITEREQUEST => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_APPCODENAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_APPNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_APPVERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_USERAGENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_JAVAENABLED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_TAINTENABLED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_MIMETYPES => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_PLUGINS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_COOKIEENABLED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_OPSPROFILE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_TOSTRING => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_CPUCLASS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_SYSTEMLANGUAGE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_BROWSERLANGUAGE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_USERLANGUAGE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_PLATFORM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_APPMINORVERSION => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_CONNECTIONSPEED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_ONLINE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IOMNAVIGATOR_USERPROFILE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INAVIGATORGEOLOCATION_GEOLOCATION => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INAVIGATORDONOTTRACK_MSDONOTTRACK => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_HREF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_PROTOCOL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_HOST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_HOSTNAME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_PORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_PATHNAME => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_SEARCH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_HASH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_RELOAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_REPLACE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_ASSIGN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLOCATION_TOSTRING => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMIMETYPESCOLLECTION_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPLUGINSCOLLECTION_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPLUGINSCOLLECTION_REFRESH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBOOKMARKCOLLECTION_LENGTH => 1501

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLBOOKMARKCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBOOKMARKCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATATRANSFER_SETDATA => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATATRANSFER_GETDATA => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATATRANSFER_CLEARDATA => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATATRANSFER_DROPEFFECT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDATATRANSFER_EFFECTALLOWED => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_SRCELEMENT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_ALTKEY => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_CTRLKEY => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_SHIFTKEY => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_RETURNVALUE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_CANCELBUBBLE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_FROMELEMENT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_TOELEMENT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_KEYCODE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_BUTTON => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_TYPE => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_QUALIFIER => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_REASON => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_X => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_Y => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_CLIENTX => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_CLIENTY => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_OFFSETX => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_OFFSETY => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_SCREENX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_SCREENY => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ_SRCFILTER => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_SETATTRIBUTE => 66037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_GETATTRIBUTE => 66038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_REMOVEATTRIBUTE => 66039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_PROPERTYNAME => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_BOOKMARKS => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_RECORDSET => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_DATAFLD => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_BOUNDELEMENTS => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_REPEAT => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_SRCURN => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_SRCELEMENT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_ALTKEY => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_CTRLKEY => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_SHIFTKEY => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_FROMELEMENT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_TOELEMENT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_BUTTON => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_TYPE => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_QUALIFIER => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_REASON => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_X => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_Y => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_CLIENTX => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_CLIENTY => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_OFFSETX => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_OFFSETY => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_SCREENX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_SCREENY => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_SRCFILTER => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ2_DATATRANSFER => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_CONTENTOVERFLOW => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_SHIFTLEFT => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_ALTLEFT => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_CTRLLEFT => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_IMECOMPOSITIONCHANGE => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_IMENOTIFYCOMMAND => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_IMENOTIFYDATA => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_IMEREQUEST => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_IMEREQUESTDATA => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_KEYBOARDLAYOUT => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_BEHAVIORCOOKIE => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_BEHAVIORPART => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ3_NEXTPAGE => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ4_WHEELDELTA => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ5_URL => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ5_DATA => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ5_SOURCE => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ5_ORIGIN => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ5_ISSESSION => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ6_ACTIONURL => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEVENTOBJ6_BUTTONID => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEMEDIA_TYPE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEMEDIA_MATCHMEDIUM => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESCOLLECTION2_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESCOLLECTION2_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_COLORDEPTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_BUFFERDEPTH => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_WIDTH => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_HEIGHT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_UPDATEINTERVAL => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_AVAILHEIGHT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_AVAILWIDTH => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN_FONTSMOOTHINGENABLED => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN2_LOGICALXDPI => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN2_LOGICALYDPI => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN2_DEVICEXDPI => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN2_DEVICEYDPI => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN3_SYSTEMXDPI => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN3_SYSTEMYDPI => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCREEN4_PIXELDEPTH => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_FRAMES => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_DEFAULTSTATUS => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_STATUS => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SETTIMEOUT => 1172

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_CLEARTIMEOUT => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ALERT => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_CONFIRM => 1110

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_PROMPT => 1111

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_IMAGE => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_LOCATION => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_HISTORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_CLOSE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_OPENER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_NAVIGATOR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_NAME => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_PARENT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_OPEN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SELF => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_TOP => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_WINDOW => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_NAVIGATE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONFOCUS => 71550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONBLUR => 71551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONBEFOREUNLOAD => 71575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONUNLOAD => 71569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONHELP => 71549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONRESIZE => 71572

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_ONSCROLL => 71567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_DOCUMENT => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_EVENT => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2__NEWENUM => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SHOWMODALDIALOG => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SHOWHELP => 1155

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SCREEN => 1156

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_OPTION => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_FOCUS => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_CLOSED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_BLUR => 1159

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SCROLL => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_CLIENTINFORMATION => 1161

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SETINTERVAL => 1173

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_CLEARINTERVAL => 1163

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_OFFSCREENBUFFERING => 1164

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_EXECSCRIPT => 1165

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_TOSTRING => 1166

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SCROLLBY => 1167

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_SCROLLTO => 1168

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_MOVETO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_MOVEBY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_RESIZETO => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_RESIZEBY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW2_EXTERNAL => 1169

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_SCREENLEFT => 1170

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_SCREENTOP => 1171

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_ATTACHEVENT => 66043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_DETACHEVENT => 66044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_SETTIMEOUT => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_SETINTERVAL => 1162

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_PRINT => 1174

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_ONBEFOREPRINT => 71602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_ONAFTERPRINT => 71603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_CLIPBOARDDATA => 1175

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW3_SHOWMODELESSDIALOG => 1176

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW4_CREATEPOPUP => 1180

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW4_FRAMEELEMENT => 1181

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW5_XMLHTTPREQUEST => 1190

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_XDOMAINREQUEST => 1191

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_SESSIONSTORAGE => 1192

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_LOCALSTORAGE => 1193

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_ONHASHCHANGE => 71645

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_MAXCONNECTIONSPERSERVER => 1194

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_POSTMESSAGE => 1196

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_TOSTATICHTML => 1197

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_ONMESSAGE => 71646

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW6_MSWRITEPROFILERMARK => 1198

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_GETSELECTION => 1199

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_GETCOMPUTEDSTYLE => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_STYLEMEDIA => 1202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_PERFORMANCE => 1203

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_INNERWIDTH => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_INNERHEIGHT => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_PAGEXOFFSET => 1206

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_PAGEYOFFSET => 1207

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_SCREENX => 1208

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_SCREENY => 1209

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_OUTERWIDTH => 1210

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_OUTERHEIGHT => 1211

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONABORT => 71564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONCANPLAY => 71670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONCANPLAYTHROUGH => 71671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONCLICK => 71544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONCONTEXTMENU => 71601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDBLCLICK => 71545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDRAG => 71585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDRAGEND => 71586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDRAGENTER => 71587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDRAGLEAVE => 71589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDRAGOVER => 71588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDRAGSTART => 71571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDROP => 71590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONDURATIONCHANGE => 71672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONFOCUSIN => 71627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONFOCUSOUT => 71628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONINPUT => 71663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONEMPTIED => 71673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONENDED => 71674

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONKEYDOWN => 71541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONKEYPRESS => 71543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONKEYUP => 71542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONLOADEDDATA => 71675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONLOADEDMETADATA => 71676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONLOADSTART => 71677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSEDOWN => 71538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSEENTER => 71621

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSELEAVE => 71622

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSEMOVE => 71540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSEOUT => 71537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSEOVER => 71536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSEUP => 71539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONMOUSEWHEEL => 71612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONOFFLINE => 71644

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONONLINE => 71643

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONPROGRESS => 71681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONRATECHANGE => 71682

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONRESET => 71548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONSEEKED => 71683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONSEEKING => 71684

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONSTALLED => 71685

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONSTORAGE => 71636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONSUBMIT => 71547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONSUSPEND => 71686

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONTIMEUPDATE => 71687

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONPAUSE => 71678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONPLAY => 71679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONPLAYING => 71680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONVOLUMECHANGE => 71688

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW7_ONWAITING => 71689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSPOINTERDOWN => 71690

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSPOINTERMOVE => 71691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSPOINTERUP => 71692

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSPOINTEROVER => 71693

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSPOINTEROUT => 71694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSPOINTERCANCEL => 71695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSPOINTERHOVER => 71696

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSGESTURESTART => 71699

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSGESTURECHANGE => 71700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSGESTUREEND => 71701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSGESTUREHOLD => 71702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSGESTURETAP => 71703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSGESTUREDOUBLETAP => 71704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONMSINERTIASTART => 71705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_APPLICATIONCACHE => 1213

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLWINDOW8_ONPOPSTATE => 71728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS3_ONHASHCHANGE => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS3_ONMESSAGE => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONUNLOAD => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONHELP => 65546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONFOCUS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONRESIZE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONSCROLL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONBEFOREUNLOAD => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONBEFOREPRINT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS2_ONAFTERPRINT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONUNLOAD => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONHELP => 65546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONFOCUS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONRESIZE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONSCROLL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONBEFOREUNLOAD => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONBEFOREPRINT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLWINDOWEVENTS_ONAFTERPRINT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENTCOMPATIBLEINFO_USERAGENT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENTCOMPATIBLEINFO_VERSION => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENTCOMPATIBLEINFOCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENTCOMPATIBLEINFOCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT_SCRIPT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ALL => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_BODY => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ACTIVEELEMENT => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_IMAGES => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_APPLETS => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_LINKS => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_FORMS => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ANCHORS => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_TITLE => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_SCRIPTS => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_DESIGNMODE => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_SELECTION => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_READYSTATE => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_FRAMES => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_EMBEDS => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_PLUGINS => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ALINKCOLOR => 1022

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLDOCUMENT2_BGCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_FGCOLOR => 70538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_LINKCOLOR => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_VLINKCOLOR => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_REFERRER => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_LOCATION => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_LASTMODIFIED => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_URL => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_DOMAIN => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_COOKIE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_EXPANDO => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_CHARSET => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_DEFAULTCHARSET => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_MIMETYPE => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_FILESIZE => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_FILECREATEDDATE => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_FILEMODIFIEDDATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_FILEUPDATEDDATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_SECURITY => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_PROTOCOL => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_NAMEPROP => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_WRITE => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_WRITELN => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_OPEN => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_CLOSE => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_CLEAR => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_QUERYCOMMANDSUPPORTED => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_QUERYCOMMANDENABLED => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_QUERYCOMMANDSTATE => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_QUERYCOMMANDINDETERM => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_QUERYCOMMANDTEXT => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_QUERYCOMMANDVALUE => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_EXECCOMMAND => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_EXECCOMMANDSHOWHELP => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_CREATEELEMENT => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONHELP => 71549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONCLICK => 71544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONDBLCLICK => 71545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONKEYUP => 71542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONKEYDOWN => 71541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONKEYPRESS => 71543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONMOUSEUP => 71539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONMOUSEDOWN => 71538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONMOUSEMOVE => 71540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONMOUSEOUT => 71537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONMOUSEOVER => 71536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONAFTERUPDATE => 71558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONROWEXIT => 71554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONROWENTER => 71555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONDRAGSTART => 71571

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONSELECTSTART => 71573

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ELEMENTFROMPOINT => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_PARENTWINDOW => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_STYLESHEETS => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONBEFOREUPDATE => 71557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_ONERRORUPDATE => 71574

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_TOSTRING => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT2_CREATESTYLESHEET => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_RELEASECAPTURE => 1072

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_RECALC => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_CREATETEXTNODE => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_DOCUMENTELEMENT => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_UNIQUEID => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ATTACHEVENT => 66043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_DETACHEVENT => 66044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONROWSDELETE => 71598

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONROWSINSERTED => 71599

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONCELLCHANGE => 71600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONDATASETCHANGED => 71576

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONDATAAVAILABLE => 71577

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONDATASETCOMPLETE => 71578

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONPROPERTYCHANGE => 71583

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_DIR => 70653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONCONTEXTMENU => 71601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONSTOP => 71604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_CREATEDOCUMENTFRAGMENT => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_PARENTDOCUMENT => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ENABLEDOWNLOAD => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_BASEURL => 1080

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_CHILDNODES => 66585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_INHERITSTYLESHEETS => 1082

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_ONBEFOREEDITFOCUS => 71605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_GETELEMENTSBYNAME => 1086

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_GETELEMENTBYID => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT3_GETELEMENTSBYTAGNAME => 1087

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_FOCUS => 1089

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_HASFOCUS => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_ONSELECTIONCHANGE => 71616

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_NAMESPACES => 1091

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_CREATEDOCUMENTFROMURL => 1092

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_MEDIA => 1093

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_CREATEEVENTOBJECT => 1094

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_FIREEVENT => 1095

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_CREATERENDERSTYLE => 1096

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_ONCONTROLSELECT => 71615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT4_URLUNENCODED => 1097

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_ONMOUSEWHEEL => 71612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_DOCTYPE => 1098

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_IMPLEMENTATION => 1099

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_CREATEATTRIBUTE => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_CREATECOMMENT => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_ONFOCUSIN => 71627

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_ONFOCUSOUT => 71628

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_ONACTIVATE => 71623

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_ONDEACTIVATE => 71624

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_ONBEFOREACTIVATE => 71626

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_ONBEFOREDEACTIVATE => 71613

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT5_COMPATMODE => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT6_COMPATIBLE => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT6_DOCUMENTMODE => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT6_ONSTORAGE => 71636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT6_ONSTORAGECOMMIT => 71637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT6_IE8_GETELEMENTBYID => 1107

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT6_UPDATESETTINGS => 1109

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_DEFAULTVIEW => 1110

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_CREATECDATASECTION => 1123

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_GETSELECTION => 1112

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_GETELEMENTSBYTAGNAMENS => 1113

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_CREATEELEMENTNS => 1114

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_CREATEATTRIBUTENS => 1115

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONMSTHUMBNAILCLICK => 71657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_CHARACTERSET => 1117

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_IE9_CREATEELEMENT => 1118

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_IE9_CREATEATTRIBUTE => 1119

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_GETELEMENTSBYCLASSNAME => 1120

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_CREATEPROCESSINGINSTRUCTION => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ADOPTNODE => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONMSSITEMODEJUMPLISTITEMREMOVED => 71666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_IE9_ALL => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_INPUTENCODING => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_XMLENCODING => 1128

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_XMLSTANDALONE => 1129

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_XMLVERSION => 1130

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_HASATTRIBUTES => 1132

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONABORT => 71564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONBLUR => 71551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONCANPLAY => 71670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONCANPLAYTHROUGH => 71671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONCHANGE => 71566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONDRAG => 71585

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONDRAGEND => 71586

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONDRAGENTER => 71587

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONDRAGLEAVE => 71589

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONDRAGOVER => 71588

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONDROP => 71590

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONDURATIONCHANGE => 71672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONEMPTIED => 71673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONENDED => 71674

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONFOCUS => 71550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONINPUT => 71663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONLOADEDDATA => 71675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONLOADEDMETADATA => 71676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONLOADSTART => 71677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONPAUSE => 71678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONPLAY => 71679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONPLAYING => 71680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONPROGRESS => 71681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONRATECHANGE => 71682

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONRESET => 71548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONSCROLL => 71567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONSEEKED => 71683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONSEEKING => 71684

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONSELECT => 71546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONSTALLED => 71685

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONSUBMIT => 71547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONSUSPEND => 71686

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONTIMEUPDATE => 71687

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONVOLUMECHANGE => 71688

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_ONWAITING => 71689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_NORMALIZE => 1134

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_IMPORTNODE => 1135

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_IE9_PARENTWINDOW => 1136

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_IE9_BODY => 1137

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT7_HEAD => 1138

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSCONTENTZOOM => 71708

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSPOINTERDOWN => 71690

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSPOINTERMOVE => 71691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSPOINTERUP => 71692

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSPOINTEROVER => 71693

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSPOINTEROUT => 71694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSPOINTERCANCEL => 71695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSPOINTERHOVER => 71696

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSGESTURESTART => 71699

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSGESTURECHANGE => 71700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSGESTUREEND => 71701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSGESTUREHOLD => 71702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSGESTURETAP => 71703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSGESTUREDOUBLETAP => 71704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSINERTIASTART => 71705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ELEMENTSFROMPOINT => 1139

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ELEMENTSFROMRECT => 1140

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_ONMSMANIPULATIONSTATECHANGED => 71714

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDOCUMENT8_MSCAPSLOCKWARNINGOFF => 1141

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOCUMENTEVENT_CREATEEVENT => 1108

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOCUMENTRANGE_CREATERANGE => 1111

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOCUMENTSELECTOR_QUERYSELECTOR => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOCUMENTSELECTOR_QUERYSELECTORALL => 1106

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOCUMENTTRAVERSAL_CREATENODEITERATOR => 1121

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOCUMENTTRAVERSAL_CREATETREEWALKER => 1122

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS4_ONMSTHUMBNAILCLICK => 71657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS4_ONMSSITEMODEJUMPLISTITEMREMOVED => 71666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS3_ONSTORAGE => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS3_ONSTORAGECOMMIT => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONHELP => 65546

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONCLICK => -600

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONDBLCLICK => -601

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONKEYDOWN => -602

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONKEYUP => -604

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONKEYPRESS => -603

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONMOUSEDOWN => -605

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONMOUSEMOVE => -606

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONMOUSEUP => -607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONMOUSEOUT => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONMOUSEOVER => 65544

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONBEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONAFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONDRAGSTART => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONSELECTSTART => 65548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONCONTEXTMENU => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONSTOP => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONCELLCHANGE => 65570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONPROPERTYCHANGE => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONBEFOREEDITFOCUS => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONSELECTIONCHANGE => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONCONTROLSELECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONMOUSEWHEEL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONFOCUSIN => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONFOCUSOUT => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONACTIVATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONDEACTIVATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONBEFOREACTIVATE => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS2_ONBEFOREDEACTIVATE => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONHELP => 65546

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONCLICK => -600

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONDBLCLICK => -601

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONKEYDOWN => -602

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONKEYUP => -604

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONKEYPRESS => -603

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONMOUSEDOWN => -605

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONMOUSEMOVE => -606

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONMOUSEUP => -607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONMOUSEOUT => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONMOUSEOVER => 65544

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONBEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONAFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONDRAGSTART => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONSELECTSTART => 65548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONCONTEXTMENU => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONSTOP => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONCELLCHANGE => 65570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONPROPERTYCHANGE => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONBEFOREEDITFOCUS => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONSELECTIONCHANGE => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONCONTROLSELECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONMOUSEWHEEL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONFOCUSIN => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONFOCUSOUT => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONACTIVATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONDEACTIVATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONBEFOREACTIVATE => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLDOCUMENTEVENTS_ONBEFOREDEACTIVATE => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBBRIDGE_URL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBBRIDGE_SCROLLBAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBBRIDGE_EMBED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBBRIDGE_EVENT => 1152

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IWEBBRIDGE_READYSTATE => -525

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IWEBBRIDGE_ABOUTBOX => -552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_RAISEEVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_BUBBLEEVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_SETCONTEXTMENU => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_SELECTABLECONTENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_FROZEN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_SCROLLBAR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_VERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_VISIBILITY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWBSCRIPTCONTROL_ONVISIBILITYCHANGE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONSCRIPTLETEVENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONCLICK => -600

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONDBLCLICK => -601

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONKEYDOWN => -602

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONKEYUP => -604

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONKEYPRESS => -603

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONMOUSEDOWN => -605

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONMOUSEMOVE => -606

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DWEBBRIDGEEVENTS_ONMOUSEUP => -607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_HIDDEN => 68546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_PALETTE => 68540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_PLUGINSPAGE => 68541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_SRC => 68542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_UNITS => 68544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT2_IE8_SRC => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLEMBEDELEMENT2_IE8_PLUGINSPAGE => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION_LENGTH => 1500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLAREASCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION_TAGS => 1502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION_ADD => 1503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION_REMOVE => 1504

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION2_URNS => 1505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION3_NAMEDITEM => 1506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION4_IE8_LENGTH => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION4_IE8_ITEM => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREASCOLLECTION4_IE8_NAMEDITEM => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMAPELEMENT_AREAS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMAPELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_SHAPE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_COORDS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_HREF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_TARGET => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_ALT => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_NOHREF => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_HOST => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_HOSTNAME => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_PATHNAME => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_PORT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_PROTOCOL => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_SEARCH => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_HASH => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_ONBLUR => 71551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_ONFOCUS => 71550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_TABINDEX => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_FOCUS => 67536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT_BLUR => 67538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT2_IE8_SHAPE => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT2_IE8_COORDS => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAREAELEMENT2_IE8_HREF => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECAPTION_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECAPTION_VALIGN => 70567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT_TEXT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT_ATOMIC => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT2_DATA => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT2_LENGTH => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT2_SUBSTRINGDATA => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT2_APPENDDATA => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT2_INSERTDATA => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT2_DELETEDATA => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT2_REPLACEDATA => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT3_IE9_SUBSTRINGDATA => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT3_IE9_INSERTDATA => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT3_IE9_DELETEDATA => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMMENTELEMENT3_IE9_REPLACEDATA => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPHRASEELEMENT2_CITE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPHRASEELEMENT2_DATETIME => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPHRASEELEMENT3_IE8_CITE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_COLS => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_BORDER => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_FRAME => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_RULES => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_CELLSPACING => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_CELLPADDING => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_BACKGROUND => 70537

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLTABLE_BGCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_BORDERCOLOR => 70564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_BORDERCOLORLIGHT => 70565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_BORDERCOLORDARK => 70566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_REFRESH => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_ROWS => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_DATAPAGESIZE => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_NEXTPAGE => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_PREVIOUSPAGE => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_THEAD => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_TFOOT => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_TBODIES => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_CAPTION => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_CREATETHEAD => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_DELETETHEAD => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_CREATETFOOT => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_DELETETFOOT => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_CREATECAPTION => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_DELETECAPTION => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_INSERTROW => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_DELETEROW => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE2_FIRSTPAGE => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE2_LASTPAGE => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE2_CELLS => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE2_MOVEROW => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE3_SUMMARY => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE4_IE9_THEAD => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE4_IE9_TFOOT => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE4_IE9_CAPTION => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE4_IE9_INSERTROW => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE4_IE9_DELETEROW => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLE4_CREATETBODY => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL_SPAN => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL_VALIGN => 70567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL2_CH => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL2_CHOFF => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL3_IE9_CH => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECOL3_IE9_CHOFF => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION_VALIGN => 70567

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLTABLESECTION_BGCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION_ROWS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION_INSERTROW => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION_DELETEROW => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION2_MOVEROW => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION3_CH => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION3_CHOFF => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION4_IE9_CH => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION4_IE9_CHOFF => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION4_IE9_INSERTROW => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLESECTION4_IE9_DELETEROW => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_VALIGN => 70567

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLTABLEROW_BGCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_BORDERCOLOR => 70564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_BORDERCOLORLIGHT => 70565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_BORDERCOLORDARK => 70566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_ROWINDEX => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_SECTIONROWINDEX => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_CELLS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_INSERTCELL => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW_DELETECELL => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW2_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW3_CH => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW3_CHOFF => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW4_IE9_CH => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW4_IE9_CHOFF => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW4_IE9_INSERTCELL => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROW4_IE9_DELETECELL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROWMETRICS_CLIENTHEIGHT => 67555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROWMETRICS_CLIENTWIDTH => 67556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROWMETRICS_CLIENTTOP => 67557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLEROWMETRICS_CLIENTLEFT => 67558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_ROWSPAN => 2001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_COLSPAN => 2002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_ALIGN => 65608

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_VALIGN => 70567

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLTABLECELL_BGCOLOR => -501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_NOWRAP => 70541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_BACKGROUND => 70537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_BORDERCOLOR => 70564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_BORDERCOLORLIGHT => 70565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_BORDERCOLORDARK => 70566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL_CELLINDEX => 2003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL2_ABBR => 2004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL2_AXIS => 2005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL2_CH => 2006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL2_CHOFF => 2007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL2_HEADERS => 2008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL2_SCOPE => 2009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL3_IE9_CH => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTABLECELL3_IE9_CHOFF => 2011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_SRC => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_HTMLFOR => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_EVENT => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_TEXT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_DEFER => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT_TYPE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT2_CHARSET => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT3_IE8_SRC => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSCRIPTELEMENT4_USEDCHARSET => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSCRIPTEVENTS2_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSCRIPTEVENTS_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_OBJECT => 68537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_CLASSID => 68538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_DATA => 68539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_RECORDSET => 68541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_CODEBASE => 68542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_CODETYPE => 68543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_CODE => 68544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_BASEHREF => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_TYPE => 68545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_READYSTATE => 68546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_ALTHTML => 68547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_VSPACE => 68548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT_HSPACE => 68549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT2_NAMEDRECORDSET => 68550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT2_CLASSID => 68538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT2_DATA => 68539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT3_ARCHIVE => 68551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT3_ALT => 68552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT3_DECLARE => 68553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT3_STANDBY => 68554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT3_BORDER => 68555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT3_USEMAP => 68556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT4_CONTENTDOCUMENT => 68566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT4_IE8_CODEBASE => 68567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT4_IE8_DATA => 68568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOBJECTELEMENT5_IE9_OBJECT => 68569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT_NAME => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT_VALUE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT_TYPE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT_VALUETYPE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT2_NAME => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT2_TYPE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT2_VALUE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPARAMELEMENT2_IE8_VALUETYPE => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONBEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONAFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONERROR => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONCELLCHANGE => 65570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS2_ONREADYSTATECHANGE => 65556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONBEFOREUPDATE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONAFTERUPDATE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONERRORUPDATE => 65549

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONROWEXIT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONROWENTER => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONDATASETCHANGED => 65550

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONDATAAVAILABLE => 65551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONDATASETCOMPLETE => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONERROR => 65555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONROWSDELETE => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONROWSINSERTED => 65569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONCELLCHANGE => 65570

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLOBJECTELEMENTEVENTS_ONREADYSTATECHANGE => 65556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_SRC => 68536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_BORDER => 68538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_FRAMEBORDER => 68539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_FRAMESPACING => 68540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_MARGINWIDTH => 68541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_MARGINHEIGHT => 68542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_NORESIZE => 68543

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE_SCROLLING => 68544

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE2_CONTENTWINDOW => 68545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE2_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE2_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE2_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE2_ALLOWTRANSPARENCY => 70742

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEBASE3_LONGDESC => 68546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLFRAMESITEEVENTS2_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLFRAMESITEEVENTS_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEELEMENT_BORDERCOLOR => 69537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEELEMENT2_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEELEMENT2_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEELEMENT3_CONTENTDOCUMENT => 69656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEELEMENT3_IE8_SRC => 69657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEELEMENT3_IE8_LONGDESC => 69658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMEELEMENT3_IE8_FRAMEBORDER => 69659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT_VSPACE => 69537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT_HSPACE => 69538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT2_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT2_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT3_CONTENTDOCUMENT => 69656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT3_IE8_SRC => 69657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT3_IE8_LONGDESC => 69658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIFRAMEELEMENT3_IE8_FRAMEBORDER => 69659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIVPOSITION_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFIELDSETELEMENT_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFIELDSETELEMENT2_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLEGENDELEMENT_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLLEGENDELEMENT2_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSPANFLOW_ALIGN => 65609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_ROWS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_COLS => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_BORDER => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_BORDERCOLOR => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_FRAMEBORDER => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_FRAMESPACING => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_ONUNLOAD => 71569

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT_ONBEFOREUNLOAD => 71575

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT2_ONBEFOREPRINT => 71602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT2_ONAFTERPRINT => 71603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT3_ONHASHCHANGE => 71645

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT3_ONMESSAGE => 71646

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT3_ONOFFLINE => 71644

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT3_ONONLINE => 71643

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFRAMESETELEMENT3_ONSTORAGE => 71636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBGSOUND_SRC => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBGSOUND_LOOP => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBGSOUND_VOLUME => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLBGSOUND_BALANCE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTNAMESCOLLECTION_LENGTH => 1501

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLFONTNAMESCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTNAMESCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTSIZESCOLLECTION_LENGTH => 1502

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLFONTSIZESCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTSIZESCOLLECTION_FORFONT => 1503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLFONTSIZESCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_DOCUMENT => 1503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_FONTS => 1504

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_EXECARG => 1505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_ERRORLINE => 1506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_ERRORCHARACTER => 1507

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_ERRORCODE => 1508

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_ERRORMESSAGE => 1509

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_ERRORDEBUG => 1510

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_UNSECUREDWINDOWOFDOCUMENT => 1511

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_FINDTEXT => 1512

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_ANYTHINGAFTERFRAMESET => 1513

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_SIZES => 1514

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_OPENFILEDLG => 1515

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_SAVEFILEDLG => 1516

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_CHOOSECOLORDLG => 1517

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_SHOWSECURITYINFO => 1518

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_ISAPARTMENTMODEL => 1519

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_GETCHARSET => 1520

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLOPTIONSHOLDER_SECURECONNECTIONINFO => 1521

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_TYPE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_STYLESHEET => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_DISABLED => 65612

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT_MEDIA => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEELEMENT2_SHEET => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSTYLEELEMENTEVENTS2_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSTYLEELEMENTEVENTS2_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSTYLEELEMENTEVENTS_ONLOAD => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLSTYLEELEMENTEVENTS_ONERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEFONTFACE_FONTSRC => 70633

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLEFONTFACE2_STYLE => 65610

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_RESPONSETEXT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_TIMEOUT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_CONTENTTYPE => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_ONPROGRESS => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_ONTIMEOUT => 71648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_ONLOAD => 71568

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_ABORT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_OPEN => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUEST_SEND => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXDOMAINREQUESTFACTORY_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE_REMAININGSPACE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE_KEY => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE_GETITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE_SETITEM => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE_REMOVEITEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE_CLEAR => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTORAGE2_IE9_SETITEM => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IEVENTTARGET_ADDEVENTLISTENER => 66046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IEVENTTARGET_REMOVEEVENTLISTENER => 66047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IEVENTTARGET_DISPATCHEVENT => 66048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_BUBBLES => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_CANCELABLE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_CURRENTTARGET => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_DEFAULTPREVENTED => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_EVENTPHASE => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_TARGET => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_TIMESTAMP => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_TYPE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_INITEVENT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_PREVENTDEFAULT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_STOPPROPAGATION => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_STOPIMMEDIATEPROPAGATION => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_ISTRUSTED => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_CANCELBUBBLE => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEVENT_SRCELEMENT => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMUIEVENT_VIEW => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMUIEVENT_DETAIL => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMUIEVENT_INITUIEVENT => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_SCREENX => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_SCREENY => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_CLIENTX => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_CLIENTY => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_CTRLKEY => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_SHIFTKEY => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_ALTKEY => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_METAKEY => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_BUTTON => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_RELATEDTARGET => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_INITMOUSEEVENT => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_GETMODIFIERSTATE => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_BUTTONS => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_FROMELEMENT => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_TOELEMENT => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_X => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_Y => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_OFFSETX => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_OFFSETY => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_PAGEX => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_PAGEY => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_LAYERX => 1072

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_LAYERY => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEEVENT_WHICH => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDRAGEVENT_DATATRANSFER => 1401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDRAGEVENT_INITDRAGEVENT => 1402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEWHEELEVENT_WHEELDELTA => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMOUSEWHEELEVENT_INITMOUSEWHEELEVENT => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMWHEELEVENT_DELTAX => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMWHEELEVENT_DELTAY => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMWHEELEVENT_DELTAZ => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMWHEELEVENT_DELTAMODE => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMWHEELEVENT_INITWHEELEVENT => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTEXTEVENT_DATA => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTEXTEVENT_INPUTMETHOD => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTEXTEVENT_INITTEXTEVENT => 1128

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTEXTEVENT_LOCALE => 1129

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_KEY => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_LOCATION => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_CTRLKEY => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_SHIFTKEY => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_ALTKEY => 1155

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_METAKEY => 1156

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_REPEAT => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_GETMODIFIERSTATE => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_INITKEYBOARDEVENT => 1159

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_KEYCODE => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_CHARCODE => 1161

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_WHICH => 1162

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_IE9_CHAR => 1163

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMKEYBOARDEVENT_LOCALE => 1164

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMCOMPOSITIONEVENT_DATA => 1176

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMCOMPOSITIONEVENT_INITCOMPOSITIONEVENT => 1177

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMCOMPOSITIONEVENT_LOCALE => 1178

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMUTATIONEVENT_RELATEDNODE => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMUTATIONEVENT_PREVVALUE => 1227

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMUTATIONEVENT_NEWVALUE => 1228

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMUTATIONEVENT_ATTRNAME => 1229

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMUTATIONEVENT_ATTRCHANGE => 1230

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMUTATIONEVENT_INITMUTATIONEVENT => 1231

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMBEFOREUNLOADEVENT_RETURNVALUE => 1376

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMFOCUSEVENT_RELATEDTARGET => 1251

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMFOCUSEVENT_INITFOCUSEVENT => 1252

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMCUSTOMEVENT_DETAIL => 1201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMCUSTOMEVENT_INITCUSTOMEVENT => 1202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASGRADIENT_ADDCOLORSTOP => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASTEXTMETRICS_WIDTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASIMAGEDATA_WIDTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASIMAGEDATA_HEIGHT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASIMAGEDATA_DATA => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASPIXELARRAY_LENGTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CANVAS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_RESTORE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_SAVE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_ROTATE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_SCALE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_SETTRANSFORM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_TRANSFORM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_TRANSLATE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_GLOBALALPHA => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_GLOBALCOMPOSITEOPERATION => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_FILLSTYLE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_STROKESTYLE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CREATELINEARGRADIENT => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CREATERADIALGRADIENT => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CREATEPATTERN => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_LINECAP => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_LINEJOIN => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_LINEWIDTH => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_MITERLIMIT => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_SHADOWBLUR => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_SHADOWCOLOR => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_SHADOWOFFSETX => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_SHADOWOFFSETY => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CLEARRECT => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_FILLRECT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_STROKERECT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_ARC => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_ARCTO => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_BEGINPATH => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_BEZIERCURVETO => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CLIP => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CLOSEPATH => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_FILL => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_LINETO => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_MOVETO => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_QUADRATICCURVETO => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_RECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_STROKE => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_ISPOINTINPATH => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_FONT => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_TEXTALIGN => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_TEXTBASELINE => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_FILLTEXT => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_MEASURETEXT => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_STROKETEXT => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_DRAWIMAGE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_CREATEIMAGEDATA => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_GETIMAGEDATA => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICANVASRENDERINGCONTEXT2D_PUTIMAGEDATA => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCANVASELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCANVASELEMENT_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCANVASELEMENT_GETCONTEXT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCANVASELEMENT_TODATAURL => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPROGRESSEVENT_LENGTHCOMPUTABLE => 1551

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPROGRESSEVENT_LOADED => 1552

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPROGRESSEVENT_TOTAL => 1553

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPROGRESSEVENT_INITPROGRESSEVENT => 1554

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMESSAGEEVENT_DATA => 1326

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMESSAGEEVENT_ORIGIN => 1327

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMESSAGEEVENT_SOURCE => 1328

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMESSAGEEVENT_INITMESSAGEEVENT => 1329

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSITEMODEEVENT_BUTTONID => 1301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSITEMODEEVENT_ACTIONURL => 1302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSTORAGEEVENT_KEY => 1351

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSTORAGEEVENT_OLDVALUE => 1352

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSTORAGEEVENT_NEWVALUE => 1353

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSTORAGEEVENT_URL => 1354

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSTORAGEEVENT_STORAGEAREA => 1355

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMSTORAGEEVENT_INITSTORAGEEVENT => 1356

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_READYSTATE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_RESPONSEBODY => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_RESPONSETEXT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_RESPONSEXML => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_STATUS => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_STATUSTEXT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_ABORT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_OPEN => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_SEND => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_GETALLRESPONSEHEADERS => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_GETRESPONSEHEADER => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST_SETREQUESTHEADER => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST2_TIMEOUT => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUEST2_ONTIMEOUT => 71648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLXMLHTTPREQUESTFACTORY_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLXMLHTTPREQUESTEVENTS_ONTIMEOUT => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTMLXMLHTTPREQUESTEVENTS_ONREADYSTATECHANGE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANGLE_UNITTYPE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANGLE_VALUE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANGLE_VALUEINSPECIFIEDUNITS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANGLE_VALUEASSTRING => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANGLE_NEWVALUESPECIFIEDUNITS => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANGLE_CONVERTTOSPECIFIEDUNITS => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTYLABLE_CLASSNAME => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLOCATABLE_NEARESTVIEWPORTELEMENT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLOCATABLE_FARTHESTVIEWPORTELEMENT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLOCATABLE_GETBBOX => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLOCATABLE_GETCTM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLOCATABLE_GETSCREENCTM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLOCATABLE_GETTRANSFORMTOELEMENT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMABLE_TRANSFORM => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTESTS_REQUIREDFEATURES => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTESTS_REQUIREDEXTENSIONS => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTESTS_SYSTEMLANGUAGE => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTESTS_HASEXTENSION => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLANGSPACE_XMLLANG => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLANGSPACE_XMLSPACE => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGEXTERNALRESOURCESREQUIRED_EXTERNALRESOURCESREQUIRED => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGFITTOVIEWBOX_VIEWBOX => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGFITTOVIEWBOX_PRESERVEASPECTRATIO => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGZOOMANDPAN_ZOOMANDPAN => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGURIREFERENCE_HREF => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDANGLE_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDANGLE_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDTRANSFORMLIST_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDTRANSFORMLIST_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDBOOLEAN_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDBOOLEAN_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDENUMERATION_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDENUMERATION_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDINTEGER_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDINTEGER_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDLENGTH_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDLENGTH_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDLENGTHLIST_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDLENGTHLIST_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDNUMBER_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDNUMBER_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDNUMBERLIST_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDNUMBERLIST_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDRECT_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDRECT_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDSTRING_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDSTRING_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGCLIPPATHELEMENT_CLIPPATHUNITS => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGDOCUMENT_ROOTELEMENT => 1116

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IGETSVGDOCUMENT_GETSVGDOCUMENT => 65615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENT_XMLBASE => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENT_OWNERSVGELEMENT => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENT_VIEWPORTELEMENT => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENT_FOCUSABLE => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTH_UNITTYPE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTH_VALUE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTH_VALUEINSPECIFIEDUNITS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTH_VALUEASSTRING => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTH_NEWVALUESPECIFIEDUNITS => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTH_CONVERTTOSPECIFIEDUNITS => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_NUMBEROFITEMS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_CLEAR => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_INITIALIZE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_GETITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_INSERTITEMBEFORE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_REPLACEITEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_REMOVEITEM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLENGTHLIST_APPENDITEM => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_A => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_B => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_C => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_D => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_E => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_F => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_MULTIPLY => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_INVERSE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_TRANSLATE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_SCALE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_SCALENONUNIFORM => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_ROTATE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_ROTATEFROMVECTOR => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_FLIPX => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_FLIPY => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_SKEWX => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMATRIX_SKEWY => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBER_VALUE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_NUMBEROFITEMS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_CLEAR => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_INITIALIZE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_GETITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_INSERTITEMBEFORE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_REPLACEITEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_REMOVEITEM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGNUMBERLIST_APPENDITEM => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATTERNELEMENT_PATTERNUNITS => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATTERNELEMENT_PATTERNCONTENTUNITS => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATTERNELEMENT_PATTERNTRANSFORM => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATTERNELEMENT_X => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATTERNELEMENT_Y => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATTERNELEMENT_WIDTH => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATTERNELEMENT_HEIGHT => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEG_PATHSEGTYPE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEG_PATHSEGTYPEASLETTER => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCABS_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCABS_R1 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCABS_R2 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCABS_ANGLE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCABS_LARGEARCFLAG => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCABS_SWEEPFLAG => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCREL_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCREL_R1 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCREL_R2 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCREL_ANGLE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCREL_LARGEARCFLAG => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGARCREL_SWEEPFLAG => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGMOVETOABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGMOVETOABS_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGMOVETOREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGMOVETOREL_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOABS_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOREL_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICABS_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICABS_X1 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICABS_Y1 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICABS_X2 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICABS_Y2 => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICREL_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICREL_X1 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICREL_Y1 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICREL_X2 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICREL_Y2 => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHABS_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHABS_X2 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHABS_Y2 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHREL_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHREL_X2 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOCUBICSMOOTHREL_Y2 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICABS_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICABS_X1 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICABS_Y1 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICREL_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICREL_X1 => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICREL_Y1 => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICSMOOTHABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICSMOOTHABS_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICSMOOTHREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGCURVETOQUADRATICSMOOTHREL_Y => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOHORIZONTALABS_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOHORIZONTALREL_X => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOVERTICALABS_Y => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLINETOVERTICALREL_Y => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_NUMBEROFITEMS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_CLEAR => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_INITIALIZE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_GETITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_INSERTITEMBEFORE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_REPLACEITEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_REMOVEITEM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHSEGLIST_APPENDITEM => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINT_X => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINT_Y => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINT_MATRIXTRANSFORM => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_NUMBEROFITEMS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_CLEAR => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_INITIALIZE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_GETITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_INSERTITEMBEFORE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_REPLACEITEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_REMOVEITEM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPOINTLIST_APPENDITEM => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECT_X => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECT_Y => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECT_WIDTH => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECT_HEIGHT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_NUMBEROFITEMS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_CLEAR => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_INITIALIZE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_GETITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_INSERTITEMBEFORE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_REPLACEITEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_REMOVEITEM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTRINGLIST_APPENDITEM => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_TYPE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_MATRIX => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_ANGLE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_SETMATRIX => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_SETTRANSLATE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_SETSCALE => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_SETROTATE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_SETSKEWX => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORM_SETSKEWY => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_X => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_Y => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_WIDTH => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_HEIGHT => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CONTENTSCRIPTTYPE => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CONTENTSTYLETYPE => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_VIEWPORT => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_PIXELUNITTOMILLIMETERX => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_PIXELUNITTOMILLIMETERY => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_SCREENPIXELTOMILLIMETERX => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_SCREENPIXELTOMILLIMETERY => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_USECURRENTVIEW => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CURRENTVIEW => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CURRENTSCALE => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CURRENTTRANSLATE => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_SUSPENDREDRAW => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_UNSUSPENDREDRAW => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_UNSUSPENDREDRAWALL => 1072

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_FORCEREDRAW => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_PAUSEANIMATIONS => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_UNPAUSEANIMATIONS => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_ANIMATIONSPAUSED => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_GETCURRENTTIME => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_SETCURRENTTIME => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_GETINTERSECTIONLIST => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_GETENCLOSURELIST => 1080

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CHECKINTERSECTION => 1081

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CHECKENCLOSURE => 1082

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_DESELECTALL => 1083

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGNUMBER => 1084

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGLENGTH => 1085

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGANGLE => 1086

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGPOINT => 1087

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGMATRIX => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGRECT => 1089

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGTRANSFORM => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_CREATESVGTRANSFORMFROMMATRIX => 1091

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSVGELEMENT_GETELEMENTBYID => 1092

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGUSEELEMENT_X => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGUSEELEMENT_Y => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGUSEELEMENT_WIDTH => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGUSEELEMENT_HEIGHT => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGUSEELEMENT_INSTANCEROOT => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGUSEELEMENT_ANIMATEDINSTANCEROOT => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESAPPLIEDCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESAPPLIEDCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESAPPLIEDCOLLECTION_PROPERTYAPPLIEDBY => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESAPPLIEDCOLLECTION_PROPERTYAPPLIEDTRACE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSTYLESHEETRULESAPPLIEDCOLLECTION_PROPERTYAPPLIEDTRACELENGTH => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIED_ELEMENT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIED_INLINESTYLES => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIED_APPLIEDRULES => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIED_PROPERTYISINLINE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIED_PROPERTYISINHERITABLE => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIED_HASINHERITABLEPROPERTY => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_LENGTH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_ELEMENT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_PROPERTYINHERITEDFROM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_PROPERTYCOUNT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_PROPERTY => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_PROPERTYINHERITEDTRACE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRULESAPPLIEDCOLLECTION_PROPERTYINHERITEDTRACELENGTH => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_NUMBEROFITEMS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_CLEAR => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_INITIALIZE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_GETITEM => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_INSERTITEMBEFORE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_REPLACEITEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_REMOVEITEM => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_APPENDITEM => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_CREATESVGTRANSFORMFROMMATRIX => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTRANSFORMLIST_CONSOLIDATE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPOINTS_POINTS => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPOINTS_ANIMATEDPOINTS => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGCIRCLEELEMENT_CX => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGCIRCLEELEMENT_CY => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGCIRCLEELEMENT_R => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELLIPSEELEMENT_CX => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELLIPSEELEMENT_CY => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELLIPSEELEMENT_RX => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELLIPSEELEMENT_RY => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEELEMENT_X1 => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEELEMENT_Y1 => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEELEMENT_X2 => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEELEMENT_Y2 => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECTELEMENT_X => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECTELEMENT_Y => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECTELEMENT_WIDTH => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECTELEMENT_HEIGHT => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECTELEMENT_RX => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRECTELEMENT_RY => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPATHDATA_PATHSEGLIST => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPATHDATA_NORMALIZEDPATHSEGLIST => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPATHDATA_ANIMATEDPATHSEGLIST => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPATHDATA_ANIMATEDNORMALIZEDPATHSEGLIST => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_PATHLENGTH => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_GETTOTALLENGTH => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_GETPOINTATLENGTH => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_GETPATHSEGATLENGTH => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCLOSEPATH => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGMOVETOABS => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGMOVETOREL => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGLINETOABS => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGLINETOREL => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOCUBICABS => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOCUBICREL => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOQUADRATICABS => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOQUADRATICREL => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGARCABS => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGARCREL => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGLINETOHORIZONTALABS => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGLINETOHORIZONTALREL => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGLINETOVERTICALABS => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGLINETOVERTICALREL => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOCUBICSMOOTHABS => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOCUBICSMOOTHREL => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOQUADRATICSMOOTHABS => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPATHELEMENT_CREATESVGPATHSEGCURVETOQUADRATICSMOOTHREL => 1072

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPRESERVEASPECTRATIO_ALIGN => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGPRESERVEASPECTRATIO_MEETORSLICE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPRESERVEASPECTRATIO_BASEVAL => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGANIMATEDPRESERVEASPECTRATIO_ANIMVAL => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGIMAGEELEMENT_X => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGIMAGEELEMENT_Y => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGIMAGEELEMENT_WIDTH => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGIMAGEELEMENT_HEIGHT => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTOPELEMENT_OFFSET => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGGRADIENTELEMENT_GRADIENTUNITS => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGGRADIENTELEMENT_GRADIENTTRANSFORM => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGGRADIENTELEMENT_SPREADMETHOD => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEARGRADIENTELEMENT_X1 => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEARGRADIENTELEMENT_Y1 => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEARGRADIENTELEMENT_X2 => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGLINEARGRADIENTELEMENT_Y2 => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRADIALGRADIENTELEMENT_CX => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRADIALGRADIENTELEMENT_CY => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRADIALGRADIENTELEMENT_R => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRADIALGRADIENTELEMENT_FX => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGRADIALGRADIENTELEMENT_FY => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMASKELEMENT_MASKUNITS => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMASKELEMENT_MASKCONTENTUNITS => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMASKELEMENT_X => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMASKELEMENT_Y => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMASKELEMENT_WIDTH => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMASKELEMENT_HEIGHT => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_REFX => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_REFY => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_MARKERUNITS => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_MARKERWIDTH => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_MARKERHEIGHT => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_ORIENTTYPE => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_ORIENTANGLE => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_SETORIENTTOAUTO => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGMARKERELEMENT_SETORIENTTOANGLE => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGZOOMEVENT_ZOOMRECTSCREEN => 1276

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGZOOMEVENT_PREVIOUSSCALE => 1277

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGZOOMEVENT_PREVIOUSTRANSLATE => 1278

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGZOOMEVENT_NEWSCALE => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGZOOMEVENT_NEWTRANSLATE => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGAELEMENT_TARGET => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGVIEWELEMENT_VIEWTARGET => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAERROR_CODE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTIMERANGES_LENGTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTIMERANGES_START => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTIMERANGES_END => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTIMERANGES2_STARTDOUBLE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTIMERANGES2_ENDDOUBLE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_ERROR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_SRC => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_CURRENTSRC => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_NETWORKSTATE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_PRELOAD => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_BUFFERED => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_LOAD => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_CANPLAYTYPE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_SEEKING => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_CURRENTTIME => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_INITIALTIME => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_DURATION => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_PAUSED => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_DEFAULTPLAYBACKRATE => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_PLAYBACKRATE => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_PLAYED => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_SEEKABLE => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_ENDED => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_AUTOPLAY => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_LOOP => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_PLAY => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_PAUSE => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_CONTROLS => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_VOLUME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_MUTED => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT_AUTOBUFFER => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT2_CURRENTTIMEDOUBLE => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT2_INITIALTIMEDOUBLE => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT2_DURATIONDOUBLE => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT2_DEFAULTPLAYBACKRATEDOUBLE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT2_PLAYBACKRATEDOUBLE => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMEDIAELEMENT2_VOLUMEDOUBLE => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSMEDIAELEMENT_MSPLAYTODISABLED => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMSMEDIAELEMENT_MSPLAYTOPRIMARY => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSOURCEELEMENT_SRC => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSOURCEELEMENT_TYPE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLSOURCEELEMENT_MEDIA => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLVIDEOELEMENT_WIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLVIDEOELEMENT_HEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLVIDEOELEMENT_VIDEOWIDTH => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLVIDEOELEMENT_VIDEOHEIGHT => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLVIDEOELEMENT_POSTER => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAUDIOELEMENTFACTORY_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_CORRESPONDINGELEMENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_CORRESPONDINGUSEELEMENT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_PARENTNODE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_CHILDNODES => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_FIRSTCHILD => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_LASTCHILD => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_PREVIOUSSIBLING => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCE_NEXTSIBLING => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCELIST_LENGTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGELEMENTINSTANCELIST_ITEM => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEXCEPTION_CODE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMEXCEPTION_MESSAGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRANGEEXCEPTION_CODE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IRANGEEXCEPTION_MESSAGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGEXCEPTION_CODE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGEXCEPTION_MESSAGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IEVENTEXCEPTION_CODE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IEVENTEXCEPTION_MESSAGE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSCRIPTELEMENT_TYPE => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTYLEELEMENT_TYPE => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGSTYLEELEMENT_MEDIA => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_TEXTLENGTH => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_LENGTHADJUST => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETNUMBEROFCHARS => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETCOMPUTEDTEXTLENGTH => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETSUBSTRINGLENGTH => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETSTARTPOSITIONOFCHAR => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETENDPOSITIONOFCHAR => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETEXTENTOFCHAR => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETROTATIONOFCHAR => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_GETCHARNUMATPOSITION => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTCONTENTELEMENT_SELECTSUBSTRING => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPOSITIONINGELEMENT_X => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPOSITIONINGELEMENT_Y => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPOSITIONINGELEMENT_DX => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPOSITIONINGELEMENT_DY => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPOSITIONINGELEMENT_ROTATE => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDOCUMENTTYPE_NAME => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDOCUMENTTYPE_ENTITIES => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDOCUMENTTYPE_NOTATIONS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDOCUMENTTYPE_PUBLICID => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDOCUMENTTYPE_SYSTEMID => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMDOCUMENTTYPE_INTERNALSUBSET => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMNODEITERATOR_ROOT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMNODEITERATOR_WHATTOSHOW => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMNODEITERATOR_FILTER => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMNODEITERATOR_EXPANDENTITYREFERENCES => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMNODEITERATOR_NEXTNODE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMNODEITERATOR_PREVIOUSNODE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMNODEITERATOR_DETACH => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_ROOT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_WHATTOSHOW => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_FILTER => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_EXPANDENTITYREFERENCES => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_CURRENTNODE => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_PARENTNODE => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_FIRSTCHILD => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_LASTCHILD => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_PREVIOUSSIBLING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_NEXTSIBLING => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_PREVIOUSNODE => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMTREEWALKER_NEXTNODE => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPROCESSINGINSTRUCTION_TARGET => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPROCESSINGINSTRUCTION_DATA => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCE_NAVIGATION => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCE_TIMING => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCE_TOSTRING => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCE_TOJSON => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCENAVIGATION_TYPE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCENAVIGATION_REDIRECTCOUNT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCENAVIGATION_TOSTRING => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCENAVIGATION_TOJSON => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_NAVIGATIONSTART => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_UNLOADEVENTSTART => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_UNLOADEVENTEND => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_REDIRECTSTART => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_REDIRECTEND => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_FETCHSTART => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_DOMAINLOOKUPSTART => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_DOMAINLOOKUPEND => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_CONNECTSTART => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_CONNECTEND => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_REQUESTSTART => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_RESPONSESTART => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_RESPONSEEND => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_DOMLOADING => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_DOMINTERACTIVE => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_DOMCONTENTLOADEDEVENTSTART => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_DOMCONTENTLOADEDEVENTEND => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_DOMCOMPLETE => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_LOADEVENTSTART => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_LOADEVENTEND => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_MSFIRSTPAINT => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_TOSTRING => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPERFORMANCETIMING_TOJSON => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_STARTDOC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_STOPDOC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PRINTBLANKPAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PRINTPAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_ENSUREPRINTDIALOGDEFAULTS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_SHOWPRINTDIALOG => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_SHOWPAGESETUPDIALOG => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PRINTNONNATIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PRINTNONNATIVEFRAMES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_FRAMESETDOCUMENT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_FRAMEACTIVE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_FRAMEASSHOWN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_SELECTION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_SELECTEDPAGES => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_CURRENTPAGE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_CURRENTPAGEAVAIL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_COLLATE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_DUPLEX => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_COPIES => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PAGEFROM => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PAGETO => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_TABLEOFLINKS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_ALLLINKEDDOCUMENTS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_HEADER => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_FOOTER => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_MARGINLEFT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_MARGINRIGHT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_MARGINTOP => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_MARGINBOTTOM => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PAGEWIDTH => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_PAGEHEIGHT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_UNPRINTABLELEFT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_UNPRINTABLETOP => 33

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_UNPRINTABLERIGHT => 34

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_UNPRINTABLEBOTTOM => 35

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER_UPDATEPAGESTATUS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER2_SELECTIONENABLED => 37

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER2_FRAMEACTIVEENABLED => 38

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER2_ORIENTATION => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER2_USEPRINTERCOPYCOLLATE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER2_DEVICESUPPORTS => 41

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_HEADERFOOTERFONT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINTOP => 43

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINRIGHT => 44

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINBOTTOM => 45

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINLEFT => 46

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINTOPIMPORTANT => 47

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINRIGHTIMPORTANT => 48

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINBOTTOMIMPORTANT => 49

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ITEMPLATEPRINTER3_GETPAGEMARGINLEFTIMPORTANT => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER_STARTPRINT => 501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER_DRAWPREVIEWPAGE => 502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER_SETPAGECOUNT => 503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER_INVALIDATEPREVIEW => 504

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER_GETPRINTTASKOPTIONVALUE => 505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER_ENDPRINT => 506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER2_SHOWHEADERFOOTER => 507

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER2_SHRINKTOFIT => 508

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IPRINTMANAGERTEMPLATEPRINTER2_PERCENTSCALE => 509

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPATHELEMENT_STARTOFFSET => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPATHELEMENT_METHOD => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISVGTEXTPATHELEMENT_SPACING => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMXMLSERIALIZER_SERIALIZETOSTRING => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPARSER_PARSEFROMSTRING => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMXMLSERIALIZERFACTORY_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMPARSERFACTORY_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPROGRESSELEMENT_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPROGRESSELEMENT_MAX => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPROGRESSELEMENT_POSITION => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPROGRESSELEMENT_FORM => 67540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSTRANSITIONEVENT_PROPERTYNAME => 1476

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSTRANSITIONEVENT_ELAPSEDTIME => 1477

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSTRANSITIONEVENT_INITMSTRANSITIONEVENT => 1478

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSANIMATIONEVENT_ANIMATIONNAME => 1501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSANIMATIONEVENT_ELAPSEDTIME => 1502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSANIMATIONEVENT_INITMSANIMATIONEVENT => 1503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOLOCATION_GETCURRENTPOSITION => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOLOCATION_WATCHPOSITION => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOLOCATION_CLEARWATCH => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOCOORDINATES_LATITUDE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOCOORDINATES_LONGITUDE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOCOORDINATES_ALTITUDE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOCOORDINATES_ACCURACY => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOCOORDINATES_ALTITUDEACCURACY => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOCOORDINATES_HEADING => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOCOORDINATES_SPEED => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOPOSITIONERROR_CODE => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOPOSITIONERROR_MESSAGE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOPOSITION_COORDS => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IWEBGEOPOSITION_TIMESTAMP => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_JAVAENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_COOKIEENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_CPUCLASS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_SYSTEMLANGUAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_USERLANGUAGE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_PLATFORM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_CONNECTIONSPEED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_ONLINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_COLORDEPTH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_BUFFERDEPTH => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_WIDTH => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_HEIGHT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_AVAILHEIGHT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_AVAILWIDTH => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_CONNECTIONTYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_ISCOMPONENTINSTALLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_GETCOMPONENTVERSION => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_COMPAREVERSIONS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_ADDCOMPONENTREQUEST => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_DOCOMPONENTREQUEST => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ICLIENTCAPS_CLEARCOMPONENTREQUEST => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSMANIPULATIONEVENT_LASTSTATE => 1526

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSMANIPULATIONEVENT_CURRENTSTATE => 1527

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMMSMANIPULATIONEVENT_INITMSMANIPULATIONEVENT => 1528

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMCLOSEEVENT_WASCLEAN => 1526

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IDOMCLOSEEVENT_INITCLOSEEVENT => 1529

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_STATUS => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONCHECKING => 71717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONERROR => 71565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONNOUPDATE => 71718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONDOWNLOADING => 71719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONPROGRESS => 71681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONUPDATEREADY => 71720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONCACHED => 71721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ONOBSOLETE => 71722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_UPDATE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_SWAPCACHE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPLICATIONCACHE_ABORT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ILINEINFO_X => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ILINEINFO_BASELINE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ILINEINFO_TEXTDESCENT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ILINEINFO_TEXTHEIGHT => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ILINEINFO_LINEDIRECTION => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_BOLD => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_ITALIC => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_UNDERLINE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_OVERLINE => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_STRIKEOUT => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_SUBSCRIPT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_SUPERSCRIPT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_EXPLICITFACE => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_FONTWEIGHT => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_FONTSIZE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_FONTNAME => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_HASBGCOLOR => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_TEXTCOLOR => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_BACKGROUNDCOLOR => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_PREFORMATTED => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_DIRECTION => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_BLOCKDIRECTION => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLCOMPUTEDSTYLE_OL => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDLGSAFEHELPER_CHOOSECOLORDLG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDLGSAFEHELPER_GETCHARSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDLGSAFEHELPER_FONTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDLGSAFEHELPER_BLOCKFORMATS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IBLOCKFORMATS__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IBLOCKFORMATS_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IBLOCKFORMATS_ITEM => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IFONTNAMES__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IFONTNAMES_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IFONTNAMES_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_NAME => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_URN => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_TAGNAMES => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_READYSTATE => 70652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_ONREADYSTATECHANGE => 71561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_DOIMPORT => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_ATTACHEVENT => 66043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACE_DETACHEVENT => 66044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACECOLLECTION_LENGTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACECOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLNAMESPACECOLLECTION_ADD => 1001

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HTMLNAMESPACEEVENTS_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIPRINTCOLLECTION_LENGTH => 1501

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IHTMLIPRINTCOLLECTION__NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLIPRINTCOLLECTION_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_DIALOGTOP => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_DIALOGLEFT => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_DIALOGWIDTH => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_DIALOGHEIGHT => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_DIALOGARGUMENTS => 25000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_MENUARGUMENTS => 25013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_RETURNVALUE => 25001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_CLOSE => 25011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG_TOSTRING => 25012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG2_STATUS => 25014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG2_RESIZABLE => 25015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG3_UNADORNED => 25016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLDIALOG3_DIALOGHIDE => 25007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMODELESSINIT_PARAMETERS => 25000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMODELESSINIT_OPTIONSTRING => 25001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMODELESSINIT_MONIKER => 25006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLMODELESSINIT_DOCUMENT => 25007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPOPUP_SHOW => 27001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPOPUP_HIDE => 27002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPOPUP_DOCUMENT => 27003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLPOPUP_ISOPEN => 27004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_APPLICATIONNAME => 5000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_VERSION => 5001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_ICON => 5002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_SINGLEINSTANCE => 5003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_MINIMIZEBUTTON => 5005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_MAXIMIZEBUTTON => 5006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_BORDER => 5007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_BORDERSTYLE => 5008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_SYSMENU => 5009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_CAPTION => 5010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_WINDOWSTATE => 5011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_SHOWINTASKBAR => 5012

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR_COMMANDLINE => 5013

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR2_CONTEXTMENU => 5014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR2_INNERBORDER => 5015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR2_SCROLL => 5016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR2_SCROLLFLAT => 5017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR2_SELECTION => 5018

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLAPPBEHAVIOR3_NAVIGABLE => 5019

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IHTMLTXTRANGEINTERNAL_GET_VISIBLETEXT => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ABORT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ACTIVATE => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_AFTERPRINT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BEFOREACTIVATE => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BEFOREDEACTIVATE => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BEFOREUNLOAD => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BEFOREPRINT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BOUNCE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CHANGE => 1001

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_CLICK => -600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_COMPLETE => 71727

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CONTEXTMENU => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DEACTIVATE => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DOMCONTENTLOADED => 71662

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SUCCESS => 71725

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ERROR => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_FINISH => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_FOCUS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_FOCUSIN => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_FOCUSOUT => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_HASHCHANGE => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_HELP => 65546

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_INPUT => 71663

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_LOAD => 1003

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_KEYDOWN => -602

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_KEYPRESS => -603

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_KEYUP => -604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MESSAGE => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ONLINE => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_OFFLINE => 1065

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_READYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_RESET => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_RESIZE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SCROLL => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SELECT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SELECTIONCHANGE => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SELECTSTART => 65548

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_START => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_STOP => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_STORAGE => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_STORAGECOMMIT => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SUBMIT => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TEXTINPUT => 71665

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TIMEOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_UNLOAD => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_WHEEL => 71649

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_DBLCLICK => -601

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_MOUSEDOWN => -605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MOUSEENTER => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MOUSELEAVE => 1043

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_MOUSEMOVE => -606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MOUSEOUT => 65545

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MOUSEOVER => 65544

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IE9EVENTS_MOUSEUP => -607

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MOUSEWHEEL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BEFORECOPY => 65566

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BEFORECUT => 65565

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BEFOREPASTE => 65567

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_COPY => 65563

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CUT => 65562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DRAG => 65556

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DRAGEND => 65557

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DRAGENTER => 65558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DRAGLEAVE => 65560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DRAGOVER => 65559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DRAGSTART => 65547

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DROP => 65561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_PASTE => 65564

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSBEFOREEDITFOCUS => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSCONTROLSELECT => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSCONTROLRESIZESTART => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSCONTROLRESIZEEND => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_COMPOSITIONSTART => 71658

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_COMPOSITIONUPDATE => 71659

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_COMPOSITIONEND => 71660

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DOMATTRMODIFIED => 71661

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DOMCHARACTERDATAMODIFIED => 71664

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DOMNODEINSERTED => 71667

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DOMNODEREMOVED => 71668

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DOMSUBTREEMODIFIED => 71669

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SVGLOAD => 71650

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SVGUNLOAD => 71651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SVGABORT => 71652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SVGERROR => 71653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SVGRESIZE => 71654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SVGSCROLL => 71655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SVGZOOM => 71656

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSTHUMBNAILCLICK => 71657

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSSITEMODEJUMPLISTITEMREMOVED => 71666

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CANPLAY => 71670

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CANPLAYTHROUGH => 71671

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DURATIONCHANGE => 71672

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_EMPTIED => 71673

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ENDED => 71674

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_LOADEDDATA => 71675

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_LOADEDMETADATA => 71676

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_LOADSTART => 71677

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_PAUSE => 71678

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_PLAY => 71679

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_PLAYING => 71680

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_PROGRESS => 71681

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_RATECHANGE => 71682

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SEEKED => 71683

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SEEKING => 71684

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_STALLED => 71685

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SUSPEND => 71686

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TIMEUPDATE => 71687

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_VOLUMECHANGE => 71688

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_WAITING => 71689

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_BLOCKED => 71726

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_UPGRADENEEDED => 71734

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CUECHANGE => 71729

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ENTER => 71730

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_EXIT => 71731

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ADDTRACK => 71736

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_REMOVETRACK => 71781

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTERDOWN => 71690

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTERMOVE => 71691

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTERUP => 71692

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTEROVER => 71693

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTEROUT => 71694

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTERCANCEL => 71695

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTERHOVER => 71696

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSLOSTPOINTERCAPTURE => 71706

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSGOTPOINTERCAPTURE => 71707

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTERENTER => 71769

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSPOINTERLEAVE => 71770

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TOUCHSTART => 71784

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TOUCHEND => 71785

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TOUCHMOVE => 71786

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TOUCHCANCEL => 71787

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSGESTURESTART => 71699

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSGESTURECHANGE => 71700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSGESTUREEND => 71701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSGESTUREHOLD => 71702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSGESTURETAP => 71703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSGESTUREDOUBLETAP => 71704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSINERTIASTART => 71705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSCONTENTZOOM => 71708

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSHOLDVISUAL => 71738

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TRANSITIONSTART => 71709

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_TRANSITIONEND => 71710

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ANIMATIONSTART => 71711

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ANIMATIONEND => 71712

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ANIMATIONITERATION => 71713

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSMANIPULATIONSTATECHANGED => 71714

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CHECKING => 71717

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_NOUPDATE => 71718

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DOWNLOADING => 71719

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_UPDATEREADY => 71720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CACHED => 71721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_OBSOLETE => 71722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_INVALID => 71724

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_OPEN => 71715

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_CLOSE => 71716

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_LOADEND => 71723

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_POPSTATE => 71728

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_VISIBILITYCHANGE => 71732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSREGIONUPDATE => 71733

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSVIDEOFORMATCHANGED => 71735

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSVIDEOFRAMESTEPCOMPLETED => 71737

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSVIDEOOPTIMALLAYOUTCHANGED => 71739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSFULLSCREENCHANGE => 71740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSFULLSCREENERROR => 71741

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSELEMENTRESIZE => 71742

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SOURCEOPEN => 71743

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SOURCEENDED => 71745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_SOURCECLOSE => 71744

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ADDSOURCEBUFFER => 71746

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_REMOVESOURCEBUFFER => 71747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_UPDATESTART => 71766

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_UPDATE => 71767

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_UPDATEEND => 71768

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSNEEDKEY => 71748

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSKEYMESSAGE => 71749

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSKEYERROR => 71750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSKEYADDED => 71751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWDOMCONTENTLOADED => 71752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWCONTENTLOADING => 71753

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWNAVIGATIONSTARTING => 71754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWNAVIGATIONCOMPLETED => 71755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWFRAMEDOMCONTENTLOADED => 71756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWFRAMECONTENTLOADING => 71757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWFRAMENAVIGATIONSTARTING => 71758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWFRAMENAVIGATIONCOMPLETED => 71759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWSCRIPTNOTIFY => 71760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWLONGRUNNINGSCRIPTDETECTED => 71763

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWUNVIEWABLECONTENTIDENTIFIED => 71761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWUNSAFECONTENTWARNINGDISPLAYING => 71762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSWEBVIEWCONTAINSFULLSCREENELEMENTCHANGED => 71783

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_WEBGLCONTEXTLOST => 71764

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_WEBGLCONTEXTRESTORED => 71765

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_WEBGLCONTEXTCREATIONERROR => 71792

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSSITEPINNED => 71771

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSORIENTATIONCHANGE => 71772

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_ORIENTATIONCHANGE => 71795

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DEVICEORIENTATION => 71773

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_DEVICEMOTION => 71774

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_COMPASSNEEDSCALIBRATION => 71782

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_PAGESHOW => 71775

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_PAGEHIDE => 71776

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSCANDIDATEWINDOWSHOW => 71777

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSCANDIDATEWINDOWUPDATE => 71778

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IE9EVENTS_MSCANDIDATEWINDOWHIDE => 71779

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_IMAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_TABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_TEXTSELECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_ANCHOR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_UNKNOWN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_IMGDYNSRC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_DEBUG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_VSCROLL => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_HSCROLL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_MEDIA => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_ENTITY => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_PDF => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_MENU_DISABLEDFLASH => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MENUEXT_SHOWDIALOG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTMLDLG_NOUI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTMLDLG_MODAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTMLDLG_MODELESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HTMLDLG_PRINT_TEMPLATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HTMLDLG_VERIFY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HTMLDLG_ALLOW_UNKNOWN_THREAD => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PRINT_DONTBOTHERUSER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINT_WAITFORCOMPLETION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_URL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_HTMLDLGTRUST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_SECSTATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_SID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_TRUSTEDDOC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_SECURITY_WINDOW => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_NAMESPACE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_IURI => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_HOSTCONTEXT_URL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_ALLOWRECOVERY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CMDID_SCRIPTSITE_BASEIURI => 10

    /**
     * @type {String}
     */
    static SZ_HTML_CLIENTSITE_OBJECTPARAM => "{d4db6850-5385-11d0-89e9-00a0c90a90ac}"

    /**
     * @type {String}
     */
    static CGID_DocHostCommandHandler => "{f38bc242-b950-11d1-8918-00c04fc2c836}"

    /**
     * @type {String}
     */
    static SID_SEditCommandTarget => "{3050f4b5-98b5-11cf-bb82-00aa00bdce0b}"

    /**
     * @type {String}
     */
    static CGID_EditStateCommands => "{3050f4b6-98b5-11cf-bb82-00aa00bdce0b}"

    /**
     * @type {String}
     */
    static SID_SHTMLEditHost => "{3050f6a0-98b5-11cf-bb82-00aa00bdce0b}"

    /**
     * @type {String}
     */
    static SID_SHTMLEditServices => "{3050f7f9-98b5-11cf-bb82-00aa00bdce0b}"

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIEACTION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIEACTION_ACCEPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIEACTION_REJECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIEACTION_DOWNGRADE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIEACTION_LEASH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIEACTION_SUPPRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIEACTION_READ => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_URLISTOPLEVEL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_URLHASCOMPACTPOLICY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_URLHASPOSTDATA => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_URLHASPOLICYREFLINK => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_URLHASPOLICYREFHEADER => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_URLHASP3PHEADER => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGCALLBACKNOTIFICATION_TIMEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGCALLBACKNOTIFICATION_INTERVAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGCALLBACKNOTIFICATION_IMMEDIATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGCALLBACKNOTIFICATION_ANIMATIONFRAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGCALLBACKNOTIFICATION_DOMEVENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGDOMEVENTPROPAGATIONSTATUS_DEFAULTCANCELED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGDOMEVENTPROPAGATIONSTATUS_STOPIMMEDIATEPROPAGATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUGDOMEVENTPROPAGATIONSTATUS_STOPPROPAGATION => 4
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Void>} hwndOwner 
     * @param {Pointer<Char>} pszUrl 
     * @param {Pointer<IEnumPrivacyRecords>} pPrivacyEnum 
     * @param {Integer} fReportAllSites 
     * @returns {HRESULT} 
     */
    static DoPrivacyDlg(hwndOwner, pszUrl, pPrivacyEnum, fReportAllSites) {
        pszUrl := pszUrl is String? StrPtr(pszUrl) : pszUrl

        result := DllCall("SHDOCVW.dll\DoPrivacyDlg", "ptr", hwndOwner, "ptr", pszUrl, "ptr", pPrivacyEnum, "int", fReportAllSites, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
