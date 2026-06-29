#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_OFFLINEIFNOTCONNECTED := -5501

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_SILENT := -5502

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_BEFORENAVIGATE := 100

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NAVIGATECOMPLETE := 101

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_STATUSTEXTCHANGE := 102

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_QUIT := 103

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DOWNLOADCOMPLETE := 104

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_COMMANDSTATECHANGE := 105

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DOWNLOADBEGIN := 106

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NEWWINDOW := 107

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROGRESSCHANGE := 108

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWMOVE := 109

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWRESIZE := 110

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWACTIVATE := 111

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROPERTYCHANGE := 112

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_TITLECHANGE := 113

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_TITLEICONCHANGE := 114

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FRAMEBEFORENAVIGATE := 200

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FRAMENAVIGATECOMPLETE := 201

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FRAMENEWWINDOW := 204

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_BEFORENAVIGATE2 := 250

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NEWWINDOW2 := 251

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NAVIGATECOMPLETE2 := 252

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONQUIT := 253

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONVISIBLE := 254

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONTOOLBAR := 255

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONMENUBAR := 256

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONSTATUSBAR := 257

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONFULLSCREEN := 258

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DOCUMENTCOMPLETE := 259

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONTHEATERMODE := 260

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ONADDRESSBAR := 261

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWSETRESIZABLE := 262

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWCLOSING := 263

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWSETLEFT := 264

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWSETTOP := 265

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWSETWIDTH := 266

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWSETHEIGHT := 267

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CLIENTTOHOSTWINDOW := 268

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETSECURELOCKICON := 269

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FILEDOWNLOAD := 270

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NAVIGATEERROR := 271

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRIVACYIMPACTEDSTATECHANGE := 272

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NEWWINDOW3 := 273

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_VIEWUPDATE := 281

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETPHISHINGFILTERSTATUS := 282

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWSTATECHANGED := 283

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NEWPROCESS := 284

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_THIRDPARTYURLBLOCKED := 285

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_REDIRECTXDOMAINBLOCKED := 286

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WEBWORKERSTARTED := 288

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WEBWORKERFINISHED := 289

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_BEFORESCRIPTEXECUTE := 290

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTTEMPLATEINSTANTIATION := 225

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTTEMPLATETEARDOWN := 226

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_UPDATEPAGESTATUS := 227

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWREGISTERED := 200

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WINDOWREVOKED := 201

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RESETFIRSTBOOTMODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RESETSAFEMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_REFRESHOFFLINEDESKTOP := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDFAVORITE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDCHANNEL := 5

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDDESKTOPCOMPONENT := 6

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ISSUBSCRIBED := 7

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NAVIGATEANDFIND := 8

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IMPORTEXPORTFAVORITES := 9

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AUTOCOMPLETESAVEFORM := 10

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AUTOSCAN := 11

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AUTOCOMPLETEATTACH := 12

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SHOWBROWSERUI := 13

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDSEARCHPROVIDER := 14

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RUNONCESHOWN := 15

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SKIPRUNONCE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CUSTOMIZESETTINGS := 17

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SQMENABLED := 18

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PHISHINGENABLED := 19

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_BRANDIMAGEURI := 20

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SKIPTABSWELCOME := 21

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DIAGNOSECONNECTION := 22

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CUSTOMIZECLEARTYPE := 23

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ISSEARCHPROVIDERINSTALLED := 24

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ISSEARCHMIGRATED := 25

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DEFAULTSEARCHPROVIDER := 26

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RUNONCEREQUIREDSETTINGSCOMPLETE := 27

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RUNONCEHASSHOWN := 28

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHGUIDEURL := 29

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDSERVICE := 30

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ISSERVICEINSTALLED := 31

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDTOFAVORITESBAR := 32

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_BUILDNEWTABPAGE := 33

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETRECENTLYCLOSEDVISIBLE := 34

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETACTIVITIESVISIBLE := 35

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CONTENTDISCOVERYRESET := 36

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_INPRIVATEFILTERINGENABLED := 37

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SUGGESTEDSITESENABLED := 38

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENABLESUGGESTEDSITES := 39

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NAVIGATETOSUGGESTEDSITES := 40

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SHOWTABSHELP := 41

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SHOWINPRIVATEHELP := 42

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ISSITEMODE := 43

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETSITEMODEICONOVERLAY := 44

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CLEARSITEMODEICONOVERLAY := 45

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_UPDATETHUMBNAILBUTTON := 46

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETTHUMBNAILBUTTONS := 47

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDTHUMBNAILBUTTONS := 48

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDSITEMODE := 49

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETSITEMODEPROPERTIES := 50

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODECREATEJUMPLIST := 51

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODEADDJUMPLISTITEM := 52

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODECLEARJUMPLIST := 53

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODEADDBUTTONSTYLE := 54

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODESHOWBUTTONSTYLE := 55

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODESHOWJUMPLIST := 56

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADDTRACKINGPROTECTIONLIST := 57

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODEACTIVATE := 58

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ISSITEMODEFIRSTRUN := 59

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_TRACKINGPROTECTIONENABLED := 60

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ACTIVEXFILTERINGENABLED := 61

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROVISIONNETWORKS := 62

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_REPORTSAFEURL := 63

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODEREFRESHBADGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SITEMODECLEARBADGE := 65

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DIAGNOSECONNECTIONUILESS := 66

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_LAUNCHNETWORKCLIENTHELP := 67

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CHANGEDEFAULTBROWSER := 68

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_STOPPERIODICUPDATE := 69

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_STARTPERIODICUPDATE := 70

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CLEARNOTIFICATION := 71

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENABLENOTIFICATIONQUEUE := 72

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PINNEDSITESTATE := 73

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_LAUNCHINTERNETOPTIONS := 74

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_STARTPERIODICUPDATEBATCH := 75

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENABLENOTIFICATIONQUEUESQUARE := 76

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENABLENOTIFICATIONQUEUEWIDE := 77

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENABLENOTIFICATIONQUEUELARGE := 78

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SCHEDULEDTILENOTIFICATION := 79

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_REMOVESCHEDULEDTILENOTIFICATION := 80

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_STARTBADGEUPDATE := 81

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_STOPBADGEUPDATE := 82

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ISMETAREFERRERAVAILABLE := 83

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETEXPERIMENTALFLAG := 84

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETEXPERIMENTALFLAG := 85

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETEXPERIMENTALVALUE := 86

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETEXPERIMENTALVALUE := 87

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_HASNEEDIEAUTOLAUNCHFLAG := 88

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETNEEDIEAUTOLAUNCHFLAG := 89

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETNEEDIEAUTOLAUNCHFLAG := 90

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_LAUNCHIE := 91

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RESETEXPERIMENTALFLAGS := 92

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETCVLISTDATA := 93

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETCVLISTLOCALDATA := 94

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETEMIELISTDATA := 95

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETEMIELISTLOCALDATA := 96

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_OPENFAVORITESPANE := 97

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_OPENFAVORITESSETTINGS := 98

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_LAUNCHINHVSI := 99

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETNEEDHVSIAUTOLAUNCHFLAG := 100

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETNEEDHVSIAUTOLAUNCHFLAG := 101

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_HASNEEDHVSIAUTOLAUNCHFLAG := 102

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETOSSKU := 103

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETMSDEFAULTS := 104

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SHELLUIHELPERLAST := 105

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ADVANCEERROR := 10

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RETREATERROR := 11

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CANADVANCEERROR := 12

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CANRETREATERROR := 13

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETERRORLINE := 14

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETERRORCHAR := 15

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETERRORCODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETERRORMSG := 17

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETERRORURL := 18

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETDETAILSSTATE := 19

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETDETAILSSTATE := 20

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETPERERRSTATE := 21

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETPERERRSTATE := 22

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_GETALWAYSSHOWLOCKSTATE := 23

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FAVSELECTIONCHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SELECTIONCHANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DOUBLECLICK := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_INITIALIZED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_MOVESELECTIONUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_MOVESELECTIONDOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_RESETSORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NEWFOLDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SYNCHRONIZE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IMPORT := 6

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_EXPORT := 7

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_INVOKECONTEXTMENU := 8

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_MOVESELECTIONTO := 9

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SUBSCRIPTIONSENABLED := 10

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CREATESUBSCRIPTION := 11

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DELETESUBSCRIPTION := 12

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETROOT := 13

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENUMOPTIONS := 14

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SELECTEDITEM := 15

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ROOT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DEPTH := 17

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_MODE := 18

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FLAGS := 19

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_TVFLAGS := 20

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NSCOLUMNS := 21

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_COUNTVIEWTYPES := 22

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SETVIEWTYPE := 23

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SELECTEDITEMS := 24

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_EXPAND := 25

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_UNSELECTALL := 26

/**
 * @type {Integer (UInt32)}
 */
export global TF_NAVIGATE := 2142153644

/**
 * @type {String}
 */
export global TARGET_NOTIFY_OBJECT_NAME := "863a99a0-21bc-11d0-82b4-00a0c90c29c5"

/**
 * @type {String}
 */
export global IEPROCESS_MODULE_NAME := "IERtUtil.dll"

/**
 * @type {String}
 */
export global IEGetProcessModule_PROC_NAME := "IEGetProcessModule"

/**
 * @type {String}
 */
export global IEGetTabWindowExports_PROC_NAME := "IEGetTabWindowExports"

/**
 * @type {String}
 */
export global TSZMICROSOFTPATH := "Software\Microsoft"

/**
 * @type {String}
 */
export global SZ_IE_MAIN := "Main"

/**
 * @type {String}
 */
export global REGSTR_VAL_SMOOTHSCROLL := "SmoothScroll"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SMOOTHSCROLL_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SHOWTOOLBAR := "Show_ToolBar"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHOWADDRESSBAR := "Show_URLToolBar"

/**
 * @type {String}
 */
export global REGSTR_VAL_STARTPAGE := "Start Page"

/**
 * @type {String}
 */
export global REGSTRA_VAL_STARTPAGE := "Start Page"

/**
 * @type {String}
 */
export global REGSTR_VAL_SEARCHPAGE := "Search Page"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOCALPAGE := "Local Page"

/**
 * @type {String}
 */
export global REGSTR_VAL_USESTYLESHEETS := "Use Stylesheets"

/**
 * @type {String}
 */
export global REGSTR_VAL_USESTYLESHEETS_DEF := "yes"

/**
 * @type {String}
 */
export global REGSTR_VAL_USEICM := "UseICM"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_USEICM_DEF := 0

/**
 * @type {String}
 */
export global REGSTR_VAL_SHOWFOCUS := "Tabstop - MouseDown"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHOWFOCUS_DEF := "no"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOADIMAGES := "Display Inline Images"

/**
 * @type {String}
 */
export global REGSTR_VAL_PLAYSOUNDS := "Play_Background_Sounds"

/**
 * @type {String}
 */
export global REGSTR_VAL_PLAYVIDEOS := "Display Inline Videos"

/**
 * @type {String}
 */
export global REGSTR_VAL_ANCHORUNDERLINE := "Anchor Underline"

/**
 * @type {String}
 */
export global REGSTR_VAL_USEDLGCOLORS := "Use_DlgBox_Colors"

/**
 * @type {String}
 */
export global REGSTR_VAL_CHECKASSOC := "Check_Associations"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHOWFULLURLS := "Show_FullURL"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTOSEARCH := "Do404Search"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTONAVIGATE := "SearchForExtensions"

/**
 * @type {String}
 */
export global REGSTR_VAL_HTTP_ERRORS := "Friendly http errors"

/**
 * @type {String}
 */
export global REGSTR_VAL_USEIBAR := "UseBar"

/**
 * @type {String}
 */
export global SZ_IE_SETTINGS := "Settings"

/**
 * @type {String}
 */
export global REGSTR_VAL_IE_CUSTOMCOLORS := "Custom Colors"

/**
 * @type {String}
 */
export global REGSTR_VAL_ANCHORCOLOR := "Anchor Color"

/**
 * @type {String}
 */
export global REGSTR_VAL_ANCHORCOLORVISITED := "Anchor Color Visited"

/**
 * @type {String}
 */
export global REGSTR_VAL_BACKGROUNDCOLOR := "Background Color"

/**
 * @type {String}
 */
export global REGSTR_VAL_TEXTCOLOR := "Text Color"

/**
 * @type {String}
 */
export global REGSTR_VAL_ANCHORCOLORHOVER := "Anchor Color Hover"

/**
 * @type {String}
 */
export global REGSTR_VAL_USEHOVERCOLOR := "Use Anchor Hover Color"

/**
 * @type {String}
 */
export global SZ_IE_SECURITY := "Security"

/**
 * @type {String}
 */
export global REGSTR_VAL_SAFETYWARNINGLEVEL := "Safety Warning Level"

/**
 * @type {String}
 */
export global SZ_IE_DEFAULT_HTML_EDITOR := "Default HTML Editor"

/**
 * @type {String}
 */
export global REGSTR_VAL_USEAUTOAPPEND := "Append Completion"

/**
 * @type {String}
 */
export global REGSTR_VAL_USEAUTOSUGGEST := "AutoSuggest"

/**
 * @type {String}
 */
export global REGSTR_VAL_USEAUTOCOMPLETE := "Use AutoComplete"

/**
 * @type {String}
 */
export global SZ_IE_IBAR := "Bar"

/**
 * @type {String}
 */
export global SZ_IE_IBAR_BANDS := "Bands"

/**
 * @type {String}
 */
export global REGSTR_VAL_USERAGENT := "User Agent"

/**
 * @type {String}
 */
export global REGSTR_VAL_INTERNETENTRY := "InternetProfile"

/**
 * @type {String}
 */
export global REGSTR_VAL_INTERNETPROFILE := "InternetProfile"

/**
 * @type {String}
 */
export global REGSTR_VAL_INTERNETENTRYBKUP := "BackupInternetProfile"

/**
 * @type {String}
 */
export global REGSTR_VAL_CODEDOWNLOAD := "Code Download"

/**
 * @type {String}
 */
export global REGSTR_VAL_CODEDOWNLOAD_DEF := "yes"

/**
 * @type {String}
 */
export global REGSTR_PATH_INETCPL_RESTRICTIONS := "Software\Policies\Microsoft\Internet Explorer\Control Panel"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_GENERALTAB := "GeneralTab"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_SECURITYTAB := "SecurityTab"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_CONTENTTAB := "ContentTab"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_CONNECTIONSTAB := "ConnectionsTab"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_PROGRAMSTAB := "ProgramsTab"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_ADVANCEDTAB := "AdvancedTab"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_PRIVACYTAB := "PrivacyTab"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETCPL_IEAK := "IEAKContext"

/**
 * @type {String}
 */
export global REGSTR_VAL_DIRECTORY := "Directory"

/**
 * @type {String}
 */
export global REGSTR_VAL_NEWDIRECTORY := "NewDirectory"

/**
 * @type {String}
 */
export global REGSTR_VAL_CACHEPREFIX := "CachePrefix"

/**
 * @type {String}
 */
export global SZ_IE_SEARCHSTRINGS := "UrlTemplate"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SEARCH_FORMAT_STRING := 255

/**
 * @type {String}
 */
export global SZ_IE_THRESHOLDS := "ErrorThresholds"

/**
 * @type {String}
 */
export global REGSTR_VAL_ACCESSMEDIUM := "AccessMedium"

/**
 * @type {String}
 */
export global REGSTR_VAL_ACCESSTYPE := "AccessType"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTODIALDLLNAME := "AutodialDllName"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTODIALFCNNAME := "AutodialFcnName"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTODIAL_MONITORCLASSNAME := "MS_AutodialMonitor"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTODIAL_TRYONLYONCE := "TryAutodialOnce"

/**
 * @type {String}
 */
export global REGSTR_PATH_REMOTEACCESS := "RemoteAccess"

/**
 * @type {String}
 */
export global REGSTR_PATH_REMOTEACESS := "RemoteAccess"

/**
 * @type {String}
 */
export global REGSTR_VAL_RNAINSTALLED := "Installed"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENABLEAUTODIAL := "EnableAutodial"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENABLEUNATTENDED := "EnableUnattended"

/**
 * @type {String}
 */
export global REGSTR_VAL_NONETAUTODIAL := "NoNetAutodial"

/**
 * @type {String}
 */
export global REGSTR_VAL_REDIALATTEMPTS := "RedialAttempts"

/**
 * @type {String}
 */
export global REGSTR_VAL_REDIALINTERVAL := "RedialWait"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENABLEAUTODIALDISCONNECT := "EnableAutodisconnect"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENABLEAUTODISCONNECT := "EnableAutodisconnect"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENABLEEXITDISCONNECT := "EnableExitDisconnect"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENABLESECURITYCHECK := "EnableSecurityCheck"

/**
 * @type {String}
 */
export global REGSTR_VAL_COVEREXCLUDE := "CoverExclude"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISCONNECTIDLETIME := "DisconnectIdleTime"

/**
 * @type {String}
 */
export global REGSTR_VAL_MOSDISCONNECT := "DisconnectTimeout"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROXYENABLE := "ProxyEnable"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROXYSERVER := "ProxyServer"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROXYOVERRIDE := "ProxyOverride"

/**
 * @type {String}
 */
export global REGSTR_VAL_BYPASSAUTOCONFIG := "BypassAutoconfig"

/**
 * @type {String}
 */
export global SZTRUSTWARNLEVEL := "Trust Warning Level"

/**
 * @type {String}
 */
export global REGSTR_VAL_TRUSTWARNINGLEVEL_HIGH := "High"

/**
 * @type {String}
 */
export global REGSTR_VAL_TRUSTWARNINGLEVEL_MED := "Medium"

/**
 * @type {String}
 */
export global REGSTR_VAL_TRUSTWARNINGLEVEL_LOW := "No Security"

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYWARNONSEND := "WarnOnPost"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYWARNONSEND_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYWARNONSENDALWAYS := "WarnAlwaysOnPost"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYWARNONSENDALWAYS_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYWARNONVIEW := "WarnOnView"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYWARNONVIEW_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYALLOWCOOKIES := "AllowCookies"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYALLOWCOOKIES_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYWARNONZONECROSSING := "WarnOnZoneCrossing"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYWARNONZONECROSSING_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYWARNONBADCERTVIEWING := "WarnOnBadCertRecving"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYWARNONBADCERTVIEWING_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYWARNONBADCERTSENDING := "WarnOnBadCertSending"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYWARNONBADCERTSENDING_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES := "DisableCachingOfSSLPages"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES_DEF := 0

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYACTIVEX := "Security_RunActiveXControls"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYACTIVEX_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYACTICEXSCRIPTS := "Security_RunScripts"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYACTICEXSCRIPTS_DEF := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_SECURITYJAVA := "Security_RunJavaApplets"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SECURITYJAVA_DEF := 1

/**
 * @type {String}
 */
export global SZJAVAVMPATH := "\Java VM"

/**
 * @type {String}
 */
export global REGSTR_VAL_JAVAJIT := "EnableJIT"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_JAVAJIT_DEF := 0

/**
 * @type {String}
 */
export global REGSTR_VAL_JAVALOGGING := "EnableLogging"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_JAVALOGGING_DEF := 0

/**
 * @type {String}
 */
export global SZTOOLBAR := "\Toolbar"

/**
 * @type {String}
 */
export global REGSTR_VAL_DAYSTOKEEP := "DaysToKeep"

/**
 * @type {String}
 */
export global SZNOTEXT := "NoText"

/**
 * @type {String}
 */
export global SZVISIBLE := "VisibleBands"

/**
 * @type {String}
 */
export global REGSTR_VAL_VISIBLEBANDS := "VisibleBands"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_VISIBLEBANDS_DEF := 7

/**
 * @type {Integer (UInt32)}
 */
export global TOOLSBAND := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADDRESSBAND := 2

/**
 * @type {Integer (UInt32)}
 */
export global LINKSBAND := 4

/**
 * @type {String}
 */
export global SZBACKBITMAP := "BackBitmap"

/**
 * @type {String}
 */
export global REGSTR_VAL_BACKBITMAP := "BackBitmap"

/**
 * @type {String}
 */
export global REGSTR_SHIFTQUICKSUFFIX := "ShiftQuickCompleteSuffix"

/**
 * @type {String}
 */
export global TSZSCHANNELPATH := "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCHANNELENABLEPROTOCOL := "Enabled"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_SCHANNELENABLEPROTOCOL_DEF := 1

/**
 * @type {String}
 */
export global TSZINTERNETCLIENTSPATH := "Software\Microsoft\Internet Explorer\Unix"

/**
 * @type {String}
 */
export global REGSTR_PATH_DEFAULT := "default"

/**
 * @type {String}
 */
export global REGSTR_PATH_CURRENT := "current"

/**
 * @type {Integer (Int32)}
 */
export global IE_USE_OE_PRESENT_HKEY := -2147483646

/**
 * @type {String}
 */
export global IE_USE_OE_PRESENT_KEY := "Software\Microsoft\Windows\CurrentVersion\app.paths\msimn.exe"

/**
 * @type {Integer (Int32)}
 */
export global IE_USE_OE_MAIL_HKEY := -2147483647

/**
 * @type {String}
 */
export global IE_USE_OE_MAIL_KEY := "Software\Microsoft\Internet Explorer\Mail"

/**
 * @type {String}
 */
export global IE_USE_OE_MAIL_VALUE := "Use Outlook Express"

/**
 * @type {Integer (Int32)}
 */
export global IE_USE_OE_NEWS_HKEY := -2147483647

/**
 * @type {String}
 */
export global IE_USE_OE_NEWS_KEY := "Software\Microsoft\Internet Explorer\News"

/**
 * @type {String}
 */
export global IE_USE_OE_NEWS_VALUE := "Use Outlook Express"

/**
 * @type {String}
 */
export global TSZPROTOCOLSPATH := "Protocols\"

/**
 * @type {String}
 */
export global TSZMAILTOPROTOCOL := "mailto"

/**
 * @type {String}
 */
export global TSZNEWSPROTOCOL := "news"

/**
 * @type {String}
 */
export global TSZCALLTOPROTOCOL := "callto"

/**
 * @type {String}
 */
export global TSZLDAPPROTOCOL := "ldap"

/**
 * @type {String}
 */
export global TSZCALENDARPROTOCOL := "unk"

/**
 * @type {String}
 */
export global TSZVSOURCEPROTOCOL := "view source"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEFAULT_CODEPAGE := "Default_CodePage"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEFAULT_SCRIPT := "Default_Script"

/**
 * @type {String}
 */
export global REGSTR_VAL_ACCEPT_LANGUAGE := "AcceptLanguage"

/**
 * @type {String}
 */
export global REGSTR_VAL_FONT_SCRIPTS := "Scripts"

/**
 * @type {String}
 */
export global REGSTR_VAL_FONT_SCRIPT := "Script"

/**
 * @type {String}
 */
export global REGSTR_VAL_FONT_SCRIPT_NAME := "Script"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEF_ENCODING := "Default_Encoding"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEF_INETENCODING := "Default_InternetEncoding"

/**
 * @type {String}
 */
export global REGSTR_VAL_FIXED_FONT := "IEFixedFontName"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCRIPT_FIXED_FONT := "IEFixedFontName"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROP_FONT := "IEPropFontName"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCRIPT_PROP_FONT := "IEPropFontName"

/**
 * @type {String}
 */
export global REGSTR_VAL_FONT_SIZE := "IEFontSize"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_FONT_SIZE_DEF := 2

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTODETECT := "AutoDetect"

/**
 * @type {String}
 */
export global REGSTR_PATH_MIME_DATABASE := "MIME\Database"

/**
 * @type {String}
 */
export global REGSTR_VAL_CODEPAGE := "CodePage"

/**
 * @type {String}
 */
export global REGSTR_VAL_INETENCODING := "InternetEncoding"

/**
 * @type {String}
 */
export global REGSTR_VAL_FAMILY := "Family"

/**
 * @type {String}
 */
export global REGSTR_VAL_LEVEL := "Level"

/**
 * @type {String}
 */
export global REGSTR_VAL_ALIASTO := "AliasForCharset"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENCODENAME := "EncodingName"

/**
 * @type {String}
 */
export global REGSTR_VAL_DESCRIPTION := "Description"

/**
 * @type {String}
 */
export global REGSTR_VAL_WEBCHARSET := "WebCharset"

/**
 * @type {String}
 */
export global REGSTR_VAL_BODYCHARSET := "BodyCharset"

/**
 * @type {String}
 */
export global REGSTR_VAL_HEADERCHARSET := "HeaderCharset"

/**
 * @type {String}
 */
export global REGSTR_VAL_FIXEDWIDTHFONT := "FixedWidthFont"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROPORTIONALFONT := "ProportionalFont"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRIVCONVERTER := "PrivConverter"

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_CLEAR_AUTOCOMPLETE_FOR_FORMS := 0

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_SETID_AUTOCOMPLETE_FOR_FORMS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_BEFORENAVIGATE_GETSHELLBROWSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_BEFORENAVIGATE_DOEXTERNALBROWSE := 3

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_BEFORENAVIGATE_GETIDLIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_SET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW := 5

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_GET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW := 6

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_ARG_CLEAR_FORMS_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_ARG_CLEAR_FORMS_ALL_BUT_PASSWORDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IECMDID_ARG_CLEAR_FORMS_PASSWORDS_ONLY := 2

/**
 * @type {Guid}
 */
export global CATID_MSOfficeAntiVirus := Guid("{56ffcc30-d398-11d0-b2ae-00a0c908fa49}")

/**
 * @type {Integer (UInt32)}
 */
export global msoedmEnable := 1

/**
 * @type {Integer (UInt32)}
 */
export global msoedmDisable := 2

/**
 * @type {Integer (UInt32)}
 */
export global msoedmDontOpen := 3

/**
 * @type {Integer (UInt32)}
 */
export global msoslUndefined := 0

/**
 * @type {Integer (UInt32)}
 */
export global msoslNone := 1

/**
 * @type {Integer (UInt32)}
 */
export global msoslMedium := 2

/**
 * @type {Integer (UInt32)}
 */
export global msoslHigh := 3

/**
 * @type {Integer (UInt32)}
 */
export global msodsvNoMacros := 0

/**
 * @type {Integer (UInt32)}
 */
export global msodsvUnsigned := 1

/**
 * @type {Integer (UInt32)}
 */
export global msodsvPassedTrusted := 2

/**
 * @type {Integer (UInt32)}
 */
export global msodsvFailed := 3

/**
 * @type {Integer (UInt32)}
 */
export global msodsvLowSecurityLevel := 4

/**
 * @type {Integer (UInt32)}
 */
export global msodsvPassedTrustedCert := 5

/**
 * @type {Integer (UInt32)}
 */
export global STATURL_QUERYFLAG_ISCACHED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global STATURL_QUERYFLAG_NOURL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global STATURL_QUERYFLAG_NOTITLE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global STATURL_QUERYFLAG_TOPLEVEL := 524288

/**
 * @type {Integer (UInt32)}
 */
export global STATURLFLAG_ISCACHED := 1

/**
 * @type {Integer (UInt32)}
 */
export global STATURLFLAG_ISTOPLEVEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SURFACE_LOCK_EXCLUSIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SURFACE_LOCK_ALLOW_DISCARD := 2

/**
 * @type {Integer (UInt32)}
 */
export global SURFACE_LOCK_WAIT := 4

/**
 * @type {Integer (Int32)}
 */
export global E_SURFACE_NOSURFACE := -2147434496

/**
 * @type {Integer (Int32)}
 */
export global E_SURFACE_UNKNOWN_FORMAT := -2147434495

/**
 * @type {Integer (Int32)}
 */
export global E_SURFACE_NOTMYPOINTER := -2147434494

/**
 * @type {Integer (Int32)}
 */
export global E_SURFACE_DISCARDED := -2147434493

/**
 * @type {Integer (Int32)}
 */
export global E_SURFACE_NODC := -2147434492

/**
 * @type {Integer (Int32)}
 */
export global E_SURFACE_NOTMYDC := -2147434491

/**
 * @type {Integer (Int32)}
 */
export global S_SURFACE_DISCARDED := 49155

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_NO_TRANSPARENT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_EVENT_PROGRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_EVENT_PALETTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_EVENT_BEGINBITS := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_EVENT_BITSCOMPLETE := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_EVENT_USEDDRAW := 16

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_HINT_TOPDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_HINT_BOTTOMUP := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMGDECODE_HINT_FULLWIDTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAPMIME_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MAPMIME_CLSID := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAPMIME_DISABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAPMIME_DEFAULT_ALWAYS := 3

/**
 * @type {Integer (UInt32)}
 */
export global TIMERMODE_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global TIMERMODE_VISIBILITYAWARE := 1
;@endregion Constants
