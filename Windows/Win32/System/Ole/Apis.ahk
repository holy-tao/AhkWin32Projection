#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRecordInfo.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\ITypeLib.ahk
#Include .\ICreateTypeLib.ahk
#Include .\ICreateTypeLib2.ahk
#Include ..\Com\ITypeInfo.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ICreateErrorInfo.ahk
#Include ..\Com\IDataObject.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IOleAdviseHolder.ahk
#Include ..\..\Foundation\HGLOBAL.ahk
#Include ..\Com\IEnumFORMATETC.ahk
#Include .\IEnumOLEVERB.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\..\UI\WindowsAndMessaging\HCURSOR.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class Ole {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static CTL_E_ILLEGALFUNCTIONCALL => -2146828283

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_E_FIRST => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static SELFREG_E_FIRST => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static PERPROP_E_FIRST => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDERR_E_FIRST => -2147221248

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDERR_E_DISABLED => -2147221247

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDERR_E_NOHELP => -2147221246

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDERR_E_CANCELED => -2147221245

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDERR_E_UNKNOWNGROUP => -2147221244

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_E_NOCONNECTION => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_E_ADVISELIMIT => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_E_CANNOTCONNECT => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_E_OVERRIDDEN => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static SELFREG_E_TYPELIB => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static SELFREG_E_CLASS => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static PERPROP_E_NOPAGEAVAILABLE => -2147220992

    /**
     * @type {Guid}
     */
    static CLSID_CFontPropPage => Guid("{0be35200-8f91-11ce-9de3-00aa004bb851}")

    /**
     * @type {Guid}
     */
    static CLSID_CColorPropPage => Guid("{0be35201-8f91-11ce-9de3-00aa004bb851}")

    /**
     * @type {Guid}
     */
    static CLSID_CPicturePropPage => Guid("{0be35202-8f91-11ce-9de3-00aa004bb851}")

    /**
     * @type {Guid}
     */
    static CLSID_PersistPropset => Guid("{fb8f0821-0164-101b-84ed-08002b2ec713}")

    /**
     * @type {Guid}
     */
    static CLSID_ConvertVBX => Guid("{fb8f0822-0164-101b-84ed-08002b2ec713}")

    /**
     * @type {Guid}
     */
    static CLSID_StdFont => Guid("{0be35203-8f91-11ce-9de3-00aa004bb851}")

    /**
     * @type {Guid}
     */
    static CLSID_StdPicture => Guid("{0be35204-8f91-11ce-9de3-00aa004bb851}")

    /**
     * @type {Guid}
     */
    static GUID_HIMETRIC => Guid("{66504300-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_COLOR => Guid("{66504301-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_XPOSPIXEL => Guid("{66504302-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_YPOSPIXEL => Guid("{66504303-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_XSIZEPIXEL => Guid("{66504304-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_YSIZEPIXEL => Guid("{66504305-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_XPOS => Guid("{66504306-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_YPOS => Guid("{66504307-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_XSIZE => Guid("{66504308-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_YSIZE => Guid("{66504309-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_TRISTATE => Guid("{6650430a-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_OPTIONVALUEEXCLUSIVE => Guid("{6650430b-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_CHECKVALUEEXCLUSIVE => Guid("{6650430c-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_FONTNAME => Guid("{6650430d-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_FONTSIZE => Guid("{6650430e-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_FONTBOLD => Guid("{6650430f-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_FONTITALIC => Guid("{66504310-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_FONTUNDERSCORE => Guid("{66504311-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_FONTSTRIKETHROUGH => Guid("{66504312-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Guid}
     */
    static GUID_HANDLE => Guid("{66504313-be0f-101a-8bbb-00aa00300cab}")

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_E_LAST => -2147220977

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_S_FIRST => 262656

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_S_LAST => 262671

    /**
     * @type {Integer (Int32)}
     */
    static SELFREG_E_LAST => -2147220977

    /**
     * @type {Integer (Int32)}
     */
    static SELFREG_S_FIRST => 262656

    /**
     * @type {Integer (Int32)}
     */
    static SELFREG_S_LAST => 262671

    /**
     * @type {Integer (Int32)}
     */
    static PERPROP_E_LAST => -2147220977

    /**
     * @type {Integer (Int32)}
     */
    static PERPROP_S_FIRST => 262656

    /**
     * @type {Integer (Int32)}
     */
    static PERPROP_S_LAST => 262671

    /**
     * @type {Integer (Int32)}
     */
    static OLEIVERB_PROPERTIES => -7

    /**
     * @type {Integer (UInt32)}
     */
    static VT_STREAMED_PROPSET => 73

    /**
     * @type {Integer (UInt32)}
     */
    static VT_STORED_PROPSET => 74

    /**
     * @type {Integer (UInt32)}
     */
    static VT_BLOB_PROPSET => 75

    /**
     * @type {Integer (UInt32)}
     */
    static VT_VERBOSE_ENUM => 76

    /**
     * @type {Integer (UInt32)}
     */
    static OCM__BASE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AUTOSIZE => -500

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_BACKCOLOR => -501

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_BACKSTYLE => -502

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_BORDERCOLOR => -503

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_BORDERSTYLE => -504

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_BORDERWIDTH => -505

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DRAWMODE => -507

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DRAWSTYLE => -508

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DRAWWIDTH => -509

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_FILLCOLOR => -510

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_FILLSTYLE => -511

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_FONT => -512

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_FORECOLOR => -513

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ENABLED => -514

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_HWND => -515

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_TABSTOP => -516

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_TEXT => -517

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_CAPTION => -518

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_BORDERVISIBLE => -519

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_APPEARANCE => -520

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MOUSEPOINTER => -521

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MOUSEICON => -522

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_PICTURE => -523

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_VALID => -524

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_READYSTATE => -525

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_LISTINDEX => -526

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SELECTED => -527

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_LIST => -528

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_COLUMN => -529

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_LISTCOUNT => -531

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MULTISELECT => -532

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MAXLENGTH => -533

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_PASSWORDCHAR => -534

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SCROLLBARS => -535

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_WORDWRAP => -536

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MULTILINE => -537

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_NUMBEROFROWS => -538

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_NUMBEROFCOLUMNS => -539

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DISPLAYSTYLE => -540

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_GROUPNAME => -541

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IMEMODE => -542

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ACCELERATOR => -543

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ENTERKEYBEHAVIOR => -544

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_TABKEYBEHAVIOR => -545

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SELTEXT => -546

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SELSTART => -547

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SELLENGTH => -548

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_REFRESH => -550

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DOCLICK => -551

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ABOUTBOX => -552

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ADDITEM => -553

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_CLEAR => -554

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_REMOVEITEM => -555

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_CLICK => -600

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DBLCLICK => -601

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_KEYDOWN => -602

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_KEYPRESS => -603

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_KEYUP => -604

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MOUSEDOWN => -605

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MOUSEMOVE => -606

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MOUSEUP => -607

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ERROREVENT => -608

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_READYSTATECHANGE => -609

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_CLICK_VALUE => -610

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RIGHTTOLEFT => -611

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_TOPTOBOTTOM => -612

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_THIS => -613

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_BACKCOLOR => -701

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_DISPLAYNAME => -702

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_FONT => -703

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_FORECOLOR => -704

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_LOCALEID => -705

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_MESSAGEREFLECT => -706

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_SCALEUNITS => -707

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_TEXTALIGN => -708

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_USERMODE => -709

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_UIDEAD => -710

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_SHOWGRABHANDLES => -711

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_SHOWHATCHING => -712

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_DISPLAYASDEFAULT => -713

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_SUPPORTSMNEMONICS => -714

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_AUTOCLIP => -715

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_APPEARANCE => -716

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_CODEPAGE => -725

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_PALETTE => -726

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_CHARSET => -727

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_TRANSFERPRIORITY => -728

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_RIGHTTOLEFT => -732

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_AMBIENT_TOPTOBOTTOM => -733

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_Name => -800

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_Delete => -801

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_Object => -802

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_Parent => -803

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_NAME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_SIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_BOLD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_ITALIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_UNDER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_STRIKE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_WEIGHT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_CHARSET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_FONT_CHANGED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PICT_HANDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PICT_HPAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PICT_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PICT_WIDTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PICT_HEIGHT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PICT_RENDER => 6

    /**
     * @type {String}
     */
    static STDOLE_TLB => "stdole2.tlb"

    /**
     * @type {String}
     */
    static STDTYPE_TLB => "stdole2.tlb"

    /**
     * @type {Integer (Int32)}
     */
    static GC_WCH_SIBLING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIFLAGS_EXTENDDISPATCHONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLECMDERR_E_NOTSUPPORTED => -2147221248

    /**
     * @type {Integer (Int32)}
     */
    static MSOCMDERR_E_FIRST => -2147221248

    /**
     * @type {Integer (Int32)}
     */
    static MSOCMDERR_E_NOTSUPPORTED => -2147221248

    /**
     * @type {Integer (Int32)}
     */
    static MSOCMDERR_E_DISABLED => -2147221247

    /**
     * @type {Integer (Int32)}
     */
    static MSOCMDERR_E_NOHELP => -2147221246

    /**
     * @type {Integer (Int32)}
     */
    static MSOCMDERR_E_CANCELED => -2147221245

    /**
     * @type {Integer (Int32)}
     */
    static MSOCMDERR_E_UNKNOWNGROUP => -2147221244

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMD_TASKDLGID_ONBEFOREUNLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_SHOWPAGEACTIONMENU_HWND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_SHOWPAGEACTIONMENU_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_SHOWPAGEACTIONMENU_Y => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_ACTIVEXINSTALL_PUBLISHER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_ACTIVEXINSTALL_DISPLAYNAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_ACTIVEXINSTALL_CLSID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_ACTIVEXINSTALL_INSTALLSCOPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OLECMDARGINDEX_ACTIVEXINSTALL_SOURCEURL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALL_SCOPE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALL_SCOPE_MACHINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALL_SCOPE_USER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MK_ALT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DD_DEFSCROLLINSET => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DD_DEFSCROLLDELAY => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DD_DEFSCROLLINTERVAL => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DD_DEFDRAGDELAY => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DD_DEFDRAGMINDIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static OT_LINK => 1

    /**
     * @type {Integer (Int32)}
     */
    static OT_EMBEDDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static OT_STATIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OLEVERB_PRIMARY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OF_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OF_GET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OF_HANDLER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32 => 100

    /**
     * @type {Integer (Int32)}
     */
    static OLESTREAM_CONVERSION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static OLESTREAM_CONVERSION_DISABLEOLELINK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_OLEUIHELP => 99

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_CREATENEW => 2100

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_CREATEFROMFILE => 2101

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_LINKFILE => 2102

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_OBJECTTYPELIST => 2103

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_DISPLAYASICON => 2104

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_CHANGEICON => 2105

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_FILE => 2106

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_FILEDISPLAY => 2107

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_RESULTIMAGE => 2108

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_RESULTTEXT => 2109

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_ICONDISPLAY => 2110

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_OBJECTTYPETEXT => 2111

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_FILETEXT => 2112

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_FILETYPE => 2113

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_INSERTCONTROL => 2114

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_ADDCONTROL => 2115

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_IO_CONTROLTYPELIST => 2116

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_PASTE => 500

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_PASTELINK => 501

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_SOURCETEXT => 502

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_PASTELIST => 503

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_PASTELINKLIST => 504

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_DISPLAYLIST => 505

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_DISPLAYASICON => 506

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_ICONDISPLAY => 507

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_CHANGEICON => 508

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_RESULTIMAGE => 509

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PS_RESULTTEXT => 510

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_GROUP => 120

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_CURRENT => 121

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_CURRENTICON => 122

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_DEFAULT => 123

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_DEFAULTICON => 124

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_FROMFILE => 125

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_FROMFILEEDIT => 126

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_ICONLIST => 127

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_LABEL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_LABELEDIT => 129

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_BROWSE => 130

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CI_ICONDISPLAY => 131

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_OBJECTTYPE => 150

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_DISPLAYASICON => 152

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_CHANGEICON => 153

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_ACTIVATELIST => 154

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_CONVERTTO => 155

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_ACTIVATEAS => 156

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_RESULTTEXT => 157

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_CONVERTLIST => 158

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_CV_ICONDISPLAY => 165

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_CHANGESOURCE => 201

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_AUTOMATIC => 202

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_CANCELLINK => 209

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_UPDATENOW => 210

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_OPENSOURCE => 211

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_MANUAL => 212

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_LINKSOURCE => 216

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_LINKTYPE => 217

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_LINKSLISTBOX => 206

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_COL1 => 220

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_COL2 => 221

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_EL_COL3 => 222

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_BZ_RETRY => 600

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_BZ_ICON => 601

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_BZ_MESSAGE1 => 602

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_BZ_SWITCHTO => 604

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_UL_METER => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_UL_STOP => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_UL_PERCENT => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_UL_PROGRESS => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PU_LINKS => 900

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PU_TEXT => 901

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PU_CONVERT => 902

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_PU_ICON => 908

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_GP_OBJECTNAME => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_GP_OBJECTTYPE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_GP_OBJECTSIZE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_GP_CONVERT => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_GP_OBJECTICON => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_GP_OBJECTLOCATION => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_PERCENT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_CHANGEICON => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_EDITABLE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_ASICON => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_RELATIVE => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_SPIN => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_SCALETXT => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_ICONDISPLAY => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_VP_RESULTIMAGE => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_OPENSOURCE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_UPDATENOW => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_BREAKLINK => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_LINKSOURCE => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_CHANGESOURCE => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_AUTOMATIC => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_MANUAL => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_DATE => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static IDC_LP_TIME => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_INSERTOBJECT => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CHANGEICON => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CONVERT => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_PASTESPECIAL => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_EDITLINKS => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_BUSY => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_UPDATELINKS => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CHANGESOURCE => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_INSERTFILEBROWSE => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CHANGEICONBROWSE => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CONVERTONLY => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CHANGESOURCE4 => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_GNRLPROPS => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_VIEWPROPS => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_LINKPROPS => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CONVERT4 => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CONVERTONLY4 => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_EDITLINKS4 => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_GNRLPROPS4 => 1106

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_LINKPROPS4 => 1107

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_PASTESPECIAL4 => 1108

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_CANNOTUPDATELINK => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_LINKSOURCEUNAVAILABLE => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_SERVERNOTFOUND => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_OUTOFMEMORY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_SERVERNOTREGW => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_LINKTYPECHANGEDW => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_SERVERNOTREGA => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_LINKTYPECHANGEDA => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_SERVERNOTREG => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static IDD_LINKTYPECHANGED => 1022

    /**
     * @type {String}
     */
    static OLESTDDELIM => "\"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_HELP => "OLEUI_MSG_HELP"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_ENDDIALOG => "OLEUI_MSG_ENDDIALOG"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_BROWSE => "OLEUI_MSG_BROWSE"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_CHANGEICON => "OLEUI_MSG_CHANGEICON"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_CLOSEBUSYDIALOG => "OLEUI_MSG_CLOSEBUSYDIALOG"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_CONVERT => "OLEUI_MSG_CONVERT"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_CHANGESOURCE => "OLEUI_MSG_CHANGESOURCE"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_ADDCONTROL => "OLEUI_MSG_ADDCONTROL"

    /**
     * @type {String}
     */
    static SZOLEUI_MSG_BROWSE_OFN => "OLEUI_MSG_BROWSE_OFN"

    /**
     * @type {Integer (UInt32)}
     */
    static ID_BROWSE_CHANGEICON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ID_BROWSE_INSERTFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ID_BROWSE_ADDCONTROL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ID_BROWSE_CHANGESOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CANCEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_STANDARDMIN => 100

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_OLEMEMALLOC => 100

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_STRUCTURENULL => 101

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_STRUCTUREINVALID => 102

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_CBSTRUCTINCORRECT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_HWNDOWNERINVALID => 104

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_LPSZCAPTIONINVALID => 105

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_LPFNHOOKINVALID => 106

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_HINSTANCEINVALID => 107

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_LPSZTEMPLATEINVALID => 108

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_HRESOURCEINVALID => 109

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_FINDTEMPLATEFAILURE => 110

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_LOADTEMPLATEFAILURE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_DIALOGFAILURE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_LOCALMEMALLOC => 113

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_GLOBALMEMALLOC => 114

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_LOADSTRING => 115

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ERR_STANDARDMAX => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_LPSZFILEINVALID => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_LPSZLABELINVALID => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_HICONINVALID => 118

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_LPFORMATETCINVALID => 119

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_PPVOBJINVALID => 120

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_LPIOLECLIENTSITEINVALID => 121

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_LPISTORAGEINVALID => 122

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_SCODEHASERROR => 123

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_LPCLSIDEXCLUDEINVALID => 124

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_CCHFILEINVALID => 125

    /**
     * @type {Integer (UInt32)}
     */
    static PS_MAXLINKTYPES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_SRCDATAOBJECTINVALID => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_ARRPASTEENTRIESINVALID => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_IOERR_ARRLINKTYPESINVALID => 118

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_PSERR_CLIPBOARDCHANGED => 119

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_PSERR_GETCLIPBOARDFAILED => 120

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ELERR_LINKCNTRNULL => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_ELERR_LINKCNTRINVALID => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CIERR_MUSTHAVECLSID => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CIERR_MUSTHAVECURRENTMETAFILE => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CIERR_SZICONEXEINVALID => 118

    /**
     * @type {String}
     */
    static PROP_HWND_CHGICONDLG => "HWND_CIDLG"

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CTERR_CLASSIDINVALID => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CTERR_DVASPECTINVALID => 118

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CTERR_CBFORMATINVALID => 119

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CTERR_HMETAPICTINVALID => 120

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CTERR_STRINGINVALID => 121

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_BZERR_HTASKINVALID => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_BZ_SWITCHTOSELECTED => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_BZ_RETRYSELECTED => 118

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_BZ_CALLUNBLOCKED => 119

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_LINKCNTRNULL => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_LINKCNTRINVALID => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_FROMNOTNULL => 118

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_TONOTNULL => 119

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_SOURCENULL => 120

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_SOURCEINVALID => 121

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_SOURCEPARSERROR => 122

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_CSERR_SOURCEPARSEERROR => 122

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_SUBPROPNULL => 116

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_SUBPROPINVALID => 117

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_PROPSHEETNULL => 118

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_PROPSHEETINVALID => 119

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_SUPPROP => 120

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_PROPSINVALID => 121

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_PAGESINCORRECT => 122

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_INVALIDPAGES => 123

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_NOTSUPPORTED => 124

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_DLGPROCNOTNULL => 125

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_LPARAMNOTZERO => 126

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_GPERR_STRINGINVALID => 127

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_GPERR_CLASSIDINVALID => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_GPERR_LPCLSIDEXCLUDEINVALID => 129

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_GPERR_CBFORMATINVALID => 130

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_VPERR_METAPICTINVALID => 131

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_VPERR_DVASPECTINVALID => 132

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_LPERR_LINKCNTRNULL => 133

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_LPERR_LINKCNTRINVALID => 134

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_PROPERTYSHEET => 135

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_OBJINFOINVALID => 136

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_OPERR_LINKINFOINVALID => 137

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_QUERY_GETCLASSID => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static OLEUI_QUERY_LINKBROKEN => 65281

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_UNKNOWN => -1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_VALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_PROPERTYPUT => -3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_NEWENUM => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_EVALUATE => -5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_CONSTRUCTOR => -6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_DESTRUCTOR => -7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_COLLECT => -8

    /**
     * @type {Integer (UInt32)}
     */
    static STDOLE_MAJORVERNUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STDOLE_MINORVERNUM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STDOLE_LCID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STDOLE2_MAJORVERNUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STDOLE2_MINORVERNUM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STDOLE2_LCID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_TIMEVALUEONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_DATEVALUEONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_VALIDDATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_CALENDAR_HIJRI => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_LOCALBOOL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_FORMAT_NOSUBSTITUTE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_FOURDIGITYEARS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALE_USE_NLS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_CALENDAR_THAI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static VAR_CALENDAR_GREGORIAN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static VTDATEGRE_MAX => 2958465

    /**
     * @type {Integer (Int32)}
     */
    static VTDATEGRE_MIN => -657434

    /**
     * @type {Integer (Int32)}
     */
    static MEMBERID_NIL => -1

    /**
     * @type {Integer (Int32)}
     */
    static ID_DEFAULTINST => -2

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_TLB_AS_32BIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_TLB_AS_64BIT => 64

    /**
     * @type {Integer (Int32)}
     */
    static fdexNameCaseSensitive => 1

    /**
     * @type {Integer (Int32)}
     */
    static fdexNameEnsure => 2

    /**
     * @type {Integer (Int32)}
     */
    static fdexNameImplicit => 4

    /**
     * @type {Integer (Int32)}
     */
    static fdexNameCaseInsensitive => 8

    /**
     * @type {Integer (Int32)}
     */
    static fdexNameInternal => 16

    /**
     * @type {Integer (Int32)}
     */
    static fdexNameNoDynamicProperties => 32

    /**
     * @type {Integer (Int32)}
     */
    static fdexEnumDefault => 1

    /**
     * @type {Integer (Int32)}
     */
    static fdexEnumAll => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPATCH_CONSTRUCT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_STARTENUM => -1

    /**
     * @type {Guid}
     */
    static SID_VariantConversion => Guid("{1f101481-bccd-11d0-9336-00a0c90dcaa9}")

    /**
     * @type {Guid}
     */
    static SID_GetCaller => Guid("{4717cc40-bcb9-11d0-9336-00a0c90dcaa9}")

    /**
     * @type {Guid}
     */
    static SID_ProvideRuntimeContext => Guid("{74a5040c-dd0c-48f0-ac85-194c3259180a}")
;@endregion Constants

;@region Methods
    /**
     * Allocates memory for a safe array descriptor.
     * @param {Integer} cDims The number of dimensions of the array.
     * @returns {Pointer<SAFEARRAY>} The safe array descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayallocdescriptor
     */
    static SafeArrayAllocDescriptor(cDims) {
        result := DllCall("OLEAUT32.dll\SafeArrayAllocDescriptor", "uint", cDims, "ptr*", &ppsaOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppsaOut
    }

    /**
     * Creates a safe array descriptor for an array of any valid variant type, including VT_RECORD, without allocating the array data.
     * @param {Integer} vt The variant type.
     * @param {Integer} cDims The number of dimensions in the array.
     * @returns {Pointer<SAFEARRAY>} The safe array descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayallocdescriptorex
     */
    static SafeArrayAllocDescriptorEx(vt, cDims) {
        result := DllCall("OLEAUT32.dll\SafeArrayAllocDescriptorEx", "ushort", vt, "uint", cDims, "ptr*", &ppsaOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppsaOut
    }

    /**
     * Allocates memory for a safe array, based on a descriptor created with SafeArrayAllocDescriptor.
     * @param {Pointer<SAFEARRAY>} psa A safe array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearrayallocdescriptor">SafeArrayAllocDescriptor</a>.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayallocdata
     */
    static SafeArrayAllocData(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayAllocData", "ptr", psa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new array descriptor, allocates and initializes the data for the array, and returns a pointer to the new array descriptor.
     * @param {Integer} vt The base type of the array (the VARTYPE of each element of the array). The VARTYPE is restricted to a subset of the variant types. Neither the VT_ARRAY nor the VT_BYREF flag can be set. VT_EMPTY and VT_NULL are not valid base types for the array. All other types are legal.
     * @param {Integer} cDims The number of dimensions in the array. The number cannot be changed after the array is created.
     * @param {Pointer<SAFEARRAYBOUND>} rgsabound A vector of bounds (one for each dimension) to allocate for the array.
     * @returns {Pointer<SAFEARRAY>} A safe array descriptor, or null if the array could not be created.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraycreate
     */
    static SafeArrayCreate(vt, cDims, rgsabound) {
        result := DllCall("OLEAUT32.dll\SafeArrayCreate", "ushort", vt, "uint", cDims, "ptr", rgsabound, "ptr")
        return result
    }

    /**
     * Creates and returns a safe array descriptor from the specified VARTYPE, number of dimensions and bounds.
     * @param {Integer} vt The base type or the VARTYPE of each element of the array. The FADF_RECORD flag can be set for a variant type VT_RECORD, The FADF_HAVEIID flag can be set for VT_DISPATCH or VT_UNKNOWN, and FADF_HAVEVARTYPE can be set for all other VARTYPEs.
     * @param {Integer} cDims The number of dimensions in the array.
     * @param {Pointer<SAFEARRAYBOUND>} rgsabound A vector of bounds (one for each dimension) to allocate for the array.
     * @param {Pointer<Void>} pvExtra the type information of the user-defined type, if you are creating a safe array of user-defined types. If the vt parameter is VT_RECORD, then <i>pvExtra</i> will be a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-irecordinfo">IRecordInfo</a> describing the record. If the <i>vt</i> parameter is VT_DISPATCH or VT_UNKNOWN, then <i>pvExtra</i> will contain a pointer to a GUID representing the type of interface being passed to the array.
     * @returns {Pointer<SAFEARRAY>} A safe array descriptor, or null if the array could not be created.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraycreateex
     */
    static SafeArrayCreateEx(vt, cDims, rgsabound, pvExtra) {
        pvExtraMarshal := pvExtra is VarRef ? "ptr" : "ptr"

        result := DllCall("OLEAUT32.dll\SafeArrayCreateEx", "ushort", vt, "uint", cDims, "ptr", rgsabound, pvExtraMarshal, pvExtra, "ptr")
        return result
    }

    /**
     * Copies the source array to the specified target array after releasing any resources in the target array.
     * @param {Pointer<SAFEARRAY>} psaSource The safe array to copy.
     * @param {Pointer<SAFEARRAY>} psaTarget The target safe array.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraycopydata
     */
    static SafeArrayCopyData(psaSource, psaTarget) {
        result := DllCall("OLEAUT32.dll\SafeArrayCopyData", "ptr", psaSource, "ptr", psaTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decreases the pinning reference count for the descriptor of the specified safe array by one. When that count reaches 0, the memory for that descriptor is no longer prevented from being freed.
     * @remarks
     * 
     * A call to the <b>SafeArrayReleaseDescriptor</b> function should match every previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearrayaddref">SafeArrayAddRef</a> function.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} psa The safe array for which the pinning reference count of the descriptor should decrease.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayreleasedescriptor
     * @since windows5.1.2600
     */
    static SafeArrayReleaseDescriptor(psa) {
        DllCall("OLEAUT32.dll\SafeArrayReleaseDescriptor", "ptr", psa)
    }

    /**
     * Destroys the descriptor of the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa A safe array descriptor.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraydestroydescriptor
     */
    static SafeArrayDestroyDescriptor(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayDestroyDescriptor", "ptr", psa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decreases the pinning reference count for the specified safe array data by one. When that count reaches 0, the memory for that data is no longer prevented from being freed.
     * @remarks
     * 
     * A call to the <b>SafeArrayReleaseData</b> function should match every previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearrayaddref">SafeArrayAddRef</a> function that returned a non-null value in the <i>ppDataToRelease</i> parameter.
     * 
     * 
     * @param {Pointer<Void>} pData The safe array data for which the pinning reference count should decrease.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayreleasedata
     * @since windows5.1.2600
     */
    static SafeArrayReleaseData(pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        DllCall("OLEAUT32.dll\SafeArrayReleaseData", pDataMarshal, pData)
    }

    /**
     * Destroys all the data in the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa A safe array descriptor.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraydestroydata
     */
    static SafeArrayDestroyData(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayDestroyData", "ptr", psa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Increases the pinning reference count of the descriptor for the specified safe array by one, and may increase the pinning reference count of the data for the specified safe array by one if that data was dynamically allocated, as determined by the descriptor of the safe array.
     * @param {Pointer<SAFEARRAY>} psa The safe array for which the pinning reference count of the descriptor should increase. While that count remains greater than 0, the memory for the descriptor is prevented from being freed by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraydestroydescriptor">SafeArrayDestroyDescriptor</a> functions.
     * @returns {Pointer<Void>} Returns the safe array data for which a pinning reference was added, if <b>SafeArrayAddRef</b> also added  a pinning reference for the  safe array data.  This parameter is NULL if <b>SafeArrayAddRef</b> did not add a pinning reference for the safe array data. <b>SafeArrayAddRef</b> does not add a pinning reference for the safe array data if that safe array data was not dynamically allocated.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayaddref
     * @since windows5.1.2600
     */
    static SafeArrayAddRef(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayAddRef", "ptr", psa, "ptr*", &ppDataToRelease := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppDataToRelease
    }

    /**
     * Destroys an existing array descriptor and all of the data in the array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraydestroy
     */
    static SafeArrayDestroy(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayDestroy", "ptr", psa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Changes the right-most (least significant) bound of the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa A safe array descriptor.
     * @param {Pointer<SAFEARRAYBOUND>} psaboundNew A new safe array bound structure that contains the new array boundary. You can change only the least significant dimension of an array.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_ARRAYISLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayredim
     */
    static SafeArrayRedim(psa, psaboundNew) {
        result := DllCall("OLEAUT32.dll\SafeArrayRedim", "ptr", psa, "ptr", psaboundNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the number of dimensions in the array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {Integer} The number of dimensions in the array.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetdim
     */
    static SafeArrayGetDim(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayGetDim", "ptr", psa, "uint")
        return result
    }

    /**
     * Gets the size of an element.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {Integer} The size of an element in a safe array, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetelemsize
     */
    static SafeArrayGetElemsize(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayGetElemsize", "ptr", psa, "uint")
        return result
    }

    /**
     * Gets the upper bound for any dimension of the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @param {Integer} nDim The array dimension for which to get the upper bound.
     * @returns {Integer} The upper bound.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetubound
     */
    static SafeArrayGetUBound(psa, nDim) {
        result := DllCall("OLEAUT32.dll\SafeArrayGetUBound", "ptr", psa, "uint", nDim, "int*", &plUbound := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plUbound
    }

    /**
     * Gets the lower bound for any dimension of the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @param {Integer} nDim The array dimension for which to get the lower bound.
     * @returns {Integer} The lower bound.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetlbound
     */
    static SafeArrayGetLBound(psa, nDim) {
        result := DllCall("OLEAUT32.dll\SafeArrayGetLBound", "ptr", psa, "uint", nDim, "int*", &plLbound := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plLbound
    }

    /**
     * Increments the lock count of an array, and places a pointer to the array data in pvData of the array descriptor.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraylock
     */
    static SafeArrayLock(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayLock", "ptr", psa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decrements the lock count of an array so it can be freed or resized.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be unlocked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayunlock
     */
    static SafeArrayUnlock(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayUnlock", "ptr", psa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Increments the lock count of an array, and retrieves a pointer to the array data.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {Pointer<Void>} The array data.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayaccessdata
     */
    static SafeArrayAccessData(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayAccessData", "ptr", psa, "ptr*", &ppvData := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvData
    }

    /**
     * Decrements the lock count of an array, and invalidates the pointer retrieved by SafeArrayAccessData.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array could not be unlocked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayunaccessdata
     */
    static SafeArrayUnaccessData(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayUnaccessData", "ptr", psa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a single element of the array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @param {Pointer<Integer>} rgIndices A vector of indexes for each dimension of the array. The right-most (least significant) dimension is rgIndices[0]. The left-most dimension is stored at <c>rgIndices[psa-&gt;cDims – 1]</c>.
     * @returns {Void} The element of the array.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetelement
     */
    static SafeArrayGetElement(psa, rgIndices) {
        rgIndicesMarshal := rgIndices is VarRef ? "int*" : "ptr"

        result := DllCall("OLEAUT32.dll\SafeArrayGetElement", "ptr", psa, rgIndicesMarshal, rgIndices, "ptr", &pv := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pv
    }

    /**
     * Stores the data element at the specified location in the array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @param {Pointer<Integer>} rgIndices A vector of indexes for each dimension of the array. The right-most (least significant) dimension is rgIndices[0]. The left-most dimension is stored at <c>rgIndices[psa-&gt;cDims – 1]</c>.
     * @param {Pointer<Void>} pv The data to assign to the array. The variant types VT_DISPATCH, VT_UNKNOWN, and VT_BSTR are pointers, and do not require another level of indirection.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified index is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated for the element.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayputelement
     */
    static SafeArrayPutElement(psa, rgIndices, pv) {
        rgIndicesMarshal := rgIndices is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall("OLEAUT32.dll\SafeArrayPutElement", "ptr", psa, rgIndicesMarshal, rgIndices, pvMarshal, pv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a copy of an existing safe array.
     * @param {Pointer<SAFEARRAY>} psa A safe array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {Pointer<SAFEARRAY>} The safe array descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraycopy
     */
    static SafeArrayCopy(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayCopy", "ptr", psa, "ptr*", &ppsaOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppsaOut
    }

    /**
     * Gets a pointer to an array element.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @param {Pointer<Integer>} rgIndices An array of index values that identify an element of the array. All indexes for the element must be specified.
     * @returns {Pointer<Void>} The array element.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearrayptrofindex
     */
    static SafeArrayPtrOfIndex(psa, rgIndices) {
        rgIndicesMarshal := rgIndices is VarRef ? "int*" : "ptr"

        result := DllCall("OLEAUT32.dll\SafeArrayPtrOfIndex", "ptr", psa, rgIndicesMarshal, rgIndices, "ptr*", &ppvData := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvData
    }

    /**
     * Sets the record info in the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa The array descriptor.
     * @param {IRecordInfo} prinfo The record info.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is null or the array descriptor does not have the FADF_RECORD flag set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraysetrecordinfo
     */
    static SafeArraySetRecordInfo(psa, prinfo) {
        result := DllCall("OLEAUT32.dll\SafeArraySetRecordInfo", "ptr", psa, "ptr", prinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the IRecordInfo interface of the UDT contained in the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {IRecordInfo} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-irecordinfo">IRecordInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetrecordinfo
     */
    static SafeArrayGetRecordInfo(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayGetRecordInfo", "ptr", psa, "ptr*", &prinfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IRecordInfo(prinfo)
    }

    /**
     * Sets the GUID of the interface for the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa The safe array descriptor.
     * @param {Pointer<Guid>} guid The IID.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is null or the array descriptor does not have the FADF_HAVEIID flag set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraysetiid
     */
    static SafeArraySetIID(psa, guid) {
        result := DllCall("OLEAUT32.dll\SafeArraySetIID", "ptr", psa, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the GUID of the interface contained within the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @param {Pointer<Guid>} pguid The GUID of the interface.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument <i>psa</i> is null or the array descriptor does not have the FADF_HAVEIID flag set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetiid
     */
    static SafeArrayGetIID(psa, pguid) {
        result := DllCall("OLEAUT32.dll\SafeArrayGetIID", "ptr", psa, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the VARTYPE stored in the specified safe array.
     * @param {Pointer<SAFEARRAY>} psa An array descriptor created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-safearraycreate">SafeArrayCreate</a>.
     * @returns {Integer} The VARTYPE.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraygetvartype
     */
    static SafeArrayGetVartype(psa) {
        result := DllCall("OLEAUT32.dll\SafeArrayGetVartype", "ptr", psa, "ushort*", &pvt := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pvt
    }

    /**
     * Creates a one-dimensional array. A safe array created with SafeArrayCreateVector is a fixed size, so the constant FADF_FIXEDSIZE is always set.
     * @param {Integer} vt The base type of the array (the VARTYPE of each element of the array). The VARTYPE is restricted to a subset of the variant types. Neither the VT_ARRAY nor the VT_BYREF flag can be set. VT_EMPTY and VT_NULL are not valid base types for the array. All other types are legal.
     * @param {Integer} lLbound The lower bound for the array. This parameter can be negative.
     * @param {Integer} cElements The number of elements in the array.
     * @returns {Pointer<SAFEARRAY>} A safe array descriptor, or null if the array could not be created.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraycreatevector
     */
    static SafeArrayCreateVector(vt, lLbound, cElements) {
        result := DllCall("OLEAUT32.dll\SafeArrayCreateVector", "ushort", vt, "int", lLbound, "uint", cElements, "ptr")
        return result
    }

    /**
     * Creates and returns a one-dimensional safe array of the specified VARTYPE and bounds.
     * @param {Integer} vt The base type of the array (the VARTYPE of each element of the array). The FADF_RECORD flag can be set for VT_RECORD. The FADF_HAVEIID can be set for VT_DISPATCH or VT_UNKNOWN and FADF_HAVEVARTYPE can be set for all other types.
     * @param {Integer} lLbound The lower bound for the array. This parameter can be negative.
     * @param {Integer} cElements The number of elements in the array.
     * @param {Pointer<Void>} pvExtra The type information of the user-defined type, if you are creating a safe array of user-defined types. If the vt parameter is VT_RECORD, then <i>pvExtra</i> will be a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-irecordinfo">IRecordInfo</a> describing the record. If the <i>vt</i> parameter is VT_DISPATCH or VT_UNKNOWN, then <i>pvExtra</i> will contain a pointer to a GUID representing the type of interface being passed to the array.
     * @returns {Pointer<SAFEARRAY>} A safe array descriptor, or null if the array could not be created.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-safearraycreatevectorex
     */
    static SafeArrayCreateVectorEx(vt, lLbound, cElements, pvExtra) {
        pvExtraMarshal := pvExtra is VarRef ? "ptr" : "ptr"

        result := DllCall("OLEAUT32.dll\SafeArrayCreateVectorEx", "ushort", vt, "int", lLbound, "uint", cElements, pvExtraMarshal, pvExtra, "ptr")
        return result
    }

    /**
     * Returns a vector, assigning each character in the BSTR to an element of the vector.
     * @param {BSTR} bstr The BSTR to be converted to a vector.
     * @returns {Pointer<SAFEARRAY>} A one-dimensional safearray containing the characters in the BSTR.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vectorfrombstr
     */
    static VectorFromBstr(bstr) {
        bstr := bstr is Win32Handle ? NumGet(bstr, "ptr") : bstr

        result := DllCall("OLEAUT32.dll\VectorFromBstr", "ptr", bstr, "ptr*", &ppsa := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppsa
    }

    /**
     * Returns a BSTR, assigning each element of the vector to a character in the BSTR.
     * @param {Pointer<SAFEARRAY>} psa The vector to be converted to a BSTR.
     * @returns {BSTR} A BSTR, each character of which is assigned to an element from the vector.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-bstrfromvector
     */
    static BstrFromVector(psa) {
        pbstr := BSTR()
        result := DllCall("OLEAUT32.dll\BstrFromVector", "ptr", psa, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return pbstr
    }

    /**
     * Converts a short value to an unsigned char value.
     * @param {Integer} sIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromi2
     */
    static VarUI1FromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromI2", "short", sIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a long value to an unsigned char value.
     * @param {Integer} lIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromi4
     */
    static VarUI1FromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromI4", "int", lIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts an 8-byte integer value to a byte value.
     * @param {Integer} i64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromi8
     */
    static VarUI1FromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarUI1FromI8", "int64", i64In, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a float value to an unsigned char value.
     * @param {Float} fltIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromr4
     */
    static VarUI1FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromR4", "float", fltIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a double value to an unsigned char value.
     * @param {Float} dblIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromr8
     */
    static VarUI1FromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromR8", "double", dblIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a currency value to an unsigned char value.
     * @param {CY} cyIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromcy
     */
    static VarUI1FromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromCy", "ptr", cyIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a date value to an unsigned char value.
     * @param {Float} dateIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromdate
     */
    static VarUI1FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromDate", "double", dateIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts an OLECHAR string to an unsigned char string.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromstr
     */
    static VarUI1FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarUI1FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts the default property of an IDispatch instance to an unsigned char value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromdisp
     */
    static VarUI1FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarUI1FromDisp", "ptr", pdispIn, "uint", lcid, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a Boolean value to an unsigned char value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1frombool
     */
    static VarUI1FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromBool", "short", boolIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a char value to an unsigned char value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromi1
     */
    static VarUI1FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromI1", "char", cIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts an unsigned short value to an unsigned char value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromui2
     */
    static VarUI1FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromUI2", "ushort", uiIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts an unsigned long value to an unsigned char value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromui4
     */
    static VarUI1FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromUI4", "uint", ulIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a byte value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromui8
     */
    static VarUI1FromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarUI1FromUI8", "uint", ui64In, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts a decimal value to an unsigned char value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui1fromdec
     */
    static VarUI1FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarUI1FromDec", "ptr", pdecIn, "char*", &pbOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pbOut
    }

    /**
     * Converts an unsigned char value to a short value.
     * @param {Integer} bIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromui1
     */
    static VarI2FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromUI1", "char", bIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts a long value to a short value.
     * @param {Integer} lIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromi4
     */
    static VarI2FromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromI4", "int", lIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts an 8-byte integer value to a short value.
     * @param {Integer} i64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromi8
     */
    static VarI2FromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarI2FromI8", "int64", i64In, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts a float value to a short value.
     * @param {Float} fltIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromr4
     */
    static VarI2FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromR4", "float", fltIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts a double value to a short value.
     * @param {Float} dblIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromr8
     */
    static VarI2FromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromR8", "double", dblIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts a currency value to a short value.
     * @param {CY} cyIn The value to convert.
     * @param {Pointer<Integer>} psOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromcy
     */
    static VarI2FromCy(cyIn, psOut) {
        psOutMarshal := psOut is VarRef ? "short*" : "ptr"

        result := DllCall("OLEAUT32.dll\VarI2FromCy", "ptr", cyIn, psOutMarshal, psOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a date value to a short value.
     * @param {Float} dateIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromdate
     */
    static VarI2FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromDate", "double", dateIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts an OLECHAR string to a short value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromstr
     */
    static VarI2FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarI2FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts the default property of an IDispatch instance to a short value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromdisp
     */
    static VarI2FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarI2FromDisp", "ptr", pdispIn, "uint", lcid, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts a Boolean value to a short value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2frombool
     */
    static VarI2FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromBool", "short", boolIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts a char value to a short value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromi1
     */
    static VarI2FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromI1", "char", cIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts an unsigned short value to a short value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromui2
     */
    static VarI2FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromUI2", "ushort", uiIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts an unsigned long value to a short value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromui4
     */
    static VarI2FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromUI4", "uint", ulIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a short value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromui8
     */
    static VarI2FromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarI2FromUI8", "uint", ui64In, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts a decimal value to a short value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari2fromdec
     */
    static VarI2FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarI2FromDec", "ptr", pdecIn, "short*", &psOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return psOut
    }

    /**
     * Converts an unsigned char value to a long value.
     * @param {Integer} bIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromui1
     */
    static VarI4FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromUI1", "char", bIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a short value to a long value.
     * @param {Integer} sIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromi2
     */
    static VarI4FromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromI2", "short", sIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts an 8-byte integer value to a long value.
     * @param {Integer} i64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromi8
     */
    static VarI4FromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarI4FromI8", "int64", i64In, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a float value to a long value.
     * @param {Float} fltIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromr4
     */
    static VarI4FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromR4", "float", fltIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a double value to a long value.
     * @param {Float} dblIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromr8
     */
    static VarI4FromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromR8", "double", dblIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a currency value to a long value.
     * @param {CY} cyIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromcy
     */
    static VarI4FromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromCy", "ptr", cyIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a date value to a long value.
     * @param {Float} dateIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromdate
     */
    static VarI4FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromDate", "double", dateIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts an OLECHAR string to a long value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromstr
     */
    static VarI4FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarI4FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts the default property of an IDispatch instance to a long value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromdisp
     */
    static VarI4FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarI4FromDisp", "ptr", pdispIn, "uint", lcid, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a Boolean value to a long value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4frombool
     */
    static VarI4FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromBool", "short", boolIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a char value to a long value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromi1
     */
    static VarI4FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromI1", "char", cIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts an unsigned short value to a long value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromui2
     */
    static VarI4FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromUI2", "ushort", uiIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts an unsigned long value to a long value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromui4
     */
    static VarI4FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromUI4", "uint", ulIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a long.
     * @param {Integer} ui64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromui8
     */
    static VarI4FromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarI4FromUI8", "uint", ui64In, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a decimal value to a long value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari4fromdec
     */
    static VarI4FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarI4FromDec", "ptr", pdecIn, "int*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Onverts an unsigned byte value to an 8-byte integer value.
     * @param {Integer} bIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromui1
     */
    static VarI8FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromUI1", "char", bIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a short value to an 8-byte integer value.
     * @param {Integer} sIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromi2
     */
    static VarI8FromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromI2", "short", sIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a float value to an 8-byte integer value.
     * @param {Float} fltIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromr4
     */
    static VarI8FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromR4", "float", fltIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a double value to an 8-byte integer value.
     * @param {Float} dblIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromr8
     */
    static VarI8FromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromR8", "double", dblIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a currency value to an 8-byte integer value.
     * @param {CY} cyIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromcy
     */
    static VarI8FromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromCy", "ptr", cyIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a date value to an 8-byte integer value.
     * @param {Float} dateIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromdate
     */
    static VarI8FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromDate", "double", dateIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an OLECHAR string to an 8-byte integer value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromstr
     */
    static VarI8FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarI8FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts the default property of an IDispatch instance to an 8-byte integer value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromdisp
     */
    static VarI8FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarI8FromDisp", "ptr", pdispIn, "uint", lcid, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a Boolean value to an 8-byte integer value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8frombool
     */
    static VarI8FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromBool", "short", boolIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a char value to an 8-byte integer value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromi1
     */
    static VarI8FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromI1", "char", cIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an unsigned short value to an 8-byte integer value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromui2
     */
    static VarI8FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromUI2", "ushort", uiIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an unsigned long value to an 8-byte integer value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromui4
     */
    static VarI8FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromUI4", "uint", ulIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an unsigned 8-byte integer value to an 8-byte integer value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromui8
     */
    static VarI8FromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarI8FromUI8", "uint", ui64In, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a decimal value to an 8-byte integer value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari8fromdec
     */
    static VarI8FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarI8FromDec", "ptr", pdecIn, "int64*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an unsigned char value to a float value.
     * @param {Integer} bIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromui1
     */
    static VarR4FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromUI1", "char", bIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts a short value to a float value.
     * @param {Integer} sIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromi2
     */
    static VarR4FromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromI2", "short", sIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts a long value to a float value.
     * @param {Integer} lIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromi4
     */
    static VarR4FromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromI4", "int", lIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts an 8-byte integer value to a float value.
     * @param {Integer} i64In The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromi8
     */
    static VarR4FromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarR4FromI8", "int64", i64In, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts a double value to a float value.
     * @param {Float} dblIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromr8
     */
    static VarR4FromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromR8", "double", dblIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts a currency value to a float value.
     * @param {CY} cyIn The value to convert.
     * @param {Pointer<Float>} pfltOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromcy
     */
    static VarR4FromCy(cyIn, pfltOut) {
        pfltOutMarshal := pfltOut is VarRef ? "float*" : "ptr"

        result := DllCall("OLEAUT32.dll\VarR4FromCy", "ptr", cyIn, pfltOutMarshal, pfltOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a date value to a float value.
     * @param {Float} dateIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromdate
     */
    static VarR4FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromDate", "double", dateIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts an OLECHAR string to a float value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromstr
     */
    static VarR4FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarR4FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts the default property of an IDispatch instance to a float value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromdisp
     */
    static VarR4FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarR4FromDisp", "ptr", pdispIn, "uint", lcid, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts a Boolean value to a float value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4frombool
     */
    static VarR4FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromBool", "short", boolIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Onverts a char value to a float value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromi1
     */
    static VarR4FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromI1", "char", cIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts an unsigned short value to a float value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromui2
     */
    static VarR4FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromUI2", "ushort", uiIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts an unsigned long value to a float value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromui4
     */
    static VarR4FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromUI4", "uint", ulIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts an unsigned 8-byte integer value to a float value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromui8
     */
    static VarR4FromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarR4FromUI8", "uint", ui64In, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts a decimal value to a float value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4fromdec
     */
    static VarR4FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarR4FromDec", "ptr", pdecIn, "float*", &pfltOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pfltOut
    }

    /**
     * Converts an unsigned char value to a double value.
     * @param {Integer} bIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromui1
     */
    static VarR8FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromUI1", "char", bIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts a short value to a double value.
     * @param {Integer} sIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromi2
     */
    static VarR8FromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromI2", "short", sIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts a long value to a double value.
     * @param {Integer} lIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromi4
     */
    static VarR8FromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromI4", "int", lIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts an 8-byte integer value to a double value.
     * @param {Integer} i64In The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromi8
     */
    static VarR8FromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarR8FromI8", "int64", i64In, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts a float value to a double value.
     * @param {Float} fltIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromr4
     */
    static VarR8FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromR4", "float", fltIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts a currency value to a double value.
     * @param {CY} cyIn The value to convert.
     * @param {Pointer<Float>} pdblOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromcy
     */
    static VarR8FromCy(cyIn, pdblOut) {
        pdblOutMarshal := pdblOut is VarRef ? "double*" : "ptr"

        result := DllCall("OLEAUT32.dll\VarR8FromCy", "ptr", cyIn, pdblOutMarshal, pdblOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a date value to a double value.
     * @param {Float} dateIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromdate
     */
    static VarR8FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromDate", "double", dateIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts an OLECHAR string to a double value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromstr
     */
    static VarR8FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarR8FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts the default property of an IDispatch instance to a double value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromdisp
     */
    static VarR8FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarR8FromDisp", "ptr", pdispIn, "uint", lcid, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts a Boolean value to a double value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8frombool
     */
    static VarR8FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromBool", "short", boolIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts a char value to a double value.
     * @param {CHAR} cIn The value to convert.
     * @param {Pointer<Float>} pdblOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromi1
     */
    static VarR8FromI1(cIn, pdblOut) {
        pdblOutMarshal := pdblOut is VarRef ? "double*" : "ptr"

        result := DllCall("OLEAUT32.dll\VarR8FromI1", "char", cIn, pdblOutMarshal, pdblOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned short value to a double value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromui2
     */
    static VarR8FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromUI2", "ushort", uiIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts an unsigned long value to a double value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromui4
     */
    static VarR8FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromUI4", "uint", ulIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a double value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromui8
     */
    static VarR8FromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarR8FromUI8", "uint", ui64In, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts a decimal value to a double value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8fromdec
     */
    static VarR8FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarR8FromDec", "ptr", pdecIn, "double*", &pdblOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblOut
    }

    /**
     * Converts an unsigned char value to a date value.
     * @param {Integer} bIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromui1
     */
    static VarDateFromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromUI1", "char", bIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a short value to a date value.
     * @param {Integer} sIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromi2
     */
    static VarDateFromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromI2", "short", sIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a long value to a date value.
     * @param {Integer} lIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromi4
     */
    static VarDateFromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromI4", "int", lIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a date value.
     * @param {Integer} i64In The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromi8
     */
    static VarDateFromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarDateFromI8", "int64", i64In, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a float value to a date value.
     * @param {Float} fltIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromr4
     */
    static VarDateFromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromR4", "float", fltIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a double value to a date value.
     * @param {Float} dblIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromr8
     */
    static VarDateFromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromR8", "double", dblIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a currency value to a date value.
     * @param {CY} cyIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromcy
     */
    static VarDateFromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromCy", "ptr", cyIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts an OLECHAR string to a date value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_CALENDAR_HIJRI"></a><a id="var_calendar_hijri"></a><dl>
     * <dt><b>VAR_CALENDAR_HIJRI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set then the Hijri calendar is used. Otherwise the calendar set in the control panel is used.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromstr
     */
    static VarDateFromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarDateFromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts the default property of an IDispatch instance to a date value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromdisp
     */
    static VarDateFromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarDateFromDisp", "ptr", pdispIn, "uint", lcid, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a Boolean value to a date value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefrombool
     */
    static VarDateFromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromBool", "short", boolIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a char value to a date value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromi1
     */
    static VarDateFromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromI1", "char", cIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts an unsigned short value to a date value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromui2
     */
    static VarDateFromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromUI2", "ushort", uiIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts an unsigned long value to a date value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromui4
     */
    static VarDateFromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromUI4", "uint", ulIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts an 8-byte unsigned value to a date value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromui8
     */
    static VarDateFromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarDateFromUI8", "uint", ui64In, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a decimal value to a date value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Float} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromdec
     */
    static VarDateFromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarDateFromDec", "ptr", pdecIn, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts an unsigned char value to a currency value.
     * @param {Integer} bIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromui1
     */
    static VarCyFromUI1(bIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromUI1", "char", bIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a short value to a currency value.
     * @param {Integer} sIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromi2
     */
    static VarCyFromI2(sIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromI2", "short", sIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a long value to a currency value.
     * @param {Integer} lIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromi4
     */
    static VarCyFromI4(lIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromI4", "int", lIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an 8-byte integer value to a currency value.
     * @param {Integer} i64In The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromi8
     */
    static VarCyFromI8(i64In, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromI8", "int64", i64In, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a float value to a currency value.
     * @param {Float} fltIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromr4
     */
    static VarCyFromR4(fltIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromR4", "float", fltIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a double value to a currency value.
     * @param {Float} dblIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromr8
     */
    static VarCyFromR8(dblIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromR8", "double", dblIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a date value to a currency value.
     * @param {Float} dateIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromdate
     */
    static VarCyFromDate(dateIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromDate", "double", dateIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an OLECHAR string to a currency value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One of more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromstr
     */
    static VarCyFromStr(strIn, lcid, dwFlags, pcyOut) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarCyFromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the default property of an IDispatch instance to a currency value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromdisp
     */
    static VarCyFromDisp(pdispIn, lcid, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromDisp", "ptr", pdispIn, "uint", lcid, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a Boolean value to a currency value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfrombool
     */
    static VarCyFromBool(boolIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromBool", "short", boolIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a char value to a currency value.
     * @param {CHAR} cIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromi1
     */
    static VarCyFromI1(cIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromI1", "char", cIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned short value to a currency value.
     * @param {Integer} uiIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromui2
     */
    static VarCyFromUI2(uiIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromUI2", "ushort", uiIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned long value to a currency value.
     * @param {Integer} ulIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromui4
     */
    static VarCyFromUI4(ulIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromUI4", "uint", ulIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an 8-byte unsigned integer value to a currency value.
     * @param {Integer} ui64In The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromui8
     */
    static VarCyFromUI8(ui64In, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromUI8", "uint", ui64In, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a decimal value to a currency value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @param {Pointer<CY>} pcyOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfromdec
     */
    static VarCyFromDec(pdecIn, pcyOut) {
        result := DllCall("OLEAUT32.dll\VarCyFromDec", "ptr", pdecIn, "ptr", pcyOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned char value to a BSTR value.
     * @param {Integer} bVal The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromui1
     */
    static VarBstrFromUI1(bVal, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromUI1", "char", bVal, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a short value to a BSTR value.
     * @param {Integer} iVal The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromi2
     */
    static VarBstrFromI2(iVal, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromI2", "short", iVal, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a long value to a BSTR value.
     * @param {Integer} lIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromi4
     */
    static VarBstrFromI4(lIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromI4", "int", lIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a BSTR value.
     * @param {Integer} i64In The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromi8
     */
    static VarBstrFromI8(i64In, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromI8", "int64", i64In, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a float value to a BSTR value.
     * @param {Float} fltIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromr4
     */
    static VarBstrFromR4(fltIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromR4", "float", fltIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a double value to a BSTR value.
     * @param {Float} dblIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromr8
     */
    static VarBstrFromR8(dblIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromR8", "double", dblIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a currency value to a BSTR value.
     * @param {CY} cyIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_USE_NLS"></a><a id="locale_use_nls"></a><dl>
     * <dt><b>LOCALE_USE_NLS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses NLS functions for currency conversions.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromcy
     */
    static VarBstrFromCy(cyIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromCy", "ptr", cyIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a date value to a BSTR value.
     * @param {Float} dateIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_CALENDAR_HIJRI"></a><a id="var_calendar_hijri"></a><dl>
     * <dt><b>VAR_CALENDAR_HIJRI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set then the Hijri calendar is used. Otherwise the calendar set in the control panel is used.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_CALENDAR_THAI"></a><a id="var_calendar_thai"></a><dl>
     * <dt><b>VAR_CALENDAR_THAI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set then the Buddhist year is used.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_CALENDAR_GREGORIAN"></a><a id="var_calendar_gregorian"></a><dl>
     * <dt><b>VAR_CALENDAR_GREGORIAN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set the Gregorian year is used.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_FOURDIGITYEARS"></a><a id="var_fourdigityears"></a><dl>
     * <dt><b>VAR_FOURDIGITYEARS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 4-digit years instead of 2-digit years.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromdate
     */
    static VarBstrFromDate(dateIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromDate", "double", dateIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts the default property of an IDispatch instance to a BSTR value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromdisp
     */
    static VarBstrFromDisp(pdispIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromDisp", "ptr", pdispIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a Boolean value to a BSTR value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_LOCALBOOL"></a><a id="var_localbool"></a><dl>
     * <dt><b>VAR_LOCALBOOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses localized Boolean names.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfrombool
     */
    static VarBstrFromBool(boolIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromBool", "short", boolIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a char value to a BSTR value.
     * @param {CHAR} cIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromi1
     */
    static VarBstrFromI1(cIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromI1", "char", cIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts an unsigned short value to a BSTR value.
     * @param {Integer} uiIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromui2
     */
    static VarBstrFromUI2(uiIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromUI2", "ushort", uiIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts an unsigned long value to a BSTR value.
     * @param {Integer} ulIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromui4
     */
    static VarBstrFromUI4(ulIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromUI4", "uint", ulIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a BSTR value.
     * @param {Integer} ui64In The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Reserved. Set to zero.
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromui8
     */
    static VarBstrFromUI8(ui64In, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromUI8", "uint", ui64In, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts a decimal value to a BSTR value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates. Not used for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantchangetype">VariantChangeType</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantchangetypeex">VariantChangeTypeEx</a>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates. Not used for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantchangetype">VariantChangeType</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantchangetypeex">VariantChangeTypeEx</a>.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrfromdec
     */
    static VarBstrFromDec(pdecIn, lcid, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrFromDec", "ptr", pdecIn, "uint", lcid, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Converts an unsigned char value to a Boolean value.
     * @param {Integer} bIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromui1
     */
    static VarBoolFromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromUI1", "char", bIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a short value to a Boolean value.
     * @param {Integer} sIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromi2
     */
    static VarBoolFromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromI2", "short", sIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a long value to a Boolean value.
     * @param {Integer} lIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromi4
     */
    static VarBoolFromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromI4", "int", lIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts an 8-byte integer value to a Boolean value.
     * @param {Integer} i64In The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromi8
     */
    static VarBoolFromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarBoolFromI8", "int64", i64In, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a float value to a Boolean value.
     * @param {Float} fltIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromr4
     */
    static VarBoolFromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromR4", "float", fltIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a double value to a Boolean value.
     * @param {Float} dblIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromr8
     */
    static VarBoolFromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromR8", "double", dblIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a date value to a Boolean value.
     * @param {Float} dateIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromdate
     */
    static VarBoolFromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromDate", "double", dateIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a currency value to a Boolean value.
     * @param {CY} cyIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromcy
     */
    static VarBoolFromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromCy", "ptr", cyIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts an OLECHAR string to a Boolean value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_LOCALBOOL"></a><a id="var_localbool"></a><dl>
     * <dt><b>VAR_LOCALBOOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses localized Boolean names.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromstr
     */
    static VarBoolFromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarBoolFromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts the default property of an IDispatch instance to a Boolean value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromdisp
     */
    static VarBoolFromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarBoolFromDisp", "ptr", pdispIn, "uint", lcid, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a char value to a Boolean value.
     * @param {CHAR} cIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromi1
     */
    static VarBoolFromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromI1", "char", cIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts an unsigned short value to a Boolean value.
     * @param {Integer} uiIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromui2
     */
    static VarBoolFromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromUI2", "ushort", uiIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts an unsigned long value to a Boolean value.
     * @param {Integer} ulIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromui4
     */
    static VarBoolFromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromUI4", "uint", ulIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts an 8-byte unsigned integer value to a Boolean value.
     * @param {Integer} i64In The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromui8
     */
    static VarBoolFromUI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarBoolFromUI8", "uint", i64In, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts a decimal value to a Boolean value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {VARIANT_BOOL} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varboolfromdec
     */
    static VarBoolFromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarBoolFromDec", "ptr", pdecIn, "short*", &pboolOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pboolOut
    }

    /**
     * Converts an unsigned char value to a char value.
     * @param {Integer} bIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromui1
     */
    static VarI1FromUI1(bIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromUI1", "char", bIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a short value to a char value.
     * @param {Integer} uiIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromi2
     */
    static VarI1FromI2(uiIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromI2", "short", uiIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a long value to a char value.
     * @param {Integer} lIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromi4
     */
    static VarI1FromI4(lIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromI4", "int", lIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an 8-byte integer value to a char value.
     * @param {Integer} i64In The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromi8
     */
    static VarI1FromI8(i64In, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromI8", "int64", i64In, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a float value to a char value.
     * @param {Float} fltIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromr4
     */
    static VarI1FromR4(fltIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromR4", "float", fltIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a double value to a char value.
     * @param {Float} dblIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromr8
     */
    static VarI1FromR8(dblIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromR8", "double", dblIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a date value to a char value.
     * @param {Float} dateIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromdate
     */
    static VarI1FromDate(dateIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromDate", "double", dateIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a currency value to a char value.
     * @param {CY} cyIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromcy
     */
    static VarI1FromCy(cyIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromCy", "ptr", cyIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an OLECHAR string to a char value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromstr
     */
    static VarI1FromStr(strIn, lcid, dwFlags, pcOut) {
        strIn := strIn is String ? StrPtr(strIn) : strIn
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the default property of an IDispatch instance to a char value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromdisp
     */
    static VarI1FromDisp(pdispIn, lcid, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromDisp", "ptr", pdispIn, "uint", lcid, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a Boolean value to a char value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1frombool
     */
    static VarI1FromBool(boolIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromBool", "short", boolIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned short value to a char value.
     * @param {Integer} uiIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromui2
     */
    static VarI1FromUI2(uiIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromUI2", "ushort", uiIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned long value to a char value.
     * @param {Integer} ulIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromui4
     */
    static VarI1FromUI4(ulIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromUI4", "uint", ulIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an 8-byte unsigned integer value to a char value.
     * @param {Integer} i64In The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromui8
     */
    static VarI1FromUI8(i64In, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromUI8", "uint", i64In, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a decimal value to a char value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @param {PSTR} pcOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vari1fromdec
     */
    static VarI1FromDec(pdecIn, pcOut) {
        pcOut := pcOut is String ? StrPtr(pcOut) : pcOut

        result := DllCall("OLEAUT32.dll\VarI1FromDec", "ptr", pdecIn, "ptr", pcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned char value to an unsigned short value.
     * @param {Integer} bIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromui1
     */
    static VarUI2FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromUI1", "char", bIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a short value to an unsigned short value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromi2
     */
    static VarUI2FromI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromI2", "short", uiIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a long value to an unsigned short value.
     * @param {Integer} lIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromi4
     */
    static VarUI2FromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromI4", "int", lIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts an 8-byte integer value to an unsigned short value.
     * @param {Integer} i64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromi8
     */
    static VarUI2FromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarUI2FromI8", "int64", i64In, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a float value to an unsigned short value.
     * @param {Float} fltIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromr4
     */
    static VarUI2FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromR4", "float", fltIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a double value to an unsigned short value.
     * @param {Float} dblIn The value to convert.
     * @param {Pointer<Integer>} puiOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromr8
     */
    static VarUI2FromR8(dblIn, puiOut) {
        puiOutMarshal := puiOut is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLEAUT32.dll\VarUI2FromR8", "double", dblIn, puiOutMarshal, puiOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a date value to an unsigned short value.
     * @param {Float} dateIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromdate
     */
    static VarUI2FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromDate", "double", dateIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a currency value to an unsigned short value.
     * @param {CY} cyIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromcy
     */
    static VarUI2FromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromCy", "ptr", cyIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts an OLECHAR string to an unsigned short value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromstr
     */
    static VarUI2FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarUI2FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts the default property of an IDispatch instance to an unsigned short value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromdisp
     */
    static VarUI2FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarUI2FromDisp", "ptr", pdispIn, "uint", lcid, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a Boolean value to an unsigned short value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2frombool
     */
    static VarUI2FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromBool", "short", boolIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a char value to an unsigned short value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromi1
     */
    static VarUI2FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromI1", "char", cIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts an unsigned long value to an unsigned short value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromui4
     */
    static VarUI2FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromUI4", "uint", ulIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts an 8-byte unsigned integer value to an unsigned short value.
     * @param {Integer} i64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromui8
     */
    static VarUI2FromUI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarUI2FromUI8", "uint", i64In, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts a decimal value to an unsigned short value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui2fromdec
     */
    static VarUI2FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarUI2FromDec", "ptr", pdecIn, "ushort*", &puiOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puiOut
    }

    /**
     * Converts an unsigned char value to an unsigned long value.
     * @param {Integer} bIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromui1
     */
    static VarUI4FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromUI1", "char", bIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a short value to an unsigned long value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromi2
     */
    static VarUI4FromI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromI2", "short", uiIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a long value to an unsigned long value.
     * @param {Integer} lIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromi4
     */
    static VarUI4FromI4(lIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromI4", "int", lIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts an 8-byte integer value to an unsigned long value.
     * @param {Integer} i64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromi8
     */
    static VarUI4FromI8(i64In) {
        result := DllCall("OLEAUT32.dll\VarUI4FromI8", "int64", i64In, "uint*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a float value to an unsigned long value.
     * @param {Float} fltIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromr4
     */
    static VarUI4FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromR4", "float", fltIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a double value to an unsigned long value.
     * @param {Float} dblIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromr8
     */
    static VarUI4FromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromR8", "double", dblIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a date value to an unsigned long value.
     * @param {Float} dateIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromdate
     */
    static VarUI4FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromDate", "double", dateIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a currency value to an unsigned long value.
     * @param {CY} cyIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromcy
     */
    static VarUI4FromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromCy", "ptr", cyIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts an OLECHAR string to an unsigned long value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromstr
     */
    static VarUI4FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarUI4FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts the default property of an IDispatch instance to an unsigned long value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromdisp
     */
    static VarUI4FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarUI4FromDisp", "ptr", pdispIn, "uint", lcid, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a Boolean value to an unsigned long value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4frombool
     */
    static VarUI4FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromBool", "short", boolIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a char value to an unsigned long value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromi1
     */
    static VarUI4FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromI1", "char", cIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts an unsigned short value to an unsigned long value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromui2
     */
    static VarUI4FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromUI2", "ushort", uiIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts an 8-byte unsigned integer value to an unsigned long value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromui8
     */
    static VarUI4FromUI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarUI4FromUI8", "uint", ui64In, "uint*", &plOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return plOut
    }

    /**
     * Converts a decimal value to an unsigned long value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui4fromdec
     */
    static VarUI4FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarUI4FromDec", "ptr", pdecIn, "uint*", &pulOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pulOut
    }

    /**
     * Converts a byte value to an 8-byte unsigned integer value.
     * @param {Integer} bIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromui1
     */
    static VarUI8FromUI1(bIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromUI1", "char", bIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a short value to an 8-byte unsigned integer value.
     * @param {Integer} sIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromi2
     */
    static VarUI8FromI2(sIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromI2", "short", sIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an 8-byte integer value to an 8-byte unsigned integer value.
     * @param {Integer} ui64In The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromi8
     */
    static VarUI8FromI8(ui64In) {
        result := DllCall("OLEAUT32.dll\VarUI8FromI8", "int64", ui64In, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a float value to an 8-byte unsigned integer value.
     * @param {Float} fltIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromr4
     */
    static VarUI8FromR4(fltIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromR4", "float", fltIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a double value to an 8-byte unsigned integer value.
     * @param {Float} dblIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromr8
     */
    static VarUI8FromR8(dblIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromR8", "double", dblIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a currency value to an 8-byte unsigned integer value.
     * @param {CY} cyIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromcy
     */
    static VarUI8FromCy(cyIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromCy", "ptr", cyIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a date value to an 8-byte unsigned integer value.
     * @param {Float} dateIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromdate
     */
    static VarUI8FromDate(dateIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromDate", "double", dateIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an OLECHAR string to an 8-byte unsigned integer value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromstr
     */
    static VarUI8FromStr(strIn, lcid, dwFlags) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarUI8FromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts the default property of an IDispatch instance to an 8-byte unsigned integer value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromdisp
     */
    static VarUI8FromDisp(pdispIn, lcid) {
        result := DllCall("OLEAUT32.dll\VarUI8FromDisp", "ptr", pdispIn, "uint", lcid, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a VARIANT_BOOL value to an 8-byte unsigned integer value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8frombool
     */
    static VarUI8FromBool(boolIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromBool", "short", boolIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a char value to an 8-byte unsigned integer value.
     * @param {CHAR} cIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromi1
     */
    static VarUI8FromI1(cIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromI1", "char", cIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an unsigned short value to an 8-byte unsigned integer value.
     * @param {Integer} uiIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromui2
     */
    static VarUI8FromUI2(uiIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromUI2", "ushort", uiIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an unsigned long value to an 8-byte unsigned integer value.
     * @param {Integer} ulIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromui4
     */
    static VarUI8FromUI4(ulIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromUI4", "uint", ulIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts a decimal value to an 8-byte unsigned integer value.
     * @param {Pointer<DECIMAL>} pdecIn The value to convert.
     * @returns {Integer} The resulting value.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varui8fromdec
     */
    static VarUI8FromDec(pdecIn) {
        result := DllCall("OLEAUT32.dll\VarUI8FromDec", "ptr", pdecIn, "uint*", &pi64Out := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pi64Out
    }

    /**
     * Converts an unsigned char value to a decimal value.
     * @param {Integer} bIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromui1
     */
    static VarDecFromUI1(bIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromUI1", "char", bIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a short value to a decimal value.
     * @param {Integer} uiIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromi2
     */
    static VarDecFromI2(uiIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromI2", "short", uiIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a long value to a decimal value.
     * @param {Integer} lIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromi4
     */
    static VarDecFromI4(lIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromI4", "int", lIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an 8-byte integer value to a decimal value.
     * @param {Integer} i64In The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromi8
     */
    static VarDecFromI8(i64In, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromI8", "int64", i64In, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a float value to a decimal value.
     * @param {Float} fltIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromr4
     */
    static VarDecFromR4(fltIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromR4", "float", fltIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a double value to a decimal value.
     * @param {Float} dblIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromr8
     */
    static VarDecFromR8(dblIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromR8", "double", dblIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a date value to a decimal value.
     * @param {Float} dateIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromdate
     */
    static VarDecFromDate(dateIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromDate", "double", dateIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a currency value to a decimal value.
     * @param {CY} cyIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromcy
     */
    static VarDecFromCy(cyIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromCy", "ptr", cyIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an OLECHAR string to a decimal value.
     * @param {PWSTR} strIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags One or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOCALE_NOUSEROVERRIDE"></a><a id="locale_nouseroverride"></a><dl>
     * <dt><b>LOCALE_NOUSEROVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses the system default locale settings, rather than custom locale settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_TIMEVALUEONLY"></a><a id="var_timevalueonly"></a><dl>
     * <dt><b>VAR_TIMEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the date portion of a VT_DATE and returns only the time. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VAR_DATEVALUEONLY"></a><a id="var_datevalueonly"></a><dl>
     * <dt><b>VAR_DATEVALUEONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omits the time portion of a VT_DATE and returns only the date. Applies to conversions to or from dates.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromstr
     */
    static VarDecFromStr(strIn, lcid, dwFlags, pdecOut) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarDecFromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the default property of an IDispatch instance to a decimal value.
     * @param {IDispatch} pdispIn The value to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromdisp
     */
    static VarDecFromDisp(pdispIn, lcid, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromDisp", "ptr", pdispIn, "uint", lcid, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a Boolean value to a decimal value.
     * @param {VARIANT_BOOL} boolIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfrombool
     */
    static VarDecFromBool(boolIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromBool", "short", boolIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a char value to a decimal value.
     * @param {CHAR} cIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromi1
     */
    static VarDecFromI1(cIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromI1", "char", cIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned short value to a decimal value.
     * @param {Integer} uiIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromui2
     */
    static VarDecFromUI2(uiIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromUI2", "ushort", uiIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an unsigned long value to a decimal value.
     * @param {Integer} ulIn The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromui4
     */
    static VarDecFromUI4(ulIn, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromUI4", "uint", ulIn, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an 8-byte unsigned integer value to a decimal value.
     * @param {Integer} ui64In The value to convert.
     * @param {Pointer<DECIMAL>} pdecOut The resulting value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input parameter is not a valid type of variant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data pointed to by the output parameter does not fit in the destination type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The argument could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfromui8
     */
    static VarDecFromUI8(ui64In, pdecOut) {
        result := DllCall("OLEAUT32.dll\VarDecFromUI8", "uint", ui64In, "ptr", pdecOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Parses a string, and creates a type-independent description of the number it represents.
     * @param {PWSTR} strIn The input string to convert.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags Enables the caller to control parsing, therefore defining the acceptable syntax of a number. If this field is set to zero, the input string must contain nothing but decimal digits. Setting each defined flag bit enables parsing of that syntactic feature. Standard Automation parsing (for example, as used by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-vari2fromstr">VarI2FromStr</a>) has all flags set (NUMPRS_STD).
     * @param {Pointer<NUMPARSE>} pnumprs The parsed results.
     * @returns {Integer} The values for the digits in the range 0–7, 0–9, or 0–15, depending on whether the number is octal, decimal, or hexadecimal. All leading zeros have been stripped off. For decimal numbers, trailing zeros are also stripped off, unless the number is zero, in which case a single zero digit will be present.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varparsenumfromstr
     */
    static VarParseNumFromStr(strIn, lcid, dwFlags, pnumprs) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\VarParseNumFromStr", "ptr", strIn, "uint", lcid, "uint", dwFlags, "ptr", pnumprs, "char*", &rgbDig := 0, "int")
        if(result != 0)
            throw OSError(result)

        return rgbDig
    }

    /**
     * Converts parsed results to a variant.
     * @param {Pointer<NUMPARSE>} pnumprs The parsed results. The <b>cDig</b> member of this argument specifies the number of digits present in <i>rgbDig</i>.
     * @param {Pointer<Integer>} rgbDig The values of the digits. The <b>cDig</b> field of <i>pnumprs</i> contains the number of digits.
     * @param {Integer} dwVtBits One bit set for each type that is acceptable as a return value (in many cases, just one bit).
     * 
     * <a id="VTBIT_I1"></a>
     * <a id="vtbit_i1"></a>
     * @param {Pointer<VARIANT>} pvar The variant result.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number is too large to be represented in an allowed type. There is no error if precision is lost in the conversion.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varnumfromparsenum
     */
    static VarNumFromParseNum(pnumprs, rgbDig, dwVtBits, pvar) {
        rgbDigMarshal := rgbDig is VarRef ? "char*" : "ptr"

        result := DllCall("OLEAUT32.dll\VarNumFromParseNum", "ptr", pnumprs, rgbDigMarshal, rgbDig, "uint", dwVtBits, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the sum of two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varadd
     */
    static VarAdd(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarAdd", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs a bitwise And operation between two variants of any integral type.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varand
     */
    static VarAnd(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarAnd", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Concatenates two variants and returns the result.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcat
     */
    static VarCat(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarCat", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the result from dividing two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardiv
     */
    static VarDiv(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarDiv", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs a bitwise equivalence on two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vareqv
     */
    static VarEqv(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarEqv", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts two variants of any type to integers then returns the result from dividing them.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varidiv
     */
    static VarIdiv(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarIdiv", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs a bitwise implication on two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varimp
     */
    static VarImp(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarImp", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Divides two variants and returns only the remainder.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varmod
     */
    static VarMod(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarMod", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the result from multiplying two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varmul
     */
    static VarMul(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarMul", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs a logical disjunction on two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varor
     */
    static VarOr(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarOr", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the result of performing the power function with two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varpow
     */
    static VarPow(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarPow", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Subtracts two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varsub
     */
    static VarSub(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarSub", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs a logical exclusion on two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varxor
     */
    static VarXor(pvarLeft, pvarRight, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarXor", "ptr", pvarLeft, "ptr", pvarRight, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the absolute value of a variant.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varabs
     */
    static VarAbs(pvarIn, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarAbs", "ptr", pvarIn, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the integer portion of a variant.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varfix
     */
    static VarFix(pvarIn, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarFix", "ptr", pvarIn, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the integer portion of a variant.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varint
     */
    static VarInt(pvarIn, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarInt", "ptr", pvarIn, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs logical negation on a variant.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varneg
     */
    static VarNeg(pvarIn, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarNeg", "ptr", pvarIn, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs the bitwise not negation operation on a variant.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varnot
     */
    static VarNot(pvarIn, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarNot", "ptr", pvarIn, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Rounds a variant to the specified number of decimal places.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {Integer} cDecimals The number of decimal places.
     * @param {Pointer<VARIANT>} pvarResult The result variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varround
     */
    static VarRound(pvarIn, cDecimals, pvarResult) {
        result := DllCall("OLEAUT32.dll\VarRound", "ptr", pvarIn, "int", cDecimals, "ptr", pvarResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compares two variants.
     * @param {Pointer<VARIANT>} pvarLeft The first variant.
     * @param {Pointer<VARIANT>} pvarRight The second variant.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags The compare results option.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNORECASE"></a><a id="norm_ignorecase"></a><dl>
     * <dt><b>NORM_IGNORECASE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore case.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNORENONSPACE"></a><a id="norm_ignorenonspace"></a><dl>
     * <dt><b>NORM_IGNORENONSPACE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore nonspace characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNORESYMBOLS"></a><a id="norm_ignoresymbols"></a><dl>
     * <dt><b>NORM_IGNORESYMBOLS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore symbols.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNOREWIDTH"></a><a id="norm_ignorewidth"></a><dl>
     * <dt><b>NORM_IGNOREWIDTH</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore string width.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNOREKANATYPE"></a><a id="norm_ignorekanatype"></a><dl>
     * <dt><b>NORM_IGNOREKANATYPE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore Kana type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNOREKASHIDA"></a><a id="norm_ignorekashida"></a><dl>
     * <dt><b>NORM_IGNOREKASHIDA</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore Arabic kashida characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_LT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pvarLeft</i> is less than <i>pvarRight</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_EQ</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameters are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_GT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pvarLeft</i> is greater than <i>pvarRight</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_NULL</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either expression is NULL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcmp
     */
    static VarCmp(pvarLeft, pvarRight, lcid, dwFlags) {
        result := DllCall("OLEAUT32.dll\VarCmp", "ptr", pvarLeft, "ptr", pvarRight, "uint", lcid, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Adds two variants of type decimal.
     * @param {Pointer<DECIMAL>} pdecLeft The first variant.
     * @param {Pointer<DECIMAL>} pdecRight The second variant.
     * @param {Pointer<DECIMAL>} pdecResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecadd
     */
    static VarDecAdd(pdecLeft, pdecRight, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecAdd", "ptr", pdecLeft, "ptr", pdecRight, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Divides two variants of type decimal.
     * @param {Pointer<DECIMAL>} pdecLeft The first decimal variant.
     * @param {Pointer<DECIMAL>} pdecRight The second decimal variant.
     * @param {Pointer<DECIMAL>} pdecResult The resulting decimal variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecdiv
     */
    static VarDecDiv(pdecLeft, pdecRight, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecDiv", "ptr", pdecLeft, "ptr", pdecRight, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Multiplies two variants of type decimal.
     * @param {Pointer<DECIMAL>} pdecLeft The first variant.
     * @param {Pointer<DECIMAL>} pdecRight The second variant.
     * @param {Pointer<DECIMAL>} pdecResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecmul
     */
    static VarDecMul(pdecLeft, pdecRight, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecMul", "ptr", pdecLeft, "ptr", pdecRight, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Subtracts two variants of type decimal.
     * @param {Pointer<DECIMAL>} pdecLeft The first variant.
     * @param {Pointer<DECIMAL>} pdecRight The second variant.
     * @param {Pointer<DECIMAL>} pdecResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecsub
     */
    static VarDecSub(pdecLeft, pdecRight, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecSub", "ptr", pdecLeft, "ptr", pdecRight, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the absolute value of a variant of type decimal.
     * @param {Pointer<DECIMAL>} pdecIn The first variant.
     * @param {Pointer<DECIMAL>} pdecResult The second variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecabs
     */
    static VarDecAbs(pdecIn, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecAbs", "ptr", pdecIn, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the integer portion of a variant of type decimal.
     * @param {Pointer<DECIMAL>} pdecIn The decimal variant.
     * @param {Pointer<DECIMAL>} pdecResult The resulting variant. If the variant is negative, then the first negative integer greater than or equal to the variant is returned.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecfix
     */
    static VarDecFix(pdecIn, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecFix", "ptr", pdecIn, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the integer portion of a variant of type decimal.
     * @param {Pointer<DECIMAL>} pdecIn The decimal variant.
     * @param {Pointer<DECIMAL>} pdecResult The resulting variant. If the variant is negative, then the first negative integer less than or equal to the variant is returned.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecint
     */
    static VarDecInt(pdecIn, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecInt", "ptr", pdecIn, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs logical negation on a variant of type decimal.
     * @param {Pointer<DECIMAL>} pdecIn The variant to negate.
     * @param {Pointer<DECIMAL>} pdecResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecneg
     */
    static VarDecNeg(pdecIn, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecNeg", "ptr", pdecIn, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Rounds a variant of type decimal to the specified number of decimal places.
     * @param {Pointer<DECIMAL>} pdecIn The variant to round.
     * @param {Integer} cDecimals The number of decimal places.
     * @param {Pointer<DECIMAL>} pdecResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardecround
     */
    static VarDecRound(pdecIn, cDecimals, pdecResult) {
        result := DllCall("OLEAUT32.dll\VarDecRound", "ptr", pdecIn, "int", cDecimals, "ptr", pdecResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compares two variants of type decimal.
     * @param {Pointer<DECIMAL>} pdecLeft The first variant.
     * @param {Pointer<DECIMAL>} pdecRight The second variant.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_LT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pdecLeft</i> is less than <i>dblRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_EQ</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two parameters are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_GT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pdecLeft</i> is greater than <i>dblRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_NULL</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either expression is null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardeccmp
     */
    static VarDecCmp(pdecLeft, pdecRight) {
        result := DllCall("OLEAUT32.dll\VarDecCmp", "ptr", pdecLeft, "ptr", pdecRight, "uint")
        return result
    }

    /**
     * Compares a variant of type decimal with the a value of type double.
     * @param {Pointer<DECIMAL>} pdecLeft The first variant.
     * @param {Float} dblRight The second variant.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_LT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pdecLeft</i> is less than <i>dblRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_EQ</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two parameters are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_GT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pdecLeft</i> is greater than <i>dblRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_NULL</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either expression is null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardeccmpr8
     */
    static VarDecCmpR8(pdecLeft, dblRight) {
        result := DllCall("OLEAUT32.dll\VarDecCmpR8", "ptr", pdecLeft, "double", dblRight, "uint")
        return result
    }

    /**
     * Adds two variants of type currency.
     * @param {CY} cyLeft The first variant.
     * @param {CY} cyRight The second variant.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyadd
     */
    static VarCyAdd(cyLeft, cyRight, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyAdd", "ptr", cyLeft, "ptr", cyRight, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Multiplies two variants of type currency.
     * @param {CY} cyLeft The first variant
     * @param {CY} cyRight The second variant.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcymul
     */
    static VarCyMul(cyLeft, cyRight, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyMul", "ptr", cyLeft, "ptr", cyRight, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Multiplies a currency value by a 32-bit integer.
     * @param {CY} cyLeft The first variant.
     * @param {Integer} lRight The second variant.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcymuli4
     */
    static VarCyMulI4(cyLeft, lRight, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyMulI4", "ptr", cyLeft, "int", lRight, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Multiplies a currency value by a 64-bit integer.
     * @param {CY} cyLeft The first variant.
     * @param {Integer} lRight The second variant.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcymuli8
     */
    static VarCyMulI8(cyLeft, lRight, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyMulI8", "ptr", cyLeft, "int64", lRight, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Subtracts two variants of type currency.
     * @param {CY} cyLeft The first variant.
     * @param {CY} cyRight The second variant.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcysub
     */
    static VarCySub(cyLeft, cyRight, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCySub", "ptr", cyLeft, "ptr", cyRight, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the absolute value of a variant of type currency.
     * @param {CY} cyIn The currency variant.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyabs
     */
    static VarCyAbs(cyIn, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyAbs", "ptr", cyIn, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the integer portion of a variant of type currency.
     * @param {CY} cyIn The currency variant.
     * @param {Pointer<CY>} pcyResult The resulting variant. If the variant is negative, then the first negative integer greater than or equal to the variant is returned.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyfix
     */
    static VarCyFix(cyIn, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyFix", "ptr", cyIn, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the integer portion of a variant of type currency.
     * @param {CY} cyIn The currency variant.
     * @param {Pointer<CY>} pcyResult The resulting variant. If the variant is negative then the first negative integer less than or equal to the variant is returned.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyint
     */
    static VarCyInt(cyIn, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyInt", "ptr", cyIn, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs a logical negation on a variant of type currency.
     * @param {CY} cyIn The variant to negate.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyneg
     */
    static VarCyNeg(cyIn, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyNeg", "ptr", cyIn, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Rounds a variant of type currency to the specified number of decimal places.
     * @param {CY} cyIn The variant to round.
     * @param {Integer} cDecimals The number of currency decimals.
     * @param {Pointer<CY>} pcyResult The resulting variant.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcyround
     */
    static VarCyRound(cyIn, cDecimals, pcyResult) {
        result := DllCall("OLEAUT32.dll\VarCyRound", "ptr", cyIn, "int", cDecimals, "ptr", pcyResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compares two variants of type currency.
     * @param {CY} cyLeft The first variant.
     * @param {CY} cyRight The second variant.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_LT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>cyLeft</i> is less than <i>cyRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_EQ</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two parameters are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_GT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>cyLeft</i> is greater than <i>cyRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_NULL</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either expression is null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcycmp
     */
    static VarCyCmp(cyLeft, cyRight) {
        result := DllCall("OLEAUT32.dll\VarCyCmp", "ptr", cyLeft, "ptr", cyRight, "uint")
        return result
    }

    /**
     * Compares a variant of type currency with a value of type double.
     * @param {CY} cyLeft The first variant.
     * @param {Float} dblRight The second variant.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_LT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>cyLeft</i> is less than <i>dblRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_EQ</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two parameters are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_GT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>cyLeft</i> is greater than <i>dblRight</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_NULL</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either expression is null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varcycmpr8
     */
    static VarCyCmpR8(cyLeft, dblRight) {
        result := DllCall("OLEAUT32.dll\VarCyCmpR8", "ptr", cyLeft, "double", dblRight, "uint")
        return result
    }

    /**
     * Concatenates two variants of type BSTR and returns the resulting BSTR.
     * @param {BSTR} bstrLeft The first variant.
     * @param {BSTR} bstrRight The second variant.
     * @returns {BSTR} The result.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrcat
     */
    static VarBstrCat(bstrLeft, bstrRight) {
        bstrLeft := bstrLeft is Win32Handle ? NumGet(bstrLeft, "ptr") : bstrLeft
        bstrRight := bstrRight is Win32Handle ? NumGet(bstrRight, "ptr") : bstrRight

        pbstrResult := BSTR()
        result := DllCall("OLEAUT32.dll\VarBstrCat", "ptr", bstrLeft, "ptr", bstrRight, "ptr", pbstrResult, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrResult
    }

    /**
     * Compares two variants of type BSTR.
     * @param {BSTR} bstrLeft The first variant.
     * @param {BSTR} bstrRight The second variant.
     * @param {Integer} lcid The locale identifier of the program to determine whether UNICODE or ANSI strings are being used.
     * @param {Integer} dwFlags The following are compare results flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNORECASE"></a><a id="norm_ignorecase"></a><dl>
     * <dt><b>NORM_IGNORECASE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore case.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNORENONSPACE"></a><a id="norm_ignorenonspace"></a><dl>
     * <dt><b>NORM_IGNORENONSPACE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore nonspace characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNORESYMBOLS"></a><a id="norm_ignoresymbols"></a><dl>
     * <dt><b>NORM_IGNORESYMBOLS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore symbols.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNOREWIDTH"></a><a id="norm_ignorewidth"></a><dl>
     * <dt><b>NORM_IGNOREWIDTH</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore string width.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNOREKANATYPE"></a><a id="norm_ignorekanatype"></a><dl>
     * <dt><b>NORM_IGNOREKANATYPE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore Kana type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NORM_IGNOREKASHIDA"></a><a id="norm_ignorekashida"></a><dl>
     * <dt><b>NORM_IGNOREKASHIDA</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore Arabic kashida characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_LT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>bstrLeft</i> is less than <i>bstrRight</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_EQ</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameters are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VARCMP_GT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>bstrLeft</i> is greater than <i>bstrRight</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varbstrcmp
     */
    static VarBstrCmp(bstrLeft, bstrRight, lcid, dwFlags) {
        bstrLeft := bstrLeft is Win32Handle ? NumGet(bstrLeft, "ptr") : bstrLeft
        bstrRight := bstrRight is Win32Handle ? NumGet(bstrRight, "ptr") : bstrRight

        result := DllCall("OLEAUT32.dll\VarBstrCmp", "ptr", bstrLeft, "ptr", bstrRight, "uint", lcid, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs the power function for variants of type double.
     * @param {Float} dblLeft The first variant.
     * @param {Float} dblRight The second variant.
     * @returns {Float} The result.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8pow
     */
    static VarR8Pow(dblLeft, dblRight) {
        result := DllCall("OLEAUT32.dll\VarR8Pow", "double", dblLeft, "double", dblRight, "double*", &pdblResult := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblResult
    }

    /**
     * Compares two variants of types float and double.
     * @param {Float} fltLeft The first variant.
     * @param {Float} dblRight The second variant.
     * @returns {Integer} The function returns the following as a SUCCESS HRESULT.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b></b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>fltLeft</i> is less than <i>dblRight.</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b></b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two parameters are equal.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b></b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>fltLeft</i> is greater than <i>dblRight.</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b></b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either expression is NULL.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr4cmpr8
     */
    static VarR4CmpR8(fltLeft, dblRight) {
        result := DllCall("OLEAUT32.dll\VarR4CmpR8", "float", fltLeft, "double", dblRight, "uint")
        return result
    }

    /**
     * Rounds a variant of type double to the specified number of decimal places.
     * @param {Float} dblIn The variant.
     * @param {Integer} cDecimals The number of decimal places.
     * @returns {Float} The result.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varr8round
     */
    static VarR8Round(dblIn, cDecimals) {
        result := DllCall("OLEAUT32.dll\VarR8Round", "double", dblIn, "int", cDecimals, "double*", &pdblResult := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdblResult
    }

    /**
     * Converts a time and date converted from MS-DOS format to variant format.
     * @param {Pointer<UDATE>} pudateIn The unpacked date.
     * @param {Integer} dwFlags VAR_VALIDDATE if the date is valid.
     * @returns {Float} The packed date.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromudate
     */
    static VarDateFromUdate(pudateIn, dwFlags) {
        result := DllCall("OLEAUT32.dll\VarDateFromUdate", "ptr", pudateIn, "uint", dwFlags, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a time and date converted from MS-DOS format to variant format.
     * @param {Pointer<UDATE>} pudateIn The unpacked date.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} dwFlags VAR_VALIDDATE if the date is valid.
     * @returns {Float} The packed date.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vardatefromudateex
     */
    static VarDateFromUdateEx(pudateIn, lcid, dwFlags) {
        result := DllCall("OLEAUT32.dll\VarDateFromUdateEx", "ptr", pudateIn, "uint", lcid, "uint", dwFlags, "double*", &pdateOut := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdateOut
    }

    /**
     * Converts a time and date converted from variant format to MS-DOS format.
     * @param {Float} dateIn The packed date.
     * @param {Integer} dwFlags Set for alternative calendars such as Hijri, Polish and Russian.
     * @param {Pointer<UDATE>} pudateOut The unpacked date.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varudatefromdate
     */
    static VarUdateFromDate(dateIn, dwFlags, pudateOut) {
        result := DllCall("OLEAUT32.dll\VarUdateFromDate", "double", dateIn, "uint", dwFlags, "ptr", pudateOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the secondary (alternate) month names.
     * @param {Integer} lcid The locale identifier to be used in retrieving the alternate month names.
     * @returns {Pointer<PWSTR>} An array of pointers to strings containing the alternate month names.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-getaltmonthnames
     */
    static GetAltMonthNames(lcid) {
        result := DllCall("OLEAUT32.dll\GetAltMonthNames", "uint", lcid, "ptr*", &prgp := 0, "int")
        if(result != 0)
            throw OSError(result)

        return prgp
    }

    /**
     * Formats a variant into string form by parsing a format string.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {PWSTR} pstrFormat The format string. For example "mm-dd-yy".
     * @param {Integer} iFirstDay First day of the week.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system default
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Monday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tuesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Wednesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thursday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Friday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Saturday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunday
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iFirstWeek First week of the year.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first week contains January 1st.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The larger half (four days) of the first week is in the current year.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first week has seven days.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags Flags that control the formatting process. The only flags that can be set are VAR_CALENDAR_HIJRI or VAR_FORMAT_NOSUBSTITUTE.
     * @returns {BSTR} The formatted string that represents the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varformat
     */
    static VarFormat(pvarIn, pstrFormat, iFirstDay, iFirstWeek, dwFlags) {
        pstrFormat := pstrFormat is String ? StrPtr(pstrFormat) : pstrFormat

        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarFormat", "ptr", pvarIn, "ptr", pstrFormat, "int", iFirstDay, "int", iFirstWeek, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Formats a variant containing named date and time information into a string.
     * @param {Pointer<VARIANT>} pvarIn The variant containing the value to format.
     * @param {Integer} iNamedFormat The named date formats are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * General date
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Long date
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Short date
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Long time
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Short time
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags VAR_CALENDAR_HIJRI is the only flag that can be set.
     * @returns {BSTR} Receives the formatted string that represents the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varformatdatetime
     */
    static VarFormatDateTime(pvarIn, iNamedFormat, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarFormatDateTime", "ptr", pvarIn, "int", iNamedFormat, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Formats a variant containing numbers into a string form.
     * @param {Pointer<VARIANT>} pvarIn The variant containing the value to format.
     * @param {Integer} iNumDig The number of digits to pad to after the decimal point. Specify -1 to use the system default value.
     * @param {Integer} iIncLead Specifies whether to include the leading digit on numbers.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include the leading digit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not include the leading digit.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iUseParens Specifies whether negative numbers should use parentheses.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use parentheses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use parentheses.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iGroup Specifies whether thousands should be grouped. For example 10,000 versus 10000. 
     * 
     * <div class="alert"><b>Note</b>  Regular numbers and currencies have separate system defaults for all the above options.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group thousands.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not group thousands.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags VAR_CALENDAR_HIJRI is the only flag that can be set.
     * @returns {BSTR} Points to the formatted string that represents the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varformatnumber
     */
    static VarFormatNumber(pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarFormatNumber", "ptr", pvarIn, "int", iNumDig, "int", iIncLead, "int", iUseParens, "int", iGroup, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Formats a variant containing percentages into a string form.
     * @param {Pointer<VARIANT>} pvarIn The variant containing the value to format.
     * @param {Integer} iNumDig The number of digits to pad to after the decimal point. Specify -1 to use the system default value.
     * @param {Integer} iIncLead Specifies whether to include the leading digit on numbers.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include the leading digit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not include the leading digit.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iUseParens Specifies whether negative numbers should use parentheses.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use parentheses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use parentheses.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iGroup Specifies whether thousands should be grouped. For example 10,000 versus 10000. 
     * 
     * <div class="alert"><b>Note</b>  Regular numbers and currencies have separate system defaults for all the above options.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group thousands.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not group thousands.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags VAR_CALENDAR_HIJRI is the only flag that can be set.
     * @returns {BSTR} Receives the formatted string that represents the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varformatpercent
     */
    static VarFormatPercent(pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarFormatPercent", "ptr", pvarIn, "int", iNumDig, "int", iIncLead, "int", iUseParens, "int", iGroup, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Formats a variant containing currency values into a string form.
     * @param {Pointer<VARIANT>} pvarIn The variant.
     * @param {Integer} iNumDig The number of digits to pad to after the decimal point. Specify -1 to use the system default value.
     * @param {Integer} iIncLead Specifies whether to include the leading digit on numbers.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include the leading digit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not include the leading digit.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iUseParens Specifies whether negative numbers should use parentheses.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use parentheses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use parentheses.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iGroup Specifies whether thousands should be grouped. For example 10,000 versus 10000. 
     * 
     * <div class="alert"><b>Note</b>  Regular numbers and currencies have separate system defaults for all the above options.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group thousands.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not group thousands.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags VAR_CALENDAR_HIJRI is the only flag that can be set.
     * @returns {BSTR} The formatted string that represents the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varformatcurrency
     */
    static VarFormatCurrency(pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarFormatCurrency", "ptr", pvarIn, "int", iNumDig, "int", iIncLead, "int", iUseParens, "int", iGroup, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Returns a string containing the localized name of the weekday.
     * @param {Integer} iWeekday The day of the week.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system default
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Monday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tuesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Wednesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thursday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Friday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Saturday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunday
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} fAbbrev If zero then the full (non-abbreviated) weekday name is used. If non-zero, then the abbreviation for the weekday name is used.
     * @param {Integer} iFirstDay First day of the week.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system default
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Monday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tuesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Wednesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thursday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Friday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Saturday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunday
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags VAR_CALENDAR_HIJRI is the only flag that can be set.
     * @returns {BSTR} Receives the formatted string that represents the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varweekdayname
     */
    static VarWeekdayName(iWeekday, fAbbrev, iFirstDay, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarWeekdayName", "int", iWeekday, "int", fAbbrev, "int", iFirstDay, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Returns a string containing the localized month name.
     * @param {Integer} iMonth Represents the month, as a number from 1 to 12.
     * @param {Integer} fAbbrev If zero then the full (non-abbreviated) month name is used. If non-zero, then the abbreviation for the month name is used.
     * @param {Integer} dwFlags VAR_CALENDAR_HIJRI is the only flag that can be set.
     * @returns {BSTR} Receives the formatted string that represents the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varmonthname
     */
    static VarMonthName(iMonth, fAbbrev, dwFlags) {
        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarMonthName", "int", iMonth, "int", fAbbrev, "uint", dwFlags, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Takes a tokenized format string and applies it to a variant to produce a formatted output string.
     * @param {Pointer<VARIANT>} pvarIn The variant containing the value to format.
     * @param {PWSTR} pstrFormat The original format string.
     * @param {Pointer<Integer>} pbTokCur The tokenized format string from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-vartokenizeformatstring">VarTokenizeFormatString</a>.
     * @param {Integer} dwFlags The only flags that can be set are VAR_CALENDAR_HIJRI or VAR_FORMAT_NOSUBSTITUTE.
     * @param {Integer} lcid The locale to use for the formatted output string.
     * @returns {BSTR} The formatted output string.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-varformatfromtokens
     */
    static VarFormatFromTokens(pvarIn, pstrFormat, pbTokCur, dwFlags, lcid) {
        pstrFormat := pstrFormat is String ? StrPtr(pstrFormat) : pstrFormat

        pbTokCurMarshal := pbTokCur is VarRef ? "char*" : "ptr"

        pbstrOut := BSTR()
        result := DllCall("OLEAUT32.dll\VarFormatFromTokens", "ptr", pvarIn, "ptr", pstrFormat, pbTokCurMarshal, pbTokCur, "uint", dwFlags, "ptr", pbstrOut, "uint", lcid, "int")
        if(result != 0)
            throw OSError(result)

        return pbstrOut
    }

    /**
     * Parses the actual format string into a series of tokens which can be used to format variants using VarFormatFromTokens.
     * @param {PWSTR} pstrFormat The format string. For example "mm-dd-yy".
     * @param {Pointer<Integer>} rgbTok The destination token buffer.
     * @param {Integer} cbTok The size of the destination token buffer.
     * @param {Integer} iFirstDay First day of the week.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system default
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Monday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tuesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Wednesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thursday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Friday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Saturday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunday
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} iFirstWeek First week of the year.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first week contains January 1st.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The larger half (four days) of the first week is in the current year.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first week has seven days.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} lcid The locale to interpret format string in.
     * @param {Pointer<Integer>} pcbActual Points to the integer which is set to the first generated token. This parameter can be NULL.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BUFFERTOOSMALL
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination token buffer is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-vartokenizeformatstring
     */
    static VarTokenizeFormatString(pstrFormat, rgbTok, cbTok, iFirstDay, iFirstWeek, lcid, pcbActual) {
        pstrFormat := pstrFormat is String ? StrPtr(pstrFormat) : pstrFormat

        rgbTokMarshal := rgbTok is VarRef ? "char*" : "ptr"
        pcbActualMarshal := pcbActual is VarRef ? "int*" : "ptr"

        result := DllCall("OLEAUT32.dll\VarTokenizeFormatString", "ptr", pstrFormat, rgbTokMarshal, rgbTok, "int", cbTok, "int", iFirstDay, "int", iFirstWeek, "uint", lcid, pcbActualMarshal, pcbActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Computes a hash value for the specified name.
     * @param {Integer} syskind The SYSKIND of the target operating system.
     * @param {Integer} lcid The LCID for the string.
     * @param {PSTR} szName The string whose hash value is to be computed.
     * @returns {Integer} A hash value that represents the specified name.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-lhashvalofnamesysa
     */
    static LHashValOfNameSysA(syskind, lcid, szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := DllCall("OLEAUT32.dll\LHashValOfNameSysA", "int", syskind, "uint", lcid, "ptr", szName, "uint")
        return result
    }

    /**
     * Computes a hash value for a name.
     * @param {Integer} syskind The SYSKIND of the target operating system.
     * @param {Integer} lcid The LCID for the string.
     * @param {PWSTR} szName The string whose hash value is to be computed.
     * @returns {Integer} A hash value that represents the passed-in name.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-lhashvalofnamesys
     */
    static LHashValOfNameSys(syskind, lcid, szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := DllCall("OLEAUT32.dll\LHashValOfNameSys", "int", syskind, "uint", lcid, "ptr", szName, "uint")
        return result
    }

    /**
     * Loads and registers a type library.
     * @param {PWSTR} szFile The name of the file from which the method should attempt to load a type library.
     * @returns {ITypeLib} The loaded type library.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-loadtypelib
     */
    static LoadTypeLib(szFile) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("OLEAUT32.dll\LoadTypeLib", "ptr", szFile, "ptr*", &pptlib := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ITypeLib(pptlib)
    }

    /**
     * Loads a type library and (optionally) registers it in the system registry.  .
     * @param {PWSTR} szFile The type library file.
     * @param {Integer} regkind Identifies the kind of registration to perform for the type library based on the following flags: DEFAULT, REGISTER and NONE. REGKIND_DEFAULT simply calls LoadTypeLib and registration occurs based on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-loadtypelib">LoadTypeLib</a> registration rules. REGKIND_NONE calls <b>LoadTypeLib</b> without the registration process enabled. REGKIND_REGISTER calls <b>LoadTypeLib</b> followed by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-registertypelib">RegisterTypeLib</a>, which registers the type library. To unregister the type library, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-unregistertypelib">UnRegisterTypeLib</a>.
     * @returns {ITypeLib} The type library.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-loadtypelibex
     */
    static LoadTypeLibEx(szFile, regkind) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("OLEAUT32.dll\LoadTypeLibEx", "ptr", szFile, "int", regkind, "ptr*", &pptlib := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ITypeLib(pptlib)
    }

    /**
     * Uses registry information to load a type library.
     * @param {Pointer<Guid>} rguid The GUID of the library.
     * @param {Integer} wVerMajor The major version of the library.
     * @param {Integer} wVerMinor The minor version of the library.
     * @param {Integer} lcid The national language code of the library.
     * @returns {ITypeLib} The loaded type library.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-loadregtypelib
     */
    static LoadRegTypeLib(rguid, wVerMajor, wVerMinor, lcid) {
        result := DllCall("OLEAUT32.dll\LoadRegTypeLib", "ptr", rguid, "ushort", wVerMajor, "ushort", wVerMinor, "uint", lcid, "ptr*", &pptlib := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ITypeLib(pptlib)
    }

    /**
     * Retrieves the path of a registered type library.
     * @param {Pointer<Guid>} guid The GUID of the library.
     * @param {Integer} wMaj The major version number of the library.
     * @param {Integer} wMin The minor version number of the library.
     * @param {Integer} lcid The national language code for the library.
     * @returns {BSTR} The type library name.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-querypathofregtypelib
     */
    static QueryPathOfRegTypeLib(guid, wMaj, wMin, lcid) {
        lpbstrPathName := BSTR()
        result := DllCall("OLEAUT32.dll\QueryPathOfRegTypeLib", "ptr", guid, "ushort", wMaj, "ushort", wMin, "uint", lcid, "ptr", lpbstrPathName, "int")
        if(result != 0)
            throw OSError(result)

        return lpbstrPathName
    }

    /**
     * Adds information about a type library to the system registry.
     * @param {ITypeLib} ptlib The type library.
     * @param {PWSTR} szFullPath The fully qualified path specification for the type library.
     * @param {PWSTR} szHelpDir The directory in which the Help file for the library being registered can be found. This parameter can be null.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_IOERROR
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not write to the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_REGISTRYACCESS
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system registration database could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-registertypelib
     */
    static RegisterTypeLib(ptlib, szFullPath, szHelpDir) {
        szFullPath := szFullPath is String ? StrPtr(szFullPath) : szFullPath
        szHelpDir := szHelpDir is String ? StrPtr(szHelpDir) : szHelpDir

        result := DllCall("OLEAUT32.dll\RegisterTypeLib", "ptr", ptlib, "ptr", szFullPath, "ptr", szHelpDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes type library information from the system registry. Use this API to allow applications to properly uninstall themselves.
     * @param {Pointer<Guid>} libID The GUID of the type library.
     * @param {Integer} wVerMajor The major version of the type library.
     * @param {Integer} wVerMinor The minor version of the type library.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} syskind The target operating system.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_IOERROR
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not write to the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_REGISTRYACCESS
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system registration database could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-unregistertypelib
     */
    static UnRegisterTypeLib(libID, wVerMajor, wVerMinor, lcid, syskind) {
        result := DllCall("OLEAUT32.dll\UnRegisterTypeLib", "ptr", libID, "ushort", wVerMajor, "ushort", wVerMinor, "uint", lcid, "int", syskind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a type library for use by the calling user.
     * @param {ITypeLib} ptlib The type library.
     * @param {PWSTR} szFullPath The fully qualified path specification for the type library.
     * @param {PWSTR} szHelpDir The directory in which the Help file for the library being registered can be found. This parameter can be null.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_IOERROR
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not write to the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_REGISTRYACCESS
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system registration database could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-registertypelibforuser
     */
    static RegisterTypeLibForUser(ptlib, szFullPath, szHelpDir) {
        szFullPath := szFullPath is String ? StrPtr(szFullPath) : szFullPath
        szHelpDir := szHelpDir is String ? StrPtr(szHelpDir) : szHelpDir

        result := DllCall("OLEAUT32.dll\RegisterTypeLibForUser", "ptr", ptlib, "ptr", szFullPath, "ptr", szHelpDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes type library information that was registered by using RegisterTypeLibForUser.
     * @param {Pointer<Guid>} libID The GUID of the library.
     * @param {Integer} wMajorVerNum The major version of the type library.
     * @param {Integer} wMinorVerNum The minor version of the type library.
     * @param {Integer} lcid The locale identifier.
     * @param {Integer} syskind The target operating system.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_IOERROR
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not write to the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_REGISTRYACCESS
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system registration database could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library could not be opened.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-unregistertypelibforuser
     */
    static UnRegisterTypeLibForUser(libID, wMajorVerNum, wMinorVerNum, lcid, syskind) {
        result := DllCall("OLEAUT32.dll\UnRegisterTypeLibForUser", "ptr", libID, "ushort", wMajorVerNum, "ushort", wMinorVerNum, "uint", lcid, "int", syskind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides access to a new object instance that supports the ICreateTypeLib interface.
     * @param {Integer} syskind The target operating system for which to create a type library.
     * @param {PWSTR} szFile The name of the file to create.
     * @returns {ICreateTypeLib} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypelib">ICreateTypeLib</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-createtypelib
     */
    static CreateTypeLib(syskind, szFile) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("OLEAUT32.dll\CreateTypeLib", "int", syskind, "ptr", szFile, "ptr*", &ppctlib := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ICreateTypeLib(ppctlib)
    }

    /**
     * Creates a type library in the current file format.
     * @param {Integer} syskind The target operating system for which to create a type library.
     * @param {PWSTR} szFile The name of the file to create.
     * @returns {ICreateTypeLib2} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypelib2">ICreateTypeLib2</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-createtypelib2
     */
    static CreateTypeLib2(syskind, szFile) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := DllCall("OLEAUT32.dll\CreateTypeLib2", "int", syskind, "ptr", szFile, "ptr*", &ppctlib := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ICreateTypeLib2(ppctlib)
    }

    /**
     * Retrieves a parameter from the DISPPARAMS structure, checking both named parameters and positional parameters, and coerces the parameter to the specified type.
     * @param {Pointer<DISPPARAMS>} pdispparams The parameters passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">Invoke</a>.
     * @param {Integer} position The position of the parameter in the parameter list. <b>DispGetParam</b> starts at the end of the array, so if position is 0, the last parameter in the array is returned.
     * @param {Integer} vtTarg The type the argument should be coerced to.
     * @param {Pointer<VARIANT>} pvarResult the variant to pass the parameter into.
     * @returns {Integer} On return, the index of the argument that caused a DISP_E_TYPEMISMATCH error. This pointer is returned to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">Invoke</a> to indicate the position of the argument in DISPPARAMS that caused the error.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-dispgetparam
     */
    static DispGetParam(pdispparams, position, vtTarg, pvarResult) {
        result := DllCall("OLEAUT32.dll\DispGetParam", "ptr", pdispparams, "uint", position, "ushort", vtTarg, "ptr", pvarResult, "uint*", &puArgErr := 0, "int")
        if(result != 0)
            throw OSError(result)

        return puArgErr
    }

    /**
     * Low-level helper for Invoke that provides machine independence for customized Invoke.
     * @param {ITypeInfo} ptinfo The type information for an interface. This type information is specific to one interface and language code, so it is not necessary to pass an interface identifier (IID) or LCID to this function.
     * @param {Pointer<PWSTR>} rgszNames An array of name strings that can be the same array passed to DispInvoke in the DISPPARAMS structure. If <i>cNames</i> is greater than 1, the first name is interpreted as a method name, and subsequent names are interpreted as parameters to that method.
     * @param {Integer} cNames The number of elements in <i>rgszNames</i>.
     * @returns {Integer} An array of DISPIDs to be filled in by this function. The first ID corresponds to the method name. Subsequent IDs are interpreted as parameters to the method.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-dispgetidsofnames
     */
    static DispGetIDsOfNames(ptinfo, rgszNames, cNames) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\DispGetIDsOfNames", "ptr", ptinfo, rgszNamesMarshal, rgszNames, "uint", cNames, "int*", &rgdispid := 0, "int")
        if(result != 0)
            throw OSError(result)

        return rgdispid
    }

    /**
     * Automatically calls member functions on an interface, given the type information for the interface.
     * @param {Pointer<Void>} _this An implementation of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface described by <i>ptinfo</i>.
     * @param {ITypeInfo} ptinfo The type information that describes the interface.
     * @param {Integer} dispidMember The member to be invoked. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-getidsofnames">GetIDsOfNames</a> or the object's documentation to obtain the DISPID.
     * @param {Integer} wFlags Flags describing the context of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">Invoke</a> call.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_METHOD"></a><a id="dispatch_method"></a><dl>
     * <dt><b>DISPATCH_METHOD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is invoked as a method. If a property has the same name, both this and the DISPATCH_PROPERTYGET flag can be set.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_PROPERTYGET"></a><a id="dispatch_propertyget"></a><dl>
     * <dt><b>DISPATCH_PROPERTYGET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is retrieved as a property or data member.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_PROPERTYPUT"></a><a id="dispatch_propertyput"></a><dl>
     * <dt><b>DISPATCH_PROPERTYPUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is changed as a property or data member.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_PROPERTYPUTREF"></a><a id="dispatch_propertyputref"></a><dl>
     * <dt><b>DISPATCH_PROPERTYPUTREF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is changed by a reference assignment, rather than a value assignment. This flag is valid only when the property accepts a reference to an object.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DISPPARAMS>} pparams Pointer to a structure containing an array of arguments, an array of argument DISPIDs for named arguments, and counts for number of elements in the arrays.
     * @param {Pointer<VARIANT>} pvarResult Pointer to where the result is to be stored, or Null if the caller expects no result. This argument is ignored if DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF is specified.
     * @param {Pointer<EXCEPINFO>} pexcepinfo Pointer to a structure containing exception information. This structure should be filled in if DISP_E_EXCEPTION is returned.
     * @param {Pointer<Integer>} puArgErr The index within rgvarg of the first argument that has an error. Arguments are stored in pdispparams-&gt;rgvarg in reverse order, so the first argument is the one with the highest index in the array. This parameter is returned only when the resulting return value is DISP_E_TYPEMISMATCH or DISP_E_PARAMNOTFOUND.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADPARAMCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of elements provided to DISPPARAMS is different from the number of arguments accepted by the method or property.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments in DISPPARAMS is not a valid variant type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application needs to raise an exception. In this case, the structure passed in <i>pexcepinfo</i> should be filled in.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_MEMBERNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested member does not exist.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_NONAMEDARGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This implementation of <a href="/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> does not support named arguments.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments in DISPPARAMS could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_PARAMNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter IDs does not correspond to a parameter on the method. In this case, <i>puArgErr</i> is set to the first argument that contains the error.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_PARAMNOTOPTIONAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter was omitted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments could not be coerced. The index of the first parameter with the incorrect type within rgvarg is returned in <i>puArgErr</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Any of the <b>ITypeInfo::Invoke</b> errors can also be returned.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-dispinvoke
     */
    static DispInvoke(_this, ptinfo, dispidMember, wFlags, pparams, pvarResult, pexcepinfo, puArgErr) {
        _thisMarshal := _this is VarRef ? "ptr" : "ptr"
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := DllCall("OLEAUT32.dll\DispInvoke", _thisMarshal, _this, "ptr", ptinfo, "int", dispidMember, "ushort", wFlags, "ptr", pparams, "ptr", pvarResult, "ptr", pexcepinfo, puArgErrMarshal, puArgErr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates simplified type information for use in an implementation of IDispatch.
     * @param {Pointer<INTERFACEDATA>} pidata The interface description that this type information describes.
     * @param {Integer} lcid The locale identifier for the names used in the type information.
     * @returns {ITypeInfo} On return, pointer to a type information implementation for use in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-dispgetidsofnames">DispGetIDsOfNames</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-dispinvoke">DispInvoke</a>.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-createdisptypeinfo
     */
    static CreateDispTypeInfo(pidata, lcid) {
        result := DllCall("OLEAUT32.dll\CreateDispTypeInfo", "ptr", pidata, "uint", lcid, "ptr*", &pptinfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ITypeInfo(pptinfo)
    }

    /**
     * Creates a standard implementation of the IDispatch interface through a single function call. This simplifies exposing objects through Automation.
     * @param {IUnknown} punkOuter The object's <b>IUnknown</b> implementation.
     * @param {Pointer<Void>} pvThis The object to expose.
     * @param {ITypeInfo} ptinfo The type information that describes the exposed object.
     * @returns {IUnknown} The private unknown for the object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface QueryInterface call. This pointer is null if the function fails.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-createstddispatch
     */
    static CreateStdDispatch(punkOuter, pvThis, ptinfo) {
        pvThisMarshal := pvThis is VarRef ? "ptr" : "ptr"

        result := DllCall("OLEAUT32.dll\CreateStdDispatch", "ptr", punkOuter, pvThisMarshal, pvThis, "ptr", ptinfo, "ptr*", &ppunkStdDisp := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppunkStdDisp)
    }

    /**
     * Low-level helper for Invoke that provides machine independence for customized Invoke.
     * @param {Pointer<Void>} pvInstance An instance of the interface described by this type description.
     * @param {Pointer} oVft For FUNC_VIRTUAL functions, specifies the offset in the VTBL.
     * @param {Integer} cc The calling convention. One of the CALLCONV values, such as CC_STDCALL.
     * @param {Integer} vtReturn The variant type of the function return value. Use VT_EMPTY to represent void.
     * @param {Integer} cActuals The number of function parameters.
     * @param {Pointer<Integer>} prgvt An array of variant types of the function parameters.
     * @param {Pointer<Pointer<VARIANT>>} prgpvarg The function parameters.
     * @param {Pointer<VARIANT>} pvargResult The function result.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-dispcallfunc
     */
    static DispCallFunc(pvInstance, oVft, cc, vtReturn, cActuals, prgvt, prgpvarg, pvargResult) {
        pvInstanceMarshal := pvInstance is VarRef ? "ptr" : "ptr"
        prgvtMarshal := prgvt is VarRef ? "ushort*" : "ptr"
        prgpvargMarshal := prgpvarg is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLEAUT32.dll\DispCallFunc", pvInstanceMarshal, pvInstance, "ptr", oVft, "int", cc, "ushort", vtReturn, "uint", cActuals, prgvtMarshal, prgvt, prgpvargMarshal, prgpvarg, "ptr", pvargResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers an object as the active object for its class.
     * @param {IUnknown} punk The active object.
     * @param {Pointer<Guid>} rclsid The CLSID of the active object.
     * @param {Integer} dwFlags Flags controlling registration of the object. Possible values are ACTIVEOBJECT_STRONG and ACTIVEOBJECT_WEAK.
     * @param {Pointer<Integer>} pdwRegister Receives a handle. This handle must be passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-revokeactiveobject">RevokeActiveObject</a> to end the object's active status.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-registeractiveobject
     */
    static RegisterActiveObject(punk, rclsid, dwFlags, pdwRegister) {
        pdwRegisterMarshal := pdwRegister is VarRef ? "uint*" : "ptr"

        result := DllCall("OLEAUT32.dll\RegisterActiveObject", "ptr", punk, "ptr", rclsid, "uint", dwFlags, pdwRegisterMarshal, pdwRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Ends an object's status as active.
     * @param {Integer} dwRegister A handle previously returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-registeractiveobject">RegisterActiveObject</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-revokeactiveobject
     */
    static RevokeActiveObject(dwRegister) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLEAUT32.dll\RevokeActiveObject", "uint", dwRegister, "ptr", pvReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a pointer to a running object that has been registered with OLE.
     * @param {Pointer<Guid>} rclsid The class identifier (CLSID) of the active object from the OLE registration database.
     * @returns {IUnknown} The requested active object.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-getactiveobject
     */
    static GetActiveObject(rclsid) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLEAUT32.dll\GetActiveObject", "ptr", rclsid, "ptr", pvReserved, "ptr*", &ppunk := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppunk)
    }

    /**
     * Creates an instance of a generic error object.
     * @returns {ICreateErrorInfo} A system-implemented generic error object.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-createerrorinfo
     */
    static CreateErrorInfo() {
        result := DllCall("OLEAUT32.dll\CreateErrorInfo", "ptr*", &pperrinfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ICreateErrorInfo(pperrinfo)
    }

    /**
     * Returns a pointer to the IRecordInfo interface of the UDT by passing its type information.
     * @param {ITypeInfo} pTypeInfo The type information of a record.
     * @returns {IRecordInfo} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-irecordinfo">IRecordInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-getrecordinfofromtypeinfo
     */
    static GetRecordInfoFromTypeInfo(pTypeInfo) {
        result := DllCall("OLEAUT32.dll\GetRecordInfoFromTypeInfo", "ptr", pTypeInfo, "ptr*", &ppRecInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IRecordInfo(ppRecInfo)
    }

    /**
     * Returns a pointer to the IRecordInfo interface for a UDT by passing the GUID of the type information without having to load the type library.
     * @param {Pointer<Guid>} rGuidTypeLib The GUID of the type library containing the UDT.
     * @param {Integer} uVerMajor The major version number of the type library of the UDT.
     * @param {Integer} uVerMinor The minor version number of the type library of the UDT.
     * @param {Integer} lcid The locale ID of the caller.
     * @param {Pointer<Guid>} rGuidTypeInfo The GUID of the typeinfo that describes the UDT.
     * @returns {IRecordInfo} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-irecordinfo">IRecordInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-getrecordinfofromguids
     */
    static GetRecordInfoFromGuids(rGuidTypeLib, uVerMajor, uVerMinor, lcid, rGuidTypeInfo) {
        result := DllCall("OLEAUT32.dll\GetRecordInfoFromGuids", "ptr", rGuidTypeLib, "uint", uVerMajor, "uint", uVerMinor, "uint", lcid, "ptr", rGuidTypeInfo, "ptr*", &ppRecInfo := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IRecordInfo(ppRecInfo)
    }

    /**
     * Retrieves the build version of OLE Automation.
     * @returns {Integer} The build number.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-oabuildversion
     */
    static OaBuildVersion() {
        result := DllCall("OLEAUT32.dll\OaBuildVersion", "uint")
        return result
    }

    /**
     * Releases memory used to hold the custom data item.
     * @param {Pointer<CUSTDATA>} pCustData The custom data item to be released.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-clearcustdata
     */
    static ClearCustData(pCustData) {
        DllCall("OLEAUT32.dll\ClearCustData", "ptr", pCustData)
    }

    /**
     * Enables the RegisterTypeLib function to override default registry mappings under Windows Vista Service Pack 1 (SP1), Windows Server 2008, and later operating system versions.
     * @remarks
     * 
     * Consider the following scenario: You are running an application on a computer that is running Windows Vista SP1 or later. In your application, you have overridden the HKEY_CLASSES_ROOT registry subtree and mapped it to another registry subtree. (For example, perhaps you mapped HKEY_CLASSES_ROOT to HKEY_CURRENT_USER.) You then attempt to register a type library by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-registertypelib">RegisterTypeLib</a>, and you receive an "access denied" error message. Additionally, <b>RegisterTypeLib</b> returns the TYPE_E_REGISTRYACCESS (0x8002801c) value.
     * 
     * 
     * 
     * This problem occurs if User Account Control (UAC) is enabled, and the application is running under a limited user account.
     * 
     * 
     * 
     * You can resolve this problem in one of two ways:
     * 
     * 
     * 
     * <ul>
     * <li>
     * Use the <b>OaEnablePerUserTLibRegistration</b> function. Before your application calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-registertypelib">RegisterTypeLib</a>, it should call <b>OaEnablePerUserTLibRegistration</b>. This enables <b>RegisterTypeLib</b> to accept the registry override mapping. The <b>OaEnablePerUserTLibRegistration</b> function is exported from the Oleaut32.dll file. You must reference this file by using run-time dynamic linking and the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> function.
     * 
     * 
     * 
     * </li>
     * <li>
     * Set the OAPERUSERTLIBREG environment variable. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-registertypelib">RegisterTypeLib</a> will check the value of this variable. If the value of OAPERUSERTLIBREG is 1, <b>RegisterTypeLib</b> will use the appropriate override mapping. Because this environment variable is read during the initialization of the <b>DLLMain</b> function, you must set the variable before you run your application. To do this, run one of the following commands at a command prompt:
     * 
     * 
     * 
     * <b>set OAPERUSERTLIBREG=1</b>
     * 
     * - or -
     * 
     * 
     * 
     * <b>start cmd.exe /c "set OAPERUSERTLIBREG=1 &amp;&amp; </b><i>MyApp.exe</i><b>"
     * 
     * </b>
     * 
     * </li>
     * </ul>
     * When using run-time dynamic linking it should be noted that the setting to enable per-user type library registration is a global setting in oleaut32.dll, so if oleaut32.dll is unloaded then this setting is lost.
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-oaenableperusertlibregistration
     */
    static OaEnablePerUserTLibRegistration() {
        DllCall("OLEAUT32.dll\OaEnablePerUserTLibRegistration")
    }

    /**
     * This function is obsolete.
     * @returns {Integer} Obsolete.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olebuildversion
     */
    static OleBuildVersion() {
        result := DllCall("ole32.dll\OleBuildVersion", "uint")
        return result
    }

    /**
     * Initializes the COM library on the current apartment, identifies the concurrency model as single-thread apartment (STA), and enables additional functionality described in the Remarks section below.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The COM library is already initialized on this apartment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_WRONGCOMPOBJ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The versions of COMPOBJ.DLL and OLE2.DLL on your machine are incompatible with each other.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CHANGED_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A previous call to <a href="/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> specified the concurrency model for this apartment as multithread apartment (MTA). This could also mean that a change from neutral threaded apartment to single threaded apartment occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleinitialize
     * @since windows5.0
     */
    static OleInitialize() {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\OleInitialize", "ptr", pvReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes the COM library on the apartment, releases any class factories, other COM objects, or servers held by the apartment, disables RPC on the apartment, and frees any resources the apartment maintains.
     * @remarks
     * 
     * Call <b>OleUninitialize</b> on application shutdown, as the last COM library call, if the apartment was initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a>. <b>OleUninitialize</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> function internally to shut down the OLE Component Object(COM) Library.
     * 
     * If the COM library was initialized on the apartment with a call to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>, it must be closed with a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> and <b>OleUninitialize</b> calls must be balanced. If there are multiple calls to the <b>OleInitialize</b> function, there must be the same number of calls to <b>OleUninitialize</b>; only the <b>OleUninitialize</b> call corresponding to the <b>OleInitialize</b> call that actually initialized the library can close it.
     * 
     * Because there is no way to control the order in which in-process servers are loaded or unloaded, do not call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> or <b>OleUninitialize</b> from the <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleuninitialize
     * @since windows5.0
     */
    static OleUninitialize() {
        DllCall("OLE32.dll\OleUninitialize")
    }

    /**
     * Determines whether an OLE linked object (rather than an OLE embedded object) can be created from a clipboard data object.
     * @param {IDataObject} pSrcDataObject Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the clipboard data object from which the object is to be created.
     * @returns {HRESULT} Returns S_OK if the <a href="/windows/desktop/api/ole2/nf-ole2-olecreatelinkfromdata">OleCreateLinkFromData</a> function can be used to create the linked object; otherwise S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olequerylinkfromdata
     * @since windows5.0
     */
    static OleQueryLinkFromData(pSrcDataObject) {
        result := DllCall("OLE32.dll\OleQueryLinkFromData", "ptr", pSrcDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Checks whether a data object has one of the formats that would allow it to become an embedded object through a call to either the OleCreateFromData or OleCreateStaticFromData function.
     * @param {IDataObject} pSrcDataObject Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data transfer object to be queried.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No formats are present that support either embedded- or static-object creation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_S_STATIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Formats that support static-object creation are present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olequerycreatefromdata
     * @since windows5.0
     */
    static OleQueryCreateFromData(pSrcDataObject) {
        result := DllCall("OLE32.dll\OleQueryCreateFromData", "ptr", pSrcDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an embedded object identified by a CLSID. You use it typically to implement the menu item that allows the end user to insert a new object.
     * @param {Pointer<Guid>} rclsid CLSID of the embedded object that is to be created.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface, usually IID_IOleObject (defined in the OLE headers as the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>), through which the caller will communicate with the new object.
     * @param {Integer} renderopt A value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a>, indicating the locally cached drawing capabilities the newly created object is to have. The <b>OLERENDER</b> value chosen affects the possible values for the <i>pFormatEtc</i> parameter.
     * @param {Pointer<FORMATETC>} pFormatEtc Depending on which of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> flags is used as the value of renderopt, pointer to one of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> enumeration values. Refer to the <b>OLERENDER</b> enumeration for restrictions. This parameter, along with the <i>renderopt</i> parameter, specifies what the new object can cache initially.
     * @param {IOleClientSite} pClientSite If you want <b>OleCreate</b> to call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a>, pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface on the container. The value may be <b>NULL</b>, in which case you must specifically call <b>IOleObject::SetClientSite</b> before attempting operations.
     * @param {IStorage} pStg Pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object. This parameter may not be <b>NULL</b>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObject</i> contains the requested interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreate
     * @since windows5.0
     */
    static OleCreate(rclsid, riid, renderopt, pFormatEtc, pClientSite, pStg) {
        result := DllCall("OLE32.dll\OleCreate", "ptr", rclsid, "ptr", riid, "uint", renderopt, "ptr", pFormatEtc, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Extends OleCreate functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple presentation formats or data, instead of the single format supported by OleCreate.
     * @param {Pointer<Guid>} rclsid Identifies the class of the object to create.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface of the object to return.
     * @param {Integer} dwFlags This value can be 0 or OLECREATE_LEAVERUNNING    (0x00000001).
     * @param {Integer} renderopt Value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> enumeration.
     * @param {Integer} cFormats When renderopt is OLERENDER_FORMAT, indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the <i>rgFormatEtc</i> array, which must be at least one. In all other cases, this parameter must be zero.
     * @param {Pointer<Integer>} rgAdvf When renderopt is OLERENDER_FORMAT, points to an array of cFormats DWORD elements, each of which is a combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. Each element of this array is passed in as the <i>advf</i> parameter to a call to either <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, depending on whether <i>pAdviseSink</i> is <b>NULL</b> or non-<b>NULL</b> (see below). In all other cases, this parameter must be <b>NULL</b>.
     * @param {Pointer<FORMATETC>} rgFormatEtc When renderopt is OLERENDER_FORMAT, points to an array of cFormats <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. When <i>pAdviseSink</i> is <b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a>. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When <i>pAdviseSink</i> is non-<b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object. In all other cases, this parameter must be <b>NULL</b>.
     * @param {IAdviseSink} lpAdviseSink When <i>renderopt</i> is OLERENDER_FORMAT, may be either a valid <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> pointer, indicating custom caching or processing of data advises, or <b>NULL</b>, indicating default caching of data formats. In all other cases, this parameter must be <b>NULL</b>.
     * @param {Pointer<Integer>} rgdwConnection Location to return the array of <i>dwConnection</i> values returned when the <i>pAdviseSink</i> interface is registered for each advisory connection using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, or <b>NULL</b> if the returned advisory connections are not needed. Must be <b>NULL</b>, if <i>pAdviseSink</i> is <b>NULL</b>.
     * @param {IOleClientSite} pClientSite Pointer to the primary interface through which the object will request services from its container. This parameter may be <b>NULL</b>, in which case it is the caller's responsibility to establish the client site as soon as possible using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a>.
     * @param {IStorage} pStg Pointer to the storage to use for the object and any default data or presentation caching established for it. This parameter may not be <b>NULL</b>.
     * @param {Pointer<Pointer<Void>>} ppvObj Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided interface identifier is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreateex
     * @since windows5.0
     */
    static OleCreateEx(rclsid, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj) {
        rgAdvfMarshal := rgAdvf is VarRef ? "uint*" : "ptr"
        rgdwConnectionMarshal := rgdwConnection is VarRef ? "uint*" : "ptr"
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\OleCreateEx", "ptr", rclsid, "ptr", riid, "uint", dwFlags, "uint", renderopt, "uint", cFormats, rgAdvfMarshal, rgAdvf, "ptr", rgFormatEtc, "ptr", lpAdviseSink, rgdwConnectionMarshal, rgdwConnection, "ptr", pClientSite, "ptr", pStg, ppvObjMarshal, ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an embedded object from a data transfer object retrieved either from the clipboard or as part of an OLE drag-and-drop operation. It is intended to be used to implement a paste from an OLE drag-and-drop operation.
     * @param {IDataObject} pSrcDataObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data transfer object that holds the data from which the object is created.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>).
     * @param {Integer} renderopt Value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the following Remarks section.
     * @param {Pointer<FORMATETC>} pFormatEtc Pointer to a value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The <b>OLERENDER</b> value chosen affects the possible values for the <i>pFormatEtc</i> parameter.
     * @param {IOleClientSite} pClientSite Pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a>, the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object. This parameter may not be <b>NULL</b>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatefromdata
     * @since windows5.0
     */
    static OleCreateFromData(pSrcDataObj, riid, renderopt, pFormatEtc, pClientSite, pStg) {
        result := DllCall("OLE32.dll\OleCreateFromData", "ptr", pSrcDataObj, "ptr", riid, "uint", renderopt, "ptr", pFormatEtc, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Extends OleCreateFromData functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentation or data, instead of the single format supported by OleCreateFromData.
     * @param {IDataObject} pSrcDataObj Pointer to the data transfer object holding the new data used to create the new object. (see <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatefromdata">OleCreateFromData</a>).
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface of the object to return.
     * @param {Integer} dwFlags This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
     * @param {Integer} renderopt Value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> enumeration.
     * @param {Integer} cFormats When <i>renderopt</i> is OLERENDER_FORMAT, indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the <i>rgFormatEtc</i> array, which must be at least one. In all other cases, this parameter must be zero.
     * @param {Pointer<Integer>} rgAdvf When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <b>DWORD</b> elements, each of which is a combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. Each element of this array is passed in as the advf parameter to a call to either <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, depending on whether <i>pAdviseSink</i> is <b>NULL</b> or non-<b>NULL</b> (see below). In all other cases, this parameter must be <b>NULL</b>.
     * @param {Pointer<FORMATETC>} rgFormatEtc When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. When <i>pAdviseSink</i> is <b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a>. This populates the data and presentation cache managed by the object's in-process handler (typically the default handler) with presentation or other cacheable data. When <i>pAdviseSink</i> is non-<b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
     * @param {IAdviseSink} lpAdviseSink When renderopt is OLERENDER_FORMAT, may be either a valid <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> pointer, indicating custom caching or processing of data advises, or <b>NULL</b>, indicating default caching of data formats.
     * @param {Pointer<Integer>} rgdwConnection Location to return the array of dwConnection values returned when the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface is registered for each advisory connection using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, or <b>NULL</b> if the returned advisory connections are not needed. This parameter must be <b>NULL</b> if <i>pAdviseSink</i> is <b>NULL</b>.
     * @param {IOleClientSite} pClientSite Pointer to the primary interface through which the object will request services from its container. This parameter may be <b>NULL</b>, in which case it is the caller's responsibility to establish the client site as soon as possible using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a>.
     * @param {IStorage} pStg Pointer to the storage to use for the object and any default data or presentation caching established for it.
     * @param {Pointer<Pointer<Void>>} ppvObj Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided interface identifier is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatefromdataex
     * @since windows5.0
     */
    static OleCreateFromDataEx(pSrcDataObj, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj) {
        rgAdvfMarshal := rgAdvf is VarRef ? "uint*" : "ptr"
        rgdwConnectionMarshal := rgdwConnection is VarRef ? "uint*" : "ptr"
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\OleCreateFromDataEx", "ptr", pSrcDataObj, "ptr", riid, "uint", dwFlags, "uint", renderopt, "uint", cFormats, rgAdvfMarshal, rgAdvf, "ptr", rgFormatEtc, "ptr", lpAdviseSink, rgdwConnectionMarshal, rgdwConnection, "ptr", pClientSite, "ptr", pStg, ppvObjMarshal, ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a linked object from a data transfer object retrieved either from the clipboard or as part of an OLE drag-and-drop operation.
     * @param {IDataObject} pSrcDataObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data transfer object from which the linked object is to be created.
     * @param {Pointer<Guid>} riid Reference to the identifier of interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>).
     * @param {Integer} renderopt Value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the following Remarks section.
     * @param {Pointer<FORMATETC>} pFormatEtc Pointer to a value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The <b>OLERENDER</b> value chosen affects the possible values for the <i>pFormatEtc</i> parameter.
     * @param {IOleClientSite} pClientSite Pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a>, the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object. This parameter cannot be <b>NULL</b>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return,   <i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatelinkfromdata
     * @since windows5.0
     */
    static OleCreateLinkFromData(pSrcDataObj, riid, renderopt, pFormatEtc, pClientSite, pStg) {
        result := DllCall("OLE32.dll\OleCreateLinkFromData", "ptr", pSrcDataObj, "ptr", riid, "uint", renderopt, "ptr", pFormatEtc, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Extends OleCreateLinkFromData functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentations or data, instead of the single format supported by OleCreateLinkFromData.
     * @param {IDataObject} pSrcDataObj Pointer to the data object to create a link object from.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface of the object to return.
     * @param {Integer} dwFlags This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
     * @param {Integer} renderopt Value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> enumeration.
     * @param {Integer} cFormats When <i>renderopt</i> is OLERENDER_FORMAT, indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the <i>rgFormatEtc</i> array, which must be at least one. In all other cases, this parameter must be zero.
     * @param {Pointer<Integer>} rgAdvf When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <b>DWORD</b> elements, each of which is a combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. Each element of this array is passed in as the <i>advf</i> parameter to a call to either <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, depending on whether <i>pAdviseSink</i> is <b>NULL</b> or non-<b>NULL</b> (see below). In all other cases, this parameter must be <b>NULL</b>.
     * @param {Pointer<FORMATETC>} rgFormatEtc When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. When <i>pAdviseSink</i> is <b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a>. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When <i>pAdviseSink</i> is non-<b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
     * @param {IAdviseSink} lpAdviseSink When <i>renderopt</i> is OLERENDER_FORMAT, may be either a valid <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> pointer, indicating custom caching or processing of data advises, or <b>NULL</b>, indicating default caching of data formats.
     * @param {Pointer<Integer>} rgdwConnection Location to return the array of <i>dwConnection</i> values returned when the <i>pAdviseSink</i> interface is registered for each advisory connection using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, or <b>NULL</b> if the returned advisory connections are not needed. This parameter must be <b>NULL</b> if <i>pAdviseSink</i> is <b>NULL</b>.
     * @param {IOleClientSite} pClientSite Pointer to the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>, in which case it is the caller's responsibility to establish the client site as soon as possible using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a>.
     * @param {IStorage} pStg Pointer to the storage to use for the object and any default data or presentation caching established for it.
     * @returns {Pointer<Void>} Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatelinkfromdataex
     * @since windows5.0
     */
    static OleCreateLinkFromDataEx(pSrcDataObj, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg) {
        rgAdvfMarshal := rgAdvf is VarRef ? "uint*" : "ptr"
        rgdwConnectionMarshal := rgdwConnection is VarRef ? "uint*" : "ptr"

        result := DllCall("ole32.dll\OleCreateLinkFromDataEx", "ptr", pSrcDataObj, "ptr", riid, "uint", dwFlags, "uint", renderopt, "uint", cFormats, rgAdvfMarshal, rgAdvf, "ptr", rgFormatEtc, "ptr", lpAdviseSink, rgdwConnectionMarshal, rgdwConnection, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Creates a static object, that contains only a representation, with no native data, from a data transfer object.
     * @param {IDataObject} pSrcDataObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data transfer object that holds the data from which the object will be created.
     * @param {Pointer<Guid>} iid Reference to the identifier of the interface with which the caller is to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>).
     * @param {Integer} renderopt Value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> indicating the locally cached drawing or data-retrieval capabilities that the container wants in the newly created component. It is an error to pass the render options OLERENDER_NONE or OLERENDER_ASIS to this function.
     * @param {Pointer<FORMATETC>} pFormatEtc Depending on which of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> flags is used as the value of <i>renderopt</i>, may be a pointer to one of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> enumeration values. Refer to the <b>OLERENDER</b> enumeration for restrictions.
     * @param {IOleClientSite} pClientSite Pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a>, the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface for storage for the object. This parameter cannot be <b>NULL</b>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatestaticfromdata
     * @since windows5.0
     */
    static OleCreateStaticFromData(pSrcDataObj, iid, renderopt, pFormatEtc, pClientSite, pStg) {
        result := DllCall("OLE32.dll\OleCreateStaticFromData", "ptr", pSrcDataObj, "ptr", iid, "uint", renderopt, "ptr", pFormatEtc, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Creates an OLE compound-document linked object.
     * @param {IMoniker} pmkLinkSrc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker that can be used to locate the source of the linked object.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>).
     * @param {Integer} renderopt Specifies a value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the Remarks section below.
     * @param {Pointer<FORMATETC>} lpFormatEtc Pointer to a value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The <b>OLERENDER</b> value chosen affects the possible values for the <i>lpFormatEtc</i> parameter.
     * @param {IOleClientSite} pClientSite Pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a>, the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object. This parameter cannot be <b>NULL</b>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatelink
     * @since windows5.0
     */
    static OleCreateLink(pmkLinkSrc, riid, renderopt, lpFormatEtc, pClientSite, pStg) {
        result := DllCall("ole32.dll\OleCreateLink", "ptr", pmkLinkSrc, "ptr", riid, "uint", renderopt, "ptr", lpFormatEtc, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Extends OleCreateLink functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentations or data, instead of the single format supported by OleCreateLink.
     * @param {IMoniker} pmkLinkSrc Pointer to a moniker to the object to create a link to.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface of the object to return.
     * @param {Integer} dwFlags This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
     * @param {Integer} renderopt Value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> enumeration.
     * @param {Integer} cFormats When <i>renderopt</i> is OLERENDER_FORMAT, indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the <i>rgFormatEtc</i> array, which must be at least one. In all other cases, this parameter must be zero.
     * @param {Pointer<Integer>} rgAdvf When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <b>DWORD</b> elements, each of which is a combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. Each element of this array is passed in as the <i>advf</i> parameter to a call to either <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, depending on whether <i>pAdviseSink</i> is <b>NULL</b> or non-<b>NULL</b> (see below). In all other cases, this parameter must be <b>NULL</b>.
     * @param {Pointer<FORMATETC>} rgFormatEtc When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. When <i>pAdviseSink</i> is <b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a>. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When <i>pAdviseSink</i> is non-<b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
     * @param {IAdviseSink} lpAdviseSink When <i>renderopt</i> is OLERENDER_FORMAT, may be either a valid <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> pointer, indicating custom caching or processing of data advises, or <b>NULL</b>, indicating default caching of data formats.
     * @param {Pointer<Integer>} rgdwConnection Location to return the array of <i>dwConnection</i> values returned when the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface is registered for each advisory connection using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, or <b>NULL</b> if the returned advisory connections are not needed. This parameter must be <b>NULL</b> if <i>pAdviseSink</i> is <b>NULL</b>.
     * @param {IOleClientSite} pClientSite Pointer to the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>, in which case it is the caller's responsibility to establish the client site as soon as possible using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a>.
     * @param {IStorage} pStg Pointer to the storage to use for the object and any default data or presentation caching established for it.
     * @param {Pointer<Pointer<Void>>} ppvObj Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided interface identifier is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatelinkex
     * @since windows5.0
     */
    static OleCreateLinkEx(pmkLinkSrc, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj) {
        rgAdvfMarshal := rgAdvf is VarRef ? "uint*" : "ptr"
        rgdwConnectionMarshal := rgdwConnection is VarRef ? "uint*" : "ptr"
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\OleCreateLinkEx", "ptr", pmkLinkSrc, "ptr", riid, "uint", dwFlags, "uint", renderopt, "uint", cFormats, rgAdvfMarshal, rgAdvf, "ptr", rgFormatEtc, "ptr", lpAdviseSink, rgdwConnectionMarshal, rgdwConnection, "ptr", pClientSite, "ptr", pStg, ppvObjMarshal, ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an object that is linked to a file.
     * @param {PWSTR} lpszFileName Pointer to a string naming the source file to be linked to.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>).
     * @param {Integer} renderopt Value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the following Remarks section.
     * @param {Pointer<FORMATETC>} lpFormatEtc Pointer to a value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The <b>OLERENDER</b> value chosen affects the possible values for the <i>pFormatEtc</i> parameter.
     * @param {IOleClientSite} pClientSite Pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a>, the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object. This parameter cannot be <b>NULL</b>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatelinktofile
     * @since windows5.0
     */
    static OleCreateLinkToFile(lpszFileName, riid, renderopt, lpFormatEtc, pClientSite, pStg) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("OLE32.dll\OleCreateLinkToFile", "ptr", lpszFileName, "ptr", riid, "uint", renderopt, "ptr", lpFormatEtc, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Extends OleCreateLinkToFile functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentations or data, instead of the single format supported by OleCreateLinkToFile.
     * @param {PWSTR} lpszFileName Pointer to the name of the file to create a link to.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface of the object to return.
     * @param {Integer} dwFlags This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
     * @param {Integer} renderopt Value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> enumeration.
     * @param {Integer} cFormats When <i>renderopt</i> is OLERENDER_FORMAT, indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the <i>rgFormatEtc</i> array, which must be at least one. In all other cases, this parameter must be zero.
     * @param {Pointer<Integer>} rgAdvf When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <b>DWORD</b> elements, each of which is a combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. Each element of this array is passed in as the <i>advf</i> parameter to a call to either <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, depending on whether <i>pAdviseSink</i> is <b>NULL</b> or non-<b>NULL</b> (see below). In all other cases, this parameter must be <b>NULL</b>.
     * @param {Pointer<FORMATETC>} rgFormatEtc When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. When <i>pAdviseSink</i> is <b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a>. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When <i>pAdviseSink</i> is non-<b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
     * @param {IAdviseSink} lpAdviseSink When <i>renderopt</i> is OLERENDER_FORMAT, may be either a valid <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> pointer, indicating custom caching or processing of data advises, or <b>NULL</b>, indicating default caching of data formats.
     * @param {Pointer<Integer>} rgdwConnection Location to return the array of <i>dwConnection</i> values returned when the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface is registered for each advisory connection using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, or <b>NULL</b> if the returned advisory connections are not needed. This parameter must be <b>NULL</b> if <i>pAdviseSink</i> is <b>NULL</b>.
     * @param {IOleClientSite} pClientSite Pointer to the primary interface through which the object will request services from its container. This parameter may be <b>NULL</b>, in which case it is the caller's responsibility to establish the client site as soon as possible using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a>.
     * @param {IStorage} pStg Pointer to the storage to use for the object and any default data or presentation caching established for it.
     * @param {Pointer<Pointer<Void>>} ppvObj Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided interface identifier is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatelinktofileex
     * @since windows5.0
     */
    static OleCreateLinkToFileEx(lpszFileName, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        rgAdvfMarshal := rgAdvf is VarRef ? "uint*" : "ptr"
        rgdwConnectionMarshal := rgdwConnection is VarRef ? "uint*" : "ptr"
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\OleCreateLinkToFileEx", "ptr", lpszFileName, "ptr", riid, "uint", dwFlags, "uint", renderopt, "uint", cFormats, rgAdvfMarshal, rgAdvf, "ptr", rgFormatEtc, "ptr", lpAdviseSink, rgdwConnectionMarshal, rgdwConnection, "ptr", pClientSite, "ptr", pStg, ppvObjMarshal, ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an embedded object from the contents of a named file.
     * @param {Pointer<Guid>} rclsid This parameter is reserved and must be CLSID_NULL.
     * @param {PWSTR} lpszFileName Pointer to a string specifying the full path of the file from which the object should be initialized.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface ID of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>).
     * @param {Integer} renderopt Value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The <b>OLERENDER</b> value chosen affects the possible values for the <i>lpFormatEtc</i> parameter.
     * @param {Pointer<FORMATETC>} lpFormatEtc Depending on which of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> flags is used as the value of <i>renderopt</i>, pointer to one of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> enumeration values. Refer also to the <b>OLERENDER</b> enumeration for restrictions.
     * @param {IOleClientSite} pClientSite Pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a>, the primary interface through which the object will request services from its container. This parameter can be <b>NULL</b>.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object. This parameter cannot be <b>NULL</b>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatefromfile
     * @since windows5.0
     */
    static OleCreateFromFile(rclsid, lpszFileName, riid, renderopt, lpFormatEtc, pClientSite, pStg) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("OLE32.dll\OleCreateFromFile", "ptr", rclsid, "ptr", lpszFileName, "ptr", riid, "uint", renderopt, "ptr", lpFormatEtc, "ptr", pClientSite, "ptr", pStg, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Extends OleCreateFromFile functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple presentation formats or data, instead of the single format supported by OleCreateFromFile.
     * @param {Pointer<Guid>} rclsid This parameter is reserved and must be CLSID_NULL.
     * @param {PWSTR} lpszFileName Pointer to the name of the file from which the new object should be initialized.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface of the object to return.
     * @param {Integer} dwFlags This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
     * @param {Integer} renderopt Value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olerender">OLERENDER</a> enumeration.
     * @param {Integer} cFormats When <i>renderopt</i> is OLERENDER_FORMAT, indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the <i>rgFormatEtc</i> array, which must be at least one. In all other cases, this parameter must be zero.
     * @param {Pointer<Integer>} rgAdvf When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <b>DWORD</b> elements, each of which is a combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. Each element of this array is passed in as the <i>advf</i> parameter to a call to either <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, depending on whether <i>pAdviseSink</i> is <b>NULL</b> or non-<b>NULL</b> (see below). In all other cases, this parameter must be <b>NULL</b>.
     * @param {Pointer<FORMATETC>} rgFormatEtc When <i>renderopt</i> is OLERENDER_FORMAT, points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. When <i>pAdviseSink</i> is <b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecache-cache">IOleCache::Cache</a>. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When <i>pAdviseSink</i> is non-<b>NULL</b>, each element of this array is passed as the <i>pFormatEtc</i> parameter to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
     * @param {IAdviseSink} lpAdviseSink When <i>renderopt</i> is OLERENDER_FORMAT, may be either a valid <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> pointer, indicating custom caching or processing of data advises, or <b>NULL</b>, indicating default caching of data formats.
     * @param {Pointer<Integer>} rgdwConnection Location to return the array of <i>dwConnection</i> values returned when the <i>pAdviseSink</i> interface is registered for each advisory connection using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>, or <b>NULL</b> if the returned advisory connections are not needed. This parameter must be <b>NULL</b> if <i>pAdviseSink</i> is <b>NULL</b>.
     * @param {IOleClientSite} pClientSite Pointer to the primary interface through which the object will request services from its container. This parameter may be <b>NULL</b>, in which case it is the caller's responsibility to establish the client site as soon as possible using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a>.
     * @param {IStorage} pStg Pointer to the storage to use for the object and any default data or presentation caching established for it.
     * @param {Pointer<Pointer<Void>>} ppvObj Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created object.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided interface identifier is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatefromfileex
     * @since windows5.0
     */
    static OleCreateFromFileEx(rclsid, lpszFileName, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        rgAdvfMarshal := rgAdvf is VarRef ? "uint*" : "ptr"
        rgdwConnectionMarshal := rgdwConnection is VarRef ? "uint*" : "ptr"
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\OleCreateFromFileEx", "ptr", rclsid, "ptr", lpszFileName, "ptr", riid, "uint", dwFlags, "uint", renderopt, "uint", cFormats, rgAdvfMarshal, rgAdvf, "ptr", rgFormatEtc, "ptr", lpAdviseSink, rgdwConnectionMarshal, rgdwConnection, "ptr", pClientSite, "ptr", pStg, ppvObjMarshal, ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Loads into memory an object nested within a specified storage object.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object from which to load the specified object.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface that the caller wants to use to communicate with the object after it is loaded.
     * @param {IOleClientSite} pClientSite Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface on the client site object being loaded.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly loaded object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleload
     * @since windows5.0
     */
    static OleLoad(pStg, riid, pClientSite) {
        result := DllCall("OLE32.dll\OleLoad", "ptr", pStg, "ptr", riid, "ptr", pClientSite, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Saves an object opened in transacted mode into the specified storage object.
     * @param {IPersistStorage} pPS Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a> interface on the object to be saved.
     * @param {IStorage} pStg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the destination storage object to which the object indicated in <i>pPS</i> is to be saved.
     * @param {BOOL} fSameAsLoad <b>TRUE</b> indicates that <i>pStg</i> is the same storage object from which the object was loaded or created; <b>FALSE</b> indicates that <i>pStg</i> was loaded or created from a different storage object.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STGMEDIUM_E_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object could not be saved due to lack of disk space.
     * 
     * This function can also return any of the error values returned by the <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olesave
     * @since windows5.0
     */
    static OleSave(pPS, pStg, fSameAsLoad) {
        result := DllCall("OLE32.dll\OleSave", "ptr", pPS, "ptr", pStg, "int", fSameAsLoad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Loads an object from the stream.
     * @param {IStream} pStm Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface on the stream from which the object is to be loaded.
     * @param {Pointer<Guid>} iidInterface Interface identifier (IID) the caller wants to use to communicate with the object after it is loaded.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly loaded object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleloadfromstream
     * @since windows5.0
     */
    static OleLoadFromStream(pStm, iidInterface) {
        result := DllCall("OLE32.dll\OleLoadFromStream", "ptr", pStm, "ptr", iidInterface, "ptr*", &ppvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObj
    }

    /**
     * Saves an object with the IPersistStream interface on it to the specified stream.
     * @param {IPersistStream} pPStm Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> interface on the object to be saved to the stream. The <i>pPStm</i> parameter cannot be <b>NULL</b>.
     * @param {IStream} pStm Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface on the stream in which the object is to be saved.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STGMEDIUM_E_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object could not be saved due to lack of disk space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pPStm</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This function can also return any of the error values returned by the <a href="/windows/desktop/api/coml2api/nf-coml2api-writeclassstm">WriteClassStm</a> function or the <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olesavetostream
     * @since windows5.0
     */
    static OleSaveToStream(pPStm, pStm) {
        result := DllCall("OLE32.dll\OleSaveToStream", "ptr", pPStm, "ptr", pStm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Notifies an object that it is embedded in an OLE container, which ensures that reference counting is done correctly for containers that support links to embedded objects.
     * @param {IUnknown} pUnknown Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the object.
     * @param {BOOL} fContained <b>TRUE</b> if the object is an embedded object; <b>FALSE</b> otherwise.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olesetcontainedobject
     * @since windows5.0
     */
    static OleSetContainedObject(pUnknown, fContained) {
        result := DllCall("OLE32.dll\OleSetContainedObject", "ptr", pUnknown, "int", fContained, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Increments or decrements an external reference that keeps an object in the running state.
     * @param {IUnknown} pUnknown Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that is to be locked or unlocked.
     * @param {BOOL} fVisible Whether the object is visible. If <b>TRUE</b>, OLE increments the reference count to hold the object visible and alive regardless of external or internal <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> operations, registrations, or revocation. If <b>FALSE</b>, OLE releases its hold (decrements the reference count) and the object can be closed.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olenoteobjectvisible
     * @since windows5.0
     */
    static OleNoteObjectVisible(pUnknown, fVisible) {
        result := DllCall("ole32.dll\OleNoteObjectVisible", "ptr", pUnknown, "int", fVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers the specified window as one that can be the target of an OLE drag-and-drop operation and specifies the IDropTarget instance to use for drop operations.
     * @param {HWND} hwnd Handle to a window that can be a target for an OLE drag-and-drop operation.
     * @param {IDropTarget} pDropTarget Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface on the object that is to be the target of a drag-and-drop operation in a specified window. This interface is used to communicate OLE drag-and-drop information for that window.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAGDROP_E_INVALIDHWND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle returned in the hwnd parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAGDROP_E_ALREADYREGISTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified window has already been registered as a drop target.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  If you use <a href="/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> instead of <a href="/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> to initialize COM, <b>RegisterDragDrop</b> will always return an E_OUTOFMEMORY error.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-registerdragdrop
     * @since windows5.0
     */
    static RegisterDragDrop(hwnd, pDropTarget) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("OLE32.dll\RegisterDragDrop", "ptr", hwnd, "ptr", pDropTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Revokes the registration of the specified application window as a potential target for OLE drag-and-drop operations.
     * @param {HWND} hwnd Handle to a window previously registered as a target for an OLE drag-and-drop operation.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAGDROP_E_NOTREGISTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to revoke a drop target that has not been registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAGDROP_E_INVALIDHWND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid handle returned in the <i>hwnd</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-revokedragdrop
     * @since windows5.0
     */
    static RevokeDragDrop(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("OLE32.dll\RevokeDragDrop", "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Carries out an OLE drag and drop operation.
     * @param {IDataObject} pDataObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on a data object that contains the data being dragged.
     * @param {IDropSource} pDropSource Pointer to an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idropsource">IDropSource</a> interface, which is used to communicate with the source during the drag operation.
     * @param {Integer} dwOKEffects Effects the source allows in the OLE drag-and-drop operation. Most significant is whether it permits a move. The <i>dwOKEffect</i> and <i>pdwEffect</i> parameters obtain values from the <a href="https://docs.microsoft.com/windows/desktop/com/dropeffect-constants">DROPEFFECT</a> enumeration. For a list of values, see <b>DROPEFFECT</b>.
     * @returns {Integer} Pointer to a value that indicates how the OLE drag-and-drop operation affected the source data. The <i>pdwEffect</i> parameter is set only if the operation is not canceled.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-dodragdrop
     * @since windows5.0
     */
    static DoDragDrop(pDataObj, pDropSource, dwOKEffects) {
        result := DllCall("OLE32.dll\DoDragDrop", "ptr", pDataObj, "ptr", pDropSource, "uint", dwOKEffects, "uint*", &pdwEffect := 0, "int")
        return pdwEffect
    }

    /**
     * Places a pointer to a specific data object onto the clipboard. This makes the data object accessible to the OleGetClipboard function.
     * @param {IDataObject} pDataObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object from which the data to be placed on the clipboard can be obtained. This parameter can be <b>NULL</b>; in which case the clipboard is emptied.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winuser/nf-winuser-openclipboard">OpenClipboard</a> function used within <a href="/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winuser/nf-winuser-emptyclipboard">EmptyClipboard</a> function used within <a href="/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_CLOSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winuser/nf-winuser-closeclipboard">CloseClipboard</a> function used within <a href="/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winuser/nf-winuser-setclipboarddata">SetClipboardData</a> function used within <a href="/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olesetclipboard
     * @since windows5.0
     */
    static OleSetClipboard(pDataObj) {
        result := DllCall("OLE32.dll\OleSetClipboard", "ptr", pDataObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a data object that you can use to access the contents of the clipboard.
     * @returns {IDataObject} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer variable that receives the interface pointer to the clipboard data object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olegetclipboard
     * @since windows5.0
     */
    static OleGetClipboard() {
        result := DllCall("OLE32.dll\OleGetClipboard", "ptr*", &ppDataObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IDataObject(ppDataObj)
    }

    /**
     * Enables Windows Information Protection enlightened applications to retrieve an IDataObject from the OLE Clipboard accompanied by Windows Information Protection information about the data and the source application.
     * @param {Pointer<IDataObject>} dataObject Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer variable that receives the interface pointer to the clipboard data object.
     * @param {Pointer<PWSTR>} dataEnterpriseId The enterprise id of the application that set the clipboard data. 
     * If the data is personal, this will be an empty string.
     * @param {Pointer<PWSTR>} sourceDescription The description of the application that set the clipboard.
     * @param {Pointer<PWSTR>} targetDescription The         description of the caller's application to be used in auditing.
     * @param {Pointer<PWSTR>} dataDescription The description of the data object to be used in auditing.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winuser/nf-winuser-openclipboard">OpenClipboard</a> function used within <a href="/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_CLOSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winuser/nf-winuser-closeclipboard">CloseClipboard</a> function used within <a href="/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olegetclipboardwithenterpriseinfo
     * @since windows10.0.10240
     */
    static OleGetClipboardWithEnterpriseInfo(dataObject, dataEnterpriseId, sourceDescription, targetDescription, dataDescription) {
        dataEnterpriseIdMarshal := dataEnterpriseId is VarRef ? "ptr*" : "ptr"
        sourceDescriptionMarshal := sourceDescription is VarRef ? "ptr*" : "ptr"
        targetDescriptionMarshal := targetDescription is VarRef ? "ptr*" : "ptr"
        dataDescriptionMarshal := dataDescription is VarRef ? "ptr*" : "ptr"

        result := DllCall("ole32.dll\OleGetClipboardWithEnterpriseInfo", "ptr*", dataObject, dataEnterpriseIdMarshal, dataEnterpriseId, sourceDescriptionMarshal, sourceDescription, targetDescriptionMarshal, targetDescription, dataDescriptionMarshal, dataDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Carries out the clipboard shutdown sequence. It also releases the IDataObject pointer that was placed on the clipboard by the OleSetClipboard function.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows OpenClipboard function used within <a href="/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLIPBRD_E_CANT_CLOSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows CloseClipboard function used within <a href="/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleflushclipboard
     * @since windows5.0
     */
    static OleFlushClipboard() {
        result := DllCall("OLE32.dll\OleFlushClipboard", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Determines whether the data object pointer previously placed on the clipboard by the OleSetClipboard function is still on the clipboard.
     * @param {IDataObject} pDataObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object containing clipboard data of interest, which the caller previously placed on the clipboard.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer is not on the clipboard.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleiscurrentclipboard
     * @since windows5.0
     */
    static OleIsCurrentClipboard(pDataObj) {
        result := DllCall("OLE32.dll\OleIsCurrentClipboard", "ptr", pDataObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates and returns an OLE menu descriptor (that is, an OLE-provided data structure that describes the menus) for OLE to use when dispatching menu messages and commands.
     * @param {HMENU} hmenuCombined Handle to the combined menu created by the object.
     * @param {Pointer<OLEMENUGROUPWIDTHS>} lpMenuWidths Pointer to an array of six <b>LONG</b> values giving the number of menus in each group.
     * @returns {Pointer} Returns the handle to the descriptor, or <b>NULL</b> if insufficient memory is available.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatemenudescriptor
     * @since windows5.0
     */
    static OleCreateMenuDescriptor(hmenuCombined, lpMenuWidths) {
        hmenuCombined := hmenuCombined is Win32Handle ? NumGet(hmenuCombined, "ptr") : hmenuCombined

        result := DllCall("OLE32.dll\OleCreateMenuDescriptor", "ptr", hmenuCombined, "ptr", lpMenuWidths, "ptr")
        return result
    }

    /**
     * Installs or removes OLE dispatching code from the container's frame window.
     * @param {Pointer} holemenu Handle to the composite menu descriptor returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatemenudescriptor">OleCreateMenuDescriptor</a> function. If <b>NULL</b>, the dispatching code is unhooked.
     * @param {HWND} hwndFrame Handle to the container's frame window where the in-place composite menu is to be installed.
     * @param {HWND} hwndActiveObject Handle to the object's in-place activation window. OLE dispatches menu messages and commands to this window.
     * @param {IOleInPlaceFrame} lpFrame Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceframe">IOleInPlaceFrame</a> interface on the container's frame window.
     * @param {IOleInPlaceActiveObject} lpActiveObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceactiveobject">IOleInPlaceActiveObject</a> interface on the active in-place object.
     * @returns {HRESULT} This function returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olesetmenudescriptor
     * @since windows5.0
     */
    static OleSetMenuDescriptor(holemenu, hwndFrame, hwndActiveObject, lpFrame, lpActiveObj) {
        hwndFrame := hwndFrame is Win32Handle ? NumGet(hwndFrame, "ptr") : hwndFrame
        hwndActiveObject := hwndActiveObject is Win32Handle ? NumGet(hwndActiveObject, "ptr") : hwndActiveObject

        result := DllCall("OLE32.dll\OleSetMenuDescriptor", "ptr", holemenu, "ptr", hwndFrame, "ptr", hwndActiveObject, "ptr", lpFrame, "ptr", lpActiveObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Called by the container to free the shared menu descriptor allocated by the OleCreateMenuDescriptor function.
     * @param {Pointer} holemenu Handle to the shared menu descriptor that was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatemenudescriptor">OleCreateMenuDescriptor</a> function.
     * @returns {HRESULT} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oledestroymenudescriptor
     * @since windows5.0
     */
    static OleDestroyMenuDescriptor(holemenu) {
        result := DllCall("OLE32.dll\OleDestroyMenuDescriptor", "ptr", holemenu, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Called by the object application, allows an object's container to translate accelerators according to the container's accelerator table.
     * @param {IOleInPlaceFrame} lpFrame Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceframe">IOleInPlaceFrame</a> interface to which the keystroke might be sent.
     * @param {Pointer<OLEINPLACEFRAMEINFO>} lpFrameInfo Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleinplaceframeinfo">OLEINPLACEFRAMEINFO</a> structure containing the accelerator table obtained from the container.
     * @param {Pointer<MSG>} lpmsg Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure containing the keystroke.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object should continue processing this message.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oletranslateaccelerator
     * @since windows5.0
     */
    static OleTranslateAccelerator(lpFrame, lpFrameInfo, lpmsg) {
        result := DllCall("OLE32.dll\OleTranslateAccelerator", "ptr", lpFrame, "ptr", lpFrameInfo, "ptr", lpmsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Duplicates the data found in the specified handle and returns a handle to the duplicated data. The source data is in a clipboard format. Use this function to help implement some of the data transfer interfaces such as IDataObject.
     * @param {HANDLE} hSrc Handle of the source data.
     * @param {Integer} cfFormat Clipboard format of the source data.
     * @param {Integer} uiFlags Flags to be used to allocate global memory for the copied data. These flags are passed to GlobalAlloc. If the value of <i>uiFlags</i> is <b>NULL</b>, GMEM_MOVEABLE is used as a default flag.
     * @returns {HANDLE} On success the HANDLE to the source data is returned; on failure a  <b>NULL</b> value is returned.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleduplicatedata
     * @since windows5.0
     */
    static OleDuplicateData(hSrc, cfFormat, uiFlags) {
        hSrc := hSrc is Win32Handle ? NumGet(hSrc, "ptr") : hSrc

        result := DllCall("OLE32.dll\OleDuplicateData", "ptr", hSrc, "ushort", cfFormat, "uint", uiFlags, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * Enables drawing objects more easily. You can use it instead of calling IViewObject::Draw directly.
     * @param {IUnknown} pUnknown Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the view object that is to be drawn.
     * @param {Integer} dwAspect How the object is to be represented. Representations include content, an icon, a thumbnail, or a printed document. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration.
     * @param {HDC} hdcDraw Device context on which to draw. Cannot be a metafile device context.
     * @param {Pointer<RECT>} lprcBounds Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure specifying the rectangle in which the object should be drawn. This parameter is converted to a <a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a> structure and passed to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a>.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data to draw from.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The draw operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VIEW_E_DRAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data to draw from.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_INVALIDRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_NOIVIEWOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object doesn't support the <a href="/windows/desktop/api/oleidl/nn-oleidl-iviewobject">IViewObject</a> interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oledraw
     * @since windows5.0
     */
    static OleDraw(pUnknown, dwAspect, hdcDraw, lprcBounds) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw

        result := DllCall("OLE32.dll\OleDraw", "ptr", pUnknown, "uint", dwAspect, "ptr", hdcDraw, "ptr", lprcBounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Puts an OLE compound document object into the running state.
     * @param {IUnknown} pUnknown Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object, with which it will query for a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunnableobject">IRunnableObject</a> interface, and then call its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunnableobject-run">Run</a> method.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_CLASSDIFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source of an OLE link has been converted to a different class.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olerun
     * @since windows5.0
     */
    static OleRun(pUnknown) {
        result := DllCall("OLE32.dll\OleRun", "ptr", pUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Determines whether a compound document object is currently in the running state.
     * @param {IOleObject} pObject Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface on the object of interest.
     * @returns {BOOL} The return value is <b>TRUE</b> if the object is running; otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleisrunning
     * @since windows5.0
     */
    static OleIsRunning(pObject) {
        result := DllCall("OLE32.dll\OleIsRunning", "ptr", pObject, "int")
        return result
    }

    /**
     * Locks an already running object into its running state or unlocks it from its running state.
     * @param {IUnknown} pUnknown Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object, which the function uses to query for a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunnableobject">IRunnableObject</a>.
     * @param {BOOL} fLock <b>TRUE</b> locks the object into its running state. <b>FALSE</b> unlocks the object from its running state.
     * @param {BOOL} fLastUnlockCloses <b>TRUE</b> specifies that if the connection being released is the last external lock on the object, the object should close. <b>FALSE</b> specifies that the object should remain open until closed by the user or another process.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olelockrunning
     * @since windows5.0
     */
    static OleLockRunning(pUnknown, fLock, fLastUnlockCloses) {
        result := DllCall("OLE32.dll\OleLockRunning", "ptr", pUnknown, "int", fLock, "int", fLastUnlockCloses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees the specified storage medium.
     * @remarks
     * 
     * The <b>ReleaseStgMedium</b> function calls the appropriate method or function to release the specified storage medium. Use this function during data transfer operations where storage medium structures are parameters, such as <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a>. In addition to identifying the type of the storage medium, this structure specifies the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method for releasing the storage medium when it is no longer needed.
     * 
     * It is common to pass a <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> from one body of code to another, such as in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>, in which the one called can allocate a medium and return it to the caller. <b>ReleaseStgMedium</b> permits flexibility in whether the receiving body of code owns the medium, or whether the original provider of the medium still owns it, in which case the receiving code needs to inform the provider that it can free the medium.
     * 
     * When the original provider of the medium is responsible for freeing the medium, the provider calls <b>ReleaseStgMedium</b>, specifying the medium and the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer as the <b>punkForRelease</b> structure member. Depending on the type of storage medium being freed, one of the following actions is taken, followed by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the specified <b>IUnknown</b> pointer.
     * 
     * <table>
     * <tr>
     * <th>Medium</th>
     * <th>ReleaseStgMedium Action</th>
     * </tr>
     * <tr>
     * <td>TYMED_HGLOBAL</td>
     * <td>None.</td>
     * </tr>
     * <tr>
     * <td>TYMED_GDI</td>
     * <td>None.</td>
     * </tr>
     * <tr>
     * <td>TYMED_ENHMF</td>
     * <td>None.</td>
     * </tr>
     * <tr>
     * <td>TYMED_MFPICT</td>
     * <td>None.</td>
     * </tr>
     * <tr>
     * <td>TYMED_FILE</td>
     * <td>Frees the file name string using standard memory management mechanisms.</td>
     * </tr>
     * <tr>
     * <td>TYMED_ISTREAM</td>
     * <td>Calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IStream::Release</a>.</td>
     * </tr>
     * <tr>
     * <td>TYMED_ISTORAGE</td>
     * <td>Calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IStorage::Release</a>.</td>
     * </tr>
     * </table>
     *  
     * 
     * The provider indicates that the receiver of the medium is responsible for freeing the medium by specifying <b>NULL</b> for the <b>punkForRelease</b> structure member. Then the receiver calls <b>ReleaseStgMedium</b>, which makes a call as described in the following table depending on the type of storage medium being freed.
     * 
     * <table>
     * <tr>
     * <th>Medium</th>
     * <th>ReleaseStgMedium Action</th>
     * </tr>
     * <tr>
     * <td>TYMED_HGLOBAL</td>
     * <td>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function on the handle.</td>
     * </tr>
     * <tr>
     * <td>TYMED_GDI</td>
     * <td>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function on the handle.</td>
     * </tr>
     * <tr>
     * <td>TYMED_ENHMF</td>
     * <td>Deletes the enhanced metafile.</td>
     * </tr>
     * <tr>
     * <td>TYMED_MFPICT</td>
     * <td>The hMF that it contains is deleted with the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletemetafile">DeleteMetaFile</a> function; then the handle itself is passed to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a>.</td>
     * </tr>
     * <tr>
     * <td>TYMED_FILE</td>
     * <td>Frees the disk file by deleting it. Frees the file name string by using the standard memory management mechanisms.</td>
     * </tr>
     * <tr>
     * <td>TYMED_ISTREAM</td>
     * <td>Calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IStream::Release</a>.</td>
     * </tr>
     * <tr>
     * <td>TYMED_ISTORAGE</td>
     * <td>Calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IStorage::Release</a>.</td>
     * </tr>
     * </table>
     *  
     * 
     * In either case, after the call to <b>ReleaseStgMedium</b>, the specified storage medium is invalid and can no longer be used.
     * 
     * 
     * @param {Pointer<STGMEDIUM>} param0 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-releasestgmedium
     * @since windows5.0
     */
    static ReleaseStgMedium(param0) {
        DllCall("OLE32.dll\ReleaseStgMedium", "ptr", param0)
    }

    /**
     * Creates an advise holder object for managing compound document notifications. It returns a pointer to the object's OLE implementation of the IOleAdviseHolder interface.
     * @returns {IOleAdviseHolder} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleadviseholder">IOleAdviseHolder</a> pointer variable that receives the interface pointer to the new advise holder object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-createoleadviseholder
     * @since windows5.0
     */
    static CreateOleAdviseHolder() {
        result := DllCall("OLE32.dll\CreateOleAdviseHolder", "ptr*", &ppOAHolder := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IOleAdviseHolder(ppOAHolder)
    }

    /**
     * Creates a new instance of the default embedding handler. This instance is initialized so it creates a local server when the embedded object enters the running state.
     * @param {Pointer<Guid>} clsid CLSID identifying the OLE server to be loaded when the embedded object enters the running state.
     * @param {IUnknown} pUnkOuter Pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface if the handler is to be aggregated; <b>NULL</b> if it is not to be aggregated.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface, usually IID_IOleObject, through which the caller will communicate with the handler.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created handler.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreatedefaulthandler
     * @since windows5.0
     */
    static OleCreateDefaultHandler(clsid, pUnkOuter, riid) {
        result := DllCall("ole32.dll\OleCreateDefaultHandler", "ptr", clsid, "ptr", pUnkOuter, "ptr", riid, "ptr*", &lplpObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return lplpObj
    }

    /**
     * Creates an OLE embedding helper object using application-supplied code aggregated with pieces of the OLE default object handler. This helper object can be created and used in a specific context and role, as determined by the caller.
     * @param {Pointer<Guid>} clsid CLSID of the class to be helped.
     * @param {IUnknown} pUnkOuter If the embedding helper is to be aggregated, pointer to the outer object's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. If it is not to be aggregated, although this is rare, the value should be <b>NULL</b>.
     * @param {Integer} flags DWORD containing flags that specify the role and creation context for the embedding helper. For legal values, see the following Remarks section.
     * @param {IClassFactory} pCF Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface on the class object the function uses to create the secondary object. In some situations, this value may be <b>NULL</b>. For more information, see the following Remarks section.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface desired by the caller.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the newly created embedding helper.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olecreateembeddinghelper
     * @since windows5.0
     */
    static OleCreateEmbeddingHelper(clsid, pUnkOuter, flags, pCF, riid) {
        result := DllCall("OLE32.dll\OleCreateEmbeddingHelper", "ptr", clsid, "ptr", pUnkOuter, "uint", flags, "ptr", pCF, "ptr", riid, "ptr*", &lplpObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return lplpObj
    }

    /**
     * Determines whether the specified keystroke maps to an accelerator in the specified accelerator table.
     * @param {HACCEL} hAccel A handle to the accelerator table.
     * @param {Integer} cAccelEntries The number of entries in the accelerator table.
     * @param {Pointer<MSG>} lpMsg A pointer to the keystroke message to be translated.
     * @param {Pointer<Integer>} lpwCmd A pointer to a variable  to receive the corresponding command identifier if there is an accelerator for the keystroke. This parameter may be <b>NULL</b>.
     * @returns {BOOL} If the message is for the object application, the return value is <b>TRUE</b>. If the message is not for the object and should be forwarded to the container, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-isaccelerator
     * @since windows5.0
     */
    static IsAccelerator(hAccel, cAccelEntries, lpMsg, lpwCmd) {
        hAccel := hAccel is Win32Handle ? NumGet(hAccel, "ptr") : hAccel

        lpwCmdMarshal := lpwCmd is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\IsAccelerator", "ptr", hAccel, "int", cAccelEntries, "ptr", lpMsg, lpwCmdMarshal, lpwCmd, "int")
        return result
    }

    /**
     * Returns a handle to a metafile containing an icon and string label for the specified file name.
     * @param {PWSTR} lpszPath A pointer to a file for which the icon and string are to be requested.
     * @param {BOOL} fUseFileAsLabel Indicates whether to use the file name as the icon label.
     * @returns {HGLOBAL} If the function succeeds, the return value is a handle to a metafile that contains and icon and label for the specified file. If there is no CLSID in the registration database for the file, then the function returns the string "Document". If <i>lpszPath</i> is <b>NULL</b>, the function returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olegeticonoffile
     * @since windows5.0
     */
    static OleGetIconOfFile(lpszPath, fUseFileAsLabel) {
        lpszPath := lpszPath is String ? StrPtr(lpszPath) : lpszPath

        result := DllCall("ole32.dll\OleGetIconOfFile", "ptr", lpszPath, "int", fUseFileAsLabel, "ptr")
        resultHandle := HGLOBAL({Value: result}, True)
        return resultHandle
    }

    /**
     * Returns a handle to a metafile containing an icon and a string label for the specified CLSID.
     * @param {Pointer<Guid>} rclsid The CLSID for which the icon and string are to be requested.
     * @param {PWSTR} lpszLabel A pointer to the label for the icon.
     * @param {BOOL} fUseTypeAsLabel Indicates whether to use the user type string in the CLSID as the icon label.
     * @returns {HGLOBAL} If the function succeeds, the return value is a handle to a metafile that contains and icon and label for the specified CLSID. Otherwise, the function returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olegeticonofclass
     * @since windows5.0
     */
    static OleGetIconOfClass(rclsid, lpszLabel, fUseTypeAsLabel) {
        lpszLabel := lpszLabel is String ? StrPtr(lpszLabel) : lpszLabel

        result := DllCall("OLE32.dll\OleGetIconOfClass", "ptr", rclsid, "ptr", lpszLabel, "int", fUseTypeAsLabel, "ptr")
        resultHandle := HGLOBAL({Value: result}, True)
        return resultHandle
    }

    /**
     * Creates a metafile in which the specified icon and label are drawn.
     * @param {HICON} hIcon Handle to the icon that is to be drawn into the metafile. This parameter can be <b>NULL</b>. If <i>hIcon</i> is <b>NULL</b>, this function returns <b>NULL</b> without creating a metafile.
     * @param {PWSTR} lpszLabel The icon label. This parameter can be <b>NULL</b>. If <i>lpszLabel</i> is <b>NULL</b>, the resulting metafile will not include a label.
     * @param {PWSTR} lpszSourceFile The path and file name of the icon file. This string can be obtained through the user interface or from the registration database. This parameter can be <b>NULL</b>.
     * @param {Integer} iIconIndex The location of the icon within the file named by <i>lpszSourceFile</i>, expressed as an offset in bytes from the beginning of file.
     * @returns {HGLOBAL} A global handle to a <a href="/windows/desktop/api/wingdi/ns-wingdi-metafilepict">METAFILEPICT</a> structure containing the icon and label. The metafile uses the MM_ANISOTROPIC mapping mode.
     * 
     * If an error occurs, the returned handle is <b>NULL</b>. In this case, the caller can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to obtain further information.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olemetafilepictfromiconandlabel
     * @since windows5.0
     */
    static OleMetafilePictFromIconAndLabel(hIcon, lpszLabel, lpszSourceFile, iIconIndex) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon
        lpszLabel := lpszLabel is String ? StrPtr(lpszLabel) : lpszLabel
        lpszSourceFile := lpszSourceFile is String ? StrPtr(lpszSourceFile) : lpszSourceFile

        A_LastError := 0

        result := DllCall("ole32.dll\OleMetafilePictFromIconAndLabel", "ptr", hIcon, "ptr", lpszLabel, "ptr", lpszSourceFile, "uint", iIconIndex, "ptr")
        if(A_LastError)
            throw OSError()

        resultHandle := HGLOBAL({Value: result}, True)
        return resultHandle
    }

    /**
     * Gets the user type of the specified class from the registry.
     * @param {Pointer<Guid>} clsid The CLSID of the class for which the user type is to be requested.
     * @param {Integer} dwFormOfType The form of the user-presentable string. Possible values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-userclasstype">USERCLASSTYPE</a>.
     * @returns {PWSTR} A pointer to a string that receives the user type.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olereggetusertype
     * @since windows5.0
     */
    static OleRegGetUserType(clsid, dwFormOfType) {
        result := DllCall("OLE32.dll\OleRegGetUserType", "ptr", clsid, "uint", dwFormOfType, "ptr*", &pszUserType := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pszUserType
    }

    /**
     * Returns miscellaneous information about the presentation and behaviors supported by the specified CLSID from the registry.
     * @param {Pointer<Guid>} clsid The CLSID of the class for which status information is to be requested.
     * @param {Integer} dwAspect The presentation aspect of the class for which information is requested. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration.
     * @returns {Integer} A pointer to the variable that receives the status information.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olereggetmiscstatus
     * @since windows5.0
     */
    static OleRegGetMiscStatus(clsid, dwAspect) {
        result := DllCall("OLE32.dll\OleRegGetMiscStatus", "ptr", clsid, "uint", dwAspect, "uint*", &pdwStatus := 0, "int")
        if(result != 0)
            throw OSError(result)

        return pdwStatus
    }

    /**
     * Creates an enumeration object that can be used to enumerate data formats that an OLE object server has registered in the system registry.
     * @param {Pointer<Guid>} clsid CLSID of the class whose formats are being requested.
     * @param {Integer} dwDirection Indicates whether to enumerate formats that can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> or formats that can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a>. Possible values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-datadir">DATADIR</a>.
     * @returns {IEnumFORMATETC} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> pointer variable that receives the interface pointer to the enumeration object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleregenumformatetc
     * @since windows5.0
     */
    static OleRegEnumFormatEtc(clsid, dwDirection) {
        result := DllCall("ole32.dll\OleRegEnumFormatEtc", "ptr", clsid, "uint", dwDirection, "ptr*", &ppenum := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IEnumFORMATETC(ppenum)
    }

    /**
     * Supplies an enumeration of the registered verbs for the specified class. Developers of custom DLL object applications use this function to emulate the behavior of the default object handler.
     * @param {Pointer<Guid>} clsid Class identifier whose verbs are being requested.
     * @returns {IEnumOLEVERB} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ienumoleverb">IEnumOLEVERB</a>* pointer variable that receives the interface pointer to the new enumeration object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleregenumverbs
     * @since windows5.0
     */
    static OleRegEnumVerbs(clsid) {
        result := DllCall("OLE32.dll\OleRegEnumVerbs", "ptr", clsid, "ptr*", &ppenum := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IEnumOLEVERB(ppenum)
    }

    /**
     * 
     * @param {Pointer<OLESTREAM>} lpolestream 
     * @param {IStorage} pstg 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {Integer} opt 
     * @param {Pointer<Void>} pvCallbackContext 
     * @param {Pointer<OLESTREAMQUERYCONVERTOLELINKCALLBACK>} pQueryConvertOLELinkCallback 
     * @returns {HRESULT} 
     */
    static OleConvertOLESTREAMToIStorage2(lpolestream, pstg, ptd, opt, pvCallbackContext, pQueryConvertOLELinkCallback) {
        pvCallbackContextMarshal := pvCallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ole32.dll\OleConvertOLESTREAMToIStorage2", "ptr", lpolestream, "ptr", pstg, "ptr", ptd, "uint", opt, pvCallbackContextMarshal, pvCallbackContext, "ptr", pQueryConvertOLELinkCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Automatically converts an object to a new class if automatic conversion for that object class is set in the registry.
     * @param {IStorage} pStg A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object to be converted.
     * @param {Pointer<Guid>} pClsidNew A pointer to the new CLSID for the object being converted. If there was no automatic conversion, this may be the same as the original class.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No conversion is needed or a conversion was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_KEYMISSING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot read a key from the registry.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This function can also return any of the error values returned by the <a href="/windows/desktop/api/ole2/nf-ole2-olegetautoconvert">OleGetAutoConvert</a> function. When accessing storage and stream objects, see the <a href="/windows/desktop/api/objidl/nf-objidl-istorage-openstorage">IStorage::OpenStorage</a> and <a href="/windows/desktop/api/objidl/nf-objidl-istorage-openstream">IStorage::OpenStream</a> methods for possible errors. When it is not possible to determine the existing CLSID or when it is not possible to update the storage object with new information, see the <a href="/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface for other error return values.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oledoautoconvert
     * @since windows5.0
     */
    static OleDoAutoConvert(pStg, pClsidNew) {
        result := DllCall("ole32.dll\OleDoAutoConvert", "ptr", pStg, "ptr", pClsidNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Determines whether the registry is set for objects of a specified CLSID to be automatically converted to another CLSID, and if so, retrieves the new CLSID.
     * @param {Pointer<Guid>} clsidOld The CLSID for the object.
     * @param {Pointer<Guid>} pClsidNew A pointer to a variable to receive the new CLSID, if any. If auto-conversion for <i>clsidOld</i> is not set in the registry, <i>clsidOld</i> is returned. The <i>pClsidNew</i> parameter is never <b>NULL</b>.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A value was successfully returned through the <i>pclsidNew</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CLSID is not properly registered in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_READREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error reading from the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_KEYMISSING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Auto-convert is not active or there was no registry entry for the <i>clsidOld</i> parameter.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olegetautoconvert
     * @since windows5.0
     */
    static OleGetAutoConvert(clsidOld, pClsidNew) {
        result := DllCall("OLE32.dll\OleGetAutoConvert", "ptr", clsidOld, "ptr", pClsidNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Specifies a CLSID for automatic conversion to a different class when an object of that class is loaded.
     * @param {Pointer<Guid>} clsidOld The CLSID of the object class to be converted.
     * @param {Pointer<Guid>} clsidNew The CLSID of the object class that should replace <i>clsidOld</i>. This new CLSID replaces any existing auto-conversion information in the registry for <i>clsidOld</i>. If this value is CLSID_NULL, any existing auto-conversion information for <i>clsidOld</i> is removed from the registry.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was tagged successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CLSID is not properly registered in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_READREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error reading from the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_WRITEREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error writing to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_KEYMISSING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot read a key from the registry.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-olesetautoconvert
     * @since windows5.0
     */
    static OleSetAutoConvert(clsidOld, clsidNew) {
        result := DllCall("ole32.dll\OleSetAutoConvert", "ptr", clsidOld, "ptr", clsidNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OLESTREAM>} polestm 
     * @param {IStorage} pstg 
     * @param {Pointer<Integer>} pcfFormat 
     * @param {Pointer<Integer>} plwWidth 
     * @param {Pointer<Integer>} plHeight 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<STGMEDIUM>} pmedium 
     * @param {Integer} opt 
     * @param {Pointer<Void>} pvCallbackContext 
     * @param {Pointer<OLESTREAMQUERYCONVERTOLELINKCALLBACK>} pQueryConvertOLELinkCallback 
     * @returns {HRESULT} 
     */
    static OleConvertOLESTREAMToIStorageEx2(polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium, opt, pvCallbackContext, pQueryConvertOLELinkCallback) {
        pcfFormatMarshal := pcfFormat is VarRef ? "ushort*" : "ptr"
        plwWidthMarshal := plwWidth is VarRef ? "int*" : "ptr"
        plHeightMarshal := plHeight is VarRef ? "int*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        pvCallbackContextMarshal := pvCallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ole32.dll\OleConvertOLESTREAMToIStorageEx2", "ptr", polestm, "ptr", pstg, pcfFormatMarshal, pcfFormat, plwWidthMarshal, plwWidth, plHeightMarshal, plHeight, pdwSizeMarshal, pdwSize, "ptr", pmedium, "uint", opt, pvCallbackContextMarshal, pvCallbackContext, "ptr", pQueryConvertOLELinkCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HRGN>} param2 
     * @returns {Integer} 
     */
    static HRGN_UserSize(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\HRGN_UserSize", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HRGN>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HRGN_UserMarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HRGN_UserMarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HRGN>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HRGN_UserUnmarshal(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("OLE32.dll\HRGN_UserUnmarshal", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HRGN>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HRGN_UserFree(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("OLE32.dll\HRGN_UserFree", param0Marshal, param0, "ptr", param1)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HRGN>} param2 
     * @returns {Integer} 
     */
    static HRGN_UserSize64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-core-marshal-l1-1-0.dll\HRGN_UserSize64", param0Marshal, param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HRGN>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HRGN_UserMarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("api-ms-win-core-marshal-l1-1-0.dll\HRGN_UserMarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<HRGN>} param2 
     * @returns {Pointer<Integer>} 
     */
    static HRGN_UserUnmarshal64(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        result := DllCall("api-ms-win-core-marshal-l1-1-0.dll\HRGN_UserUnmarshal64", param0Marshal, param0, param1Marshal, param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<HRGN>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    static HRGN_UserFree64(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        DllCall("api-ms-win-core-marshal-l1-1-0.dll\HRGN_UserFree64", param0Marshal, param0, "ptr", param1)
    }

    /**
     * Invokes a new property frame, that is, a property sheet dialog box, whose parent is hwndOwner, where the dialog is positioned at the point (x,y) in the parent window and has the caption lpszCaption.
     * @param {HWND} hwndOwner Handle to the parent window of the resulting property sheet dialog box.
     * @param {Integer} x Reserved. Horizontal position for the dialog box relative to <i>hwndOwner</i>.
     * @param {Integer} y Reserved. Vertical position for the dialog box relative to <i>hwndOwner</i>.
     * @param {PWSTR} lpszCaption Pointer to the string used for the caption of the dialog box.
     * @param {Integer} cObjects Number of object pointers passed in <i>ppUnk</i>.
     * @param {Pointer<IUnknown>} ppUnk An array of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers on the objects for which this property sheet is being invoked. The number of elements in the array is specified by <i>cObjects</i>. These pointers are passed to each property page through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-setobjects">IPropertyPage::SetObjects</a>.
     * @param {Integer} cPages Number of property pages specified in <i>pPageCIsID</i>.
     * @param {Pointer<Guid>} pPageClsID Array of size <i>cPages</i> containing the CLSIDs of each property page to display in the property sheet.
     * @param {Integer} lcid Locale identifier to use for the property sheet. Property pages can retrieve this identifier through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid">IPropertyPageSite::GetLocaleID</a>.
     * @returns {HRESULT} This function supports the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box was invoked and operated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>lpszCaption</i>, <i>ppUnk</i>, or <i>pPageCIsID</i> is not valid. For example, any one of them may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-olecreatepropertyframe
     * @since windows5.0
     */
    static OleCreatePropertyFrame(hwndOwner, x, y, lpszCaption, cObjects, ppUnk, cPages, pPageClsID, lcid) {
        static dwReserved := 0, pvReserved := 0 ;Reserved parameters must always be NULL

        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        lpszCaption := lpszCaption is String ? StrPtr(lpszCaption) : lpszCaption

        result := DllCall("OLEAUT32.dll\OleCreatePropertyFrame", "ptr", hwndOwner, "uint", x, "uint", y, "ptr", lpszCaption, "uint", cObjects, "ptr*", ppUnk, "uint", cPages, "ptr", pPageClsID, "uint", lcid, "uint", dwReserved, "ptr", pvReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a property frame, that is, a property sheet dialog box, based on a structure (OCPFIPARAMS) that contains the parameters, rather than specifying separate parameters as when calling OleCreatePropertyFrame.
     * @param {Pointer<OCPFIPARAMS>} lpParams Pointer to the caller-allocated structure containing the creation parameters for the dialog box.
     * @returns {HRESULT} This function supports the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box was invoked and operated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>lpParams</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-olecreatepropertyframeindirect
     * @since windows5.0
     */
    static OleCreatePropertyFrameIndirect(lpParams) {
        result := DllCall("OLEAUT32.dll\OleCreatePropertyFrameIndirect", "ptr", lpParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an OLE_COLOR type to a COLORREF.
     * @param {Integer} clr The OLE color to be converted into a <b>COLORREF</b>.
     * @param {HPALETTE} hpal Palette used as a basis for the conversion.
     * @returns {COLORREF} Pointer to the caller's variable that receives the converted <b>COLORREF</b> result. This parameter can be <b>NULL</b>, indicating that the caller wants only to verify that a converted color exists.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-oletranslatecolor
     * @since windows5.0
     */
    static OleTranslateColor(clr, hpal) {
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal

        result := DllCall("OLEAUT32.dll\OleTranslateColor", "uint", clr, "ptr", hpal, "uint*", &lpcolorref := 0, "int")
        if(result != 0)
            throw OSError(result)

        return lpcolorref
    }

    /**
     * Creates and initializes a standard font object using an initial description of the font's properties in a FONTDESC structure.
     * @param {Pointer<FONTDESC>} lpFontDesc Address of a caller-allocated, <a href="https://docs.microsoft.com/windows/desktop/api/olectl/ns-olectl-fontdesc">FONTDESC</a> structure containing the initial state of the font. This value must not be <b>NULL</b>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>lplpvObj</i>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, this parameter contains the requested interface pointer on the newly created font object. If successful, the caller is responsible to call Release through this interface pointer when the new object is no longer needed. If unsuccessful, the value of is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-olecreatefontindirect
     * @since windows5.0
     */
    static OleCreateFontIndirect(lpFontDesc, riid) {
        result := DllCall("OLEAUT32.dll\OleCreateFontIndirect", "ptr", lpFontDesc, "ptr", riid, "ptr*", &lplpvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return lplpvObj
    }

    /**
     * Creates a new picture object initialized according to a PICTDESC structure.
     * @param {Pointer<PICTDESC>} lpPictDesc Pointer to a caller-allocated structure containing the initial state of the picture. The specified structure can be <b>NULL</b> to create an uninitialized object, in the event the picture needs to initialize via <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-load">IPersistStream::Load</a>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>lplpvObj</i>.
     * @param {BOOL} fOwn If <b>TRUE</b>, the picture object is to destroy its picture when the object is destroyed. If <b>FALSE</b>, the caller is responsible for destroying the picture.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, this parameter contains the requested interface pointer on the newly created object. If the call is successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> through this interface pointer when the new object is no longer needed. If the call fails, the value is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-olecreatepictureindirect
     * @since windows5.0
     */
    static OleCreatePictureIndirect(lpPictDesc, riid, fOwn) {
        result := DllCall("OLEAUT32.dll\OleCreatePictureIndirect", "ptr", lpPictDesc, "ptr", riid, "int", fOwn, "ptr*", &lplpvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return lplpvObj
    }

    /**
     * Creates a new picture object and initializes it from the contents of a stream. This is equivalent to calling OleCreatePictureIndirect with NULL as the first parameter, followed by a call to IPersistStream::Load.
     * @param {IStream} lpstream Pointer to the stream that contains the picture's data.
     * @param {Integer} lSize The number of bytes that should be read from the stream, or zero if the entire stream should be read.
     * @param {BOOL} fRunmode The opposite of the initial value of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipicture-get_keeporiginalformat">KeepOriginalFormat</a> property. If <b>TRUE</b>, <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipicture-put_keeporiginalformat">KeepOriginalFormat</a> is set to <b>FALSE</b> and vice-versa.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>ppvObj</i>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the storage of the object identified by the moniker. If *<i>ppvObj</i> is non-<b>NULL</b>, this function calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the interface; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>. If an error occurs, *<i>ppvObj</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-oleloadpicture
     * @since windows5.0
     */
    static OleLoadPicture(lpstream, lSize, fRunmode, riid) {
        result := DllCall("OLEAUT32.dll\OleLoadPicture", "ptr", lpstream, "int", lSize, "int", fRunmode, "ptr", riid, "ptr*", &lplpvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return lplpvObj
    }

    /**
     * Creates a new picture object and initializes it from the contents of a stream. This is equivalent to calling OleCreatePictureIndirect with NULL as the first parameter, followed by a call to IPersistStream::Load.
     * @param {IStream} lpstream Pointer to the stream that contains the picture's data.
     * @param {Integer} lSize The number of bytes that should be read from the stream, or zero if the entire stream should be read.
     * @param {BOOL} fRunmode The opposite of the initial value of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipicture-get_keeporiginalformat">KeepOriginalFormat</a> property. If <b>TRUE</b>, <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipicture-put_keeporiginalformat">KeepOriginalFormat</a> is set to <b>FALSE</b> and vice versa.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in <i>ppvObj</i>.
     * @param {Integer} xSizeDesired Desired width of icon or cursor. Valid values are 16, 32, and 48. Pass LP_DEFAULT to both size parameters to use system default size.
     * @param {Integer} ySizeDesired Desired height of icon or cursor. Valid values are 16, 32, and 48. Pass LP_DEFAULT to both size parameters to use system default size.
     * @param {Integer} dwFlags Desired color depth for icon or cursor. Values are LP_MONOCHROME (monochrome), LP_VGACOLOR (16 colors), LP_COLOR (256 colors), or LP_DEFAULT (selects best depth for current display).
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer on the storage of the object identified by the moniker. If *<i>ppvObj</i> is non-<b>NULL</b>, this function calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the interface; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>. If an error occurs, *<i>ppvObj</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-oleloadpictureex
     * @since windows5.0
     */
    static OleLoadPictureEx(lpstream, lSize, fRunmode, riid, xSizeDesired, ySizeDesired, dwFlags) {
        result := DllCall("OLEAUT32.dll\OleLoadPictureEx", "ptr", lpstream, "int", lSize, "int", fRunmode, "ptr", riid, "uint", xSizeDesired, "uint", ySizeDesired, "uint", dwFlags, "ptr*", &lplpvObj := 0, "int")
        if(result != 0)
            throw OSError(result)

        return lplpvObj
    }

    /**
     * Creates a new picture object and initializes it from the contents of a stream. This is equivalent to calling OleCreatePictureIndirect(NULL, ...) followed by IPersistStream::Load.
     * @param {PWSTR} szURLorPath The path or URL to the file you want to open.
     * @param {IUnknown} punkCaller Points to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> for COM aggregation.
     * @param {Integer} clrReserved The color you want to reserve to be transparent.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface describing the type of interface pointer to return in ppvRet.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvRet</i> contains the requested interface pointer on the storage of the object identified by the moniker. If *<i>ppvRet</i> is non-<b>NULL</b>, this function calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the interface; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>. If an error occurs, *<i>ppvRet</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-oleloadpicturepath
     * @since windows5.0
     */
    static OleLoadPicturePath(szURLorPath, punkCaller, clrReserved, riid) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        szURLorPath := szURLorPath is String ? StrPtr(szURLorPath) : szURLorPath

        result := DllCall("OLEAUT32.dll\OleLoadPicturePath", "ptr", szURLorPath, "ptr", punkCaller, "uint", dwReserved, "uint", clrReserved, "ptr", riid, "ptr*", &ppvRet := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppvRet
    }

    /**
     * Creates an IPictureDisp object from a picture file on disk.
     * @param {VARIANT} varFileName The path and name of the picture file to load.
     * @returns {IDispatch} The location that receives a pointer to the <b>IPictureDisp</b> object.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-oleloadpicturefile
     */
    static OleLoadPictureFile(varFileName) {
        result := DllCall("OLEAUT32.dll\OleLoadPictureFile", "ptr", varFileName, "ptr*", &lplpdispPicture := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IDispatch(lplpdispPicture)
    }

    /**
     * Loads a picture from a file.
     * @param {VARIANT} varFileName The path and name of the picture file to load.
     * @param {Integer} xSizeDesired The desired length for the picture to be displayed.
     * @param {Integer} ySizeDesired The desired height for the picture to be displayed.
     * @param {Integer} dwFlags The desired color depth for the icon or cursor. Together with the desired size it is used to select the best matching image.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LP_MONOCHROME_"></a><a id="lp_monochrome_"></a><dl>
     * <dt><b>LP_MONOCHROME
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Creates a monochrome picture to display on a monitor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LP_VGACOLOR_"></a><a id="lp_vgacolor_"></a><dl>
     * <dt><b>LP_VGACOLOR
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Creates a 16-color picture to display on a monitor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LP_COLOR_"></a><a id="lp_color_"></a><dl>
     * <dt><b>LP_COLOR
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Creates a 256-color picture to display on a monitor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LP_DEFAULT_"></a><a id="lp_default_"></a><dl>
     * <dt><b>LP_DEFAULT
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Selects the best color depth to use for the current display.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IDispatch} The location that receives a pointer to the picture.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-oleloadpicturefileex
     */
    static OleLoadPictureFileEx(varFileName, xSizeDesired, ySizeDesired, dwFlags) {
        result := DllCall("OLEAUT32.dll\OleLoadPictureFileEx", "ptr", varFileName, "uint", xSizeDesired, "uint", ySizeDesired, "uint", dwFlags, "ptr*", &lplpdispPicture := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IDispatch(lplpdispPicture)
    }

    /**
     * Saves a picture to a file.
     * @param {IDispatch} lpdispPicture Points to the <b>IPictureDisp</b> picture object.
     * @param {BSTR} bstrFileName The name of the file to save the picture to.
     * @returns {HRESULT} This method returns standard COM error codes in addition to the following values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CTL_E_INVALIDPROPERTYVALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpdispPicture</i> is <b>NULL</b>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CTL_E_FILENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>bstrFileName</i> cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-olesavepicturefile
     */
    static OleSavePictureFile(lpdispPicture, bstrFileName) {
        bstrFileName := bstrFileName is Win32Handle ? NumGet(bstrFileName, "ptr") : bstrFileName

        result := DllCall("OLEAUT32.dll\OleSavePictureFile", "ptr", lpdispPicture, "ptr", bstrFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an icon to a cursor.
     * @param {HINSTANCE} hinstExe This parameter is ignored.
     * @param {HICON} hIcon A handle to the icon to be converted.
     * @returns {HCURSOR} The function returns a handle to the new cursor object. The caller is responsible for deleting this cursor with the <a href="/windows/desktop/api/winuser/nf-winuser-destroycursor">DestroyCursor</a> function. If the conversion could not be completed, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//olectl/nf-olectl-oleicontocursor
     * @since windows5.0
     */
    static OleIconToCursor(hinstExe, hIcon) {
        hinstExe := hinstExe is Win32Handle ? NumGet(hinstExe, "ptr") : hinstExe
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon

        result := DllCall("OLEAUT32.dll\OleIconToCursor", "ptr", hinstExe, "ptr", hIcon, "ptr")
        resultHandle := HCURSOR({Value: result}, True)
        return resultHandle
    }

    /**
     * Adds the Verb menu for the specified object to the specified menu.
     * @param {IOleObject} lpOleObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface on the selected object. If this is <b>NULL</b>, then a default disabled menu item is created.
     * @param {PWSTR} lpszShortType Pointer to the short name defined in the registry (AuxName==2) for the object identified with <i>lpOleObj</i>. If the string is not known, then <b>NULL</b> may be passed. If <b>NULL</b> is passed, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a> is called to retrieve it. If the caller has easy access to the string, it is faster to pass it in.
     * @param {HMENU} hMenu Handle to the menu in which to make modifications.
     * @param {Integer} uPos Position of the menu item.
     * @param {Integer} uIDVerbMin The identifier value at which to start the verbs.
     * @param {Integer} uIDVerbMax The maximum identifier value to be used for object verbs. If <i>uIDVerbMax</i> is 0, then no maximum identifier value is used.
     * @param {BOOL} bAddConvert Indicates whether to add a <b>Convert</b> item to the bottom of the menu (preceded by a separator).
     * @param {Integer} idConvert The identifier value to use for the <b>Convert</b> menu item, if <i>bAddConvert</i> is <b>TRUE</b>.
     * @param {Pointer<HMENU>} lphMenu An <b>HMENU</b> pointer to the cascading verb menu if it's created. If there is only one verb, this will be filled with <b>NULL</b>.
     * @returns {BOOL} This function returns <b>TRUE</b> if <i>lpOleObj</i> was valid and at least one verb was added to the menu. A <b>FALSE</b> return indicates that <i>lpOleObj</i> was <b>NULL</b> and a disabled default menu item was created.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiaddverbmenuw
     * @since windows5.0
     */
    static OleUIAddVerbMenuW(lpOleObj, lpszShortType, hMenu, uPos, uIDVerbMin, uIDVerbMax, bAddConvert, idConvert, lphMenu) {
        lpszShortType := lpszShortType is String ? StrPtr(lpszShortType) : lpszShortType
        hMenu := hMenu is Win32Handle ? NumGet(hMenu, "ptr") : hMenu

        result := DllCall("oledlg.dll\OleUIAddVerbMenuW", "ptr", lpOleObj, "ptr", lpszShortType, "ptr", hMenu, "uint", uPos, "uint", uIDVerbMin, "uint", uIDVerbMax, "int", bAddConvert, "uint", idConvert, "ptr", lphMenu, "int")
        return result
    }

    /**
     * Adds the Verb menu for the specified object to the specified menu.
     * @param {IOleObject} lpOleObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface on the selected object. If this is <b>NULL</b>, then a default disabled menu item is created.
     * @param {PSTR} lpszShortType Pointer to the short name defined in the registry (AuxName==2) for the object identified with <i>lpOleObj</i>. If the string is not known, then <b>NULL</b> may be passed. If <b>NULL</b> is passed, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a> is called to retrieve it. If the caller has easy access to the string, it is faster to pass it in.
     * @param {HMENU} hMenu Handle to the menu in which to make modifications.
     * @param {Integer} uPos Position of the menu item.
     * @param {Integer} uIDVerbMin The identifier value at which to start the verbs.
     * @param {Integer} uIDVerbMax The maximum identifier value to be used for object verbs. If <i>uIDVerbMax</i> is 0, then no maximum identifier value is used.
     * @param {BOOL} bAddConvert Indicates whether to add a <b>Convert</b> item to the bottom of the menu (preceded by a separator).
     * @param {Integer} idConvert The identifier value to use for the <b>Convert</b> menu item, if <i>bAddConvert</i> is <b>TRUE</b>.
     * @param {Pointer<HMENU>} lphMenu An <b>HMENU</b> pointer to the cascading verb menu if it's created. If there is only one verb, this will be filled with <b>NULL</b>.
     * @returns {BOOL} This function returns <b>TRUE</b> if <i>lpOleObj</i> was valid and at least one verb was added to the menu. A <b>FALSE</b> return indicates that <i>lpOleObj</i> was <b>NULL</b> and a disabled default menu item was created.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiaddverbmenua
     * @since windows5.0
     */
    static OleUIAddVerbMenuA(lpOleObj, lpszShortType, hMenu, uPos, uIDVerbMin, uIDVerbMax, bAddConvert, idConvert, lphMenu) {
        lpszShortType := lpszShortType is String ? StrPtr(lpszShortType) : lpszShortType
        hMenu := hMenu is Win32Handle ? NumGet(hMenu, "ptr") : hMenu

        result := DllCall("oledlg.dll\OleUIAddVerbMenuA", "ptr", lpOleObj, "ptr", lpszShortType, "ptr", hMenu, "uint", uPos, "uint", uIDVerbMin, "uint", uIDVerbMax, "int", bAddConvert, "uint", idConvert, "ptr", lphMenu, "int")
        return result
    }

    /**
     * Invokes the standard Insert Object dialog box, which allows the user to select an object source and class name, as well as the option of displaying the object as itself or as an icon.
     * @param {Pointer<OLEUIINSERTOBJECTW>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPSZFILEINVALID </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpszFile</b> value is invalid or user has insufficient write access permissions.This <b>lpszFile</b> member points to the name of the file linked to or inserted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_PPVOBJINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppvOjb</i> value is invalid. This member points to the location where the pointer for the object is returned. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPIOLECLIENTSITEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpIOleClientSite</b> value is invalid. This member points to the client site for the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPISTORAGEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpIStorage</b> value is invalid. This member points to the storage to be used for the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_SCODEHASERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>sc</b> member of <i>lpIO</i> has additional error information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPCLSIDEXCLUDEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpClsidExclude</b> value is invalid. This member contains the list of CLSIDs to exclude.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_CCHFILEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>cchFile</b> or <b>lpszFile</b> value is invalid. The <b>cchFile</b> member specifies the size of the <b>lpszFile</b> buffer. The <b>lpszFile</b> member points to the name of the file linked to or inserted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiinsertobjectw
     * @since windows5.0
     */
    static OleUIInsertObjectW(param0) {
        result := DllCall("oledlg.dll\OleUIInsertObjectW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Insert Object dialog box, which allows the user to select an object source and class name, as well as the option of displaying the object as itself or as an icon.
     * @param {Pointer<OLEUIINSERTOBJECTA>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPSZFILEINVALID </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpszFile</b> value is invalid or user has insufficient write access permissions.This <b>lpszFile</b> member points to the name of the file linked to or inserted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_PPVOBJINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppvOjb</i> value is invalid. This member points to the location where the pointer for the object is returned. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPIOLECLIENTSITEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpIOleClientSite</b> value is invalid. This member points to the client site for the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPISTORAGEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpIStorage</b> value is invalid. This member points to the storage to be used for the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_SCODEHASERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>sc</b> member of <i>lpIO</i> has additional error information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_LPCLSIDEXCLUDEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpClsidExclude</b> value is invalid. This member contains the list of CLSIDs to exclude.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_CCHFILEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>cchFile</b> or <b>lpszFile</b> value is invalid. The <b>cchFile</b> member specifies the size of the <b>lpszFile</b> buffer. The <b>lpszFile</b> member points to the name of the file linked to or inserted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiinsertobjecta
     * @since windows5.0
     */
    static OleUIInsertObjectA(param0) {
        result := DllCall("oledlg.dll\OleUIInsertObjectA", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Paste Special dialog box, allowing the user to select the format of the clipboard object to be pasted or paste-linked.
     * @param {Pointer<OLEUIPASTESPECIALW>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call <a href="/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> to get localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_SRCDATAOBJECTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpSrcDataObject</b> member of <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuipastespeciala">OLEUIPASTESPECIAL</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_ARRPASTEENTRIESINVALID </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>arrPasteEntries</b> member of <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuipastespeciala">OLEUIPASTESPECIAL</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_ARRLINKTYPESINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>arrLinkTypes</b> member of <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuipastespeciala">OLEUIPASTESPECIAL</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_PSERR_CLIPBOARDCHANGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The clipboard contents changed while the dialog box was displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_PSERR_GETCLIPBOAARDFAILED 
     * 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpSrcDataObj</b> member is incorrect.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuipastespecialw
     * @since windows5.0
     */
    static OleUIPasteSpecialW(param0) {
        result := DllCall("oledlg.dll\OleUIPasteSpecialW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Paste Special dialog box, allowing the user to select the format of the clipboard object to be pasted or paste-linked.
     * @param {Pointer<OLEUIPASTESPECIALA>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call <a href="/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> to get localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_SRCDATAOBJECTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpSrcDataObject</b> member of <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuipastespeciala">OLEUIPASTESPECIAL</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_ARRPASTEENTRIESINVALID </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>arrPasteEntries</b> member of <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuipastespeciala">OLEUIPASTESPECIAL</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_IOERR_ARRLINKTYPESINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>arrLinkTypes</b> member of <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuipastespeciala">OLEUIPASTESPECIAL</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_PSERR_CLIPBOARDCHANGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The clipboard contents changed while the dialog box was displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_PSERR_GETCLIPBOAARDFAILED 
     * 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpSrcDataObj</b> member is incorrect.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuipastespeciala
     * @since windows5.0
     */
    static OleUIPasteSpecialA(param0) {
        result := DllCall("oledlg.dll\OleUIPasteSpecialA", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Links dialog box, allowing the user to make modifications to a container's linked objects.
     * @param {Pointer<OLEUIEDITLINKSW>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuieditlinksw
     * @since windows5.0
     */
    static OleUIEditLinksW(param0) {
        result := DllCall("oledlg.dll\OleUIEditLinksW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Links dialog box, allowing the user to make modifications to a container's linked objects.
     * @param {Pointer<OLEUIEDITLINKSA>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuieditlinksa
     * @since windows5.0
     */
    static OleUIEditLinksA(param0) {
        result := DllCall("oledlg.dll\OleUIEditLinksA", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Change Icon dialog box, which allows the user to select an icon from an icon file, executable, or DLL.
     * @param {Pointer<OLEUICHANGEICONW>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CIERR_MUSTHAVECLSID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>clsid</b> member was not the current CLSID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CIERR_MUSTHAVECURRENTMETAFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>hMetaPict</b> member was not the current metafile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CIERR_SZICONEXEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szIconExe</i> value was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuichangeiconw
     * @since windows5.0
     */
    static OleUIChangeIconW(param0) {
        result := DllCall("oledlg.dll\OleUIChangeIconW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Change Icon dialog box, which allows the user to select an icon from an icon file, executable, or DLL.
     * @param {Pointer<OLEUICHANGEICONA>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CIERR_MUSTHAVECLSID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>clsid</b> member was not the current CLSID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CIERR_MUSTHAVECURRENTMETAFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>hMetaPict</b> member was not the current metafile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CIERR_SZICONEXEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szIconExe</i> value was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuichangeicona
     * @since windows5.0
     */
    static OleUIChangeIconA(param0) {
        result := DllCall("oledlg.dll\OleUIChangeIconA", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Convert dialog box, allowing the user to change the type of a single specified object, or the type of all OLE objects of the specified object's class.
     * @param {Pointer<OLEUICONVERTW>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_CLASSIDINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>clsid</b> value was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_DVASPECTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dvAspect</b> value was invalid. This member specifies the aspect of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_CBFORMATINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>wFormat</b> value was invalid. This member specifies the data format of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_STRINGINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A string value (for example, <b>lpszUserType</b> or <b>lpszDefLabel</b>) was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiconvertw
     * @since windows5.0
     */
    static OleUIConvertW(param0) {
        result := DllCall("oledlg.dll\OleUIConvertW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Convert dialog box, allowing the user to change the type of a single specified object, or the type of all OLE objects of the specified object's class.
     * @param {Pointer<OLEUICONVERTA>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_CLASSIDINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>clsid</b> value was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_DVASPECTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dvAspect</b> value was invalid. This member specifies the aspect of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_CBFORMATINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>wFormat</b> value was invalid. This member specifies the data format of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CTERR_STRINGINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A string value (for example, <b>lpszUserType</b> or <b>lpszDefLabel</b>) was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiconverta
     * @since windows5.0
     */
    static OleUIConvertA(param0) {
        result := DllCall("oledlg.dll\OleUIConvertA", "ptr", param0, "uint")
        return result
    }

    /**
     * Determines if there are any OLE object classes in the registry that can be used to convert or activate the specified CLSID from.
     * @param {Pointer<Guid>} rClsid The CLSID of the class for which the information is required.
     * @param {BOOL} fIsLinkedObject <b>TRUE</b> if the original object is a linked object; <b>FALSE</b> otherwise.
     * @param {Integer} wFormat Format of the original class.
     * @returns {BOOL} This function returns <b>TRUE</b> if the specified class can be converted to another class; <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuicanconvertoractivateas
     * @since windows5.0
     */
    static OleUICanConvertOrActivateAs(rClsid, fIsLinkedObject, wFormat) {
        result := DllCall("oledlg.dll\OleUICanConvertOrActivateAs", "ptr", rClsid, "int", fIsLinkedObject, "ushort", wFormat, "int")
        return result
    }

    /**
     * Invokes the standard Busy dialog box, allowing the user to manage concurrency.
     * @param {Pointer<OLEUIBUSYW>} param0 
     * @returns {Integer} This function returns the following values:
     * 
     * 
     * Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>OK</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed the <b>Cancel</b> button and that the caller should cancel the operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_SWITCHTOSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed <b>Switch To</b> and <a href="/windows/desktop/api/oledlg/nf-oledlg-oleuibusya">OleUIBusy</a> was unable to determine how to switch to the blocking application. In this case, the caller should either take measures to attempt to resolve the conflict itself, if possible, or retry the operation. <b>OleUIBusy</b> will only return OLEUI_BZ_SWITCHTOSELECTED if the user has pressed the <b>Switch To</b> button, <i>hTask</i> is <b>NULL</b> and the BZ_NOTRESPONDING flag is set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_SWITCHTOSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed <b>Switch To</b> and <a href="/windows/desktop/api/oledlg/nf-oledlg-oleuibusya">OleUIBusy</a> was unable to determine how to switch to the blocking application. In this case, the caller should either take measures to attempt to resolve the conflict itself, if possible, or retry the operation. <b>OleUIBusy</b> will only return OLEUI_BZ_SWITCHTOSELECTED if the user has pressed the <b>Switch To</b> button, <i>hTask</i> is <b>NULL</b> and the BZ_NOTRESPONDING flag is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_SWITCHTOSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed <b>Switch To</b> and <a href="/windows/desktop/api/oledlg/nf-oledlg-oleuibusya">OleUIBusy</a> was unable to determine how to switch to the blocking application. In this case, the caller should either take measures to attempt to resolve the conflict itself, if possible, or retry the operation. <b>OleUIBusy</b> will only return OLEUI_BZ_SWITCHTOSELECTED if the user has pressed the <b>Switch To</b> button, <i>hTask</i> is <b>NULL</b> and the BZ_NOTRESPONDING flag is set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_RETRYSELECTED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has either pressed the <b>Retry</b> button or attempted to resolve the conflict (probably by switching to the blocking application). In this case, the caller should retry the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_CALLUNBLOCKED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box has been informed that the operation is no longer blocked. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call <a href="/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> for the localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZERR_HTASKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hTask specified in the <i>hTask</i> member of the <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuibusya">OLEUIBUSY</a> structure is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuibusyw
     * @since windows5.0
     */
    static OleUIBusyW(param0) {
        result := DllCall("oledlg.dll\OleUIBusyW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the standard Busy dialog box, allowing the user to manage concurrency.
     * @param {Pointer<OLEUIBUSYA>} param0 
     * @returns {Integer} This function returns the following values:
     * 
     * 
     * Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>OK</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed the <b>Cancel</b> button and that the caller should cancel the operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_SWITCHTOSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed <b>Switch To</b> and <a href="/windows/desktop/api/oledlg/nf-oledlg-oleuibusya">OleUIBusy</a> was unable to determine how to switch to the blocking application. In this case, the caller should either take measures to attempt to resolve the conflict itself, if possible, or retry the operation. <b>OleUIBusy</b> will only return OLEUI_BZ_SWITCHTOSELECTED if the user has pressed the <b>Switch To</b> button, <i>hTask</i> is <b>NULL</b> and the BZ_NOTRESPONDING flag is set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_SWITCHTOSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed <b>Switch To</b> and <a href="/windows/desktop/api/oledlg/nf-oledlg-oleuibusya">OleUIBusy</a> was unable to determine how to switch to the blocking application. In this case, the caller should either take measures to attempt to resolve the conflict itself, if possible, or retry the operation. <b>OleUIBusy</b> will only return OLEUI_BZ_SWITCHTOSELECTED if the user has pressed the <b>Switch To</b> button, <i>hTask</i> is <b>NULL</b> and the BZ_NOTRESPONDING flag is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_SWITCHTOSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has pressed <b>Switch To</b> and <a href="/windows/desktop/api/oledlg/nf-oledlg-oleuibusya">OleUIBusy</a> was unable to determine how to switch to the blocking application. In this case, the caller should either take measures to attempt to resolve the conflict itself, if possible, or retry the operation. <b>OleUIBusy</b> will only return OLEUI_BZ_SWITCHTOSELECTED if the user has pressed the <b>Switch To</b> button, <i>hTask</i> is <b>NULL</b> and the BZ_NOTRESPONDING flag is set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_RETRYSELECTED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has either pressed the <b>Retry</b> button or attempted to resolve the conflict (probably by switching to the blocking application). In this case, the caller should retry the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZ_CALLUNBLOCKED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box has been informed that the operation is no longer blocked. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call <a href="/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> for the localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_BZERR_HTASKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hTask specified in the <i>hTask</i> member of the <a href="/windows/desktop/api/oledlg/ns-oledlg-oleuibusya">OLEUIBUSY</a> structure is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuibusya
     * @since windows5.0
     */
    static OleUIBusyA(param0) {
        result := DllCall("oledlg.dll\OleUIBusyA", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the Change Source dialog box, allowing the user to change the source of a link.
     * @param {Pointer<OLEUICHANGESOURCEW>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_LINKCNTRNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpOleUILinkContainer</i> value is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_LINKCNTRINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpOleUILinkContainer</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_FROMNOTNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszFrom</i> value is not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_TONOTNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTo</i> value is not <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_SOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszDisplayName</i> or <i>nFileLength</i> value is invalid, or cannot retrieve the link source.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_SOURCEPARSEERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>nFilename</i> value is wrong.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuichangesourcew
     * @since windows5.0
     */
    static OleUIChangeSourceW(param0) {
        result := DllCall("oledlg.dll\OleUIChangeSourceW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the Change Source dialog box, allowing the user to change the source of a link.
     * @param {Pointer<OLEUICHANGESOURCEA>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the OK button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the Cancel button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_LINKCNTRNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpOleUILinkContainer</i> value is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_LINKCNTRINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpOleUILinkContainer</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_FROMNOTNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszFrom</i> value is not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_TONOTNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTo</i> value is not <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_SOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszDisplayName</i> or <i>nFileLength</i> value is invalid, or cannot retrieve the link source.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CSERR_SOURCEPARSEERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>nFilename</i> value is wrong.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuichangesourcea
     * @since windows5.0
     */
    static OleUIChangeSourceA(param0) {
        result := DllCall("oledlg.dll\OleUIChangeSourceA", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the Object Properties dialog box, which displays General, View, and Link information about an object.
     * @param {Pointer<OLEUIOBJECTPROPSW>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>OK</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>Cancel</b> button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Initialization Errors
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_SUBPROPNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpGP</i> or <i>lpVP</i> is <b>NULL</b>, or <i>dwFlags</i> and OPF_OBJECTISLINK and <i>lpLP</i> are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_SUBPROPINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient write-access permissions for the structures pointed to by <i>lpGP</i>, <i>lpVP</i>, or <i>lpLP</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPSHEETNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpLP</i> value is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPSHEETINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient write-access permissions for the structures pointed to by <i>lpGP</i>, <i>lpVP</i>, or <i>lpLP</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_SUPPROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sub-link property pointer, <i>lpLP</i>, is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPSINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient write access for the sub-link property pointer, <i>lpLP</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PAGESINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some sub-link properties of the <i>lpPS</i> member are incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_INVALIDPAGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some sub-link properties of the <i>lpPS</i> member are incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sub-link property of the <i>lpPS</i> member is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_DLGPROCNOTNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sub-link property of the <i>lpPS</i> member is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_LPARAMNOTZERO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sub-link property of the <i>lpPS</i> member is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_STRINGINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A string value (for example, <i>lplpszLabel</i> or <i>lplpszType</i>) is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_CLASSIDINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>clsid</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_LPCLSIDEXCLUDEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ClsidExcluded</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_CBFORMATINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>wFormat</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_VPERR_METAPICTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMetaPict</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_VPERR_DVASPECTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dvAspect</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPERTYSHEET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpPS</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_OBJINFOINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpObjInfo</i> value is <b>NULL</b> or the calling process doesn't have read access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_LINKINFOINVALID 
     * 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpLinkInfo</i> value is <b>NULL</b> or the calling process doesn't have read access.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiobjectpropertiesw
     * @since windows5.0
     */
    static OleUIObjectPropertiesW(param0) {
        result := DllCall("oledlg.dll\OleUIObjectPropertiesW", "ptr", param0, "uint")
        return result
    }

    /**
     * Invokes the Object Properties dialog box, which displays General, View, and Link information about an object.
     * @param {Pointer<OLEUIOBJECTPROPSA>} param0 
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>OK</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>Cancel</b> button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Initialization Errors
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_SUBPROPNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpGP</i> or <i>lpVP</i> is <b>NULL</b>, or <i>dwFlags</i> and OPF_OBJECTISLINK and <i>lpLP</i> are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_SUBPROPINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient write-access permissions for the structures pointed to by <i>lpGP</i>, <i>lpVP</i>, or <i>lpLP</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPSHEETNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpLP</i> value is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPSHEETINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient write-access permissions for the structures pointed to by <i>lpGP</i>, <i>lpVP</i>, or <i>lpLP</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_SUPPROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sub-link property pointer, <i>lpLP</i>, is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPSINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient write access for the sub-link property pointer, <i>lpLP</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PAGESINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some sub-link properties of the <i>lpPS</i> member are incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_INVALIDPAGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some sub-link properties of the <i>lpPS</i> member are incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sub-link property of the <i>lpPS</i> member is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_DLGPROCNOTNULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sub-link property of the <i>lpPS</i> member is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_LPARAMNOTZERO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sub-link property of the <i>lpPS</i> member is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_STRINGINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A string value (for example, <i>lplpszLabel</i> or <i>lplpszType</i>) is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_CLASSIDINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>clsid</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_LPCLSIDEXCLUDEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ClsidExcluded</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_GPERR_CBFORMATINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>wFormat</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_VPERR_METAPICTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hMetaPict</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_VPERR_DVASPECTINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dvAspect</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_PROPERTYSHEET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpPS</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_OBJINFOINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpObjInfo</i> value is <b>NULL</b> or the calling process doesn't have read access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OPERR_LINKINFOINVALID 
     * 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpLinkInfo</i> value is <b>NULL</b> or the calling process doesn't have read access.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiobjectpropertiesa
     * @since windows5.0
     */
    static OleUIObjectPropertiesA(param0) {
        result := DllCall("oledlg.dll\OleUIObjectPropertiesA", "ptr", param0, "uint")
        return result
    }

    /**
     * Displays a dialog box with the specified template and returns the response (button identifier) from the user. This function is used to display OLE warning messages, for example, Class Not Registered.
     * @param {Integer} nTemplate The resource number of the dialog box to be displayed. See Remarks.
     * @param {HWND} hwndParent The handle to the parent window of the dialog box.
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>OK</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>Cancel</b> button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuipromptuserw
     * @since windows5.0
     */
    static OleUIPromptUserW(nTemplate, hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("oledlg.dll\OleUIPromptUserW", "int", nTemplate, "ptr", hwndParent, "CDecl int")
        return result
    }

    /**
     * Displays a dialog box with the specified template and returns the response (button identifier) from the user. This function is used to display OLE warning messages, for example, Class Not Registered.
     * @param {Integer} nTemplate The resource number of the dialog box to be displayed. See Remarks.
     * @param {HWND} hwndParent The handle to the parent window of the dialog box.
     * @returns {Integer} Standard Success/Error Definitions
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown failure (unused).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>OK</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error, same as OLEUI_OK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user pressed the <b>Cancel</b> button.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Standard Field Validation Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTURENULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to an OLEUIXXX structure passed into the function was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STRUCTUREINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient permissions for read or write access to an OLEUIXXX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_CBSTRUCTINCORRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>cbstruct</i> value is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HWNDOWNERINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hWndOwner</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZCAPTIONINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszCaption</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPFNHOOKINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpfnHook</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HINSTANCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hInstance</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LPSZTEMPLATEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszTemplate</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_HRESOURCEINVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hResource</i> value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Initialization Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_FINDTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADTEMPLATEFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to load the dialog box template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_DIALOGFAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dialog box initialization failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOCALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_GLOBALMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to <a href="/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_LOADSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to call LoadString for localized resources from the library.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_OLEMEMALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A call to the standard <a href="/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> allocator failed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Function Specific Errors
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEUI_ERR_STANDARDMAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors common to all dialog boxes lie in the range OLEUI_ERR_STANDARDMIN to OLEUI_ERR_STANDARDMAX. This value allows the application to test for standard messages in order to display error messages to the user.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuipromptusera
     * @since windows5.0
     */
    static OleUIPromptUserA(nTemplate, hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("oledlg.dll\OleUIPromptUserA", "int", nTemplate, "ptr", hwndParent, "CDecl int")
        return result
    }

    /**
     * Updates all links in the link container and displays a dialog box that shows the progress of the updating process. The process is stopped if the user presses the Stop button or when all links are processed.
     * @param {IOleUILinkContainerW} lpOleUILinkCntr Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface on the link container.
     * @param {HWND} hwndParent Parent window of the dialog box.
     * @param {PWSTR} lpszTitle Pointer to the title of the dialog box.
     * @param {Integer} cLinks Total number of links.
     * @returns {BOOL} Returns <b>TRUE</b> if the links were successfully updated; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiupdatelinksw
     * @since windows5.0
     */
    static OleUIUpdateLinksW(lpOleUILinkCntr, hwndParent, lpszTitle, cLinks) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        result := DllCall("oledlg.dll\OleUIUpdateLinksW", "ptr", lpOleUILinkCntr, "ptr", hwndParent, "ptr", lpszTitle, "int", cLinks, "int")
        return result
    }

    /**
     * Updates all links in the link container and displays a dialog box that shows the progress of the updating process. The process is stopped if the user presses the Stop button or when all links are processed.
     * @param {IOleUILinkContainerA} lpOleUILinkCntr Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface on the link container.
     * @param {HWND} hwndParent Parent window of the dialog box.
     * @param {PSTR} lpszTitle Pointer to the title of the dialog box.
     * @param {Integer} cLinks Total number of links.
     * @returns {BOOL} Returns <b>TRUE</b> if the links were successfully updated; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-oleuiupdatelinksa
     * @since windows5.0
     */
    static OleUIUpdateLinksA(lpOleUILinkCntr, hwndParent, lpszTitle, cLinks) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        result := DllCall("oledlg.dll\OleUIUpdateLinksA", "ptr", lpOleUILinkCntr, "ptr", hwndParent, "ptr", lpszTitle, "int", cLinks, "int")
        return result
    }

;@endregion Methods
}
