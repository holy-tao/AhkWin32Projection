#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class InternetExplorer {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_OFFLINEIFNOTCONNECTED => -5501

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_SILENT => -5502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BEFORENAVIGATE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAVIGATECOMPLETE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STATUSTEXTCHANGE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_QUIT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOWNLOADCOMPLETE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_COMMANDSTATECHANGE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOWNLOADBEGIN => 106

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NEWWINDOW => 107

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROGRESSCHANGE => 108

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWMOVE => 109

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWRESIZE => 110

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWACTIVATE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROPERTYCHANGE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TITLECHANGE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TITLEICONCHANGE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FRAMEBEFORENAVIGATE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FRAMENAVIGATECOMPLETE => 201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FRAMENEWWINDOW => 204

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BEFORENAVIGATE2 => 250

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NEWWINDOW2 => 251

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAVIGATECOMPLETE2 => 252

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONQUIT => 253

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONVISIBLE => 254

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONTOOLBAR => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONMENUBAR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONSTATUSBAR => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONFULLSCREEN => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOCUMENTCOMPLETE => 259

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONTHEATERMODE => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ONADDRESSBAR => 261

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWSETRESIZABLE => 262

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWCLOSING => 263

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWSETLEFT => 264

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWSETTOP => 265

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWSETWIDTH => 266

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWSETHEIGHT => 267

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CLIENTTOHOSTWINDOW => 268

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETSECURELOCKICON => 269

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FILEDOWNLOAD => 270

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAVIGATEERROR => 271

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRIVACYIMPACTEDSTATECHANGE => 272

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NEWWINDOW3 => 273

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_VIEWUPDATE => 281

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETPHISHINGFILTERSTATUS => 282

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWSTATECHANGED => 283

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NEWPROCESS => 284

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_THIRDPARTYURLBLOCKED => 285

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_REDIRECTXDOMAINBLOCKED => 286

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WEBWORKERSTARTED => 288

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WEBWORKERFINISHED => 289

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BEFORESCRIPTEXECUTE => 290

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTTEMPLATEINSTANTIATION => 225

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTTEMPLATETEARDOWN => 226

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_UPDATEPAGESTATUS => 227

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWREGISTERED => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_WINDOWREVOKED => 201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RESETFIRSTBOOTMODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RESETSAFEMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_REFRESHOFFLINEDESKTOP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDFAVORITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDCHANNEL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDDESKTOPCOMPONENT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISSUBSCRIBED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAVIGATEANDFIND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMPORTEXPORTFAVORITES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AUTOCOMPLETESAVEFORM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AUTOSCAN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AUTOCOMPLETEATTACH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SHOWBROWSERUI => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDSEARCHPROVIDER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RUNONCESHOWN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SKIPRUNONCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CUSTOMIZESETTINGS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SQMENABLED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PHISHINGENABLED => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BRANDIMAGEURI => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SKIPTABSWELCOME => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DIAGNOSECONNECTION => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CUSTOMIZECLEARTYPE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISSEARCHPROVIDERINSTALLED => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISSEARCHMIGRATED => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DEFAULTSEARCHPROVIDER => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RUNONCEREQUIREDSETTINGSCOMPLETE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RUNONCEHASSHOWN => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SEARCHGUIDEURL => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDSERVICE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISSERVICEINSTALLED => 31

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDTOFAVORITESBAR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_BUILDNEWTABPAGE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETRECENTLYCLOSEDVISIBLE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETACTIVITIESVISIBLE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CONTENTDISCOVERYRESET => 36

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INPRIVATEFILTERINGENABLED => 37

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SUGGESTEDSITESENABLED => 38

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ENABLESUGGESTEDSITES => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NAVIGATETOSUGGESTEDSITES => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SHOWTABSHELP => 41

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SHOWINPRIVATEHELP => 42

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISSITEMODE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETSITEMODEICONOVERLAY => 44

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CLEARSITEMODEICONOVERLAY => 45

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_UPDATETHUMBNAILBUTTON => 46

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETTHUMBNAILBUTTONS => 47

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDTHUMBNAILBUTTONS => 48

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDSITEMODE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETSITEMODEPROPERTIES => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODECREATEJUMPLIST => 51

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODEADDJUMPLISTITEM => 52

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODECLEARJUMPLIST => 53

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODEADDBUTTONSTYLE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODESHOWBUTTONSTYLE => 55

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODESHOWJUMPLIST => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADDTRACKINGPROTECTIONLIST => 57

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODEACTIVATE => 58

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISSITEMODEFIRSTRUN => 59

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TRACKINGPROTECTIONENABLED => 60

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ACTIVEXFILTERINGENABLED => 61

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROVISIONNETWORKS => 62

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_REPORTSAFEURL => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODEREFRESHBADGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SITEMODECLEARBADGE => 65

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DIAGNOSECONNECTIONUILESS => 66

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LAUNCHNETWORKCLIENTHELP => 67

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CHANGEDEFAULTBROWSER => 68

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STOPPERIODICUPDATE => 69

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STARTPERIODICUPDATE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CLEARNOTIFICATION => 71

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ENABLENOTIFICATIONQUEUE => 72

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PINNEDSITESTATE => 73

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LAUNCHINTERNETOPTIONS => 74

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STARTPERIODICUPDATEBATCH => 75

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ENABLENOTIFICATIONQUEUESQUARE => 76

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ENABLENOTIFICATIONQUEUEWIDE => 77

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ENABLENOTIFICATIONQUEUELARGE => 78

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SCHEDULEDTILENOTIFICATION => 79

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_REMOVESCHEDULEDTILENOTIFICATION => 80

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STARTBADGEUPDATE => 81

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_STOPBADGEUPDATE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ISMETAREFERRERAVAILABLE => 83

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETEXPERIMENTALFLAG => 84

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETEXPERIMENTALFLAG => 85

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETEXPERIMENTALVALUE => 86

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETEXPERIMENTALVALUE => 87

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HASNEEDIEAUTOLAUNCHFLAG => 88

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETNEEDIEAUTOLAUNCHFLAG => 89

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETNEEDIEAUTOLAUNCHFLAG => 90

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LAUNCHIE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RESETEXPERIMENTALFLAGS => 92

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETCVLISTDATA => 93

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETCVLISTLOCALDATA => 94

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETEMIELISTDATA => 95

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETEMIELISTLOCALDATA => 96

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OPENFAVORITESPANE => 97

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_OPENFAVORITESSETTINGS => 98

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_LAUNCHINHVSI => 99

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETNEEDHVSIAUTOLAUNCHFLAG => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETNEEDHVSIAUTOLAUNCHFLAG => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HASNEEDHVSIAUTOLAUNCHFLAG => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETOSSKU => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETMSDEFAULTS => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SHELLUIHELPERLAST => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ADVANCEERROR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RETREATERROR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANADVANCEERROR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CANRETREATERROR => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETERRORLINE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETERRORCHAR => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETERRORCODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETERRORMSG => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETERRORURL => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETDETAILSSTATE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETDETAILSSTATE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETPERERRSTATE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETPERERRSTATE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_GETALWAYSSHOWLOCKSTATE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FAVSELECTIONCHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SELECTIONCHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOUBLECLICK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INITIALIZED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MOVESELECTIONUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MOVESELECTIONDOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RESETSORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NEWFOLDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SYNCHRONIZE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_IMPORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EXPORT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_INVOKECONTEXTMENU => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MOVESELECTIONTO => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SUBSCRIPTIONSENABLED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_CREATESUBSCRIPTION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DELETESUBSCRIPTION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETROOT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ENUMOPTIONS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SELECTEDITEM => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_ROOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DEPTH => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MODE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FLAGS => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_TVFLAGS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NSCOLUMNS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_COUNTVIEWTYPES => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SETVIEWTYPE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SELECTEDITEMS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_EXPAND => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_UNSELECTALL => 26

    /**
     * @type {Integer (UInt32)}
     */
    static TF_NAVIGATE => 2142153644

    /**
     * @type {String}
     */
    static TARGET_NOTIFY_OBJECT_NAME => "863a99a0-21bc-11d0-82b4-00a0c90c29c5"

    /**
     * @type {String}
     */
    static IEPROCESS_MODULE_NAME => "IERtUtil.dll"

    /**
     * @type {String}
     */
    static IEGetProcessModule_PROC_NAME => "IEGetProcessModule"

    /**
     * @type {String}
     */
    static IEGetTabWindowExports_PROC_NAME => "IEGetTabWindowExports"

    /**
     * @type {String}
     */
    static TSZMICROSOFTPATH => "Software\Microsoft"

    /**
     * @type {String}
     */
    static SZ_IE_MAIN => "Main"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SMOOTHSCROLL => "SmoothScroll"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SMOOTHSCROLL_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHOWTOOLBAR => "Show_ToolBar"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHOWADDRESSBAR => "Show_URLToolBar"

    /**
     * @type {String}
     */
    static REGSTR_VAL_STARTPAGE => "Start Page"

    /**
     * @type {String}
     */
    static REGSTRA_VAL_STARTPAGE => "Start Page"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SEARCHPAGE => "Search Page"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOCALPAGE => "Local Page"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USESTYLESHEETS => "Use Stylesheets"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USESTYLESHEETS_DEF => "yes"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USEICM => "UseICM"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_USEICM_DEF => 0

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHOWFOCUS => "Tabstop - MouseDown"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHOWFOCUS_DEF => "no"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOADIMAGES => "Display Inline Images"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PLAYSOUNDS => "Play_Background_Sounds"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PLAYVIDEOS => "Display Inline Videos"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ANCHORUNDERLINE => "Anchor Underline"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USEDLGCOLORS => "Use_DlgBox_Colors"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CHECKASSOC => "Check_Associations"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHOWFULLURLS => "Show_FullURL"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTOSEARCH => "Do404Search"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTONAVIGATE => "SearchForExtensions"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HTTP_ERRORS => "Friendly http errors"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USEIBAR => "UseBar"

    /**
     * @type {String}
     */
    static SZ_IE_SETTINGS => "Settings"

    /**
     * @type {String}
     */
    static REGSTR_VAL_IE_CUSTOMCOLORS => "Custom Colors"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ANCHORCOLOR => "Anchor Color"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ANCHORCOLORVISITED => "Anchor Color Visited"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BACKGROUNDCOLOR => "Background Color"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TEXTCOLOR => "Text Color"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ANCHORCOLORHOVER => "Anchor Color Hover"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USEHOVERCOLOR => "Use Anchor Hover Color"

    /**
     * @type {String}
     */
    static SZ_IE_SECURITY => "Security"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SAFETYWARNINGLEVEL => "Safety Warning Level"

    /**
     * @type {String}
     */
    static SZ_IE_DEFAULT_HTML_EDITOR => "Default HTML Editor"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USEAUTOAPPEND => "Append Completion"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USEAUTOSUGGEST => "AutoSuggest"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USEAUTOCOMPLETE => "Use AutoComplete"

    /**
     * @type {String}
     */
    static SZ_IE_IBAR => "Bar"

    /**
     * @type {String}
     */
    static SZ_IE_IBAR_BANDS => "Bands"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USERAGENT => "User Agent"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INTERNETENTRY => "InternetProfile"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INTERNETPROFILE => "InternetProfile"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INTERNETENTRYBKUP => "BackupInternetProfile"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CODEDOWNLOAD => "Code Download"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CODEDOWNLOAD_DEF => "yes"

    /**
     * @type {String}
     */
    static REGSTR_PATH_INETCPL_RESTRICTIONS => "Software\Policies\Microsoft\Internet Explorer\Control Panel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_GENERALTAB => "GeneralTab"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_SECURITYTAB => "SecurityTab"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_CONTENTTAB => "ContentTab"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_CONNECTIONSTAB => "ConnectionsTab"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_PROGRAMSTAB => "ProgramsTab"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_ADVANCEDTAB => "AdvancedTab"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_PRIVACYTAB => "PrivacyTab"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETCPL_IEAK => "IEAKContext"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DIRECTORY => "Directory"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NEWDIRECTORY => "NewDirectory"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CACHEPREFIX => "CachePrefix"

    /**
     * @type {String}
     */
    static SZ_IE_SEARCHSTRINGS => "UrlTemplate"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SEARCH_FORMAT_STRING => 255

    /**
     * @type {String}
     */
    static SZ_IE_THRESHOLDS => "ErrorThresholds"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ACCESSMEDIUM => "AccessMedium"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ACCESSTYPE => "AccessType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTODIALDLLNAME => "AutodialDllName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTODIALFCNNAME => "AutodialFcnName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTODIAL_MONITORCLASSNAME => "MS_AutodialMonitor"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTODIAL_TRYONLYONCE => "TryAutodialOnce"

    /**
     * @type {String}
     */
    static REGSTR_PATH_REMOTEACCESS => "RemoteAccess"

    /**
     * @type {String}
     */
    static REGSTR_PATH_REMOTEACESS => "RemoteAccess"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RNAINSTALLED => "Installed"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENABLEAUTODIAL => "EnableAutodial"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENABLEUNATTENDED => "EnableUnattended"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NONETAUTODIAL => "NoNetAutodial"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REDIALATTEMPTS => "RedialAttempts"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REDIALINTERVAL => "RedialWait"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENABLEAUTODIALDISCONNECT => "EnableAutodisconnect"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENABLEAUTODISCONNECT => "EnableAutodisconnect"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENABLEEXITDISCONNECT => "EnableExitDisconnect"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENABLESECURITYCHECK => "EnableSecurityCheck"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COVEREXCLUDE => "CoverExclude"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISCONNECTIDLETIME => "DisconnectIdleTime"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MOSDISCONNECT => "DisconnectTimeout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROXYENABLE => "ProxyEnable"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROXYSERVER => "ProxyServer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROXYOVERRIDE => "ProxyOverride"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BYPASSAUTOCONFIG => "BypassAutoconfig"

    /**
     * @type {String}
     */
    static SZTRUSTWARNLEVEL => "Trust Warning Level"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TRUSTWARNINGLEVEL_HIGH => "High"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TRUSTWARNINGLEVEL_MED => "Medium"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TRUSTWARNINGLEVEL_LOW => "No Security"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYWARNONSEND => "WarnOnPost"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYWARNONSEND_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYWARNONSENDALWAYS => "WarnAlwaysOnPost"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYWARNONSENDALWAYS_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYWARNONVIEW => "WarnOnView"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYWARNONVIEW_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYALLOWCOOKIES => "AllowCookies"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYALLOWCOOKIES_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYWARNONZONECROSSING => "WarnOnZoneCrossing"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYWARNONZONECROSSING_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYWARNONBADCERTVIEWING => "WarnOnBadCertRecving"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYWARNONBADCERTVIEWING_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYWARNONBADCERTSENDING => "WarnOnBadCertSending"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYWARNONBADCERTSENDING_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES => "DisableCachingOfSSLPages"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES_DEF => 0

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYACTIVEX => "Security_RunActiveXControls"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYACTIVEX_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYACTICEXSCRIPTS => "Security_RunScripts"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYACTICEXSCRIPTS_DEF => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECURITYJAVA => "Security_RunJavaApplets"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SECURITYJAVA_DEF => 1

    /**
     * @type {String}
     */
    static SZJAVAVMPATH => "\Java VM"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JAVAJIT => "EnableJIT"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_JAVAJIT_DEF => 0

    /**
     * @type {String}
     */
    static REGSTR_VAL_JAVALOGGING => "EnableLogging"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_JAVALOGGING_DEF => 0

    /**
     * @type {String}
     */
    static SZTOOLBAR => "\Toolbar"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DAYSTOKEEP => "DaysToKeep"

    /**
     * @type {String}
     */
    static SZNOTEXT => "NoText"

    /**
     * @type {String}
     */
    static SZVISIBLE => "VisibleBands"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VISIBLEBANDS => "VisibleBands"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_VISIBLEBANDS_DEF => 7

    /**
     * @type {Integer (UInt32)}
     */
    static TOOLSBAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADDRESSBAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LINKSBAND => 4

    /**
     * @type {String}
     */
    static SZBACKBITMAP => "BackBitmap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BACKBITMAP => "BackBitmap"

    /**
     * @type {String}
     */
    static REGSTR_SHIFTQUICKSUFFIX => "ShiftQuickCompleteSuffix"

    /**
     * @type {String}
     */
    static TSZSCHANNELPATH => "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCHANNELENABLEPROTOCOL => "Enabled"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_SCHANNELENABLEPROTOCOL_DEF => 1

    /**
     * @type {String}
     */
    static TSZINTERNETCLIENTSPATH => "Software\Microsoft\Internet Explorer\Unix"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DEFAULT => "default"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CURRENT => "current"

    /**
     * @type {Integer (Int32)}
     */
    static IE_USE_OE_PRESENT_HKEY => -2147483646

    /**
     * @type {String}
     */
    static IE_USE_OE_PRESENT_KEY => "Software\Microsoft\Windows\CurrentVersion\app.paths\msimn.exe"

    /**
     * @type {Integer (Int32)}
     */
    static IE_USE_OE_MAIL_HKEY => -2147483647

    /**
     * @type {String}
     */
    static IE_USE_OE_MAIL_KEY => "Software\Microsoft\Internet Explorer\Mail"

    /**
     * @type {String}
     */
    static IE_USE_OE_MAIL_VALUE => "Use Outlook Express"

    /**
     * @type {Integer (Int32)}
     */
    static IE_USE_OE_NEWS_HKEY => -2147483647

    /**
     * @type {String}
     */
    static IE_USE_OE_NEWS_KEY => "Software\Microsoft\Internet Explorer\News"

    /**
     * @type {String}
     */
    static IE_USE_OE_NEWS_VALUE => "Use Outlook Express"

    /**
     * @type {String}
     */
    static TSZPROTOCOLSPATH => "Protocols\"

    /**
     * @type {String}
     */
    static TSZMAILTOPROTOCOL => "mailto"

    /**
     * @type {String}
     */
    static TSZNEWSPROTOCOL => "news"

    /**
     * @type {String}
     */
    static TSZCALLTOPROTOCOL => "callto"

    /**
     * @type {String}
     */
    static TSZLDAPPROTOCOL => "ldap"

    /**
     * @type {String}
     */
    static TSZCALENDARPROTOCOL => "unk"

    /**
     * @type {String}
     */
    static TSZVSOURCEPROTOCOL => "view source"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEFAULT_CODEPAGE => "Default_CodePage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEFAULT_SCRIPT => "Default_Script"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ACCEPT_LANGUAGE => "AcceptLanguage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FONT_SCRIPTS => "Scripts"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FONT_SCRIPT => "Script"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FONT_SCRIPT_NAME => "Script"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEF_ENCODING => "Default_Encoding"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEF_INETENCODING => "Default_InternetEncoding"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FIXED_FONT => "IEFixedFontName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCRIPT_FIXED_FONT => "IEFixedFontName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROP_FONT => "IEPropFontName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCRIPT_PROP_FONT => "IEPropFontName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FONT_SIZE => "IEFontSize"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_FONT_SIZE_DEF => 2

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTODETECT => "AutoDetect"

    /**
     * @type {String}
     */
    static REGSTR_PATH_MIME_DATABASE => "MIME\Database"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CODEPAGE => "CodePage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INETENCODING => "InternetEncoding"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FAMILY => "Family"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LEVEL => "Level"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ALIASTO => "AliasForCharset"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENCODENAME => "EncodingName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DESCRIPTION => "Description"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WEBCHARSET => "WebCharset"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BODYCHARSET => "BodyCharset"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HEADERCHARSET => "HeaderCharset"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FIXEDWIDTHFONT => "FixedWidthFont"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROPORTIONALFONT => "ProportionalFont"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRIVCONVERTER => "PrivConverter"

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_CLEAR_AUTOCOMPLETE_FOR_FORMS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_SETID_AUTOCOMPLETE_FOR_FORMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_BEFORENAVIGATE_GETSHELLBROWSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_BEFORENAVIGATE_DOEXTERNALBROWSE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_BEFORENAVIGATE_GETIDLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_SET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_GET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_ARG_CLEAR_FORMS_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_ARG_CLEAR_FORMS_ALL_BUT_PASSWORDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IECMDID_ARG_CLEAR_FORMS_PASSWORDS_ONLY => 2

    /**
     * @type {String}
     */
    static CATID_MSOfficeAntiVirus => "{56ffcc30-d398-11d0-b2ae-00a0c908fa49}"

    /**
     * @type {Integer (UInt32)}
     */
    static msoedmEnable => 1

    /**
     * @type {Integer (UInt32)}
     */
    static msoedmDisable => 2

    /**
     * @type {Integer (UInt32)}
     */
    static msoedmDontOpen => 3

    /**
     * @type {Integer (UInt32)}
     */
    static msoslUndefined => 0

    /**
     * @type {Integer (UInt32)}
     */
    static msoslNone => 1

    /**
     * @type {Integer (UInt32)}
     */
    static msoslMedium => 2

    /**
     * @type {Integer (UInt32)}
     */
    static msoslHigh => 3

    /**
     * @type {Integer (UInt32)}
     */
    static msodsvNoMacros => 0

    /**
     * @type {Integer (UInt32)}
     */
    static msodsvUnsigned => 1

    /**
     * @type {Integer (UInt32)}
     */
    static msodsvPassedTrusted => 2

    /**
     * @type {Integer (UInt32)}
     */
    static msodsvFailed => 3

    /**
     * @type {Integer (UInt32)}
     */
    static msodsvLowSecurityLevel => 4

    /**
     * @type {Integer (UInt32)}
     */
    static msodsvPassedTrustedCert => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STATURL_QUERYFLAG_ISCACHED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static STATURL_QUERYFLAG_NOURL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static STATURL_QUERYFLAG_NOTITLE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static STATURL_QUERYFLAG_TOPLEVEL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static STATURLFLAG_ISCACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STATURLFLAG_ISTOPLEVEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SURFACE_LOCK_EXCLUSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SURFACE_LOCK_ALLOW_DISCARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SURFACE_LOCK_WAIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static E_SURFACE_NOSURFACE => -2147434496

    /**
     * @type {Integer (Int32)}
     */
    static E_SURFACE_UNKNOWN_FORMAT => -2147434495

    /**
     * @type {Integer (Int32)}
     */
    static E_SURFACE_NOTMYPOINTER => -2147434494

    /**
     * @type {Integer (Int32)}
     */
    static E_SURFACE_DISCARDED => -2147434493

    /**
     * @type {Integer (Int32)}
     */
    static E_SURFACE_NODC => -2147434492

    /**
     * @type {Integer (Int32)}
     */
    static E_SURFACE_NOTMYDC => -2147434491

    /**
     * @type {Integer (Int32)}
     */
    static S_SURFACE_DISCARDED => 49155

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_NO_TRANSPARENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_EVENT_PROGRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_EVENT_PALETTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_EVENT_BEGINBITS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_EVENT_BITSCOMPLETE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_EVENT_USEDDRAW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_HINT_TOPDOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_HINT_BOTTOMUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMGDECODE_HINT_FULLWIDTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAPMIME_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAPMIME_CLSID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPMIME_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAPMIME_DEFAULT_ALWAYS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TIMERMODE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIMERMODE_VISIBILITYAWARE => 1
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Integer} dwTabThreadID 
     * @param {Integer} dwAssociatedThreadID 
     * @returns {Integer} 
     */
    static IEAssociateThreadWithTab(dwTabThreadID, dwAssociatedThreadID) {
        result := DllCall("Ieframe.dll\IEAssociateThreadWithTab", "uint", dwTabThreadID, "uint", dwAssociatedThreadID, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwTabThreadID 
     * @param {Integer} dwAssociatedThreadID 
     * @returns {Integer} 
     */
    static IEDisassociateThreadWithTab(dwTabThreadID, dwAssociatedThreadID) {
        result := DllCall("Ieframe.dll\IEDisassociateThreadWithTab", "uint", dwTabThreadID, "uint", dwAssociatedThreadID, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static IEIsInPrivateBrowsing() {
        result := DllCall("Ieframe.dll\IEIsInPrivateBrowsing", "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static IEInPrivateFilteringEnabled() {
        result := DllCall("Ieframe.dll\IEInPrivateFilteringEnabled", "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static IETrackingProtectionEnabled() {
        result := DllCall("Ieframe.dll\IETrackingProtectionEnabled", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hState 
     * @param {Pointer<PWSTR>} lpwstrSourceFile 
     * @returns {Integer} 
     */
    static IESaveFile(hState, lpwstrSourceFile) {
        result := DllCall("Ieframe.dll\IESaveFile", "ptr", hState, "ptr", lpwstrSourceFile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hState 
     * @returns {Integer} 
     */
    static IECancelSaveFile(hState) {
        result := DllCall("Ieframe.dll\IECancelSaveFile", "ptr", hState, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<PWSTR>} lpwstrInitialFileName 
     * @param {Pointer<PWSTR>} lpwstrInitialDir 
     * @param {Pointer<PWSTR>} lpwstrFilter 
     * @param {Pointer<PWSTR>} lpwstrDefExt 
     * @param {Integer} dwFilterIndex 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} lppwstrDestinationFilePath 
     * @param {Pointer<HANDLE>} phState 
     * @returns {Integer} 
     */
    static IEShowSaveFileDialog(hwnd, lpwstrInitialFileName, lpwstrInitialDir, lpwstrFilter, lpwstrDefExt, dwFilterIndex, dwFlags, lppwstrDestinationFilePath, phState) {
        result := DllCall("Ieframe.dll\IEShowSaveFileDialog", "ptr", hwnd, "ptr", lpwstrInitialFileName, "ptr", lpwstrInitialDir, "ptr", lpwstrFilter, "ptr", lpwstrDefExt, "uint", dwFilterIndex, "uint", dwFlags, "ptr", lppwstrDestinationFilePath, "ptr", phState, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<PWSTR>} lpwstrFileName 
     * @param {Integer} cchMaxFileName 
     * @param {Pointer<PWSTR>} lpwstrInitialDir 
     * @param {Pointer<PWSTR>} lpwstrFilter 
     * @param {Pointer<PWSTR>} lpwstrDefExt 
     * @param {Integer} dwFilterIndex 
     * @param {Integer} dwFlags 
     * @param {Pointer<HANDLE>} phFile 
     * @returns {Integer} 
     */
    static IEShowOpenFileDialog(hwnd, lpwstrFileName, cchMaxFileName, lpwstrInitialDir, lpwstrFilter, lpwstrDefExt, dwFilterIndex, dwFlags, phFile) {
        result := DllCall("Ieframe.dll\IEShowOpenFileDialog", "ptr", hwnd, "ptr", lpwstrFileName, "uint", cchMaxFileName, "ptr", lpwstrInitialDir, "ptr", lpwstrFilter, "ptr", lpwstrDefExt, "uint", dwFilterIndex, "uint", dwFlags, "ptr", phFile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HKEY>} pHKey 
     * @returns {Integer} 
     */
    static IEGetWriteableLowHKCU(pHKey) {
        result := DllCall("Ieframe.dll\IEGetWriteableLowHKCU", "ptr", pHKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidFolderID 
     * @param {Pointer<PWSTR>} lppwstrPath 
     * @returns {Integer} 
     */
    static IEGetWriteableFolderPath(clsidFolderID, lppwstrPath) {
        result := DllCall("Ieframe.dll\IEGetWriteableFolderPath", "ptr", clsidFolderID, "ptr", lppwstrPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pbResult 
     * @returns {Integer} 
     */
    static IEIsProtectedModeProcess(pbResult) {
        result := DllCall("Ieframe.dll\IEIsProtectedModeProcess", "ptr", pbResult, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpwstrUrl 
     * @returns {Integer} 
     */
    static IEIsProtectedModeURL(lpwstrUrl) {
        result := DllCall("Ieframe.dll\IEIsProtectedModeURL", "ptr", lpwstrUrl, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpwstrUrl 
     * @param {Pointer<PROCESS_INFORMATION>} lpProcInfo 
     * @param {Pointer<Void>} lpInfo 
     * @returns {Integer} 
     */
    static IELaunchURL(lpwstrUrl, lpProcInfo, lpInfo) {
        result := DllCall("Ieframe.dll\IELaunchURL", "ptr", lpwstrUrl, "ptr", lpProcInfo, "ptr", lpInfo, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static IERefreshElevationPolicy() {
        result := DllCall("Ieframe.dll\IERefreshElevationPolicy", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpszURL 
     * @param {Pointer<PWSTR>} lpszCookieName 
     * @param {Pointer<PWSTR>} lpszCookieData 
     * @param {Pointer<UInt32>} pcchCookieData 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static IEGetProtectedModeCookie(lpszURL, lpszCookieName, lpszCookieData, pcchCookieData, dwFlags) {
        result := DllCall("Ieframe.dll\IEGetProtectedModeCookie", "ptr", lpszURL, "ptr", lpszCookieName, "ptr", lpszCookieData, "ptr", pcchCookieData, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpszURL 
     * @param {Pointer<PWSTR>} lpszCookieName 
     * @param {Pointer<PWSTR>} lpszCookieData 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static IESetProtectedModeCookie(lpszURL, lpszCookieName, lpszCookieData, dwFlags) {
        result := DllCall("Ieframe.dll\IESetProtectedModeCookie", "ptr", lpszURL, "ptr", lpszCookieName, "ptr", lpszCookieData, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<PWSTR>} lpSubkey 
     * @param {Integer} fSubkeyAllowed 
     * @returns {Integer} 
     */
    static IERegisterWritableRegistryKey(guid, lpSubkey, fSubkeyAllowed) {
        result := DllCall("Ieframe.dll\IERegisterWritableRegistryKey", "ptr", guid, "ptr", lpSubkey, "int", fSubkeyAllowed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<PWSTR>} lpPath 
     * @param {Pointer<PWSTR>} lpValueName 
     * @param {Integer} dwType 
     * @param {Pointer<Byte>} lpData 
     * @param {Integer} cbMaxData 
     * @returns {Integer} 
     */
    static IERegisterWritableRegistryValue(guid, lpPath, lpValueName, dwType, lpData, cbMaxData) {
        result := DllCall("Ieframe.dll\IERegisterWritableRegistryValue", "ptr", guid, "ptr", lpPath, "ptr", lpValueName, "uint", dwType, "ptr", lpData, "uint", cbMaxData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {Integer} 
     */
    static IEUnregisterWritableRegistry(guid) {
        result := DllCall("Ieframe.dll\IEUnregisterWritableRegistry", "ptr", guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpSubKey 
     * @param {Integer} Reserved 
     * @param {Pointer<PWSTR>} lpClass 
     * @param {Integer} dwOptions 
     * @param {Integer} samDesired 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
     * @param {Pointer<HKEY>} phkResult 
     * @param {Pointer<UInt32>} lpdwDisposition 
     * @returns {Integer} 
     */
    static IERegCreateKeyEx(lpSubKey, Reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
        result := DllCall("Ieframe.dll\IERegCreateKeyEx", "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, "uint", dwOptions, "uint", samDesired, "ptr", lpSecurityAttributes, "ptr", phkResult, "ptr", lpdwDisposition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpSubKey 
     * @param {Pointer<PWSTR>} lpValueName 
     * @param {Integer} Reserved 
     * @param {Integer} dwType 
     * @param {Pointer<Byte>} lpData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     */
    static IERegSetValueEx(lpSubKey, lpValueName, Reserved, dwType, lpData, cbData) {
        result := DllCall("Ieframe.dll\IERegSetValueEx", "ptr", lpSubKey, "ptr", lpValueName, "uint", Reserved, "uint", dwType, "ptr", lpData, "uint", cbData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpFileName 
     * @param {Integer} dwDesiredAccess 
     * @param {Integer} dwShareMode 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
     * @param {Integer} dwCreationDisposition 
     * @param {Integer} dwFlagsAndAttributes 
     * @param {Pointer<HANDLE>} hTemplateFile 
     * @returns {Pointer<HANDLE>} 
     */
    static IECreateFile(lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile) {
        result := DllCall("Ieframe.dll\IECreateFile", "ptr", lpFileName, "uint", dwDesiredAccess, "uint", dwShareMode, "ptr", lpSecurityAttributes, "uint", dwCreationDisposition, "uint", dwFlagsAndAttributes, "ptr", hTemplateFile, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpFileName 
     * @returns {Integer} 
     */
    static IEDeleteFile(lpFileName) {
        result := DllCall("Ieframe.dll\IEDeleteFile", "ptr", lpFileName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpPathName 
     * @returns {Integer} 
     */
    static IERemoveDirectory(lpPathName) {
        result := DllCall("Ieframe.dll\IERemoveDirectory", "ptr", lpPathName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpExistingFileName 
     * @param {Pointer<PWSTR>} lpNewFileName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static IEMoveFileEx(lpExistingFileName, lpNewFileName, dwFlags) {
        result := DllCall("Ieframe.dll\IEMoveFileEx", "ptr", lpExistingFileName, "ptr", lpNewFileName, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpPathName 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
     * @returns {Integer} 
     */
    static IECreateDirectory(lpPathName, lpSecurityAttributes) {
        result := DllCall("Ieframe.dll\IECreateDirectory", "ptr", lpPathName, "ptr", lpSecurityAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpFileName 
     * @param {Integer} fInfoLevelId 
     * @param {Pointer<Void>} lpFileInformation 
     * @returns {Integer} 
     */
    static IEGetFileAttributesEx(lpFileName, fInfoLevelId, lpFileInformation) {
        result := DllCall("Ieframe.dll\IEGetFileAttributesEx", "ptr", lpFileName, "int", fInfoLevelId, "ptr", lpFileInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpFileName 
     * @param {Pointer<WIN32_FIND_DATAA>} lpFindFileData 
     * @returns {Pointer<HANDLE>} 
     */
    static IEFindFirstFile(lpFileName, lpFindFileData) {
        result := DllCall("Ieframe.dll\IEFindFirstFile", "ptr", lpFileName, "ptr", lpFindFileData, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwndParent 
     * @param {Pointer<PSTR>} pszUsername 
     * @param {Integer} fEnable 
     * @returns {Integer} 
     */
    static RatingEnable(hwndParent, pszUsername, fEnable) {
        result := DllCall("MSRATING.dll\RatingEnable", "ptr", hwndParent, "ptr", pszUsername, "int", fEnable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwndParent 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Integer} fEnable 
     * @returns {Integer} 
     */
    static RatingEnableW(hwndParent, pszUsername, fEnable) {
        result := DllCall("MSRATING.dll\RatingEnableW", "ptr", hwndParent, "ptr", pszUsername, "int", fEnable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszUsername 
     * @param {Pointer<PSTR>} pszURL 
     * @param {Pointer<PSTR>} pszRatingInfo 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} cbData 
     * @param {Pointer<Void>} ppRatingDetails 
     * @returns {Integer} 
     */
    static RatingCheckUserAccess(pszUsername, pszURL, pszRatingInfo, pData, cbData, ppRatingDetails) {
        result := DllCall("MSRATING.dll\RatingCheckUserAccess", "ptr", pszUsername, "ptr", pszURL, "ptr", pszRatingInfo, "ptr", pData, "uint", cbData, "ptr", ppRatingDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Pointer<PWSTR>} pszURL 
     * @param {Pointer<PWSTR>} pszRatingInfo 
     * @param {Pointer<Byte>} pData 
     * @param {Integer} cbData 
     * @param {Pointer<Void>} ppRatingDetails 
     * @returns {Integer} 
     */
    static RatingCheckUserAccessW(pszUsername, pszURL, pszRatingInfo, pData, cbData, ppRatingDetails) {
        result := DllCall("MSRATING.dll\RatingCheckUserAccessW", "ptr", pszUsername, "ptr", pszURL, "ptr", pszRatingInfo, "ptr", pData, "uint", cbData, "ptr", ppRatingDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Pointer<PSTR>} pszUsername 
     * @param {Pointer<PSTR>} pszContentDescription 
     * @param {Pointer<Void>} pRatingDetails 
     * @returns {Integer} 
     */
    static RatingAccessDeniedDialog(hDlg, pszUsername, pszContentDescription, pRatingDetails) {
        result := DllCall("MSRATING.dll\RatingAccessDeniedDialog", "ptr", hDlg, "ptr", pszUsername, "ptr", pszContentDescription, "ptr", pRatingDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Pointer<PWSTR>} pszContentDescription 
     * @param {Pointer<Void>} pRatingDetails 
     * @returns {Integer} 
     */
    static RatingAccessDeniedDialogW(hDlg, pszUsername, pszContentDescription, pRatingDetails) {
        result := DllCall("MSRATING.dll\RatingAccessDeniedDialogW", "ptr", hDlg, "ptr", pszUsername, "ptr", pszContentDescription, "ptr", pRatingDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Pointer<PSTR>} pszUsername 
     * @param {Pointer<Void>} pRatingDetails 
     * @returns {Integer} 
     */
    static RatingAccessDeniedDialog2(hDlg, pszUsername, pRatingDetails) {
        result := DllCall("MSRATING.dll\RatingAccessDeniedDialog2", "ptr", hDlg, "ptr", pszUsername, "ptr", pRatingDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Pointer<Void>} pRatingDetails 
     * @returns {Integer} 
     */
    static RatingAccessDeniedDialog2W(hDlg, pszUsername, pRatingDetails) {
        result := DllCall("MSRATING.dll\RatingAccessDeniedDialog2W", "ptr", hDlg, "ptr", pszUsername, "ptr", pRatingDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRatingDetails 
     * @returns {Integer} 
     */
    static RatingFreeDetails(pRatingDetails) {
        result := DllCall("MSRATING.dll\RatingFreeDetails", "ptr", pRatingDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hRatingObtainQuery 
     * @returns {Integer} 
     */
    static RatingObtainCancel(hRatingObtainQuery) {
        result := DllCall("MSRATING.dll\RatingObtainCancel", "ptr", hRatingObtainQuery, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszTargetUrl 
     * @param {Integer} dwUserData 
     * @param {Pointer} fCallback 
     * @param {Pointer<HANDLE>} phRatingObtainQuery 
     * @returns {Integer} 
     */
    static RatingObtainQuery(pszTargetUrl, dwUserData, fCallback, phRatingObtainQuery) {
        result := DllCall("MSRATING.dll\RatingObtainQuery", "ptr", pszTargetUrl, "uint", dwUserData, "ptr", fCallback, "ptr", phRatingObtainQuery, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszTargetUrl 
     * @param {Integer} dwUserData 
     * @param {Pointer} fCallback 
     * @param {Pointer<HANDLE>} phRatingObtainQuery 
     * @returns {Integer} 
     */
    static RatingObtainQueryW(pszTargetUrl, dwUserData, fCallback, phRatingObtainQuery) {
        result := DllCall("MSRATING.dll\RatingObtainQueryW", "ptr", pszTargetUrl, "uint", dwUserData, "ptr", fCallback, "ptr", phRatingObtainQuery, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Pointer<PSTR>} pszUsername 
     * @returns {Integer} 
     */
    static RatingSetupUI(hDlg, pszUsername) {
        result := DllCall("MSRATING.dll\RatingSetupUI", "ptr", hDlg, "ptr", pszUsername, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Pointer<PWSTR>} pszUsername 
     * @returns {Integer} 
     */
    static RatingSetupUIW(hDlg, pszUsername) {
        result := DllCall("MSRATING.dll\RatingSetupUIW", "ptr", hDlg, "ptr", pszUsername, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hDlg 
     * @param {Integer} cbPasswordBlob 
     * @param {Pointer<Byte>} pbPasswordBlob 
     * @param {Pointer<PWSTR>} lpszUrl 
     * @param {Integer} fAlwaysNever 
     * @param {Integer} fSitePage 
     * @param {Integer} fApprovedSitesEnforced 
     * @returns {Integer} 
     */
    static RatingAddToApprovedSites(hDlg, cbPasswordBlob, pbPasswordBlob, lpszUrl, fAlwaysNever, fSitePage, fApprovedSitesEnforced) {
        result := DllCall("MSRATING.dll\RatingAddToApprovedSites", "ptr", hDlg, "uint", cbPasswordBlob, "ptr", pbPasswordBlob, "ptr", lpszUrl, "int", fAlwaysNever, "int", fSitePage, "int", fApprovedSitesEnforced, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWndOwner 
     * @param {Pointer<HINSTANCE>} param1 
     * @param {Pointer<PSTR>} lpszFileName 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static RatingClickedOnPRFInternal(hWndOwner, param1, lpszFileName, nShow) {
        result := DllCall("MSRATING.dll\RatingClickedOnPRFInternal", "ptr", hWndOwner, "ptr", param1, "ptr", lpszFileName, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWndOwner 
     * @param {Pointer<HINSTANCE>} param1 
     * @param {Pointer<PSTR>} lpszFileName 
     * @param {Integer} nShow 
     * @returns {Integer} 
     */
    static RatingClickedOnRATInternal(hWndOwner, param1, lpszFileName, nShow) {
        result := DllCall("MSRATING.dll\RatingClickedOnRATInternal", "ptr", hWndOwner, "ptr", param1, "ptr", lpszFileName, "int", nShow, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static RatingEnabledQuery() {
        result := DllCall("MSRATING.dll\RatingEnabledQuery", "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static RatingInit() {
        result := DllCall("MSRATING.dll\RatingInit", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMapMIMEToCLSID>} ppMap 
     * @returns {Integer} 
     */
    static CreateMIMEMap(ppMap) {
        result := DllCall("ImgUtil.dll\CreateMIMEMap", "ptr", ppMap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<IMapMIMEToCLSID>} pMap 
     * @param {Pointer<IUnknown>} pEventSink 
     * @returns {Integer} 
     */
    static DecodeImage(pStream, pMap, pEventSink) {
        result := DllCall("ImgUtil.dll\DecodeImage", "ptr", pStream, "ptr", pMap, "ptr", pEventSink, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pInStream 
     * @param {Pointer<UInt32>} pnFormat 
     * @param {Pointer<IStream>} ppOutStream 
     * @returns {Integer} 
     */
    static SniffStream(pInStream, pnFormat, ppOutStream) {
        result := DllCall("ImgUtil.dll\SniffStream", "ptr", pInStream, "ptr", pnFormat, "ptr", ppOutStream, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnMaxBytes 
     * @returns {Integer} 
     */
    static GetMaxMIMEIDBytes(pnMaxBytes) {
        result := DllCall("ImgUtil.dll\GetMaxMIMEIDBytes", "ptr", pnMaxBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbBytes 
     * @param {Integer} nBytes 
     * @param {Pointer<UInt32>} pnFormat 
     * @returns {Integer} 
     */
    static IdentifyMIMEType(pbBytes, nBytes, pnFormat) {
        result := DllCall("ImgUtil.dll\IdentifyMIMEType", "ptr", pbBytes, "uint", nBytes, "ptr", pnFormat, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RGBQUAD>} pRGBColors 
     * @param {Integer} nColors 
     * @param {Pointer<Byte>} pInvTable 
     * @param {Integer} cbTable 
     * @returns {Integer} 
     */
    static ComputeInvCMAP(pRGBColors, nColors, pInvTable, cbTable) {
        result := DllCall("ImgUtil.dll\ComputeInvCMAP", "ptr", pRGBColors, "uint", nColors, "ptr", pInvTable, "uint", cbTable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pDestBits 
     * @param {Integer} nDestPitch 
     * @param {Pointer<Byte>} pSrcBits 
     * @param {Integer} nSrcPitch 
     * @param {Pointer<Guid>} bfidSrc 
     * @param {Pointer<RGBQUAD>} prgbDestColors 
     * @param {Pointer<RGBQUAD>} prgbSrcColors 
     * @param {Pointer<Byte>} pbDestInvMap 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @param {Integer} lDestTrans 
     * @param {Integer} lSrcTrans 
     * @returns {Integer} 
     */
    static DitherTo8(pDestBits, nDestPitch, pSrcBits, nSrcPitch, bfidSrc, prgbDestColors, prgbSrcColors, pbDestInvMap, x, y, cx, cy, lDestTrans, lSrcTrans) {
        result := DllCall("ImgUtil.dll\DitherTo8", "ptr", pDestBits, "int", nDestPitch, "ptr", pSrcBits, "int", nSrcPitch, "ptr", bfidSrc, "ptr", prgbDestColors, "ptr", prgbSrcColors, "ptr", pbDestInvMap, "int", x, "int", y, "int", cx, "int", cy, "int", lDestTrans, "int", lSrcTrans, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HBITMAP>} hbmDib 
     * @param {Pointer<IDirectDrawSurface>} ppSurface 
     * @returns {Integer} 
     */
    static CreateDDrawSurfaceOnDIB(hbmDib, ppSurface) {
        result := DllCall("ImgUtil.dll\CreateDDrawSurfaceOnDIB", "ptr", hbmDib, "ptr", ppSurface, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<IMapMIMEToCLSID>} pMap 
     * @param {Pointer<IUnknown>} pEventSink 
     * @param {Pointer<PWSTR>} pszMIMETypeParam 
     * @returns {Integer} 
     */
    static DecodeImageEx(pStream, pMap, pEventSink, pszMIMETypeParam) {
        result := DllCall("ImgUtil.dll\DecodeImageEx", "ptr", pStream, "ptr", pMap, "ptr", pEventSink, "ptr", pszMIMETypeParam, "int")
        return result
    }

;@endregion Methods
}
