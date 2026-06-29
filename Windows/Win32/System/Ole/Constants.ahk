#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ole
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global CTL_E_ILLEGALFUNCTIONCALL := -2146828283

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_E_FIRST := -2147220992

/**
 * @type {Integer (Int32)}
 */
export global SELFREG_E_FIRST := -2147220992

/**
 * @type {Integer (Int32)}
 */
export global PERPROP_E_FIRST := -2147220992

/**
 * @type {Integer (Int32)}
 */
export global OLECMDERR_E_FIRST := -2147221248

/**
 * @type {Integer (Int32)}
 */
export global OLECMDERR_E_DISABLED := -2147221247

/**
 * @type {Integer (Int32)}
 */
export global OLECMDERR_E_NOHELP := -2147221246

/**
 * @type {Integer (Int32)}
 */
export global OLECMDERR_E_CANCELED := -2147221245

/**
 * @type {Integer (Int32)}
 */
export global OLECMDERR_E_UNKNOWNGROUP := -2147221244

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_E_NOCONNECTION := -2147220992

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_E_ADVISELIMIT := -2147220991

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_E_CANNOTCONNECT := -2147220990

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_E_OVERRIDDEN := -2147220989

/**
 * @type {Integer (Int32)}
 */
export global SELFREG_E_TYPELIB := -2147220992

/**
 * @type {Integer (Int32)}
 */
export global SELFREG_E_CLASS := -2147220991

/**
 * @type {Integer (Int32)}
 */
export global PERPROP_E_NOPAGEAVAILABLE := -2147220992

/**
 * @type {Guid}
 */
export global CLSID_CFontPropPage := Guid("{0be35200-8f91-11ce-9de3-00aa004bb851}")

/**
 * @type {Guid}
 */
export global CLSID_CColorPropPage := Guid("{0be35201-8f91-11ce-9de3-00aa004bb851}")

/**
 * @type {Guid}
 */
export global CLSID_CPicturePropPage := Guid("{0be35202-8f91-11ce-9de3-00aa004bb851}")

/**
 * @type {Guid}
 */
export global CLSID_PersistPropset := Guid("{fb8f0821-0164-101b-84ed-08002b2ec713}")

/**
 * @type {Guid}
 */
export global CLSID_ConvertVBX := Guid("{fb8f0822-0164-101b-84ed-08002b2ec713}")

/**
 * @type {Guid}
 */
export global CLSID_StdFont := Guid("{0be35203-8f91-11ce-9de3-00aa004bb851}")

/**
 * @type {Guid}
 */
export global CLSID_StdPicture := Guid("{0be35204-8f91-11ce-9de3-00aa004bb851}")

/**
 * @type {Guid}
 */
export global GUID_HIMETRIC := Guid("{66504300-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_COLOR := Guid("{66504301-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_XPOSPIXEL := Guid("{66504302-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_YPOSPIXEL := Guid("{66504303-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_XSIZEPIXEL := Guid("{66504304-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_YSIZEPIXEL := Guid("{66504305-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_XPOS := Guid("{66504306-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_YPOS := Guid("{66504307-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_XSIZE := Guid("{66504308-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_YSIZE := Guid("{66504309-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_TRISTATE := Guid("{6650430a-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_OPTIONVALUEEXCLUSIVE := Guid("{6650430b-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_CHECKVALUEEXCLUSIVE := Guid("{6650430c-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_FONTNAME := Guid("{6650430d-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_FONTSIZE := Guid("{6650430e-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_FONTBOLD := Guid("{6650430f-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_FONTITALIC := Guid("{66504310-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_FONTUNDERSCORE := Guid("{66504311-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_FONTSTRIKETHROUGH := Guid("{66504312-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Guid}
 */
export global GUID_HANDLE := Guid("{66504313-be0f-101a-8bbb-00aa00300cab}")

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_E_LAST := -2147220977

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_S_FIRST := 262656

/**
 * @type {Integer (Int32)}
 */
export global CONNECT_S_LAST := 262671

/**
 * @type {Integer (Int32)}
 */
export global SELFREG_E_LAST := -2147220977

/**
 * @type {Integer (Int32)}
 */
export global SELFREG_S_FIRST := 262656

/**
 * @type {Integer (Int32)}
 */
export global SELFREG_S_LAST := 262671

/**
 * @type {Integer (Int32)}
 */
export global PERPROP_E_LAST := -2147220977

/**
 * @type {Integer (Int32)}
 */
export global PERPROP_S_FIRST := 262656

/**
 * @type {Integer (Int32)}
 */
export global PERPROP_S_LAST := 262671

/**
 * @type {Integer (Int32)}
 */
export global OLEIVERB_PROPERTIES := -7

/**
 * @type {Integer (UInt32)}
 */
export global VT_STREAMED_PROPSET := 73

/**
 * @type {Integer (UInt32)}
 */
export global VT_STORED_PROPSET := 74

/**
 * @type {Integer (UInt32)}
 */
export global VT_BLOB_PROPSET := 75

/**
 * @type {Integer (UInt32)}
 */
export global VT_VERBOSE_ENUM := 76

/**
 * @type {Integer (UInt32)}
 */
export global OCM__BASE := 8192

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AUTOSIZE := -500

/**
 * @type {Integer (Int32)}
 */
export global DISPID_BACKCOLOR := -501

/**
 * @type {Integer (Int32)}
 */
export global DISPID_BACKSTYLE := -502

/**
 * @type {Integer (Int32)}
 */
export global DISPID_BORDERCOLOR := -503

/**
 * @type {Integer (Int32)}
 */
export global DISPID_BORDERSTYLE := -504

/**
 * @type {Integer (Int32)}
 */
export global DISPID_BORDERWIDTH := -505

/**
 * @type {Integer (Int32)}
 */
export global DISPID_DRAWMODE := -507

/**
 * @type {Integer (Int32)}
 */
export global DISPID_DRAWSTYLE := -508

/**
 * @type {Integer (Int32)}
 */
export global DISPID_DRAWWIDTH := -509

/**
 * @type {Integer (Int32)}
 */
export global DISPID_FILLCOLOR := -510

/**
 * @type {Integer (Int32)}
 */
export global DISPID_FILLSTYLE := -511

/**
 * @type {Integer (Int32)}
 */
export global DISPID_FONT := -512

/**
 * @type {Integer (Int32)}
 */
export global DISPID_FORECOLOR := -513

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ENABLED := -514

/**
 * @type {Integer (Int32)}
 */
export global DISPID_HWND := -515

/**
 * @type {Integer (Int32)}
 */
export global DISPID_TABSTOP := -516

/**
 * @type {Integer (Int32)}
 */
export global DISPID_TEXT := -517

/**
 * @type {Integer (Int32)}
 */
export global DISPID_CAPTION := -518

/**
 * @type {Integer (Int32)}
 */
export global DISPID_BORDERVISIBLE := -519

/**
 * @type {Integer (Int32)}
 */
export global DISPID_APPEARANCE := -520

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MOUSEPOINTER := -521

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MOUSEICON := -522

/**
 * @type {Integer (Int32)}
 */
export global DISPID_PICTURE := -523

/**
 * @type {Integer (Int32)}
 */
export global DISPID_VALID := -524

/**
 * @type {Integer (Int32)}
 */
export global DISPID_READYSTATE := -525

/**
 * @type {Integer (Int32)}
 */
export global DISPID_LISTINDEX := -526

/**
 * @type {Integer (Int32)}
 */
export global DISPID_SELECTED := -527

/**
 * @type {Integer (Int32)}
 */
export global DISPID_LIST := -528

/**
 * @type {Integer (Int32)}
 */
export global DISPID_COLUMN := -529

/**
 * @type {Integer (Int32)}
 */
export global DISPID_LISTCOUNT := -531

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MULTISELECT := -532

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MAXLENGTH := -533

/**
 * @type {Integer (Int32)}
 */
export global DISPID_PASSWORDCHAR := -534

/**
 * @type {Integer (Int32)}
 */
export global DISPID_SCROLLBARS := -535

/**
 * @type {Integer (Int32)}
 */
export global DISPID_WORDWRAP := -536

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MULTILINE := -537

/**
 * @type {Integer (Int32)}
 */
export global DISPID_NUMBEROFROWS := -538

/**
 * @type {Integer (Int32)}
 */
export global DISPID_NUMBEROFCOLUMNS := -539

/**
 * @type {Integer (Int32)}
 */
export global DISPID_DISPLAYSTYLE := -540

/**
 * @type {Integer (Int32)}
 */
export global DISPID_GROUPNAME := -541

/**
 * @type {Integer (Int32)}
 */
export global DISPID_IMEMODE := -542

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ACCELERATOR := -543

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ENTERKEYBEHAVIOR := -544

/**
 * @type {Integer (Int32)}
 */
export global DISPID_TABKEYBEHAVIOR := -545

/**
 * @type {Integer (Int32)}
 */
export global DISPID_SELTEXT := -546

/**
 * @type {Integer (Int32)}
 */
export global DISPID_SELSTART := -547

/**
 * @type {Integer (Int32)}
 */
export global DISPID_SELLENGTH := -548

/**
 * @type {Integer (Int32)}
 */
export global DISPID_REFRESH := -550

/**
 * @type {Integer (Int32)}
 */
export global DISPID_DOCLICK := -551

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ABOUTBOX := -552

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ADDITEM := -553

/**
 * @type {Integer (Int32)}
 */
export global DISPID_CLEAR := -554

/**
 * @type {Integer (Int32)}
 */
export global DISPID_REMOVEITEM := -555

/**
 * @type {Integer (Int32)}
 */
export global DISPID_CLICK := -600

/**
 * @type {Integer (Int32)}
 */
export global DISPID_DBLCLICK := -601

/**
 * @type {Integer (Int32)}
 */
export global DISPID_KEYDOWN := -602

/**
 * @type {Integer (Int32)}
 */
export global DISPID_KEYPRESS := -603

/**
 * @type {Integer (Int32)}
 */
export global DISPID_KEYUP := -604

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MOUSEDOWN := -605

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MOUSEMOVE := -606

/**
 * @type {Integer (Int32)}
 */
export global DISPID_MOUSEUP := -607

/**
 * @type {Integer (Int32)}
 */
export global DISPID_ERROREVENT := -608

/**
 * @type {Integer (Int32)}
 */
export global DISPID_READYSTATECHANGE := -609

/**
 * @type {Integer (Int32)}
 */
export global DISPID_CLICK_VALUE := -610

/**
 * @type {Integer (Int32)}
 */
export global DISPID_RIGHTTOLEFT := -611

/**
 * @type {Integer (Int32)}
 */
export global DISPID_TOPTOBOTTOM := -612

/**
 * @type {Integer (Int32)}
 */
export global DISPID_THIS := -613

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_BACKCOLOR := -701

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_DISPLAYNAME := -702

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_FONT := -703

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_FORECOLOR := -704

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_LOCALEID := -705

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_MESSAGEREFLECT := -706

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_SCALEUNITS := -707

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_TEXTALIGN := -708

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_USERMODE := -709

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_UIDEAD := -710

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_SHOWGRABHANDLES := -711

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_SHOWHATCHING := -712

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_DISPLAYASDEFAULT := -713

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_SUPPORTSMNEMONICS := -714

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_AUTOCLIP := -715

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_APPEARANCE := -716

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_CODEPAGE := -725

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_PALETTE := -726

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_CHARSET := -727

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_TRANSFERPRIORITY := -728

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_RIGHTTOLEFT := -732

/**
 * @type {Integer (Int32)}
 */
export global DISPID_AMBIENT_TOPTOBOTTOM := -733

/**
 * @type {Integer (Int32)}
 */
export global DISPID_Name := -800

/**
 * @type {Integer (Int32)}
 */
export global DISPID_Delete := -801

/**
 * @type {Integer (Int32)}
 */
export global DISPID_Object := -802

/**
 * @type {Integer (Int32)}
 */
export global DISPID_Parent := -803

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_NAME := 0

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_SIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_BOLD := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_ITALIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_UNDER := 5

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_STRIKE := 6

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_WEIGHT := 7

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_CHARSET := 8

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FONT_CHANGED := 9

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PICT_HANDLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PICT_HPAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PICT_TYPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PICT_WIDTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PICT_HEIGHT := 5

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PICT_RENDER := 6

/**
 * @type {String}
 */
export global STDOLE_TLB := "stdole2.tlb"

/**
 * @type {String}
 */
export global STDTYPE_TLB := "stdole2.tlb"

/**
 * @type {Integer (Int32)}
 */
export global GC_WCH_SIBLING := 1

/**
 * @type {Integer (UInt32)}
 */
export global TIFLAGS_EXTENDDISPATCHONLY := 1

/**
 * @type {Integer (Int32)}
 */
export global OLECMDERR_E_NOTSUPPORTED := -2147221248

/**
 * @type {Integer (Int32)}
 */
export global MSOCMDERR_E_FIRST := -2147221248

/**
 * @type {Integer (Int32)}
 */
export global MSOCMDERR_E_NOTSUPPORTED := -2147221248

/**
 * @type {Integer (Int32)}
 */
export global MSOCMDERR_E_DISABLED := -2147221247

/**
 * @type {Integer (Int32)}
 */
export global MSOCMDERR_E_NOHELP := -2147221246

/**
 * @type {Integer (Int32)}
 */
export global MSOCMDERR_E_CANCELED := -2147221245

/**
 * @type {Integer (Int32)}
 */
export global MSOCMDERR_E_UNKNOWNGROUP := -2147221244

/**
 * @type {Integer (UInt32)}
 */
export global OLECMD_TASKDLGID_ONBEFOREUNLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_SHOWPAGEACTIONMENU_HWND := 0

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_SHOWPAGEACTIONMENU_X := 1

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_SHOWPAGEACTIONMENU_Y := 2

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_ACTIVEXINSTALL_PUBLISHER := 0

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_ACTIVEXINSTALL_DISPLAYNAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_ACTIVEXINSTALL_CLSID := 2

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_ACTIVEXINSTALL_INSTALLSCOPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global OLECMDARGINDEX_ACTIVEXINSTALL_SOURCEURL := 4

/**
 * @type {Integer (UInt32)}
 */
export global INSTALL_SCOPE_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global INSTALL_SCOPE_MACHINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global INSTALL_SCOPE_USER := 2

/**
 * @type {Integer (UInt32)}
 */
export global MK_ALT := 32

/**
 * @type {Integer (UInt32)}
 */
export global DD_DEFSCROLLINSET := 11

/**
 * @type {Integer (UInt32)}
 */
export global DD_DEFSCROLLDELAY := 50

/**
 * @type {Integer (UInt32)}
 */
export global DD_DEFSCROLLINTERVAL := 50

/**
 * @type {Integer (UInt32)}
 */
export global DD_DEFDRAGDELAY := 200

/**
 * @type {Integer (UInt32)}
 */
export global DD_DEFDRAGMINDIST := 2

/**
 * @type {Integer (Int32)}
 */
export global OT_LINK := 1

/**
 * @type {Integer (Int32)}
 */
export global OT_EMBEDDED := 2

/**
 * @type {Integer (Int32)}
 */
export global OT_STATIC := 3

/**
 * @type {Integer (UInt32)}
 */
export global OLEVERB_PRIMARY := 0

/**
 * @type {Integer (UInt32)}
 */
export global OF_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global OF_GET := 2

/**
 * @type {Integer (UInt32)}
 */
export global OF_HANDLER := 4

/**
 * @type {Integer (UInt32)}
 */
export global WIN32 := 100

/**
 * @type {Integer (Int32)}
 */
export global OLESTREAM_CONVERSION_DEFAULT := 0

/**
 * @type {Integer (Int32)}
 */
export global OLESTREAM_CONVERSION_DISABLEOLELINK := 1

/**
 * @type {Integer (UInt32)}
 */
export global IDC_OLEUIHELP := 99

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_CREATENEW := 2100

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_CREATEFROMFILE := 2101

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_LINKFILE := 2102

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_OBJECTTYPELIST := 2103

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_DISPLAYASICON := 2104

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_CHANGEICON := 2105

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_FILE := 2106

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_FILEDISPLAY := 2107

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_RESULTIMAGE := 2108

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_RESULTTEXT := 2109

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_ICONDISPLAY := 2110

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_OBJECTTYPETEXT := 2111

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_FILETEXT := 2112

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_FILETYPE := 2113

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_INSERTCONTROL := 2114

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_ADDCONTROL := 2115

/**
 * @type {Integer (UInt32)}
 */
export global IDC_IO_CONTROLTYPELIST := 2116

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_PASTE := 500

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_PASTELINK := 501

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_SOURCETEXT := 502

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_PASTELIST := 503

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_PASTELINKLIST := 504

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_DISPLAYLIST := 505

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_DISPLAYASICON := 506

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_ICONDISPLAY := 507

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_CHANGEICON := 508

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_RESULTIMAGE := 509

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PS_RESULTTEXT := 510

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_GROUP := 120

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_CURRENT := 121

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_CURRENTICON := 122

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_DEFAULT := 123

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_DEFAULTICON := 124

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_FROMFILE := 125

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_FROMFILEEDIT := 126

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_ICONLIST := 127

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_LABEL := 128

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_LABELEDIT := 129

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_BROWSE := 130

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CI_ICONDISPLAY := 131

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_OBJECTTYPE := 150

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_DISPLAYASICON := 152

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_CHANGEICON := 153

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_ACTIVATELIST := 154

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_CONVERTTO := 155

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_ACTIVATEAS := 156

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_RESULTTEXT := 157

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_CONVERTLIST := 158

/**
 * @type {Integer (UInt32)}
 */
export global IDC_CV_ICONDISPLAY := 165

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_CHANGESOURCE := 201

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_AUTOMATIC := 202

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_CANCELLINK := 209

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_UPDATENOW := 210

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_OPENSOURCE := 211

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_MANUAL := 212

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_LINKSOURCE := 216

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_LINKTYPE := 217

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_LINKSLISTBOX := 206

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_COL1 := 220

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_COL2 := 221

/**
 * @type {Integer (UInt32)}
 */
export global IDC_EL_COL3 := 222

/**
 * @type {Integer (UInt32)}
 */
export global IDC_BZ_RETRY := 600

/**
 * @type {Integer (UInt32)}
 */
export global IDC_BZ_ICON := 601

/**
 * @type {Integer (UInt32)}
 */
export global IDC_BZ_MESSAGE1 := 602

/**
 * @type {Integer (UInt32)}
 */
export global IDC_BZ_SWITCHTO := 604

/**
 * @type {Integer (UInt32)}
 */
export global IDC_UL_METER := 1029

/**
 * @type {Integer (UInt32)}
 */
export global IDC_UL_STOP := 1030

/**
 * @type {Integer (UInt32)}
 */
export global IDC_UL_PERCENT := 1031

/**
 * @type {Integer (UInt32)}
 */
export global IDC_UL_PROGRESS := 1032

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PU_LINKS := 900

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PU_TEXT := 901

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PU_CONVERT := 902

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PU_ICON := 908

/**
 * @type {Integer (UInt32)}
 */
export global IDC_GP_OBJECTNAME := 1009

/**
 * @type {Integer (UInt32)}
 */
export global IDC_GP_OBJECTTYPE := 1010

/**
 * @type {Integer (UInt32)}
 */
export global IDC_GP_OBJECTSIZE := 1011

/**
 * @type {Integer (UInt32)}
 */
export global IDC_GP_CONVERT := 1013

/**
 * @type {Integer (UInt32)}
 */
export global IDC_GP_OBJECTICON := 1014

/**
 * @type {Integer (UInt32)}
 */
export global IDC_GP_OBJECTLOCATION := 1022

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_PERCENT := 1000

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_CHANGEICON := 1001

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_EDITABLE := 1002

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_ASICON := 1003

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_RELATIVE := 1005

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_SPIN := 1006

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_SCALETXT := 1034

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_ICONDISPLAY := 1021

/**
 * @type {Integer (UInt32)}
 */
export global IDC_VP_RESULTIMAGE := 1033

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_OPENSOURCE := 1006

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_UPDATENOW := 1007

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_BREAKLINK := 1008

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_LINKSOURCE := 1012

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_CHANGESOURCE := 1015

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_AUTOMATIC := 1016

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_MANUAL := 1017

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_DATE := 1018

/**
 * @type {Integer (UInt32)}
 */
export global IDC_LP_TIME := 1019

/**
 * @type {Integer (UInt32)}
 */
export global IDD_INSERTOBJECT := 1000

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CHANGEICON := 1001

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CONVERT := 1002

/**
 * @type {Integer (UInt32)}
 */
export global IDD_PASTESPECIAL := 1003

/**
 * @type {Integer (UInt32)}
 */
export global IDD_EDITLINKS := 1004

/**
 * @type {Integer (UInt32)}
 */
export global IDD_BUSY := 1006

/**
 * @type {Integer (UInt32)}
 */
export global IDD_UPDATELINKS := 1007

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CHANGESOURCE := 1009

/**
 * @type {Integer (UInt32)}
 */
export global IDD_INSERTFILEBROWSE := 1010

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CHANGEICONBROWSE := 1011

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CONVERTONLY := 1012

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CHANGESOURCE4 := 1013

/**
 * @type {Integer (UInt32)}
 */
export global IDD_GNRLPROPS := 1100

/**
 * @type {Integer (UInt32)}
 */
export global IDD_VIEWPROPS := 1101

/**
 * @type {Integer (UInt32)}
 */
export global IDD_LINKPROPS := 1102

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CONVERT4 := 1103

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CONVERTONLY4 := 1104

/**
 * @type {Integer (UInt32)}
 */
export global IDD_EDITLINKS4 := 1105

/**
 * @type {Integer (UInt32)}
 */
export global IDD_GNRLPROPS4 := 1106

/**
 * @type {Integer (UInt32)}
 */
export global IDD_LINKPROPS4 := 1107

/**
 * @type {Integer (UInt32)}
 */
export global IDD_PASTESPECIAL4 := 1108

/**
 * @type {Integer (UInt32)}
 */
export global IDD_CANNOTUPDATELINK := 1008

/**
 * @type {Integer (UInt32)}
 */
export global IDD_LINKSOURCEUNAVAILABLE := 1020

/**
 * @type {Integer (UInt32)}
 */
export global IDD_SERVERNOTFOUND := 1023

/**
 * @type {Integer (UInt32)}
 */
export global IDD_OUTOFMEMORY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IDD_SERVERNOTREGW := 1021

/**
 * @type {Integer (UInt32)}
 */
export global IDD_LINKTYPECHANGEDW := 1022

/**
 * @type {Integer (UInt32)}
 */
export global IDD_SERVERNOTREGA := 1025

/**
 * @type {Integer (UInt32)}
 */
export global IDD_LINKTYPECHANGEDA := 1026

/**
 * @type {Integer (UInt32)}
 */
export global IDD_SERVERNOTREG := 1021

/**
 * @type {Integer (UInt32)}
 */
export global IDD_LINKTYPECHANGED := 1022

/**
 * @type {String}
 */
export global OLESTDDELIM := "\"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_HELP := "OLEUI_MSG_HELP"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_ENDDIALOG := "OLEUI_MSG_ENDDIALOG"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_BROWSE := "OLEUI_MSG_BROWSE"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_CHANGEICON := "OLEUI_MSG_CHANGEICON"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_CLOSEBUSYDIALOG := "OLEUI_MSG_CLOSEBUSYDIALOG"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_CONVERT := "OLEUI_MSG_CONVERT"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_CHANGESOURCE := "OLEUI_MSG_CHANGESOURCE"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_ADDCONTROL := "OLEUI_MSG_ADDCONTROL"

/**
 * @type {String}
 */
export global SZOLEUI_MSG_BROWSE_OFN := "OLEUI_MSG_BROWSE_OFN"

/**
 * @type {Integer (UInt32)}
 */
export global ID_BROWSE_CHANGEICON := 1

/**
 * @type {Integer (UInt32)}
 */
export global ID_BROWSE_INSERTFILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ID_BROWSE_ADDCONTROL := 3

/**
 * @type {Integer (UInt32)}
 */
export global ID_BROWSE_CHANGESOURCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_FALSE := 0

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OK := 1

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CANCEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_STANDARDMIN := 100

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_OLEMEMALLOC := 100

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_STRUCTURENULL := 101

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_STRUCTUREINVALID := 102

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_CBSTRUCTINCORRECT := 103

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_HWNDOWNERINVALID := 104

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_LPSZCAPTIONINVALID := 105

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_LPFNHOOKINVALID := 106

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_HINSTANCEINVALID := 107

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_LPSZTEMPLATEINVALID := 108

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_HRESOURCEINVALID := 109

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_FINDTEMPLATEFAILURE := 110

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_LOADTEMPLATEFAILURE := 111

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_DIALOGFAILURE := 112

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_LOCALMEMALLOC := 113

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_GLOBALMEMALLOC := 114

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_LOADSTRING := 115

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ERR_STANDARDMAX := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_LPSZFILEINVALID := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_LPSZLABELINVALID := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_HICONINVALID := 118

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_LPFORMATETCINVALID := 119

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_PPVOBJINVALID := 120

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_LPIOLECLIENTSITEINVALID := 121

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_LPISTORAGEINVALID := 122

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_SCODEHASERROR := 123

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_LPCLSIDEXCLUDEINVALID := 124

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_CCHFILEINVALID := 125

/**
 * @type {Integer (UInt32)}
 */
export global PS_MAXLINKTYPES := 8

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_SRCDATAOBJECTINVALID := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_ARRPASTEENTRIESINVALID := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_IOERR_ARRLINKTYPESINVALID := 118

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_PSERR_CLIPBOARDCHANGED := 119

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_PSERR_GETCLIPBOARDFAILED := 120

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ELERR_LINKCNTRNULL := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_ELERR_LINKCNTRINVALID := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CIERR_MUSTHAVECLSID := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CIERR_MUSTHAVECURRENTMETAFILE := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CIERR_SZICONEXEINVALID := 118

/**
 * @type {String}
 */
export global PROP_HWND_CHGICONDLG := "HWND_CIDLG"

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CTERR_CLASSIDINVALID := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CTERR_DVASPECTINVALID := 118

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CTERR_CBFORMATINVALID := 119

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CTERR_HMETAPICTINVALID := 120

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CTERR_STRINGINVALID := 121

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_BZERR_HTASKINVALID := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_BZ_SWITCHTOSELECTED := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_BZ_RETRYSELECTED := 118

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_BZ_CALLUNBLOCKED := 119

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_LINKCNTRNULL := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_LINKCNTRINVALID := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_FROMNOTNULL := 118

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_TONOTNULL := 119

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_SOURCENULL := 120

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_SOURCEINVALID := 121

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_SOURCEPARSERROR := 122

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_CSERR_SOURCEPARSEERROR := 122

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_SUBPROPNULL := 116

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_SUBPROPINVALID := 117

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_PROPSHEETNULL := 118

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_PROPSHEETINVALID := 119

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_SUPPROP := 120

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_PROPSINVALID := 121

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_PAGESINCORRECT := 122

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_INVALIDPAGES := 123

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_NOTSUPPORTED := 124

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_DLGPROCNOTNULL := 125

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_LPARAMNOTZERO := 126

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_GPERR_STRINGINVALID := 127

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_GPERR_CLASSIDINVALID := 128

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_GPERR_LPCLSIDEXCLUDEINVALID := 129

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_GPERR_CBFORMATINVALID := 130

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_VPERR_METAPICTINVALID := 131

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_VPERR_DVASPECTINVALID := 132

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_LPERR_LINKCNTRNULL := 133

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_LPERR_LINKCNTRINVALID := 134

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_PROPERTYSHEET := 135

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_OBJINFOINVALID := 136

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_OPERR_LINKINFOINVALID := 137

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_QUERY_GETCLASSID := 65280

/**
 * @type {Integer (UInt32)}
 */
export global OLEUI_QUERY_LINKBROKEN := 65281

/**
 * @type {Integer (Int32)}
 */
export global DISPID_UNKNOWN := -1

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_VALUE := 0

/**
 * @type {Integer (Int32)}
 */
export global DISPID_PROPERTYPUT := -3

/**
 * @type {Integer (Int32)}
 */
export global DISPID_NEWENUM := -4

/**
 * @type {Integer (Int32)}
 */
export global DISPID_EVALUATE := -5

/**
 * @type {Integer (Int32)}
 */
export global DISPID_CONSTRUCTOR := -6

/**
 * @type {Integer (Int32)}
 */
export global DISPID_DESTRUCTOR := -7

/**
 * @type {Integer (Int32)}
 */
export global DISPID_COLLECT := -8

/**
 * @type {Integer (UInt32)}
 */
export global STDOLE_MAJORVERNUM := 1

/**
 * @type {Integer (UInt32)}
 */
export global STDOLE_MINORVERNUM := 0

/**
 * @type {Integer (UInt32)}
 */
export global STDOLE_LCID := 0

/**
 * @type {Integer (UInt32)}
 */
export global STDOLE2_MAJORVERNUM := 2

/**
 * @type {Integer (UInt32)}
 */
export global STDOLE2_MINORVERNUM := 0

/**
 * @type {Integer (UInt32)}
 */
export global STDOLE2_LCID := 0

/**
 * @type {Integer (UInt32)}
 */
export global VAR_TIMEVALUEONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global VAR_DATEVALUEONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global VAR_VALIDDATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global VAR_CALENDAR_HIJRI := 8

/**
 * @type {Integer (UInt32)}
 */
export global VAR_LOCALBOOL := 16

/**
 * @type {Integer (UInt32)}
 */
export global VAR_FORMAT_NOSUBSTITUTE := 32

/**
 * @type {Integer (UInt32)}
 */
export global VAR_FOURDIGITYEARS := 64

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_USE_NLS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global VAR_CALENDAR_THAI := 128

/**
 * @type {Integer (UInt32)}
 */
export global VAR_CALENDAR_GREGORIAN := 256

/**
 * @type {Integer (UInt32)}
 */
export global VTDATEGRE_MAX := 2958465

/**
 * @type {Integer (Int32)}
 */
export global VTDATEGRE_MIN := -657434

/**
 * @type {Integer (Int32)}
 */
export global MEMBERID_NIL := -1

/**
 * @type {Integer (Int32)}
 */
export global ID_DEFAULTINST := -2

/**
 * @type {Integer (UInt32)}
 */
export global LOAD_TLB_AS_32BIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global LOAD_TLB_AS_64BIT := 64

/**
 * @type {Integer (Int32)}
 */
export global fdexNameCaseSensitive := 1

/**
 * @type {Integer (Int32)}
 */
export global fdexNameEnsure := 2

/**
 * @type {Integer (Int32)}
 */
export global fdexNameImplicit := 4

/**
 * @type {Integer (Int32)}
 */
export global fdexNameCaseInsensitive := 8

/**
 * @type {Integer (Int32)}
 */
export global fdexNameInternal := 16

/**
 * @type {Integer (Int32)}
 */
export global fdexNameNoDynamicProperties := 32

/**
 * @type {Integer (Int32)}
 */
export global fdexEnumDefault := 1

/**
 * @type {Integer (Int32)}
 */
export global fdexEnumAll := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPATCH_CONSTRUCT := 16384

/**
 * @type {Integer (Int32)}
 */
export global DISPID_STARTENUM := -1

/**
 * @type {Guid}
 */
export global SID_VariantConversion := Guid("{1f101481-bccd-11d0-9336-00a0c90dcaa9}")

/**
 * @type {Guid}
 */
export global SID_GetCaller := Guid("{4717cc40-bcb9-11d0-9336-00a0c90dcaa9}")

/**
 * @type {Guid}
 */
export global SID_ProvideRuntimeContext := Guid("{74a5040c-dd0c-48f0-ac85-194c3259180a}")
;@endregion Constants
