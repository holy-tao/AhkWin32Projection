#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\PRINTER_HANDLE.ahk
#Include .\FINDPRINTERCHANGENOTIFICATION_HANDLE.ahk
#Include ..\Gdi\HDC.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class Printing {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PRINTER_INTERFACE_CLASSIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PRINTER_INTERFACE_IPP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PRINTER_INTERFACE_DUAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PRINT_IPP_COMPAT_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PRINT_IPP_FAXOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USBPRINT_IOCTL_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_GET_LPT_STATUS => 2228272

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_GET_1284_ID => 2228276

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_VENDOR_SET_COMMAND => 2228280

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_VENDOR_GET_COMMAND => 2228284

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_SOFT_RESET => 2228288

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_GET_PROTOCOL => 2228292

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_SET_PROTOCOL => 2228296

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_GET_INTERFACE_TYPE => 2228300

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_SET_PORT_NUMBER => 2228304

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_ADD_MSIPP_COMPAT_ID => 2228308

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_SET_DEVICE_ID => 2228312

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_ADD_CHILD_DEVICE => 2228316

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_CYCLE_PORT => 2228320

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USBPRINT_GET_MFG_MDL_ID => 2228324

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_2STATES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_3STATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_UDARROW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_TRACKBAR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_SCROLLBAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_LISTBOX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_COMBOBOX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_EDITBOX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_PUSHBUTTON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_CHKBOX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static TVOT_NSTATES_EX => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CHKBOXS_FALSE_TRUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CHKBOXS_NO_YES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHKBOXS_OFF_ON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHKBOXS_FALSE_PDATA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CHKBOXS_NO_PDATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CHKBOXS_OFF_PDATA => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CHKBOXS_NONE_PDATA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PUSHBUTTON_TYPE_DLGPROC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PUSHBUTTON_TYPE_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PUSHBUTTON_TYPE_HTCLRADJ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PUSHBUTTON_TYPE_HTSETUP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_RES_STR_CHARS => 160

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_HIDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_ICONID_AS_HICON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_OVERLAY_WARNING_ICON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_OVERLAY_STOP_ICON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_OVERLAY_NO_ICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_USE_HDLGTEMPLATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OPTPF_MASK => 127

    /**
     * @type {Integer (UInt32)}
     */
    static OPTCF_HIDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPTCF_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPTTF_TYPE_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPTTF_NOSPACE_BEFORE_POSTFIX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPTTF_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_LBCB_SORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_LBCB_PROPPAGE_LBUSECB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_LBCB_PROPPAGE_CBUSELB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_LBCB_INCL_ITEM_NONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_LBCB_NO_ICON16_IN_ITEM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_PUSH_INCL_SETUP_TITLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_PUSH_NO_DOT_DOT_DOT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_PUSH_ENABLE_ALWAYS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OTS_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_PUSH_TYPE_DLGPROC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_INCL_SETUP_TITLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_NO_DOT_DOT_DOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_ICONID_AS_HICON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_OVERLAY_WARNING_ICON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_OVERLAY_STOP_ICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_OVERLAY_NO_ICON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_USE_HDLGTEMPLATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EPF_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_CHECKNAME_AT_FRONT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_CHECKNAME_ONLY_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_ICONID_AS_HICON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_OVERLAY_WARNING_ICON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_OVERLAY_ECBICON_IF_CHECKED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_OVERLAY_STOP_ICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_OVERLAY_NO_ICON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_CHECKNAME_ONLY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ECBF_MASK => 255

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_COLLAPSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_HIDE => 2

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_CALLBACK => 4

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_CHANGED => 8

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_CHANGEONCE => 16

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_DISABLED => 32

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_ECB_CHECKED => 64

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_EXT_HIDE => 128

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_EXT_DISABLED => 256

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_SEL_AS_HICON => 512

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_EXT_IS_EXTPUSH => 1024

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_NO_GROUPBOX_NAME => 2048

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_OVERLAY_WARNING_ICON => 4096

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_OVERLAY_STOP_ICON => 8192

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_OVERLAY_NO_ICON => 16384

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_INITIAL_TVITEM => 32768

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_HAS_POIEXT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static OPTIF_MASK => 131071

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_FIRST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_ORIENTATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_SCALE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_COPIES_COLLATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_DEFSOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_PRINTQUALITY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_COLOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_DUPLEX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_TTOPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_FORMNAME => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_ICMMETHOD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_ICMINTENT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_MEDIATYPE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_DITHERTYPE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_OUTPUTBIN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_QUALITY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_NUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_PAGEORDER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_NUP_DIRECTION => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_MANUAL_DUPLEX => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_STAPLE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_BOOKLET_EDGE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_LAST => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_OEM_PAPER_ITEM => 97

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_OEM_GRAPHIC_ITEM => 98

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_OEM_ROOT_ITEM => 99

    /**
     * @type {Integer (UInt32)}
     */
    static DMPUB_USER => 100

    /**
     * @type {Integer (UInt32)}
     */
    static OIEXTF_ANSI_STRING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_SEL_CHANGED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_PUSHBUTTON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_ECB_CHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_DLGPROC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_UNDO_CHANGES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_EXTPUSH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_APPLYNOW => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_OPTITEM_SETFOCUS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_ITEMS_REVERTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_ABOUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_SETACTIVE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_REASON_KILLACTIVE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_ACTION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_ACTION_OPTIF_CHANGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_ACTION_REINIT_ITEMS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_ACTION_NO_APPLY_EXIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUICB_ACTION_ITEMS_APPLIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DP_STD_TREEVIEWPAGE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DP_STD_DOCPROPPAGE2 => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static DP_STD_DOCPROPPAGE1 => 65533

    /**
     * @type {Integer (UInt32)}
     */
    static DP_STD_RESERVED_START => 65520

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DLGPAGE_COUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DPF_ICONID_AS_HICON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DPF_USE_HDLGTEMPLATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUIF_UPDATE_PERMISSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUIF_ICONID_AS_HICON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUIF_ABOUT_CALLBACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_HPROPSHEETPAGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PROPSHEETPAGEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PCOMPROPSHEETUIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PCOMPROPSHEETUIW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PFNPROPSHEETUIA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PFNPROPSHEETUIW => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_DELETE_HCOMPROPSHEET => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_HSTARTPAGE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_GET_PAGECOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_RESULT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_GET_HPSUIPAGES => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_LOAD_CPSUI_STRINGA => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_LOAD_CPSUI_STRINGW => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_LOAD_CPSUI_ICON => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_GET_PFNPROPSHEETUI_ICON => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PROPSHEETPAGEA => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_INSERT_PSUIPAGEA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_INSERT_PSUIPAGEW => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_PSUIPAGE_TITLEA => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_PSUIPAGE_TITLEW => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_PSUIPAGE_ICON => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_DATABLOCK => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_QUERY_DATABLOCK => 22

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_DMPUB_HIDEBITS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_IGNORE_CPSUI_PSN_APPLY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_DO_APPLY_CPSUI => 25

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_FUSION_CONTEXT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CPSFUNC_INDEX => 26

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PCOMPROPSHEETUI => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PFNPROPSHEETUI => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_LOAD_CPSUI_STRING => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_ADD_PROPSHEETPAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_INSERT_PSUIPAGE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CPSFUNC_SET_PSUIPAGE_TITLE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SR_OWNER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SR_OWNER_PARENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIPAGEINSERT_GROUP_PARENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIPAGEINSERT_PCOMPROPSHEETUI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIPAGEINSERT_PFNPROPSHEETUI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIPAGEINSERT_PROPSHEETPAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIPAGEINSERT_HPROPSHEETPAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIPAGEINSERT_DLL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PSUIPAGEINSERT_INDEX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INSPSUIPAGE_MODE_BEFORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INSPSUIPAGE_MODE_AFTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INSPSUIPAGE_MODE_FIRST_CHILD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INSPSUIPAGE_MODE_LAST_CHILD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INSPSUIPAGE_MODE_INDEX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSP_TVPAGE => 10000

    /**
     * @type {Integer (UInt32)}
     */
    static SSP_STDPAGE1 => 10001

    /**
     * @type {Integer (UInt32)}
     */
    static SSP_STDPAGE2 => 10002

    /**
     * @type {Integer (UInt32)}
     */
    static APPLYCPSUI_NO_NEWDEF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPLYCPSUI_OK_CANCEL_BUTTON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSHEETUI_REASON_INIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSHEETUI_REASON_GET_INFO_HEADER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSHEETUI_REASON_DESTROY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSHEETUI_REASON_SET_RESULT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSHEETUI_REASON_GET_ICON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSHEETUI_REASON_BEFORE_INIT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PROPSHEETUI_REASON_INDEX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSHEETUI_INFO_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIINFO_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIHDRF_OBSOLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIHDRF_NOAPPLYNOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIHDRF_PROPTITLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIHDRF_USEHICON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIHDRF_DEFTITLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PSUIHDRF_EXACT_PTITLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUI_CANCEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUI_OK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUI_RESTARTWINDOWS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPSUI_REBOOTSYSTEM => 3

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_GETLASTERROR => -1

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_ALLOCMEM_FAILED => -2

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_PDATA => -3

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_LPARAM => -4

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_HINST => -5

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_CALLERNAME => -6

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_OPTITEMNAME => -7

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NO_PROPSHEETPAGE => -8

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_TOO_MANY_PROPSHEETPAGES => -9

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_CREATEPROPPAGE_FAILED => -10

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_MORE_THAN_ONE_TVPAGE => -11

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_MORE_THAN_ONE_STDPAGE => -12

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_PDLGPAGE => -13

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_DLGPAGE_CBSIZE => -14

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_TOO_MANY_DLGPAGES => -15

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_DLGPAGEIDX => -16

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_SUBITEM_DIFF_DLGPAGEIDX => -17

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_POPTITEM => -18

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_OPTITEM_CBSIZE => -19

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_OPTTYPE_CBSIZE => -20

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_OPTTYPE_COUNT => -21

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_POPTPARAM => -22

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_OPTPARAM_CBSIZE => -23

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_EDITBOX_PSEL => -24

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_EDITBOX_BUF_SIZE => -25

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_ECB_CBSIZE => -26

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_ECB_PTITLE => -27

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_ECB_PCHECKEDNAME => -28

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_DMPUBID => -29

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_DMPUB_TVOT => -30

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_CREATE_TRACKBAR_FAILED => -31

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_CREATE_UDARROW_FAILED => -32

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_CREATE_IMAGELIST_FAILED => -33

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_TVOT_TYPE => -34

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_LBCB_TYPE => -35

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_SUBITEM_DIFF_OPTIF_HIDE => -36

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_PUSHBUTTON_TYPE => -38

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INVALID_EXTPUSH_CBSIZE => -39

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_EXTPUSH_DLGPROC => -40

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NO_EXTPUSH_DLGTEMPLATEID => -41

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_NULL_EXTPUSH_CALLBACK => -42

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_DMCOPIES_USE_EXTPUSH => -43

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_ZERO_OPTITEM => -44

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_FUNCTION_NOT_IMPLEMENTED => -9999

    /**
     * @type {Integer (Int32)}
     */
    static ERR_CPSUI_INTERNAL_ERROR => -10000

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ICONID_FIRST => 64000

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_EMPTY => 64000

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_SEL_NONE => 64001

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_WARNING => 64002

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_NO => 64003

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_YES => 64004

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_FALSE => 64005

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_TRUE => 64006

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_OFF => 64007

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ON => 64008

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PAPER_OUTPUT => 64009

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ENVELOPE => 64010

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_MEM => 64011

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_FONTCARTHDR => 64012

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_FONTCART => 64013

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_STAPLER_ON => 64014

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_STAPLER_OFF => 64015

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_HT_HOST => 64016

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_HT_DEVICE => 64017

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_TT_PRINTASGRAPHIC => 64018

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_TT_DOWNLOADSOFT => 64019

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_TT_DOWNLOADVECT => 64020

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_TT_SUBDEV => 64021

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PORTRAIT => 64022

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LANDSCAPE => 64023

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ROT_LAND => 64024

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_AUTOSEL => 64025

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PAPER_TRAY => 64026

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PAPER_TRAY2 => 64027

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PAPER_TRAY3 => 64028

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_TRANSPARENT => 64029

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_COLLATE => 64030

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DUPLEX_NONE => 64031

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DUPLEX_HORZ => 64032

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DUPLEX_VERT => 64033

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_RES_DRAFT => 64034

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_RES_LOW => 64035

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_RES_MEDIUM => 64036

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_RES_HIGH => 64037

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_RES_PRESENTATION => 64038

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_MONO => 64039

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_COLOR => 64040

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DITHER_NONE => 64041

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DITHER_COARSE => 64042

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DITHER_FINE => 64043

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DITHER_LINEART => 64044

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_SCALING => 64045

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_COPY => 64046

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_HTCLRADJ => 64047

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_HALFTONE_SETUP => 64048

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_WATERMARK => 64049

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ERROR => 64050

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ICM_OPTION => 64051

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ICM_METHOD => 64052

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ICM_INTENT => 64053

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_STD_FORM => 64054

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_OUTBIN => 64055

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_OUTPUT => 64056

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_GRAPHIC => 64057

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ADVANCE => 64058

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DOCUMENT => 64059

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DEVICE => 64060

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DEVICE2 => 64061

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PRINTER => 64062

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PRINTER2 => 64063

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PRINTER3 => 64064

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PRINTER4 => 64065

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_OPTION => 64066

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_OPTION2 => 64067

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_STOP => 64068

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_NOTINSTALLED => 64069

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_WARNING_OVERLAY => 64070

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_STOP_WARNING_OVERLAY => 64071

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_GENERIC_OPTION => 64072

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_GENERIC_ITEM => 64073

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_RUN_DIALOG => 64074

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_QUESTION => 64075

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_FORMTRAYASSIGN => 64076

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PRINTER_FOLDER => 64077

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_INSTALLABLE_OPTION => 64078

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PRINTER_FEATURE => 64079

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DEVICE_FEATURE => 64080

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_FONTSUB => 64081

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_POSTSCRIPT => 64082

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_TELEPHONE => 64083

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DUPLEX_NONE_L => 64084

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DUPLEX_HORZ_L => 64085

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_DUPLEX_VERT_L => 64086

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LF_PEN_PLOTTER => 64087

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_SF_PEN_PLOTTER => 64088

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LF_RASTER_PLOTTER => 64089

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_SF_RASTER_PLOTTER => 64090

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ROLL_PAPER => 64091

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PEN_CARROUSEL => 64092

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PLOTTER_PEN => 64093

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_MANUAL_FEED => 64094

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_FAX => 64095

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_PAGE_PROTECT => 64096

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ENVELOPE_FEED => 64097

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_FONTCART_SLOT => 64098

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_PORTRAIT => 64099

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_ARROWL => 64100

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_ARROWS => 64101

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_BOOKLETL => 64102

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_BOOKLETP => 64103

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_ARROWLR => 64104

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_ROT_PORT => 64105

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_BOOKLETL_NB => 64106

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_LAYOUT_BMP_BOOKLETP_NB => 64107

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ROT_PORT => 64110

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_NUP_BORDER => 64111

    /**
     * @type {Integer (UInt32)}
     */
    static IDI_CPSUI_ICONID_LAST => 64111

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STRID_FIRST => 64700

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SETUP => 64700

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MORE => 64701

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_CHANGE => 64702

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_OPTION => 64703

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_OF => 64704

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_RANGE_FROM => 64705

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TO => 64706

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COLON_SEP => 64707

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LEFT_ANGLE => 64708

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_RIGHT_ANGLE => 64709

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SLASH_SEP => 64710

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PERCENT => 64711

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LBCB_NOSEL => 64712

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PROPERTIES => 64713

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DEFAULTDOCUMENT => 64714

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DOCUMENT => 64715

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ADVANCEDOCUMENT => 64716

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PRINTER => 64717

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_AUTOSELECT => 64718

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PAPER_OUTPUT => 64719

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_GRAPHIC => 64720

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_OPTIONS => 64721

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ADVANCED => 64722

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STDDOCPROPTAB => 64723

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STDDOCPROPTVTAB => 64724

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DEVICEOPTIONS => 64725

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FALSE => 64726

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TRUE => 64727

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NO => 64728

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_YES => 64729

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_OFF => 64730

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ON => 64731

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DEFAULT => 64732

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ERROR => 64733

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NONE => 64734

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NOT => 64735

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_EXIST => 64736

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NOTINSTALLED => 64737

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ORIENTATION => 64738

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SCALING => 64739

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUM_OF_COPIES => 64740

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SOURCE => 64741

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PRINTQUALITY => 64742

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_RESOLUTION => 64743

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COLOR_APPERANCE => 64744

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DUPLEX => 64745

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TTOPTION => 64746

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FORMNAME => 64747

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICM => 64748

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICMMETHOD => 64749

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICMINTENT => 64750

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MEDIA => 64751

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DITHERING => 64752

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PORTRAIT => 64753

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LANDSCAPE => 64754

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ROT_LAND => 64755

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COLLATE => 64756

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COLLATED => 64757

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PRINTFLDSETTING => 64758

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DRAFT => 64759

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LOW => 64760

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MEDIUM => 64761

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_HIGH => 64762

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PRESENTATION => 64763

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COLOR => 64764

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_GRAYSCALE => 64765

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MONOCHROME => 64766

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SIMPLEX => 64767

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_HORIZONTAL => 64768

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_VERTICAL => 64769

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LONG_SIDE => 64770

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SHORT_SIDE => 64771

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TT_PRINTASGRAPHIC => 64772

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TT_DOWNLOADSOFT => 64773

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TT_DOWNLOADVECT => 64774

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TT_SUBDEV => 64775

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICM_BLACKWHITE => 64776

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICM_NO => 64777

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICM_YES => 64778

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICM_SATURATION => 64779

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICM_CONTRAST => 64780

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ICM_COLORMETRIC => 64781

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STANDARD => 64782

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_GLOSSY => 64783

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TRANSPARENCY => 64784

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_REGULAR => 64785

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_BOND => 64786

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COARSE => 64787

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FINE => 64788

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LINEART => 64789

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ERRDIFFUSE => 64790

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_HALFTONE => 64791

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_HTCLRADJ => 64792

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_USE_HOST_HT => 64793

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_USE_DEVICE_HT => 64794

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_USE_PRINTER_HT => 64795

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_OUTBINASSIGN => 64796

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_WATERMARK => 64797

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FORMTRAYASSIGN => 64798

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_UPPER_TRAY => 64799

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ONLYONE => 64800

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LOWER_TRAY => 64801

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MIDDLE_TRAY => 64802

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MANUAL_TRAY => 64803

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ENVELOPE_TRAY => 64804

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ENVMANUAL_TRAY => 64805

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TRACTOR_TRAY => 64806

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SMALLFMT_TRAY => 64807

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LARGEFMT_TRAY => 64808

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LARGECAP_TRAY => 64809

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_CASSETTE_TRAY => 64810

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DEFAULT_TRAY => 64811

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FORMSOURCE => 64812

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MANUALFEED => 64813

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PRINTERMEM_KB => 64814

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PRINTERMEM_MB => 64815

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PAGEPROTECT => 64816

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_HALFTONE_SETUP => 64817

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_INSTFONTCART => 64818

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SLOT1 => 64819

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SLOT2 => 64820

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SLOT3 => 64821

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SLOT4 => 64822

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LEFT_SLOT => 64823

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_RIGHT_SLOT => 64824

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STAPLER => 64825

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STAPLER_ON => 64826

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STAPLER_OFF => 64827

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STACKER => 64828

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MAILBOX => 64829

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COPY => 64830

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_COPIES => 64831

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_TOTAL => 64832

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MAKE => 64833

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PRINT => 64834

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FAX => 64835

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PLOT => 64836

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SLOW => 64837

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FAST => 64838

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ROTATED => 64839

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_RESET => 64840

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ALL => 64841

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DEVICE => 64842

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SETTINGS => 64843

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_REVERT => 64844

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_CHANGES => 64845

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_CHANGED => 64846

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_WARNING => 64847

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ABOUT => 64848

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_VERSION => 64849

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NO_NAME => 64850

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SETTING => 64851

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DEVICE_SETTINGS => 64852

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STDDOCPROPTAB1 => 64853

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STDDOCPROPTAB2 => 64854

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_PAGEORDER => 64855

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_FRONTTOBACK => 64856

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_BACKTOFRONT => 64857

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_QUALITY_SETTINGS => 64858

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_QUALITY_DRAFT => 64859

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_QUALITY_BETTER => 64860

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_QUALITY_BEST => 64861

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_QUALITY_CUSTOM => 64862

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_OUTPUTBIN => 64863

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP => 64864

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_NORMAL => 64865

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_TWOUP => 64866

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_FOURUP => 64867

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_SIXUP => 64868

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_NINEUP => 64869

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_SIXTEENUP => 64870

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SIDE1 => 64871

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_SIDE2 => 64872

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_BOOKLET => 64873

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_POSTER => 64874

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_POSTER_2x2 => 64875

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_POSTER_3x3 => 64876

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_POSTER_4x4 => 64877

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_DIRECTION => 64878

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_RIGHT_THEN_DOWN => 64879

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DOWN_THEN_RIGHT => 64880

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_LEFT_THEN_DOWN => 64881

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_DOWN_THEN_LEFT => 64882

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MANUAL_DUPLEX => 64883

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MANUAL_DUPLEX_ON => 64884

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_MANUAL_DUPLEX_OFF => 64885

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_ROT_PORT => 64886

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STAPLE => 64887

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_BOOKLET_EDGE => 64888

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_BOOKLET_EDGE_LEFT => 64889

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_BOOKLET_EDGE_RIGHT => 64890

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_BORDER => 64891

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_NUP_BORDERED => 64892

    /**
     * @type {Integer (UInt32)}
     */
    static IDS_CPSUI_STRID_LAST => 64892

    /**
     * @type {String}
     */
    static XPS_FP_PRINTER_NAME => "PrinterName"

    /**
     * @type {String}
     */
    static XPS_FP_PROGRESS_REPORT => "ProgressReport"

    /**
     * @type {String}
     */
    static XPS_FP_PRINTER_HANDLE => "PrinterHandle"

    /**
     * @type {String}
     */
    static XPS_FP_USER_PRINT_TICKET => "PerUserPrintTicket"

    /**
     * @type {String}
     */
    static XPS_FP_USER_TOKEN => "UserSecurityToken"

    /**
     * @type {String}
     */
    static XPS_FP_JOB_ID => "PrintJobId"

    /**
     * @type {String}
     */
    static XPS_FP_PRINT_CLASS_FACTORY => "PrintClassFactory"

    /**
     * @type {String}
     */
    static XPS_FP_OUTPUT_FILE => "PrintOutputFileName"

    /**
     * @type {String}
     */
    static XPS_FP_MS_CONTENT_TYPE => "DriverMultiContentType"

    /**
     * @type {String}
     */
    static XPS_FP_MS_CONTENT_TYPE_XPS => "XPS"

    /**
     * @type {String}
     */
    static XPS_FP_MS_CONTENT_TYPE_OPENXPS => "OpenXPS"

    /**
     * @type {String}
     */
    static XPS_FP_DRIVER_PROPERTY_BAG => "DriverPropertyBag"

    /**
     * @type {String}
     */
    static XPS_FP_QUEUE_PROPERTY_BAG => "QueuePropertyBag"

    /**
     * @type {String}
     */
    static XPS_FP_MERGED_DATAFILE_PATH => "MergedDataFilePath"

    /**
     * @type {String}
     */
    static XPS_FP_RESOURCE_DLL_PATHS => "ResourceDLLPaths"

    /**
     * @type {String}
     */
    static XPS_FP_JOB_LEVEL_PRINTTICKET => "JobPrintTicket"

    /**
     * @type {String}
     */
    static XPS_FP_PRINTDEVICECAPABILITIES => "PrintDeviceCapabilities"

    /**
     * @type {String}
     */
    static XPS_FP_FAX_JOB_PROPERTIES => "JobFaxProperties"

    /**
     * @type {Integer (UInt32)}
     */
    static MXDC_ESCAPE => 4122

    /**
     * @type {Integer (UInt32)}
     */
    static MXDCOP_GET_FILENAME => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MXDCOP_PRINTTICKET_FIXED_DOC_SEQ => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MXDCOP_PRINTTICKET_FIXED_DOC => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MXDCOP_PRINTTICKET_FIXED_PAGE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MXDCOP_SET_S0PAGE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static MXDCOP_SET_S0PAGE_RESOURCE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static MXDCOP_SET_XPSPASSTHRU_MODE => 32

    /**
     * @type {String}
     */
    static CLSID_OEMRENDER => "{6d6abf26-9f38-11d1-882a-00c04fb961ec}"

    /**
     * @type {String}
     */
    static CLSID_OEMUI => "{abce80d7-9f46-11d1-882a-00c04fb961ec}"

    /**
     * @type {String}
     */
    static CLSID_OEMUIMXDC => "{4e144300-5b43-4288-932a-5e4dd6d82bed}"

    /**
     * @type {String}
     */
    static CLSID_OEMPTPROVIDER => "{91723892-45d2-48e2-9ec9-562379daf992}"

    /**
     * @type {Integer (Int32)}
     */
    static S_DEVCAP_OUTPUT_FULL_REPLACEMENT => 318465

    /**
     * @type {String}
     */
    static CLSID_PTPROVIDER => "{46ac151b-8490-4531-96cc-55bf2bf19e11}"

    /**
     * @type {Integer (UInt32)}
     */
    static E_VERSION_NOT_SUPPORTED => 2147745793

    /**
     * @type {Integer (UInt32)}
     */
    static S_NO_CONFLICT => 262145

    /**
     * @type {Integer (UInt32)}
     */
    static S_CONFLICT_RESOLVED => 262146

    /**
     * @type {String}
     */
    static PRINTER_EXTENSION_DETAILEDREASON_PRINTER_STATUS => "{5d5a1704-dfd1-4181-8eee-815c86edad31}"

    /**
     * @type {String}
     */
    static PRINTER_EXTENSION_REASON_PRINT_PREFERENCES => "{ec8f261f-267c-469f-b5d6-3933023c29cc}"

    /**
     * @type {String}
     */
    static PRINTER_EXTENSION_REASON_DRIVER_EVENT => "{23bb1328-63de-4293-915b-a6a23d929acb}"

    /**
     * @type {String}
     */
    static FMTID_PrinterPropertyBag => "{75f9adca-097d-45c3-a6e4-bab29e276f3e}"

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_OEMINTF_VERSION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OEM_MODE_PUBLISHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGI_GETSIGNATURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGI_GETINTERFACEVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGI_GETVERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGI_GETPUBLISHERINFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGI_GETREQUESTEDHELPERINTERFACES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static OEMPUBLISH_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OEMPUBLISH_IPRINTCOREHELPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMDM_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMDM_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OEMDM_CONVERT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OEMDM_MERGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_MIN_DOCSTICKY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PSDM_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PSDM_DIALECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PSDM_TTDLFMT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PSDM_NUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PSDM_PSLEVEL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PSDM_CUSTOMSIZE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_UNIDM_GPDVER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_UNIDM_FLAGS => 16385

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_MIN_PRINTERSTICKY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PRINTFLAGS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_FREEMEM => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_JOBTIMEOUT => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_WAITTIMEOUT => 32771

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_PROTOCOL => 32772

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_MINOUTLINE => 32773

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_MAXBITMAP => 32774

    /**
     * @type {Integer (UInt32)}
     */
    static OEMGDS_MAX => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static GPD_OEMCUSTOMDATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MV_UPDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MV_RELATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MV_GRAPHICS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MV_PHYSICAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MV_SENDXMOVECMD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MV_SENDYMOVECMD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OEMTTY_INFO_MARGINS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMTTY_INFO_CODEPAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OEMTTY_INFO_NUM_UFMS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OEMTTY_INFO_UFM_IDS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UFOFLAG_TTFONT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UFOFLAG_TTDOWNLOAD_BITMAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UFOFLAG_TTDOWNLOAD_TTOUTLINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UFOFLAG_TTOUTLINE_BOLD_SIM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static UFOFLAG_TTOUTLINE_ITALIC_SIM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UFOFLAG_TTOUTLINE_VERTICAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static UFOFLAG_TTSUBSTITUTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static UFO_GETINFO_FONTOBJ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UFO_GETINFO_GLYPHSTRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UFO_GETINFO_GLYPHBITMAP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static UFO_GETINFO_GLYPHWIDTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UFO_GETINFO_MEMORY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static UFO_GETINFO_STDVARIABLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_PRINTDIRINCCDEGREES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_GRAYPERCENTAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_NEXTFONTID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_NEXTGLYPH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_FONTHEIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_FONTWIDTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_FONTBOLD => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_FONTITALIC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_FONTUNDERLINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_FONTSTRIKETHRU => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_CURRENTFONTID => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_TEXTYRES => 11

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_TEXTXRES => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_FONTMAXWIDTH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FNT_INFO_MAX => 14

    /**
     * @type {Integer (UInt32)}
     */
    static TTDOWNLOAD_DONTCARE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TTDOWNLOAD_GRAPHICS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTDOWNLOAD_BITMAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TTDOWNLOAD_TTOUTLINE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_TRANSDATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_GLYPHHANDLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_GLYPHID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PDEV_ADJUST_PAPER_MARGIN_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDEV_HOSTFONT_ENABLED_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PDEV_USE_TRUE_COLOR_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PDEV_ADJUST_GRAPHICS_RESOLUTION_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PDEV_ADJUST_IMAGEABLE_ORIGIN_AREA_TYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PDEV_ADJUST_PHYSICAL_PAPER_SIZE_TYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OEMCUIP_DOCPROP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OEMCUIP_PRNPROP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CUSTOMPARAM_WIDTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CUSTOMPARAM_HEIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CUSTOMPARAM_WIDTHOFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CUSTOMPARAM_HEIGHTOFFSET => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CUSTOMPARAM_ORIENTATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CUSTOMPARAM_MAX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SETOPTIONS_FLAG_RESOLVE_CONFLICT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SETOPTIONS_FLAG_KEEP_CONFLICT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SETOPTIONS_RESULT_NO_CONFLICT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SETOPTIONS_RESULT_CONFLICT_RESOLVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SETOPTIONS_RESULT_CONFLICT_REMAINED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UNIFM_VERSION_1_0 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static UFM_SOFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UFM_CART => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UFM_SCALABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DF_TYPE_HPINTELLIFONT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DF_TYPE_TRUETYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DF_TYPE_PST1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DF_TYPE_CAPSL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DF_TYPE_OEM1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DF_TYPE_OEM2 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DF_NOITALIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DF_NOUNDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DF_XM_CR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DF_NO_BOLD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DF_NO_DOUBLE_UNDERLINE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DF_NO_STRIKETHRU => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DF_BKSP_OK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static UNI_GLYPHSETDATA_VERSION_1_0 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_FORMAT_MASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_COMPOSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_DIRECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_PAIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_DOUBLEBYTECHAR_MASK => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_SINGLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_DOUBLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_PREDEFIN_MASK => 224

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_REPLACE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_ADD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MTYPE_DISABLE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CC_NOPRECNV => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static CC_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static CC_CP437 => -1

    /**
     * @type {Integer (Int32)}
     */
    static CC_CP850 => -2

    /**
     * @type {Integer (Int32)}
     */
    static CC_CP863 => -3

    /**
     * @type {Integer (Int32)}
     */
    static CC_BIG5 => -10

    /**
     * @type {Integer (Int32)}
     */
    static CC_ISC => -11

    /**
     * @type {Integer (Int32)}
     */
    static CC_JIS => -12

    /**
     * @type {Integer (Int32)}
     */
    static CC_JIS_ANK => -13

    /**
     * @type {Integer (Int32)}
     */
    static CC_NS86 => -14

    /**
     * @type {Integer (Int32)}
     */
    static CC_TCA => -15

    /**
     * @type {Integer (Int32)}
     */
    static CC_GB2312 => -16

    /**
     * @type {Integer (Int32)}
     */
    static CC_SJIS => -17

    /**
     * @type {Integer (Int32)}
     */
    static CC_WANSUNG => -18

    /**
     * @type {Integer (UInt32)}
     */
    static UFF_VERSION_NUMBER => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_DIR_SORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_UFM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_IFI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_SOFTFONT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_PERMANENT_SF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_DEVICEFONT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_GLYPHSET_GTT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_GLYPHSET_RLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FONT_FL_RESERVED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FG_CANCHANGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WM_FI_FILENAME => 900

    /**
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PROTOCOL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROTOCOL_UNKNOWN_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RAWTCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROTOCOL_RAWTCP_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LPR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROTOCOL_LPR_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PORTNAME_LEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NETWORKNAME_LEN => 49

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NETWORKNAME2_LEN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SNMP_COMMUNITY_STR_LEN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_QUEUENAME_LEN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_IPADDR_STR_LEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ADDRESS_STR_LEN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEVICEDESCRIPTION_STR_LEN => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DPS_NOPERMISSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DM_ADVANCED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DM_NOPERMISSION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DM_USER_DEFAULT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PROMPT_NON_MODAL => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DM_INVALIDATE_DRIVER_CACHE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DM_RESERVED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_CONVERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_CONVERT351 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_DRIVER_DEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_FIRST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_CREATEDCPRE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_CREATEDCPOST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_RESETDCPRE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_RESETDCPOST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_STARTDOC => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_STARTDOCPRE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_STARTPAGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_ENDPAGE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_ENDDOC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_ENDDOCPRE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_ABORTDOC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_DELETEDC => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_ESCAPE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_ENDDOCPOST => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_STARTDOCPOST => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_QUERYFILTER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDPAGEEPRE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDPAGEPOST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPOST => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_CANCELJOB => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPRE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPRE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPRE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPOST => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPOST => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPOST => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPOST => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_LAST => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_SPOOLED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOCUMENTEVENT_UNSUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOCUMENTEVENT_FAILURE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_CONFIGURATION_CHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_ADD_CONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_DELETE_CONNECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_INITIALIZE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_CACHE_REFRESH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_CACHE_DELETE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_ATTRIBUTES_CHANGED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_CONFIGURATION_UPDATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_ADD_CONNECTION_NO_UI => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_DELETE_CONNECTION_NO_UI => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_EVENT_FLAG_NO_UI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_EVENT_INITIALIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_EVENT_DELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BORDER_PRINT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NO_BORDER_PRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NORMAL_PRINT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REVERSE_PRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BOOKLET_PRINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NO_COLOR_OPTIMIZATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_OPTIMIZATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REVERSE_PAGES_FOR_REVERSE_DUPLEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DONT_SEND_EXTRA_PAGES_FOR_DUPLEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RIGHT_THEN_DOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOWN_THEN_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LEFT_THEN_DOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DOWN_THEN_LEFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BOOKLET_EDGE_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BOOKLET_EDGE_RIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QCP_DEVICEPROFILE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static QCP_SOURCEPROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QCP_PROFILEMEMORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QCP_PROFILEDISK => 2

    /**
     * @type {String}
     */
    static SPLPRINTER_USER_MODE_PRINTER_DRIVER => "SPLUserModePrinterDriver"

    /**
     * @type {Integer (UInt32)}
     */
    static EMF_PP_COLOR_OPTIMIZATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_STATUS_ENDPOINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_STATUS_POLL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_STATUS_INFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTER_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTER_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTER_STOP_ROUTING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOC_INFO_INTERNAL_LEVEL => 100

    /**
     * @type {Integer (UInt32)}
     */
    static SPLCLIENT_INFO_INTERNAL_LEVEL => 100

    /**
     * @type {Integer (UInt32)}
     */
    static FILL_WITH_DEFAULTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_INFO_DATA_COMPACT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_EVENT_SET_PRINTER_DATAEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_EVENT_DELETE_PRINTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_EVENT_ADD_PRINTER_CONNECTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_EVENT_DELETE_PRINTER_CONNECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_EVENT_FILES_CHANGED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_FLAG_CLIENT_SPOOLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_FLAG_SERVER_SPOOLER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSPRINT_PUBLISH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSPRINT_UPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSPRINT_UNPUBLISH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSPRINT_REPUBLISH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSPRINT_PENDING => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CONTROL_PAUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CONTROL_RESUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CONTROL_PURGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CONTROL_SET_STATUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PAUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PENDING_DELETION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PAPER_JAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PAPER_OUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_MANUAL_FEED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PAPER_PROBLEM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_OFFLINE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_IO_ACTIVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_BUSY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PRINTING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_OUTPUT_BIN_FULL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_NOT_AVAILABLE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_WAITING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PROCESSING => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_INITIALIZING => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_WARMING_UP => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_TONER_LOW => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_NO_TONER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_PAGE_PUNT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_USER_INTERVENTION => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_OUT_OF_MEMORY => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_DOOR_OPEN => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_SERVER_UNKNOWN => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_POWER_SAVE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_SERVER_OFFLINE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_STATUS_DRIVER_UPDATE_NEEDED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_QUEUED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_DIRECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_DEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_SHARED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_NETWORK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_HIDDEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_LOCAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_ENABLE_DEVQ => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_KEEPPRINTEDJOBS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_DO_COMPLETE_FIRST => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_WORK_OFFLINE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_ENABLE_BIDI => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_RAW_ONLY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_PUBLISHED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_FAX => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_TS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_PUSHED_USER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_PUSHED_MACHINE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_MACHINE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_FRIENDLY_NAME => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_TS_GENERIC_DRIVER => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_PER_USER => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ATTRIBUTE_ENTERPRISE_CLOUD => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static NO_PRIORITY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PRIORITY => 99

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_PRIORITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEF_PRIORITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_PAUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_RESUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_CANCEL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_RESTART => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_DELETE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_SENT_TO_PRINTER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_LAST_PAGE_EJECTED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_RETAIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_RELEASE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_SEND_TOAST => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_CONTROL_PENDING_ON_DEVICE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_PAUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_DELETING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_SPOOLING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_PRINTING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_OFFLINE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_PAPEROUT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_PRINTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_DELETED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_BLOCKED_DEVQ => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_USER_INTERVENTION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_RESTART => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_COMPLETE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_RETAINED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_STATUS_RENDERING_LOCALLY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_POSITION_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_PACKAGE_AWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_XPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_SANDBOX_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_CLASS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_DERIVED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_NOT_SHAREABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_CATEGORY_FAX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_CATEGORY_FILE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_CATEGORY_VIRTUAL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_CATEGORY_SERVICE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_SOFT_RESET_REQUIRED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_SANDBOX_DISABLED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_CATEGORY_3D => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_CATEGORY_CLOUD => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_KERNELMODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_USERMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DPD_DELETE_UNUSED_FILES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DPD_DELETE_SPECIFIC_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DPD_DELETE_ALL_FILES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static APD_STRICT_UPGRADE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APD_STRICT_DOWNGRADE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static APD_COPY_ALL_FILES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static APD_COPY_NEW_FILES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static APD_COPY_FROM_DIRECTORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STRING_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STRING_MUIDLL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STRING_LANGPAIR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FORM_KEYWORD_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DI_CHANNEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_READ_SPOOL_JOB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI_MEMORYMAP_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FORM_USER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FORM_BUILTIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FORM_PRINTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_RIGHT_THEN_DOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_DOWN_THEN_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_LEFT_THEN_DOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_DOWN_THEN_LEFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_BORDER_PRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_BOOKLET_EDGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_REVERSE_PAGES_FOR_REVERSE_DUPLEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_DONT_SEND_EXTRA_PAGES_FOR_DUPLEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PPCAPS_SQUARE_SCALING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_TYPE_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_TYPE_READ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_TYPE_REDIRECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_TYPE_NET_ATTACHED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_TYPE_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_TYPE_WARNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_TYPE_INFO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_OFFLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_PAPER_JAM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_PAPER_OUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_OUTPUT_BIN_FULL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_PAPER_PROBLEM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_NO_TONER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_DOOR_OPEN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_USER_INTERVENTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_OUT_OF_MEMORY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_TONER_LOW => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_WARMING_UP => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_STATUS_POWER_SAVE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_LOCAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_CONNECTIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_FAVORITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_REMOTE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_SHARED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_NETWORK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_EXPAND => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_CONTAINER => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICONMASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON1 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON2 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON3 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON4 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON5 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON6 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON7 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_ICON8 => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_HIDE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_CATEGORY_ALL => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ENUM_CATEGORY_3D => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SPOOL_FILE_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPOOL_FILE_TEMPORARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_NOTIFY_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_SERVER_NAME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_PRINTER_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_SHARE_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_PORT_NAME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_DRIVER_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_COMMENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_LOCATION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_DEVMODE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_SEPFILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_PRINT_PROCESSOR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_PARAMETERS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_DATATYPE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_SECURITY_DESCRIPTOR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_ATTRIBUTES => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_PRIORITY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_DEFAULT_PRIORITY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_START_TIME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_UNTIL_TIME => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_STATUS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_STATUS_STRING => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_CJOBS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_AVERAGE_PPM => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_TOTAL_PAGES => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_PAGES_PRINTED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_TOTAL_BYTES => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_BYTES_PRINTED => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_OBJECT_GUID => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_FRIENDLY_NAME => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_FIELD_BRANCH_OFFICE_PRINTING => 28

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_PRINTER_NAME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_MACHINE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_PORT_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_USER_NAME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_NOTIFY_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_DATATYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_PRINT_PROCESSOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_PARAMETERS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_DRIVER_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_DEVMODE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_STATUS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_STATUS_STRING => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_SECURITY_DESCRIPTOR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_DOCUMENT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_PRIORITY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_POSITION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_SUBMITTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_START_TIME => 17

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_UNTIL_TIME => 18

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_TIME => 19

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_TOTAL_PAGES => 20

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_PAGES_PRINTED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_TOTAL_BYTES => 22

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_BYTES_PRINTED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_NOTIFY_FIELD_REMOTE_JOB_ID => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_NOTIFY_FIELD_PRINT_DRIVER_ISOLATION_GROUP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_CATEGORY_ALL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_CATEGORY_3D => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_OPTIONS_REFRESH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOTIFY_INFO_DISCARDED => 1

    /**
     * @type {String}
     */
    static BIDI_ACTION_ENUM_SCHEMA => "EnumSchema"

    /**
     * @type {String}
     */
    static BIDI_ACTION_GET => "Get"

    /**
     * @type {String}
     */
    static BIDI_ACTION_SET => "Set"

    /**
     * @type {String}
     */
    static BIDI_ACTION_GET_ALL => "GetAll"

    /**
     * @type {String}
     */
    static BIDI_ACTION_GET_WITH_ARGUMENT => "GetWithArgument"

    /**
     * @type {Integer (UInt32)}
     */
    static BIDI_ACCESS_ADMINISTRATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BIDI_ACCESS_USER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_STATUS_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_ERROR_BASE => 13000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_STATUS_WARNING => 13001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SCHEMA_READ_ONLY => 13002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SERVER_OFFLINE => 13003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_DEVICE_OFFLINE => 13004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SCHEMA_NOT_SUPPORTED => 13005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SET_DIFFERENT_TYPE => 13006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SET_MULTIPLE_SCHEMAPATH => 13007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SET_INVALID_SCHEMAPATH => 13008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SET_UNKNOWN_FAILURE => 13009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_SCHEMA_WRITE_ONLY => 13010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_GET_REQUIRES_ARGUMENT => 13011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_GET_ARGUMENT_NOT_SUPPORTED => 13012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_GET_MISSING_ARGUMENT => 13013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_DEVICE_CONFIG_UNCHANGED => 13014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_NO_LOCALIZED_RESOURCES => 13015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_NO_BIDI_SCHEMA_EXTENSIONS => 13016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_UNSUPPORTED_CLIENT_LANGUAGE => 13017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIDI_UNSUPPORTED_RESOURCE_FORMAT => 13018

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_ADD_PRINTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_SET_PRINTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_DELETE_PRINTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_FAILED_CONNECTION_PRINTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_PRINTER => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_ADD_JOB => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_SET_JOB => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_DELETE_JOB => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_WRITE_JOB => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_JOB => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_ADD_FORM => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_SET_FORM => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_DELETE_FORM => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_FORM => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_ADD_PORT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_CONFIGURE_PORT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_DELETE_PORT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_PORT => 7340032

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_ADD_PRINT_PROCESSOR => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_DELETE_PRINT_PROCESSOR => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_PRINT_PROCESSOR => 117440512

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_SERVER => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_ADD_PRINTER_DRIVER => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_SET_PRINTER_DRIVER => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_DELETE_PRINTER_DRIVER => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_PRINTER_DRIVER => 1879048192

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_TIMEOUT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CHANGE_ALL => 2138570751

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ERROR_INFORMATION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ERROR_WARNING => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ERROR_SEVERE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ERROR_OUTOFPAPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ERROR_JAM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_ERROR_OUTOFTONER => 4

    /**
     * @type {String}
     */
    static SPLREG_DEFAULT_SPOOL_DIRECTORY => "DefaultSpoolDirectory"

    /**
     * @type {String}
     */
    static SPLREG_PORT_THREAD_PRIORITY_DEFAULT => "PortThreadPriorityDefault"

    /**
     * @type {String}
     */
    static SPLREG_PORT_THREAD_PRIORITY => "PortThreadPriority"

    /**
     * @type {String}
     */
    static SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT => "SchedulerThreadPriorityDefault"

    /**
     * @type {String}
     */
    static SPLREG_SCHEDULER_THREAD_PRIORITY => "SchedulerThreadPriority"

    /**
     * @type {String}
     */
    static SPLREG_BEEP_ENABLED => "BeepEnabled"

    /**
     * @type {String}
     */
    static SPLREG_NET_POPUP => "NetPopup"

    /**
     * @type {String}
     */
    static SPLREG_RETRY_POPUP => "RetryPopup"

    /**
     * @type {String}
     */
    static SPLREG_NET_POPUP_TO_COMPUTER => "NetPopupToComputer"

    /**
     * @type {String}
     */
    static SPLREG_EVENT_LOG => "EventLog"

    /**
     * @type {String}
     */
    static SPLREG_MAJOR_VERSION => "MajorVersion"

    /**
     * @type {String}
     */
    static SPLREG_MINOR_VERSION => "MinorVersion"

    /**
     * @type {String}
     */
    static SPLREG_ARCHITECTURE => "Architecture"

    /**
     * @type {String}
     */
    static SPLREG_OS_VERSION => "OSVersion"

    /**
     * @type {String}
     */
    static SPLREG_OS_VERSIONEX => "OSVersionEx"

    /**
     * @type {String}
     */
    static SPLREG_DS_PRESENT => "DsPresent"

    /**
     * @type {String}
     */
    static SPLREG_DS_PRESENT_FOR_USER => "DsPresentForUser"

    /**
     * @type {String}
     */
    static SPLREG_REMOTE_FAX => "RemoteFax"

    /**
     * @type {String}
     */
    static SPLREG_RESTART_JOB_ON_POOL_ERROR => "RestartJobOnPoolError"

    /**
     * @type {String}
     */
    static SPLREG_RESTART_JOB_ON_POOL_ENABLED => "RestartJobOnPoolEnabled"

    /**
     * @type {String}
     */
    static SPLREG_DNS_MACHINE_NAME => "DNSMachineName"

    /**
     * @type {String}
     */
    static SPLREG_ALLOW_USER_MANAGEFORMS => "AllowUserManageForms"

    /**
     * @type {String}
     */
    static SPLREG_WEBSHAREMGMT => "WebShareMgmt"

    /**
     * @type {String}
     */
    static SPLREG_PRINT_DRIVER_ISOLATION_GROUPS => "PrintDriverIsolationGroups"

    /**
     * @type {String}
     */
    static SPLREG_PRINT_DRIVER_ISOLATION_TIME_BEFORE_RECYCLE => "PrintDriverIsolationTimeBeforeRecycle"

    /**
     * @type {String}
     */
    static SPLREG_PRINT_DRIVER_ISOLATION_MAX_OBJECTS_BEFORE_RECYCLE => "PrintDriverIsolationMaxobjsBeforeRecycle"

    /**
     * @type {String}
     */
    static SPLREG_PRINT_DRIVER_ISOLATION_IDLE_TIMEOUT => "PrintDriverIsolationIdleTimeout"

    /**
     * @type {String}
     */
    static SPLREG_PRINT_DRIVER_ISOLATION_EXECUTION_POLICY => "PrintDriverIsolationExecutionPolicy"

    /**
     * @type {String}
     */
    static SPLREG_PRINT_DRIVER_ISOLATION_OVERRIDE_POLICY => "PrintDriverIsolationOverrideCompat"

    /**
     * @type {String}
     */
    static SPLREG_PRINT_QUEUE_V4_DRIVER_DIRECTORY => "PrintQueueV4DriverDirectory"

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_ACCESS_ADMINISTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_ACCESS_READ => 32

    /**
     * @type {String}
     */
    static SPLDS_SPOOLER_KEY => "DsSpooler"

    /**
     * @type {String}
     */
    static SPLDS_DRIVER_KEY => "DsDriver"

    /**
     * @type {String}
     */
    static SPLDS_USER_KEY => "DsUser"

    /**
     * @type {String}
     */
    static SPLDS_ASSET_NUMBER => "assetNumber"

    /**
     * @type {String}
     */
    static SPLDS_BYTES_PER_MINUTE => "bytesPerMinute"

    /**
     * @type {String}
     */
    static SPLDS_DESCRIPTION => "description"

    /**
     * @type {String}
     */
    static SPLDS_DRIVER_NAME => "driverName"

    /**
     * @type {String}
     */
    static SPLDS_DRIVER_VERSION => "driverVersion"

    /**
     * @type {String}
     */
    static SPLDS_LOCATION => "location"

    /**
     * @type {String}
     */
    static SPLDS_PORT_NAME => "portName"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_ATTRIBUTES => "printAttributes"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_BIN_NAMES => "printBinNames"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_COLLATE => "printCollate"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_COLOR => "printColor"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_DUPLEX_SUPPORTED => "printDuplexSupported"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_END_TIME => "printEndTime"

    /**
     * @type {String}
     */
    static SPLDS_PRINTER_CLASS => "printQueue"

    /**
     * @type {String}
     */
    static SPLDS_PRINTER_NAME => "printerName"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_KEEP_PRINTED_JOBS => "printKeepPrintedJobs"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_LANGUAGE => "printLanguage"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MAC_ADDRESS => "printMACAddress"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MAX_X_EXTENT => "printMaxXExtent"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MAX_Y_EXTENT => "printMaxYExtent"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MAX_RESOLUTION_SUPPORTED => "printMaxResolutionSupported"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MEDIA_READY => "printMediaReady"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MEDIA_SUPPORTED => "printMediaSupported"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MEMORY => "printMemory"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MIN_X_EXTENT => "printMinXExtent"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_MIN_Y_EXTENT => "printMinYExtent"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_NETWORK_ADDRESS => "printNetworkAddress"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_NOTIFY => "printNotify"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_NUMBER_UP => "printNumberUp"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_ORIENTATIONS_SUPPORTED => "printOrientationsSupported"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_OWNER => "printOwner"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_PAGES_PER_MINUTE => "printPagesPerMinute"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_RATE => "printRate"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_RATE_UNIT => "printRateUnit"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_SEPARATOR_FILE => "printSeparatorFile"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_SHARE_NAME => "printShareName"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_SPOOLING => "printSpooling"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_STAPLING_SUPPORTED => "printStaplingSupported"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_START_TIME => "printStartTime"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_STATUS => "printStatus"

    /**
     * @type {String}
     */
    static SPLDS_PRIORITY => "priority"

    /**
     * @type {String}
     */
    static SPLDS_SERVER_NAME => "serverName"

    /**
     * @type {String}
     */
    static SPLDS_SHORT_SERVER_NAME => "shortServerName"

    /**
     * @type {String}
     */
    static SPLDS_UNC_NAME => "uNCName"

    /**
     * @type {String}
     */
    static SPLDS_URL => "url"

    /**
     * @type {String}
     */
    static SPLDS_FLAGS => "flags"

    /**
     * @type {String}
     */
    static SPLDS_VERSION_NUMBER => "versionNumber"

    /**
     * @type {String}
     */
    static SPLDS_PRINT_IPP_COMPRESSION_SUPPORTED => "ippCompressionSupported"

    /**
     * @type {String}
     */
    static SPLDS_PRINTER_NAME_ALIASES => "printerNameAliases"

    /**
     * @type {String}
     */
    static SPLDS_PRINTER_LOCATIONS => "printerLocations"

    /**
     * @type {String}
     */
    static SPLDS_PRINTER_MODEL => "printerModel"

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CONNECTION_MISMATCH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTER_CONNECTION_NO_UI => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IPDFP_COPY_ALL_FILES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UPDP_SILENT_UPLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UPDP_UPLOAD_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UPDP_CHECK_DRIVERSTORE => 4

    /**
     * @type {String}
     */
    static MS_PRINT_JOB_OUTPUT_FILE => "MsPrintJobOutputFile"

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ELEMENT => 10000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ELEMENT_XMLNODE => 10001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ELEMENT_NAME => 10002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ELEMENT_NAMESPACEURI => 10003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT => 10100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT_DISPLAYNAME => 10101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_OPTION => 10200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_OPTION_SELECTED => 10201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_OPTION_CONSTRAINED => 10202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_OPTION_GETPROPERTYVALUE => 10203

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION => 10300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_WIDTH => 10301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_HEIGHT => 10302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_NUPOPTION => 10400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_NUPOPTION_PAGESPERSHEET => 10401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_OPTIONCOLLECTION => 10500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_OPTIONCOLLECTION_COUNT => 10501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_OPTIONCOLLECTION_GETAT => 10502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_FEATURE => 10600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_FEATURE_SELECTEDOPTION => 10601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_FEATURE_SELECTIONTYPE => 10602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_FEATURE_GETOPTION => 10603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_FEATURE_DISPLAYUI => 10604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE => 10700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_WIDTH => 10701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_HEIGHT => 10702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_WIDTH => 10703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_HEIGHT => 10704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_WIDTH => 10705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_HEIGHT => 10706

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES => 10800

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE_KEYNAME => 10801

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE => 10802

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_PAGEIMAGEABLESIZE => 10803

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMINVALUE => 10804

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMAXVALUE => 10805

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_GETSELECTEDOPTION => 10806

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_GETOPTIONS => 10807

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_CAPABILITIES_GETPARAMETERDEFINITION => 10808

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ASYNCOPERATION => 10900

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ASYNCOPERATION_START => 10901

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ASYNCOPERATION_CANCEL => 10902

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET => 11000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_GETFEATURE_KEYNAME => 11001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_GETFEATURE => 11002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_VALIDATEASYNC => 11003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_COMMITASYNC => 11004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_NOTIFYXMLCHANGED => 11005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_GETCAPABILITIES => 11006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_JOBCOPIESALLDOCUMENTS => 11007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_TICKET_GETPARAMETERINITIALIZER => 11008

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT => 11100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT_COMPLETED => 11101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM => 11200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_READ => 11201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_WRITE => 11202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLESTREAM => 11300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLESTREAM_COMMIT => 11301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLESTREAM_SEEK => 11302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLESTREAM_SETSIZE => 11303

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG => 11400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_GETBOOL => 11401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_SETBOOL => 11402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_GETINT32 => 11403

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_SETINT32 => 11404

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_GETSTRING => 11405

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_SETSTRING => 11406

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_GETBYTES => 11407

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_SETBYTES => 11408

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_GETREADSTREAM => 11409

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERPROPERTYBAG_GETWRITESTREAM => 11410

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTREAMASXML => 11411

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG => 11500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBOOL => 11501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBOOL => 11502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETINT32 => 11503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETINT32 => 11504

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTRING => 11505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETSTRING => 11506

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBYTES => 11507

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBYTES => 11508

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETREADSTREAM => 11509

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETWRITESTREAM => 11510

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUE => 11600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUE_HANDLE => 11601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUE_NAME => 11602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUE_SENDBIDIQUERY => 11603

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUE_GETPROPERTIES => 11604

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUE_SENDBIDISETREQUESTASYNC => 11605

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUE_GETPRINTERQUEUEVIEW => 11606

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUEEVENT => 11700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUEEVENT_ONBIDIRESPONSERECEIVED => 11701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXT => 11800

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXT_PRINTERQUEUE => 11801

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXT_PRINTSCHEMATICKET => 11802

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXT_DRIVERPROPERTIES => 11803

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXT_USERPROPERTIES => 11804

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_REQUEST => 11900

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_REQUEST_CANCEL => 11901

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_REQUEST_COMPLETE => 11902

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS => 12000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS_BIDINOTIFICATION => 12001

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS_REASONID => 12002

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS_REQUEST => 12003

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS_SOURCEAPPLICATION => 12004

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS_DETAILEDREASONID => 12005

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWMODAL => 12006

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWPARENT => 12007

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION => 12100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_COUNT => 12101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_GETAT => 12102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENT => 12200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENT_ONDRIVEREVENT => 12201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTEREXTENSION_EVENT_ONPRINTERQUEUESENUMERATED => 12202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTCONTEXT => 12300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTCONTEXT_DRIVERPROPERTIES => 12301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTCONTEXT_QUEUEPROPERTIES => 12302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERSCRIPTCONTEXT_USERPROPERTIES => 12303

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERINITIALIZER => 12400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERINITIALIZER_VALUE => 12401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERDEFINITION => 12500

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERDEFINITION_USERINPUTREQUIRED => 12501

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERDEFINITION_UNITTYPE => 12502

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERDEFINITION_DATATYPE => 12503

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMIN => 12504

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMAX => 12505

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTJOBCOLLECTION => 12600

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTJOBCOLLECTION_COUNT => 12601

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTJOBCOLLECTION_GETAT => 12602

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUEVIEW => 12700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUEVIEW_SETVIEWRANGE => 12701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUEVIEW_EVENT => 12800

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PRINTERQUEUEVIEW_EVENT_ONCHANGED => 12801

    /**
     * @type {String}
     */
    static NOTIFICATION_RELEASE => "{ba9a5027-a70e-4ae7-9b7d-eb3e06ad4157}"

    /**
     * @type {String}
     */
    static PRINT_APP_BIDI_NOTIFY_CHANNEL => "{2abad223-b994-4aca-82fc-4571b1b585ac}"

    /**
     * @type {String}
     */
    static PRINT_PORT_MONITOR_NOTIFY_CHANNEL => "{25df3b0e-74a9-47f5-80ce-79b4b1eb5c58}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_USBPRINT => "{28d78fad-5a12-11d1-ae5b-0000f803a8c2}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_IPPUSB_PRINT => "{f2f40381-f46d-4e51-bce7-62de6cf2d098}"

    /**
     * @type {String}
     */
    static CLSID_XPSRASTERIZER_FACTORY => "{503e79bf-1d09-4764-9d72-1eb0c65967c6}"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {HWND} hWndOwner 
     * @param {Pointer<PFNPROPSHEETUI>} pfnPropSheetUI 
     * @param {LPARAM} lParam 
     * @param {Pointer<Integer>} pResult 
     * @returns {Integer} 
     */
    static CommonPropertySheetUIA(hWndOwner, pfnPropSheetUI, lParam, pResult) {
        hWndOwner := hWndOwner is Win32Handle ? NumGet(hWndOwner, "ptr") : hWndOwner

        result := DllCall("COMPSTUI.dll\CommonPropertySheetUIA", "ptr", hWndOwner, "ptr", pfnPropSheetUI, "ptr", lParam, "uint*", pResult, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWndOwner 
     * @param {Pointer<PFNPROPSHEETUI>} pfnPropSheetUI 
     * @param {LPARAM} lParam 
     * @param {Pointer<Integer>} pResult 
     * @returns {Integer} 
     */
    static CommonPropertySheetUIW(hWndOwner, pfnPropSheetUI, lParam, pResult) {
        hWndOwner := hWndOwner is Win32Handle ? NumGet(hWndOwner, "ptr") : hWndOwner

        result := DllCall("COMPSTUI.dll\CommonPropertySheetUIW", "ptr", hWndOwner, "ptr", pfnPropSheetUI, "ptr", lParam, "uint*", pResult, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hDlg 
     * @returns {Pointer} 
     */
    static GetCPSUIUserData(hDlg) {
        hDlg := hDlg is Win32Handle ? NumGet(hDlg, "ptr") : hDlg

        result := DllCall("COMPSTUI.dll\GetCPSUIUserData", "ptr", hDlg, "ptr")
        return result
    }

    /**
     * 
     * @param {HWND} hDlg 
     * @param {Pointer} CPSUIUserData 
     * @returns {BOOL} 
     */
    static SetCPSUIUserData(hDlg, CPSUIUserData) {
        hDlg := hDlg is Win32Handle ? NumGet(hDlg, "ptr") : hDlg

        result := DllCall("COMPSTUI.dll\SetCPSUIUserData", "ptr", hDlg, "ptr", CPSUIUserData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PSTR} Name 
     * @param {Integer} Level 
     * @param {Pointer} pPrinterEnum 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinters
     */
    static EnumPrintersA(Flags, Name, Level, pPrinterEnum, cbBuf, pcbNeeded, pcReturned) {
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrintersA", "uint", Flags, "ptr", Name, "uint", Level, "ptr", pPrinterEnum, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} Name 
     * @param {Integer} Level 
     * @param {Pointer} pPrinterEnum 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinters
     */
    static EnumPrintersW(Flags, Name, Level, pPrinterEnum, cbBuf, pcbNeeded, pcReturned) {
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrintersW", "uint", Flags, "ptr", Name, "uint", Level, "ptr", pPrinterEnum, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getspoolfilehandle
     */
    static GetSpoolFileHandle(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\GetSpoolFileHandle", "ptr", hPrinter, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {HANDLE} hSpoolFile 
     * @param {Integer} cbCommit 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/commitspooldata
     */
    static CommitSpoolData(hPrinter, hSpoolFile, cbCommit) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hSpoolFile := hSpoolFile is Win32Handle ? NumGet(hSpoolFile, "ptr") : hSpoolFile

        result := DllCall("winspool.drv\CommitSpoolData", "ptr", hPrinter, "ptr", hSpoolFile, "uint", cbCommit, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {HANDLE} hSpoolFile 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/closespoolfilehandle
     */
    static CloseSpoolFileHandle(hPrinter, hSpoolFile) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hSpoolFile := hSpoolFile is Win32Handle ? NumGet(hSpoolFile, "ptr") : hSpoolFile

        result := DllCall("winspool.drv\CloseSpoolFileHandle", "ptr", hPrinter, "ptr", hSpoolFile, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pPrinterName 
     * @param {Pointer<PRINTER_HANDLE>} phPrinter 
     * @param {Pointer<PRINTER_DEFAULTSA>} pDefault 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter
     */
    static OpenPrinterA(pPrinterName, phPrinter, pDefault) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinterA", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinterName 
     * @param {Pointer<PRINTER_HANDLE>} phPrinter 
     * @param {Pointer<PRINTER_DEFAULTSW>} pDefault 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter
     */
    static OpenPrinterW(pPrinterName, phPrinter, pDefault) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinterW", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<PRINTER_DEFAULTSA>} pDefault 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/resetprinter
     */
    static ResetPrinterA(hPrinter, pDefault) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\ResetPrinterA", "ptr", hPrinter, "ptr", pDefault, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<PRINTER_DEFAULTSW>} pDefault 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/resetprinter
     */
    static ResetPrinterW(hPrinter, pDefault) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\ResetPrinterW", "ptr", hPrinter, "ptr", pDefault, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Integer} Level 
     * @param {Integer} Command 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setjob
     */
    static SetJobA(hPrinter, JobId, Level, Command) {
        static pJob := 0 ;Reserved parameters must always be NULL

        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetJobA", "ptr", hPrinter, "uint", JobId, "uint", Level, "char*", pJob, "uint", Command, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Integer} Level 
     * @param {Integer} Command 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setjob
     */
    static SetJobW(hPrinter, JobId, Level, Command) {
        static pJob := 0 ;Reserved parameters must always be NULL

        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetJobW", "ptr", hPrinter, "uint", JobId, "uint", Level, "char*", pJob, "uint", Command, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Integer} Level 
     * @param {Pointer} pJob 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getjob
     */
    static GetJobA(hPrinter, JobId, Level, pJob, cbBuf, pcbNeeded) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetJobA", "ptr", hPrinter, "uint", JobId, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Integer} Level 
     * @param {Pointer} pJob 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getjob
     */
    static GetJobW(hPrinter, JobId, Level, pJob, cbBuf, pcbNeeded) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetJobW", "ptr", hPrinter, "uint", JobId, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} FirstJob 
     * @param {Integer} NoJobs 
     * @param {Integer} Level 
     * @param {Pointer} pJob 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumjobs
     */
    static EnumJobsA(hPrinter, FirstJob, NoJobs, Level, pJob, cbBuf, pcbNeeded, pcReturned) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\EnumJobsA", "ptr", hPrinter, "uint", FirstJob, "uint", NoJobs, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} FirstJob 
     * @param {Integer} NoJobs 
     * @param {Integer} Level 
     * @param {Pointer} pJob 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumjobs
     */
    static EnumJobsW(hPrinter, FirstJob, NoJobs, Level, pJob, cbBuf, pcbNeeded, pcReturned) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\EnumJobsW", "ptr", hPrinter, "uint", FirstJob, "uint", NoJobs, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pPrinter 
     * @returns {PRINTER_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinter
     */
    static AddPrinterA(pName, Level, pPrinter) {
        pName := pName is String ? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterA", "ptr", pName, "uint", Level, "char*", pPrinter, "ptr")
        if(A_LastError)
            throw OSError()

        return PRINTER_HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pPrinter 
     * @returns {PRINTER_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinter
     */
    static AddPrinterW(pName, Level, pPrinter) {
        pName := pName is String ? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterW", "ptr", pName, "uint", Level, "char*", pPrinter, "ptr")
        if(A_LastError)
            throw OSError()

        return PRINTER_HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinter
     */
    static DeletePrinter(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\DeletePrinter", "ptr", hPrinter, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pPrinter 
     * @param {Integer} Command 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinter
     */
    static SetPrinterA(hPrinter, Level, pPrinter, Command) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\SetPrinterA", "ptr", hPrinter, "uint", Level, "char*", pPrinter, "uint", Command, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pPrinter 
     * @param {Integer} Command 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinter
     */
    static SetPrinterW(hPrinter, Level, pPrinter, Command) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\SetPrinterW", "ptr", hPrinter, "uint", Level, "char*", pPrinter, "uint", Command, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer} pPrinter 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinter
     */
    static GetPrinterA(hPrinter, Level, pPrinter, cbBuf, pcbNeeded) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\GetPrinterA", "ptr", hPrinter, "uint", Level, "ptr", pPrinter, "uint", cbBuf, "uint*", pcbNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer} pPrinter 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinter
     */
    static GetPrinterW(hPrinter, Level, pPrinter, cbBuf, pcbNeeded) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\GetPrinterW", "ptr", hPrinter, "uint", Level, "ptr", pPrinter, "uint", cbBuf, "uint*", pcbNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pDriverInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriver
     */
    static AddPrinterDriverA(pName, Level, pDriverInfo) {
        pName := pName is String ? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterDriverA", "ptr", pName, "uint", Level, "char*", pDriverInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pDriverInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriver
     */
    static AddPrinterDriverW(pName, Level, pDriverInfo) {
        pName := pName is String ? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterDriverW", "ptr", pName, "uint", Level, "char*", pDriverInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} lpbDriverInfo 
     * @param {Integer} dwFileCopyFlags 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriverex
     */
    static AddPrinterDriverExA(pName, Level, lpbDriverInfo, dwFileCopyFlags) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterDriverExA", "ptr", pName, "uint", Level, "char*", lpbDriverInfo, "uint", dwFileCopyFlags, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} lpbDriverInfo 
     * @param {Integer} dwFileCopyFlags 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriverex
     */
    static AddPrinterDriverExW(pName, Level, lpbDriverInfo, dwFileCopyFlags) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterDriverExW", "ptr", pName, "uint", Level, "char*", lpbDriverInfo, "uint", dwFileCopyFlags, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdrivers
     */
    static EnumPrinterDriversA(pName, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrinterDriversA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdrivers
     */
    static EnumPrinterDriversW(pName, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrinterDriversW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver
     */
    static GetPrinterDriverA(hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDriverA", "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver
     */
    static GetPrinterDriverW(hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDriverW", "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverDirectory 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverdirectory
     */
    static GetPrinterDriverDirectoryA(pName, pEnvironment, Level, pDriverDirectory, cbBuf, pcbNeeded) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriverDirectoryA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverDirectory, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverDirectory 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverdirectory
     */
    static GetPrinterDriverDirectoryW(pName, pEnvironment, Level, pDriverDirectory, cbBuf, pcbNeeded) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriverDirectoryW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverDirectory, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {PSTR} pDriverName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriver
     */
    static DeletePrinterDriverA(pName, pEnvironment, pDriverName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverA", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {PWSTR} pDriverName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriver
     */
    static DeletePrinterDriverW(pName, pEnvironment, pDriverName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverW", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {PSTR} pDriverName 
     * @param {Integer} dwDeleteFlag 
     * @param {Integer} dwVersionFlag 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverex
     */
    static DeletePrinterDriverExA(pName, pEnvironment, pDriverName, dwDeleteFlag, dwVersionFlag) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverExA", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "uint", dwDeleteFlag, "uint", dwVersionFlag, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {PWSTR} pDriverName 
     * @param {Integer} dwDeleteFlag 
     * @param {Integer} dwVersionFlag 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverex
     */
    static DeletePrinterDriverExW(pName, pEnvironment, pDriverName, dwDeleteFlag, dwVersionFlag) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverExW", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "uint", dwDeleteFlag, "uint", dwVersionFlag, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {PSTR} pPathName 
     * @param {PSTR} pPrintProcessorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprocessor
     */
    static AddPrintProcessorA(pName, pEnvironment, pPathName, pPrintProcessorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pPathName := pPathName is String ? StrPtr(pPathName) : pPathName
        pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\AddPrintProcessorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPathName, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {PWSTR} pPathName 
     * @param {PWSTR} pPrintProcessorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprocessor
     */
    static AddPrintProcessorW(pName, pEnvironment, pPathName, pPrintProcessorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pPathName := pPathName is String ? StrPtr(pPathName) : pPathName
        pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\AddPrintProcessorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPathName, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pPrintProcessorInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessors
     */
    static EnumPrintProcessorsA(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\EnumPrintProcessorsA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pPrintProcessorInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessors
     */
    static EnumPrintProcessorsW(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\EnumPrintProcessorsW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pPrintProcessorInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprintprocessordirectory
     */
    static GetPrintProcessorDirectoryA(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrintProcessorDirectoryA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pPrintProcessorInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprintprocessordirectory
     */
    static GetPrintProcessorDirectoryW(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrintProcessorDirectoryW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pPrintProcessorName 
     * @param {Integer} Level 
     * @param {Pointer} pDatatypes 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessordatatypes
     */
    static EnumPrintProcessorDatatypesA(pName, pPrintProcessorName, Level, pDatatypes, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName
        pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\EnumPrintProcessorDatatypesA", "ptr", pName, "ptr", pPrintProcessorName, "uint", Level, "ptr", pDatatypes, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pPrintProcessorName 
     * @param {Integer} Level 
     * @param {Pointer} pDatatypes 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessordatatypes
     */
    static EnumPrintProcessorDatatypesW(pName, pPrintProcessorName, Level, pDatatypes, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName
        pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\EnumPrintProcessorDatatypesW", "ptr", pName, "ptr", pPrintProcessorName, "uint", Level, "ptr", pDatatypes, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {PSTR} pPrintProcessorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprocessor
     */
    static DeletePrintProcessorA(pName, pEnvironment, pPrintProcessorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\DeletePrintProcessorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {PWSTR} pPrintProcessorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprocessor
     */
    static DeletePrintProcessorW(pName, pEnvironment, pPrintProcessorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\DeletePrintProcessorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<DOC_INFO_1A>} pDocInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/startdocprinter
     */
    static StartDocPrinterA(hPrinter, Level, pDocInfo) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\StartDocPrinterA", "ptr", hPrinter, "uint", Level, "ptr", pDocInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<DOC_INFO_1W>} pDocInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/startdocprinter
     */
    static StartDocPrinterW(hPrinter, Level, pDocInfo) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\StartDocPrinterW", "ptr", hPrinter, "uint", Level, "ptr", pDocInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/startpageprinter
     */
    static StartPagePrinter(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\StartPagePrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer} pBuf 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcWritten 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/writeprinter
     */
    static WritePrinter(hPrinter, pBuf, cbBuf, pcWritten) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\WritePrinter", "ptr", hPrinter, "ptr", pBuf, "uint", cbBuf, "uint*", pcWritten, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer} pBuf 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcWritten 
     * @param {Integer} cSleep 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/flushprinter
     */
    static FlushPrinter(hPrinter, pBuf, cbBuf, pcWritten, cSleep) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\FlushPrinter", "ptr", hPrinter, "ptr", pBuf, "uint", cbBuf, "uint*", pcWritten, "uint", cSleep, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/endpageprinter
     */
    static EndPagePrinter(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EndPagePrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/abortprinter
     */
    static AbortPrinter(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\AbortPrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer} pBuf 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pNoBytesRead 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/readprinter
     */
    static ReadPrinter(hPrinter, pBuf, cbBuf, pNoBytesRead) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\ReadPrinter", "ptr", hPrinter, "ptr", pBuf, "uint", cbBuf, "uint*", pNoBytesRead, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enddocprinter
     */
    static EndDocPrinter(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EndDocPrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer} pData 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addjob
     */
    static AddJobA(hPrinter, Level, pData, cbBuf, pcbNeeded) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\AddJobA", "ptr", hPrinter, "uint", Level, "ptr", pData, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer} pData 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addjob
     */
    static AddJobW(hPrinter, Level, pData, cbBuf, pcbNeeded) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\AddJobW", "ptr", hPrinter, "uint", Level, "ptr", pData, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/schedulejob
     */
    static ScheduleJob(hPrinter, JobId) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\ScheduleJob", "ptr", hPrinter, "uint", JobId, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/printerproperties
     */
    static PrinterProperties(hWnd, hPrinter) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\PrinterProperties", "ptr", hWnd, "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pDeviceName 
     * @param {Pointer<DEVMODEA>} pDevModeOutput 
     * @param {Pointer<DEVMODEA>} pDevModeInput 
     * @param {Integer} fMode 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/documentproperties
     */
    static DocumentPropertiesA(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DocumentPropertiesA", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "uint", fMode, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pDeviceName 
     * @param {Pointer<DEVMODEW>} pDevModeOutput 
     * @param {Pointer<DEVMODEW>} pDevModeInput 
     * @param {Integer} fMode 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/documentproperties
     */
    static DocumentPropertiesW(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DocumentPropertiesW", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "uint", fMode, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pDeviceName 
     * @param {Pointer<DEVMODEA>} pDevModeOutput 
     * @param {Pointer<DEVMODEA>} pDevModeInput 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/advanceddocumentproperties
     */
    static AdvancedDocumentPropertiesA(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\AdvancedDocumentPropertiesA", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pDeviceName 
     * @param {Pointer<DEVMODEW>} pDevModeOutput 
     * @param {Pointer<DEVMODEW>} pDevModeInput 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/advanceddocumentproperties
     */
    static AdvancedDocumentPropertiesW(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\AdvancedDocumentPropertiesW", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {HANDLE} hInst 
     * @param {Pointer<DEVMODEA>} pDevModeOutput 
     * @param {PSTR} pDeviceName 
     * @param {PSTR} pPort 
     * @param {Pointer<DEVMODEA>} pDevModeInput 
     * @param {PSTR} pProfile 
     * @param {Integer} fMode 
     * @returns {Integer} 
     */
    static ExtDeviceMode(hWnd, hInst, pDevModeOutput, pDeviceName, pPort, pDevModeInput, pProfile, fMode) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName
        pPort := pPort is String ? StrPtr(pPort) : pPort
        pProfile := pProfile is String ? StrPtr(pProfile) : pProfile
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hInst := hInst is Win32Handle ? NumGet(hInst, "ptr") : hInst

        result := DllCall("winspool.drv\ExtDeviceMode", "ptr", hWnd, "ptr", hInst, "ptr", pDevModeOutput, "ptr", pDeviceName, "ptr", pPort, "ptr", pDevModeInput, "ptr", pProfile, "uint", fMode, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pValueName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer} pData 
     * @param {Integer} nSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdata
     */
    static GetPrinterDataA(hPrinter, pValueName, pType, pData, nSize, pcbNeeded) {
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDataA", "ptr", hPrinter, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pValueName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer} pData 
     * @param {Integer} nSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdata
     */
    static GetPrinterDataW(hPrinter, pValueName, pType, pData, nSize, pcbNeeded) {
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDataW", "ptr", hPrinter, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pKeyName 
     * @param {PSTR} pValueName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer} pData 
     * @param {Integer} nSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdataex
     */
    static GetPrinterDataExA(hPrinter, pKeyName, pValueName, pType, pData, nSize, pcbNeeded) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pKeyName 
     * @param {PWSTR} pValueName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer} pData 
     * @param {Integer} nSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdataex
     */
    static GetPrinterDataExW(hPrinter, pKeyName, pValueName, pType, pData, nSize, pcbNeeded) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} dwIndex 
     * @param {Pointer} pValueName 
     * @param {Integer} cbValueName 
     * @param {Pointer<Integer>} pcbValueName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdata
     */
    static EnumPrinterDataA(hPrinter, dwIndex, pValueName, cbValueName, pcbValueName, pType, pData, cbData, pcbData) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumPrinterDataA", "ptr", hPrinter, "uint", dwIndex, "ptr", pValueName, "uint", cbValueName, "uint*", pcbValueName, "uint*", pType, "char*", pData, "uint", cbData, "uint*", pcbData, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} dwIndex 
     * @param {Pointer} pValueName 
     * @param {Integer} cbValueName 
     * @param {Pointer<Integer>} pcbValueName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdata
     */
    static EnumPrinterDataW(hPrinter, dwIndex, pValueName, cbValueName, pcbValueName, pType, pData, cbData, pcbData) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumPrinterDataW", "ptr", hPrinter, "uint", dwIndex, "ptr", pValueName, "uint", cbValueName, "uint*", pcbValueName, "uint*", pType, "char*", pData, "uint", cbData, "uint*", pcbData, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pKeyName 
     * @param {Pointer} pEnumValues 
     * @param {Integer} cbEnumValues 
     * @param {Pointer<Integer>} pcbEnumValues 
     * @param {Pointer<Integer>} pnEnumValues 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdataex
     */
    static EnumPrinterDataExA(hPrinter, pKeyName, pEnumValues, cbEnumValues, pcbEnumValues, pnEnumValues) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumPrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pEnumValues, "uint", cbEnumValues, "uint*", pcbEnumValues, "uint*", pnEnumValues, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pKeyName 
     * @param {Pointer} pEnumValues 
     * @param {Integer} cbEnumValues 
     * @param {Pointer<Integer>} pcbEnumValues 
     * @param {Pointer<Integer>} pnEnumValues 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdataex
     */
    static EnumPrinterDataExW(hPrinter, pKeyName, pEnumValues, cbEnumValues, pcbEnumValues, pnEnumValues) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumPrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pEnumValues, "uint", cbEnumValues, "uint*", pcbEnumValues, "uint*", pnEnumValues, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pKeyName 
     * @param {Pointer} pSubkey 
     * @param {Integer} cbSubkey 
     * @param {Pointer<Integer>} pcbSubkey 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterkey
     */
    static EnumPrinterKeyA(hPrinter, pKeyName, pSubkey, cbSubkey, pcbSubkey) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumPrinterKeyA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pSubkey, "uint", cbSubkey, "uint*", pcbSubkey, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pKeyName 
     * @param {Pointer} pSubkey 
     * @param {Integer} cbSubkey 
     * @param {Pointer<Integer>} pcbSubkey 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterkey
     */
    static EnumPrinterKeyW(hPrinter, pKeyName, pSubkey, cbSubkey, pcbSubkey) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumPrinterKeyW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pSubkey, "uint", cbSubkey, "uint*", pcbSubkey, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pValueName 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdata
     */
    static SetPrinterDataA(hPrinter, pValueName, Type, pData, cbData) {
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetPrinterDataA", "ptr", hPrinter, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pValueName 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdata
     */
    static SetPrinterDataW(hPrinter, pValueName, Type, pData, cbData) {
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetPrinterDataW", "ptr", hPrinter, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pKeyName 
     * @param {PSTR} pValueName 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdataex
     */
    static SetPrinterDataExA(hPrinter, pKeyName, pValueName, Type, pData, cbData) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetPrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pKeyName 
     * @param {PWSTR} pValueName 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdataex
     */
    static SetPrinterDataExW(hPrinter, pKeyName, pValueName, Type, pData, cbData) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetPrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pValueName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdata
     */
    static DeletePrinterDataA(hPrinter, pValueName) {
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeletePrinterDataA", "ptr", hPrinter, "ptr", pValueName, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pValueName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdata
     */
    static DeletePrinterDataW(hPrinter, pValueName) {
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeletePrinterDataW", "ptr", hPrinter, "ptr", pValueName, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pKeyName 
     * @param {PSTR} pValueName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdataex
     */
    static DeletePrinterDataExA(hPrinter, pKeyName, pValueName) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeletePrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pKeyName 
     * @param {PWSTR} pValueName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdataex
     */
    static DeletePrinterDataExW(hPrinter, pKeyName, pValueName) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeletePrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pKeyName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterkey
     */
    static DeletePrinterKeyA(hPrinter, pKeyName) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeletePrinterKeyA", "ptr", hPrinter, "ptr", pKeyName, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pKeyName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterkey
     */
    static DeletePrinterKeyW(hPrinter, pKeyName) {
        pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeletePrinterKeyW", "ptr", hPrinter, "ptr", pKeyName, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static WaitForPrinterChange(hPrinter, Flags) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\WaitForPrinterChange", "ptr", hPrinter, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} fdwFilter 
     * @param {Integer} fdwOptions 
     * @param {Pointer<Void>} pPrinterNotifyOptions 
     * @returns {FINDPRINTERCHANGENOTIFICATION_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/findfirstprinterchangenotification
     */
    static FindFirstPrinterChangeNotification(hPrinter, fdwFilter, fdwOptions, pPrinterNotifyOptions) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\FindFirstPrinterChangeNotification", "ptr", hPrinter, "uint", fdwFilter, "uint", fdwOptions, "ptr", pPrinterNotifyOptions, "ptr")
        return FINDPRINTERCHANGENOTIFICATION_HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {FINDPRINTERCHANGENOTIFICATION_HANDLE} hChange 
     * @param {Pointer<Integer>} pdwChange 
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<Pointer<Void>>} ppPrinterNotifyInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/findnextprinterchangenotification
     */
    static FindNextPrinterChangeNotification(hChange, pdwChange, pvReserved, ppPrinterNotifyInfo) {
        hChange := hChange is Win32Handle ? NumGet(hChange, "ptr") : hChange

        result := DllCall("winspool.drv\FindNextPrinterChangeNotification", "ptr", hChange, "uint*", pdwChange, "ptr", pvReserved, "ptr*", ppPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pPrinterNotifyInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/freeprinternotifyinfo
     */
    static FreePrinterNotifyInfo(pPrinterNotifyInfo) {
        result := DllCall("winspool.drv\FreePrinterNotifyInfo", "ptr", pPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {FINDPRINTERCHANGENOTIFICATION_HANDLE} hChange 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/findcloseprinterchangenotification
     */
    static FindClosePrinterChangeNotification(hChange) {
        hChange := hChange is Win32Handle ? NumGet(hChange, "ptr") : hChange

        result := DllCall("winspool.drv\FindClosePrinterChangeNotification", "ptr", hChange, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Error 
     * @param {HWND} hWnd 
     * @param {PSTR} pText 
     * @param {PSTR} pCaption 
     * @param {Integer} dwType 
     * @returns {Integer} 
     */
    static PrinterMessageBoxA(hPrinter, Error, hWnd, pText, pCaption, dwType) {
        pText := pText is String ? StrPtr(pText) : pText
        pCaption := pCaption is String ? StrPtr(pCaption) : pCaption
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("winspool.drv\PrinterMessageBoxA", "ptr", hPrinter, "uint", Error, "ptr", hWnd, "ptr", pText, "ptr", pCaption, "uint", dwType, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Error 
     * @param {HWND} hWnd 
     * @param {PWSTR} pText 
     * @param {PWSTR} pCaption 
     * @param {Integer} dwType 
     * @returns {Integer} 
     */
    static PrinterMessageBoxW(hPrinter, Error, hWnd, pText, pCaption, dwType) {
        pText := pText is String ? StrPtr(pText) : pText
        pCaption := pCaption is String ? StrPtr(pCaption) : pCaption
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("winspool.drv\PrinterMessageBoxW", "ptr", hPrinter, "uint", Error, "ptr", hWnd, "ptr", pText, "ptr", pCaption, "uint", dwType, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/closeprinter
     */
    static ClosePrinter(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        A_LastError := 0

        result := DllCall("winspool.drv\ClosePrinter", "ptr", hPrinter, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pForm 
     * @returns {BOOL} 
     */
    static AddFormA(hPrinter, Level, pForm) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\AddFormA", "ptr", hPrinter, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pForm 
     * @returns {BOOL} 
     */
    static AddFormW(hPrinter, Level, pForm) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\AddFormW", "ptr", hPrinter, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pFormName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteform
     */
    static DeleteFormA(hPrinter, pFormName) {
        pFormName := pFormName is String ? StrPtr(pFormName) : pFormName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeleteFormA", "ptr", hPrinter, "ptr", pFormName, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pFormName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteform
     */
    static DeleteFormW(hPrinter, pFormName) {
        pFormName := pFormName is String ? StrPtr(pFormName) : pFormName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeleteFormW", "ptr", hPrinter, "ptr", pFormName, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pFormName 
     * @param {Integer} Level 
     * @param {Pointer} pForm 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getform
     */
    static GetFormA(hPrinter, pFormName, Level, pForm, cbBuf, pcbNeeded) {
        pFormName := pFormName is String ? StrPtr(pFormName) : pFormName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetFormA", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pFormName 
     * @param {Integer} Level 
     * @param {Pointer} pForm 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getform
     */
    static GetFormW(hPrinter, pFormName, Level, pForm, cbBuf, pcbNeeded) {
        pFormName := pFormName is String ? StrPtr(pFormName) : pFormName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetFormW", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pFormName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pForm 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setform
     */
    static SetFormA(hPrinter, pFormName, Level, pForm) {
        pFormName := pFormName is String ? StrPtr(pFormName) : pFormName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetFormA", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pFormName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pForm 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setform
     */
    static SetFormW(hPrinter, pFormName, Level, pForm) {
        pFormName := pFormName is String ? StrPtr(pFormName) : pFormName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetFormW", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer} pForm 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumforms
     */
    static EnumFormsA(hPrinter, Level, pForm, cbBuf, pcbNeeded, pcReturned) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumFormsA", "ptr", hPrinter, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer} pForm 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumforms
     */
    static EnumFormsW(hPrinter, Level, pForm, cbBuf, pcbNeeded, pcReturned) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumFormsW", "ptr", hPrinter, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer} pMonitor 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enummonitors
     */
    static EnumMonitorsA(pName, Level, pMonitor, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumMonitorsA", "ptr", pName, "uint", Level, "ptr", pMonitor, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer} pMonitor 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enummonitors
     */
    static EnumMonitorsW(pName, Level, pMonitor, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumMonitorsW", "ptr", pName, "uint", Level, "ptr", pMonitor, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pMonitors 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addmonitor
     */
    static AddMonitorA(pName, Level, pMonitors) {
        pName := pName is String ? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddMonitorA", "ptr", pName, "uint", Level, "char*", pMonitors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pMonitors 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addmonitor
     */
    static AddMonitorW(pName, Level, pMonitors) {
        pName := pName is String ? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddMonitorW", "ptr", pName, "uint", Level, "char*", pMonitors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {PSTR} pMonitorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deletemonitor
     */
    static DeleteMonitorA(pName, pEnvironment, pMonitorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName

        A_LastError := 0

        result := DllCall("winspool.drv\DeleteMonitorA", "ptr", pName, "ptr", pEnvironment, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {PWSTR} pMonitorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deletemonitor
     */
    static DeleteMonitorW(pName, pEnvironment, pMonitorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName

        A_LastError := 0

        result := DllCall("winspool.drv\DeleteMonitorW", "ptr", pName, "ptr", pEnvironment, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer} pPort 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumports
     */
    static EnumPortsA(pName, Level, pPort, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumPortsA", "ptr", pName, "uint", Level, "ptr", pPort, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer} pPort 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumports
     */
    static EnumPortsW(pName, Level, pPort, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumPortsW", "ptr", pName, "uint", Level, "ptr", pPort, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {HWND} hWnd 
     * @param {PSTR} pMonitorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addport
     */
    static AddPortA(pName, hWnd, pMonitorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("winspool.drv\AddPortA", "ptr", pName, "ptr", hWnd, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {HWND} hWnd 
     * @param {PWSTR} pMonitorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addport
     */
    static AddPortW(pName, hWnd, pMonitorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("winspool.drv\AddPortW", "ptr", pName, "ptr", hWnd, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {HWND} hWnd 
     * @param {PSTR} pPortName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/configureport
     */
    static ConfigurePortA(pName, hWnd, pPortName) {
        pName := pName is String ? StrPtr(pName) : pName
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("winspool.drv\ConfigurePortA", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {HWND} hWnd 
     * @param {PWSTR} pPortName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/configureport
     */
    static ConfigurePortW(pName, hWnd, pPortName) {
        pName := pName is String ? StrPtr(pName) : pName
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("winspool.drv\ConfigurePortW", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {HWND} hWnd 
     * @param {PSTR} pPortName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteport
     */
    static DeletePortA(pName, hWnd, pPortName) {
        pName := pName is String ? StrPtr(pName) : pName
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("winspool.drv\DeletePortA", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {HWND} hWnd 
     * @param {PWSTR} pPortName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteport
     */
    static DeletePortW(pName, hWnd, pPortName) {
        pName := pName is String ? StrPtr(pName) : pName
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("winspool.drv\DeletePortW", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hXcv 
     * @param {PWSTR} pszDataName 
     * @param {Pointer} pInputData 
     * @param {Integer} cbInputData 
     * @param {Pointer} pOutputData 
     * @param {Integer} cbOutputData 
     * @param {Pointer<Integer>} pcbOutputNeeded 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {BOOL} 
     */
    static XcvDataW(hXcv, pszDataName, pInputData, cbInputData, pOutputData, cbOutputData, pcbOutputNeeded, pdwStatus) {
        pszDataName := pszDataName is String ? StrPtr(pszDataName) : pszDataName
        hXcv := hXcv is Win32Handle ? NumGet(hXcv, "ptr") : hXcv

        result := DllCall("winspool.drv\XcvDataW", "ptr", hXcv, "ptr", pszDataName, "ptr", pInputData, "uint", cbInputData, "ptr", pOutputData, "uint", cbOutputData, "uint*", pcbOutputNeeded, "uint*", pdwStatus, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pszBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getdefaultprinter
     */
    static GetDefaultPrinterA(pszBuffer, pcchBuffer) {
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := DllCall("winspool.drv\GetDefaultPrinterA", "ptr", pszBuffer, "uint*", pcchBuffer, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getdefaultprinter
     */
    static GetDefaultPrinterW(pszBuffer, pcchBuffer) {
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := DllCall("winspool.drv\GetDefaultPrinterW", "ptr", pszBuffer, "uint*", pcchBuffer, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pszPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setdefaultprinter
     */
    static SetDefaultPrinterA(pszPrinter) {
        pszPrinter := pszPrinter is String ? StrPtr(pszPrinter) : pszPrinter

        result := DllCall("winspool.drv\SetDefaultPrinterA", "ptr", pszPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPrinter 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setdefaultprinter
     */
    static SetDefaultPrinterW(pszPrinter) {
        pszPrinter := pszPrinter is String ? StrPtr(pszPrinter) : pszPrinter

        result := DllCall("winspool.drv\SetDefaultPrinterW", "ptr", pszPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pPortName 
     * @param {Integer} dwLevel 
     * @param {Pointer<Integer>} pPortInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setport
     */
    static SetPortA(pName, pPortName, dwLevel, pPortInfo) {
        pName := pName is String ? StrPtr(pName) : pName
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

        A_LastError := 0

        result := DllCall("winspool.drv\SetPortA", "ptr", pName, "ptr", pPortName, "uint", dwLevel, "char*", pPortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pPortName 
     * @param {Integer} dwLevel 
     * @param {Pointer<Integer>} pPortInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/setport
     */
    static SetPortW(pName, pPortName, dwLevel, pPortInfo) {
        pName := pName is String ? StrPtr(pName) : pName
        pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

        A_LastError := 0

        result := DllCall("winspool.drv\SetPortW", "ptr", pName, "ptr", pPortName, "uint", dwLevel, "char*", pPortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection
     */
    static AddPrinterConnectionA(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterConnectionA", "ptr", pName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection
     */
    static AddPrinterConnectionW(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterConnectionW", "ptr", pName, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterconnection
     */
    static DeletePrinterConnectionA(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\DeletePrinterConnectionA", "ptr", pName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterconnection
     */
    static DeletePrinterConnectionW(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\DeletePrinterConnectionW", "ptr", pName, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} Flags 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/connecttoprinterdlg
     */
    static ConnectToPrinterDlg(hwnd, Flags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("winspool.drv\ConnectToPrinterDlg", "ptr", hwnd, "uint", Flags, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pProvidorInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprovidor
     */
    static AddPrintProvidorA(pName, Level, pProvidorInfo) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrintProvidorA", "ptr", pName, "uint", Level, "char*", pProvidorInfo, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} Level 
     * @param {Pointer<Integer>} pProvidorInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprovidor
     */
    static AddPrintProvidorW(pName, Level, pProvidorInfo) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrintProvidorW", "ptr", pName, "uint", Level, "char*", pProvidorInfo, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pName 
     * @param {PSTR} pEnvironment 
     * @param {PSTR} pPrintProvidorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprovidor
     */
    static DeletePrintProvidorA(pName, pEnvironment, pPrintProvidorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pPrintProvidorName := pPrintProvidorName is String ? StrPtr(pPrintProvidorName) : pPrintProvidorName

        result := DllCall("winspool.drv\DeletePrintProvidorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProvidorName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pEnvironment 
     * @param {PWSTR} pPrintProvidorName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprovidor
     */
    static DeletePrintProvidorW(pName, pEnvironment, pPrintProvidorName) {
        pName := pName is String ? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        pPrintProvidorName := pPrintProvidorName is String ? StrPtr(pPrintProvidorName) : pPrintProvidorName

        result := DllCall("winspool.drv\DeletePrintProvidorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProvidorName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Pointer} DevmodeSize 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/isvaliddevmode
     */
    static IsValidDevmodeA(pDevmode, DevmodeSize) {
        result := DllCall("winspool.drv\IsValidDevmodeA", "ptr", pDevmode, "ptr", DevmodeSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVMODEW>} pDevmode 
     * @param {Pointer} DevmodeSize 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/isvaliddevmode
     */
    static IsValidDevmodeW(pDevmode, DevmodeSize) {
        result := DllCall("winspool.drv\IsValidDevmodeW", "ptr", pDevmode, "ptr", DevmodeSize, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pPrinterName 
     * @param {Pointer<PRINTER_HANDLE>} phPrinter 
     * @param {Pointer<PRINTER_DEFAULTSA>} pDefault 
     * @param {Pointer<PRINTER_OPTIONSA>} pOptions 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter2
     */
    static OpenPrinter2A(pPrinterName, phPrinter, pDefault, pOptions) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinter2A", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "ptr", pOptions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinterName 
     * @param {Pointer<PRINTER_HANDLE>} phPrinter 
     * @param {Pointer<PRINTER_DEFAULTSW>} pDefault 
     * @param {Pointer<PRINTER_OPTIONSW>} pOptions 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter2
     */
    static OpenPrinter2W(pPrinterName, phPrinter, pDefault, pOptions) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinter2W", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "ptr", pOptions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PSTR} pszName 
     * @param {Integer} dwLevel 
     * @param {Pointer<Void>} pConnectionInfo 
     * @returns {BOOL} 
     */
    static AddPrinterConnection2A(hWnd, pszName, dwLevel, pConnectionInfo) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("winspool.drv\AddPrinterConnection2A", "ptr", hWnd, "ptr", pszName, "uint", dwLevel, "ptr", pConnectionInfo, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PWSTR} pszName 
     * @param {Integer} dwLevel 
     * @param {Pointer<Void>} pConnectionInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection2
     */
    static AddPrinterConnection2W(hWnd, pszName, dwLevel, pConnectionInfo) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("winspool.drv\AddPrinterConnection2W", "ptr", hWnd, "ptr", pszName, "uint", dwLevel, "ptr", pConnectionInfo, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pszServer 
     * @param {PSTR} pszInfPath 
     * @param {PSTR} pszDriverName 
     * @param {PSTR} pszEnvironment 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/installprinterdriverfrompackage
     */
    static InstallPrinterDriverFromPackageA(pszServer, pszInfPath, pszDriverName, pszEnvironment, dwFlags) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
        pszDriverName := pszDriverName is String ? StrPtr(pszDriverName) : pszDriverName
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\InstallPrinterDriverFromPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszDriverName, "ptr", pszEnvironment, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszServer 
     * @param {PWSTR} pszInfPath 
     * @param {PWSTR} pszDriverName 
     * @param {PWSTR} pszEnvironment 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/installprinterdriverfrompackage
     */
    static InstallPrinterDriverFromPackageW(pszServer, pszInfPath, pszDriverName, pszEnvironment, dwFlags) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
        pszDriverName := pszDriverName is String ? StrPtr(pszDriverName) : pszDriverName
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\InstallPrinterDriverFromPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszDriverName, "ptr", pszEnvironment, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszServer 
     * @param {PSTR} pszInfPath 
     * @param {PSTR} pszEnvironment 
     * @param {Integer} dwFlags 
     * @param {HWND} hwnd 
     * @param {PSTR} pszDestInfPath 
     * @param {Pointer<Integer>} pcchDestInfPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/uploadprinterdriverpackage
     */
    static UploadPrinterDriverPackageA(pszServer, pszInfPath, pszEnvironment, dwFlags, hwnd, pszDestInfPath, pcchDestInfPath) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
        pszDestInfPath := pszDestInfPath is String ? StrPtr(pszDestInfPath) : pszDestInfPath
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("winspool.drv\UploadPrinterDriverPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "uint", dwFlags, "ptr", hwnd, "ptr", pszDestInfPath, "uint*", pcchDestInfPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszServer 
     * @param {PWSTR} pszInfPath 
     * @param {PWSTR} pszEnvironment 
     * @param {Integer} dwFlags 
     * @param {HWND} hwnd 
     * @param {PWSTR} pszDestInfPath 
     * @param {Pointer<Integer>} pcchDestInfPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/uploadprinterdriverpackage
     */
    static UploadPrinterDriverPackageW(pszServer, pszInfPath, pszEnvironment, dwFlags, hwnd, pszDestInfPath, pcchDestInfPath) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
        pszDestInfPath := pszDestInfPath is String ? StrPtr(pszDestInfPath) : pszDestInfPath
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("winspool.drv\UploadPrinterDriverPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "uint", dwFlags, "ptr", hwnd, "ptr", pszDestInfPath, "uint*", pcchDestInfPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszServer 
     * @param {PSTR} pszEnvironment 
     * @param {PSTR} pszzCoreDriverDependencies 
     * @param {Integer} cCorePrinterDrivers 
     * @param {Pointer<CORE_PRINTER_DRIVERA>} pCorePrinterDrivers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getcoreprinterdrivers
     */
    static GetCorePrinterDriversA(pszServer, pszEnvironment, pszzCoreDriverDependencies, cCorePrinterDrivers, pCorePrinterDrivers) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
        pszzCoreDriverDependencies := pszzCoreDriverDependencies is String ? StrPtr(pszzCoreDriverDependencies) : pszzCoreDriverDependencies

        result := DllCall("winspool.drv\GetCorePrinterDriversA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszzCoreDriverDependencies, "uint", cCorePrinterDrivers, "ptr", pCorePrinterDrivers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszServer 
     * @param {PWSTR} pszEnvironment 
     * @param {PWSTR} pszzCoreDriverDependencies 
     * @param {Integer} cCorePrinterDrivers 
     * @param {Pointer<CORE_PRINTER_DRIVERW>} pCorePrinterDrivers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getcoreprinterdrivers
     */
    static GetCorePrinterDriversW(pszServer, pszEnvironment, pszzCoreDriverDependencies, cCorePrinterDrivers, pCorePrinterDrivers) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
        pszzCoreDriverDependencies := pszzCoreDriverDependencies is String ? StrPtr(pszzCoreDriverDependencies) : pszzCoreDriverDependencies

        result := DllCall("winspool.drv\GetCorePrinterDriversW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszzCoreDriverDependencies, "uint", cCorePrinterDrivers, "ptr", pCorePrinterDrivers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszServer 
     * @param {PSTR} pszEnvironment 
     * @param {Guid} CoreDriverGUID 
     * @param {FILETIME} ftDriverDate 
     * @param {Integer} dwlDriverVersion 
     * @param {Pointer<BOOL>} pbDriverInstalled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/coreprinterdriverinstalled
     */
    static CorePrinterDriverInstalledA(pszServer, pszEnvironment, CoreDriverGUID, ftDriverDate, dwlDriverVersion, pbDriverInstalled) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\CorePrinterDriverInstalledA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", CoreDriverGUID, "ptr", ftDriverDate, "uint", dwlDriverVersion, "ptr", pbDriverInstalled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszServer 
     * @param {PWSTR} pszEnvironment 
     * @param {Guid} CoreDriverGUID 
     * @param {FILETIME} ftDriverDate 
     * @param {Integer} dwlDriverVersion 
     * @param {Pointer<BOOL>} pbDriverInstalled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/coreprinterdriverinstalled
     */
    static CorePrinterDriverInstalledW(pszServer, pszEnvironment, CoreDriverGUID, ftDriverDate, dwlDriverVersion, pbDriverInstalled) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\CorePrinterDriverInstalledW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", CoreDriverGUID, "ptr", ftDriverDate, "uint", dwlDriverVersion, "ptr", pbDriverInstalled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszServer 
     * @param {PSTR} pszEnvironment 
     * @param {PSTR} pszLanguage 
     * @param {PSTR} pszPackageID 
     * @param {PSTR} pszDriverPackageCab 
     * @param {Integer} cchDriverPackageCab 
     * @param {Pointer<Integer>} pcchRequiredSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverpackagepath
     */
    static GetPrinterDriverPackagePathA(pszServer, pszEnvironment, pszLanguage, pszPackageID, pszDriverPackageCab, cchDriverPackageCab, pcchRequiredSize) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
        pszLanguage := pszLanguage is String ? StrPtr(pszLanguage) : pszLanguage
        pszPackageID := pszPackageID is String ? StrPtr(pszPackageID) : pszPackageID
        pszDriverPackageCab := pszDriverPackageCab is String ? StrPtr(pszDriverPackageCab) : pszDriverPackageCab

        result := DllCall("winspool.drv\GetPrinterDriverPackagePathA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszLanguage, "ptr", pszPackageID, "ptr", pszDriverPackageCab, "uint", cchDriverPackageCab, "uint*", pcchRequiredSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszServer 
     * @param {PWSTR} pszEnvironment 
     * @param {PWSTR} pszLanguage 
     * @param {PWSTR} pszPackageID 
     * @param {PWSTR} pszDriverPackageCab 
     * @param {Integer} cchDriverPackageCab 
     * @param {Pointer<Integer>} pcchRequiredSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverpackagepath
     */
    static GetPrinterDriverPackagePathW(pszServer, pszEnvironment, pszLanguage, pszPackageID, pszDriverPackageCab, cchDriverPackageCab, pcchRequiredSize) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
        pszLanguage := pszLanguage is String ? StrPtr(pszLanguage) : pszLanguage
        pszPackageID := pszPackageID is String ? StrPtr(pszPackageID) : pszPackageID
        pszDriverPackageCab := pszDriverPackageCab is String ? StrPtr(pszDriverPackageCab) : pszDriverPackageCab

        result := DllCall("winspool.drv\GetPrinterDriverPackagePathW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszLanguage, "ptr", pszPackageID, "ptr", pszDriverPackageCab, "uint", cchDriverPackageCab, "uint*", pcchRequiredSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszServer 
     * @param {PSTR} pszInfPath 
     * @param {PSTR} pszEnvironment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverpackage
     */
    static DeletePrinterDriverPackageA(pszServer, pszInfPath, pszEnvironment) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\DeletePrinterDriverPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszServer 
     * @param {PWSTR} pszInfPath 
     * @param {PWSTR} pszEnvironment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverpackage
     */
    static DeletePrinterDriverPackageW(pszServer, pszInfPath, pszEnvironment) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\DeletePrinterDriverPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} printerHandle 
     * @param {Integer} jobId 
     * @param {Integer} jobOperation 
     * @param {Integer} jobProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/reportjobprocessingprogress
     */
    static ReportJobProcessingProgress(printerHandle, jobId, jobOperation, jobProgress) {
        printerHandle := printerHandle is Win32Handle ? NumGet(printerHandle, "ptr") : printerHandle

        result := DllCall("winspool.drv\ReportJobProcessingProgress", "ptr", printerHandle, "uint", jobId, "int", jobOperation, "int", jobProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     */
    static GetPrinterDriver2A(hWnd, hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDriver2A", "ptr", hWnd, "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {PWSTR} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<Integer>} pcbNeeded 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver2
     */
    static GetPrinterDriver2W(hWnd, hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetPrinterDriver2W", "ptr", hWnd, "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINT_EXECUTION_DATA>} pData 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprintexecutiondata
     */
    static GetPrintExecutionData(pData) {
        result := DllCall("winspool.drv\GetPrintExecutionData", "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {PWSTR} pszName 
     * @param {Pointer<PrintPropertyValue>} pValue 
     * @returns {Integer} 
     */
    static GetJobNamedPropertyValue(hPrinter, JobId, pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\GetJobNamedPropertyValue", "ptr", hPrinter, "uint", JobId, "ptr", pszName, "ptr", pValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PrintPropertyValue>} pValue 
     * @returns {String} Nothing - always returns an empty string
     */
    static FreePrintPropertyValue(pValue) {
        DllCall("winspool.drv\FreePrintPropertyValue", "ptr", pValue)
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<Pointer<PrintNamedProperty>>} ppProperties 
     * @returns {String} Nothing - always returns an empty string
     */
    static FreePrintNamedPropertyArray(cProperties, ppProperties) {
        DllCall("winspool.drv\FreePrintNamedPropertyArray", "uint", cProperties, "ptr*", ppProperties)
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<PrintNamedProperty>} pProperty 
     * @returns {Integer} 
     */
    static SetJobNamedProperty(hPrinter, JobId, pProperty) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\SetJobNamedProperty", "ptr", hPrinter, "uint", JobId, "ptr", pProperty, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {PWSTR} pszName 
     * @returns {Integer} 
     */
    static DeleteJobNamedProperty(hPrinter, JobId, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DeleteJobNamedProperty", "ptr", hPrinter, "uint", JobId, "ptr", pszName, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<Integer>} pcProperties 
     * @param {Pointer<Pointer<PrintNamedProperty>>} ppProperties 
     * @returns {Integer} 
     */
    static EnumJobNamedProperties(hPrinter, JobId, pcProperties, ppProperties) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\EnumJobNamedProperties", "ptr", hPrinter, "uint", JobId, "uint*", pcProperties, "ptr*", ppProperties, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PWSTR} pszPrinter 
     * @param {Pointer<HANDLE>} phFile 
     * @param {Pointer<PWSTR>} ppszOutputFile 
     * @returns {HRESULT} 
     */
    static GetPrintOutputInfo(hWnd, pszPrinter, phFile, ppszOutputFile) {
        pszPrinter := pszPrinter is String ? StrPtr(pszPrinter) : pszPrinter
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("winspool.drv\GetPrintOutputInfo", "ptr", hWnd, "ptr", pszPrinter, "ptr", phFile, "ptr", ppszOutputFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DEVQUERYPRINT_INFO>} pDQPInfo 
     * @returns {BOOL} 
     */
    static DevQueryPrintEx(pDQPInfo) {
        result := DllCall("winspool.drv\DevQueryPrintEx", "ptr", pDQPInfo, "int")
        return result
    }

    /**
     * Enables an application to register for notifications from Print Spooler-hosted printing components such as printer drivers, print processors, and port monitors.
     * @param {PWSTR} pszName A pointer to the name of a print server or print queue.
     * @param {Pointer<Guid>} pNotificationType A pointer to the GUID of the data schema for the type of notifications that the application must receive.
     * @param {Integer} eUserFilter A value specifying whether notifications will be sent to:
     * 
     * <ul>
     * <li>Only applications that are running as the same user as the Print Spooler-hosted plug-in sender.</li>
     * <li>A broader set of listening applications.</li>
     * </ul>
     * @param {Integer} eConversationStyle A value specifying whether communication is bidirectional or unidirectional.
     * @param {IPrintAsyncNotifyCallback} pCallback A pointer to an object that the Print Spooler-hosted component will use to call back the application. This should never be <b>NULL</b>.
     * @param {Pointer<HANDLE>} phNotify A pointer to a structure that represents the registration.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Severity</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>SUCCESS</td>
     * <td>The function completed successfully.</td>
     * </tr>
     * <tr>
     * <td>ALREADY_REGISTERED</td>
     * <td>ERROR</td>
     * <td>The registration object has already been registered.</td>
     * </tr>
     * <tr>
     * <td>LOCAL_ONLY_REGISTRATION</td>
     * <td>SUCCESS</td>
     * <td>Registration for local notification was successful. Registration for remote notifications was not.</td>
     * </tr>
     * <tr>
     * <td>MAX_REGISTRATION_COUNT_EXCEEDED</td>
     * <td>ERROR</td>
     * <td>The maximum number of registrations has been reached. No more registrations are permitted.</td>
     * </tr>
     * <tr>
     * <td>REMOTE_ONLY_REGISTRATION</td>
     * <td>SUCCESS</td>
     * <td>Registration for remote notifications was successful. Registration for local notifications was not.</td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an HRESULT other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific HRESULT that was returned by the function, use the HRESULT_CODE macro.
     * 
     * The following code example shows how these macros can be used to evaluate the return value.
     * 
     * 
     * ```cpp
     * if (SUCCEEDED(hr)) {
     *   // Call succeeded, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case S_OK:
     *       // Some action 
     *       break;
     *       case LOCAL_ONLY_REGISTRATION:
     *       // Some action 
     *       break;
     *     case REMOTE_ONLY_REGISTRATION:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * } else {
     *   // Call failed, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case ALREADY_REGISTERED:
     *       // Some action 
     *       break;
     *     case MAX_REGISTRATION_COUNT_EXCEEDED:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * }
     * 
     * ```
     * 
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-registerforprintasyncnotifications
     * @since windows6.0.6000
     */
    static RegisterForPrintAsyncNotifications(pszName, pNotificationType, eUserFilter, eConversationStyle, pCallback, phNotify) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\RegisterForPrintAsyncNotifications", "ptr", pszName, "ptr", pNotificationType, "int", eUserFilter, "int", eConversationStyle, "ptr", pCallback, "ptr", phNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables an application that has registered to receive notifications from Print Spooler-hosted printing components to unregister.
     * @param {HANDLE} param0 
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Severity</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>SUCCESS</td>
     * <td>The function completed successfully.</td>
     * </tr>
     * <tr>
     * <td>ALREADY_UNREGISTERED</td>
     * <td>
     * SUCCESS
     * 
     * ERROR
     * 
     * </td>
     * <td>The registration handler has already been unregistered. If this HRESULT has an ERROR severity, the calling function should handle the error condition.</td>
     * </tr>
     * <tr>
     * <td>NOT_REGISTERED</td>
     * <td>SUCCESS</td>
     * <td>The registration handler was not registered.</td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an <b>HRESULT</b> other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific <b>HRESULT</b> that was returned by the function, use the HRESULT_CODE macro.
     * 
     * The following code example shows how these macros can be used to evaluate the return value.
     * 
     * 
     * ```cpp
     * if (SUCCEEDED(hr)) {
     *   // Call succeeded, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case S_OK:
     *       // Some action 
     *       break;
     *     case NOT_REGISTERED:
     *       // Some action 
     *       break;
     *     case ALREADY_UNREGISTERED:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * } else {
     *   // Call failed, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     // This can be error and a successful return
     *     case ALREADY_UNREGISTERED:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * }
     * 
     * ```
     * 
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-unregisterforprintasyncnotifications
     * @since windows6.0.6000
     */
    static UnRegisterForPrintAsyncNotifications(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("winspool.drv\UnRegisterForPrintAsyncNotifications", "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a communication channel between a Print Spooler-hosted printing component, such as a print driver or port monitor, and an application that receives notifications from the component.
     * @param {PWSTR} pszName A pointer to the name of a print server or print queue.
     * @param {Pointer<Guid>} pNotificationType A pointer to the GUID of the data schema for the type of notifications to be sent in the channel.
     * @param {Integer} eUserFilter A value specifying whether notifications will be sent to:
     * 
     * <ul>
     * <li>Only applications that are running as the same user as the Print Spooler-hosted plug-in sender.</li>
     * <li>A broader set of listening applications.</li>
     * </ul>
     * @param {Integer} eConversationStyle A value specifying whether communication is bidirectional or unidirectional.
     * @param {IPrintAsyncNotifyCallback} pCallback A pointer to an object that the listening application will use to call back the Print Spooler-hosted component. This should be <b>NULL</b> if <i>directionality</i> is <b>kUniDirectional</b>.
     * @param {Pointer<IPrintAsyncNotifyChannel>} ppIAsynchNotification A pointer to the new channel.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Severity</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>SUCCESS</td>
     * <td>The function completed successfully.</td>
     * </tr>
     * <tr>
     * <td>CHANNEL_ALREADY_OPENED</td>
     * <td>ERROR</td>
     * <td>The channel has already been opened.</td>
     * </tr>
     * <tr>
     * <td>MAX_CHANNEL_COUNT_EXCEEDED</td>
     * <td>ERROR</td>
     * <td>The maximum number of listening applications have already registered for the specified type of notification with the specified queue or print server. The default maximum is 10,000.</td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an <b>HRESULT</b> other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific <b>HRESULT</b> that was returned by the function, use the HRESULT_CODE macro.
     * 
     * The following code example shows how these macros can be used to evaluate the return value.
     * 
     * 
     * ```cpp
     * if (SUCCEEDED(hr)){
     *   //Call was successful 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed 
     *   switch (HRESULT_CODE(hr)){
     *     case CHANNEL_ALREADY_OPENED:
     *       // Some action 
     *       break;
     *     case MAX_CHANNEL_COUNT_EXCEEDED:
     *       // Some action 
     *       break;
     *     default:
     *       //Default action 
     *       break;
     *   }
     * } else {
     *   //call succeeded 
     * }
     * 
     * ```
     * 
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-createprintasyncnotifychannel
     * @since windows6.0.6000
     */
    static CreatePrintAsyncNotifyChannel(pszName, pNotificationType, eUserFilter, eConversationStyle, pCallback, ppIAsynchNotification) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\CreatePrintAsyncNotifyChannel", "ptr", pszName, "ptr", pNotificationType, "int", eUserFilter, "int", eConversationStyle, "ptr", pCallback, "ptr*", ppIAsynchNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hNotify 
     * @returns {HRESULT} 
     */
    static RouterUnregisterForPrintAsyncNotifications(hNotify) {
        hNotify := hNotify is Win32Handle ? NumGet(hNotify, "ptr") : hNotify

        result := DllCall("SPOOLSS.dll\RouterUnregisterForPrintAsyncNotifications", "ptr", hNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<Guid>} pNotificationType 
     * @param {Integer} eNotifyFilter 
     * @param {Integer} eConversationStyle 
     * @param {IPrintAsyncNotifyCallback} pCallback 
     * @param {Pointer<IPrintAsyncNotifyChannel>} ppIAsynchNotification 
     * @returns {HRESULT} 
     */
    static RouterCreatePrintAsyncNotificationChannel(pName, pNotificationType, eNotifyFilter, eConversationStyle, pCallback, ppIAsynchNotification) {
        pName := pName is String ? StrPtr(pName) : pName

        result := DllCall("SPOOLSS.dll\RouterCreatePrintAsyncNotificationChannel", "ptr", pName, "ptr", pNotificationType, "int", eNotifyFilter, "int", eConversationStyle, "ptr", pCallback, "ptr*", ppIAsynchNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    static RouterGetPrintClassObject(pPrinter, riid, ppv) {
        pPrinter := pPrinter is String ? StrPtr(pPrinter) : pPrinter

        result := DllCall("SPOOLSS.dll\RouterGetPrintClassObject", "ptr", pPrinter, "ptr", riid, "ptr*", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPrinterName 
     * @param {Pointer<DEVMODEW>} pDevmode 
     * @param {PWSTR} pwszDocName 
     * @returns {HANDLE} 
     */
    static GdiGetSpoolFileHandle(pwszPrinterName, pDevmode, pwszDocName) {
        pwszPrinterName := pwszPrinterName is String ? StrPtr(pwszPrinterName) : pwszPrinterName
        pwszDocName := pwszDocName is String ? StrPtr(pwszDocName) : pwszDocName

        result := DllCall("GDI32.dll\GdiGetSpoolFileHandle", "ptr", pwszPrinterName, "ptr", pDevmode, "ptr", pwszDocName, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @returns {BOOL} 
     */
    static GdiDeleteSpoolFileHandle(SpoolFileHandle) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiDeleteSpoolFileHandle", "ptr", SpoolFileHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @returns {Integer} 
     */
    static GdiGetPageCount(SpoolFileHandle) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiGetPageCount", "ptr", SpoolFileHandle, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @returns {HDC} 
     */
    static GdiGetDC(SpoolFileHandle) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiGetDC", "ptr", SpoolFileHandle, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @param {Integer} Page 
     * @param {Pointer<Integer>} pdwPageType 
     * @returns {HANDLE} 
     */
    static GdiGetPageHandle(SpoolFileHandle, Page, pdwPageType) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiGetPageHandle", "ptr", SpoolFileHandle, "uint", Page, "uint*", pdwPageType, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @param {Pointer<DOCINFOW>} pDocInfo 
     * @returns {BOOL} 
     */
    static GdiStartDocEMF(SpoolFileHandle, pDocInfo) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiStartDocEMF", "ptr", SpoolFileHandle, "ptr", pDocInfo, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @returns {BOOL} 
     */
    static GdiStartPageEMF(SpoolFileHandle) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiStartPageEMF", "ptr", SpoolFileHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @param {HANDLE} hemf 
     * @param {Pointer<RECT>} prectDocument 
     * @param {Pointer<RECT>} prectBorder 
     * @param {Pointer<RECT>} prectClip 
     * @returns {BOOL} 
     */
    static GdiPlayPageEMF(SpoolFileHandle, hemf, prectDocument, prectBorder, prectClip) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf

        result := DllCall("GDI32.dll\GdiPlayPageEMF", "ptr", SpoolFileHandle, "ptr", hemf, "ptr", prectDocument, "ptr", prectBorder, "ptr", prectClip, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @param {Integer} dwOptimization 
     * @returns {BOOL} 
     */
    static GdiEndPageEMF(SpoolFileHandle, dwOptimization) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiEndPageEMF", "ptr", SpoolFileHandle, "uint", dwOptimization, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @returns {BOOL} 
     */
    static GdiEndDocEMF(SpoolFileHandle) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiEndDocEMF", "ptr", SpoolFileHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @param {Integer} dwPageNumber 
     * @param {Pointer<Pointer<DEVMODEW>>} pCurrDM 
     * @param {Pointer<Pointer<DEVMODEW>>} pLastDM 
     * @returns {BOOL} 
     */
    static GdiGetDevmodeForPage(SpoolFileHandle, dwPageNumber, pCurrDM, pLastDM) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiGetDevmodeForPage", "ptr", SpoolFileHandle, "uint", dwPageNumber, "ptr*", pCurrDM, "ptr*", pLastDM, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SpoolFileHandle 
     * @param {Pointer<DEVMODEW>} pCurrDM 
     * @returns {BOOL} 
     */
    static GdiResetDCEMF(SpoolFileHandle, pCurrDM) {
        SpoolFileHandle := SpoolFileHandle is Win32Handle ? NumGet(SpoolFileHandle, "ptr") : SpoolFileHandle

        result := DllCall("GDI32.dll\GdiResetDCEMF", "ptr", SpoolFileHandle, "ptr", pCurrDM, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinterName 
     * @param {Pointer<DEVMODEW>} pDevmode 
     * @param {Pointer<ATTRIBUTE_INFO_3>} pAttributeInfo 
     * @returns {BOOL} 
     */
    static GetJobAttributes(pPrinterName, pDevmode, pAttributeInfo) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        result := DllCall("SPOOLSS.dll\GetJobAttributes", "ptr", pPrinterName, "ptr", pDevmode, "ptr", pAttributeInfo, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pPrinterName 
     * @param {Pointer<DEVMODEW>} pDevmode 
     * @param {Integer} dwLevel 
     * @param {Pointer} pAttributeInfo 
     * @param {Integer} nSize 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     */
    static GetJobAttributesEx(pPrinterName, pDevmode, dwLevel, pAttributeInfo, nSize, dwFlags) {
        pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

        result := DllCall("SPOOLSS.dll\GetJobAttributesEx", "ptr", pPrinterName, "ptr", pDevmode, "uint", dwLevel, "ptr", pAttributeInfo, "uint", nSize, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<DEVMODEW>} pDevMode 
     * @returns {HANDLE} 
     */
    static CreatePrinterIC(hPrinter, pDevMode) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\CreatePrinterIC", "ptr", hPrinter, "ptr", pDevMode, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hPrinterIC 
     * @param {Pointer} pIn 
     * @param {Integer} cIn 
     * @param {Pointer} pOut 
     * @param {Integer} cOut 
     * @param {Integer} ul 
     * @returns {BOOL} 
     */
    static PlayGdiScriptOnPrinterIC(hPrinterIC, pIn, cIn, pOut, cOut, ul) {
        hPrinterIC := hPrinterIC is Win32Handle ? NumGet(hPrinterIC, "ptr") : hPrinterIC

        result := DllCall("winspool.drv\PlayGdiScriptOnPrinterIC", "ptr", hPrinterIC, "ptr", pIn, "uint", cIn, "ptr", pOut, "uint", cOut, "uint", ul, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hPrinterIC 
     * @returns {BOOL} 
     */
    static DeletePrinterIC(hPrinterIC) {
        hPrinterIC := hPrinterIC is Win32Handle ? NumGet(hPrinterIC, "ptr") : hPrinterIC

        result := DllCall("winspool.drv\DeletePrinterIC", "ptr", hPrinterIC, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Pointer<Integer>} pResID 
     * @returns {BOOL} 
     */
    static DevQueryPrint(hPrinter, pDevMode, pResID) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("winspool.drv\DevQueryPrint", "ptr", hPrinter, "ptr", pDevMode, "uint*", pResID, "int")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    static RevertToPrinterSelf() {
        result := DllCall("SPOOLSS.dll\RevertToPrinterSelf", "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hToken 
     * @returns {BOOL} 
     */
    static ImpersonatePrinterClient(hToken) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        result := DllCall("SPOOLSS.dll\ImpersonatePrinterClient", "ptr", hToken, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} fdwChangeFlags 
     * @param {Pointer<Integer>} pdwResult 
     * @param {Pointer<Void>} pPrinterNotifyInfo 
     * @returns {BOOL} 
     */
    static ReplyPrinterChangeNotification(hPrinter, fdwChangeFlags, pdwResult, pPrinterNotifyInfo) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\ReplyPrinterChangeNotification", "ptr", hPrinter, "uint", fdwChangeFlags, "uint*", pdwResult, "ptr", pPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hNotify 
     * @param {Integer} dwColor 
     * @param {Integer} fdwFlags 
     * @param {Pointer<Integer>} pdwResult 
     * @param {Pointer<Void>} pPrinterNotifyInfo 
     * @returns {BOOL} 
     */
    static ReplyPrinterChangeNotificationEx(hNotify, dwColor, fdwFlags, pdwResult, pPrinterNotifyInfo) {
        hNotify := hNotify is Win32Handle ? NumGet(hNotify, "ptr") : hNotify

        result := DllCall("SPOOLSS.dll\ReplyPrinterChangeNotificationEx", "ptr", hNotify, "uint", dwColor, "uint", fdwFlags, "uint*", pdwResult, "ptr", pPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<PRINTER_NOTIFY_INFO_DATA>} pDataSrc 
     * @returns {BOOL} 
     */
    static PartialReplyPrinterChangeNotification(hPrinter, pDataSrc) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\PartialReplyPrinterChangeNotification", "ptr", hPrinter, "ptr", pDataSrc, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cPrinterNotifyInfoData 
     * @returns {Pointer<PRINTER_NOTIFY_INFO>} 
     */
    static RouterAllocPrinterNotifyInfo(cPrinterNotifyInfoData) {
        result := DllCall("SPOOLSS.dll\RouterAllocPrinterNotifyInfo", "uint", cPrinterNotifyInfoData, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfo 
     * @returns {BOOL} 
     */
    static RouterFreePrinterNotifyInfo(pInfo) {
        result := DllCall("SPOOLSS.dll\RouterFreePrinterNotifyInfo", "ptr", pInfo, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {Pointer<BIDI_RESPONSE_CONTAINER>} 
     */
    static RouterAllocBidiResponseContainer(Count) {
        result := DllCall("SPOOLSS.dll\RouterAllocBidiResponseContainer", "uint", Count, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} NumBytes 
     * @returns {Pointer<Void>} 
     */
    static RouterAllocBidiMem(NumBytes) {
        result := DllCall("SPOOLSS.dll\RouterAllocBidiMem", "ptr", NumBytes, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<BIDI_RESPONSE_CONTAINER>} pData 
     * @returns {Integer} 
     */
    static RouterFreeBidiResponseContainer(pData) {
        result := DllCall("winspool.drv\RouterFreeBidiResponseContainer", "ptr", pData, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pMemPointer 
     * @returns {String} Nothing - always returns an empty string
     */
    static RouterFreeBidiMem(pMemPointer) {
        DllCall("SPOOLSS.dll\RouterFreeBidiMem", "ptr", pMemPointer)
    }

    /**
     * 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfoDest 
     * @param {Pointer<PRINTER_NOTIFY_INFO_DATA>} pDataSrc 
     * @param {Integer} fdwFlags 
     * @returns {BOOL} 
     */
    static AppendPrinterNotifyInfoData(pInfoDest, pDataSrc, fdwFlags) {
        result := DllCall("SPOOLSS.dll\AppendPrinterNotifyInfoData", "ptr", pInfoDest, "ptr", pDataSrc, "uint", fdwFlags, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hPrinterRPC 
     * @param {Integer} fdwFilterFlags 
     * @param {Integer} fdwOptions 
     * @param {HANDLE} hNotify 
     * @param {Pointer<PRINTER_NOTIFY_OPTIONS>} pPrinterNotifyOptions 
     * @returns {Integer} 
     */
    static CallRouterFindFirstPrinterChangeNotification(hPrinterRPC, fdwFilterFlags, fdwOptions, hNotify, pPrinterNotifyOptions) {
        hPrinterRPC := hPrinterRPC is Win32Handle ? NumGet(hPrinterRPC, "ptr") : hPrinterRPC
        hNotify := hNotify is Win32Handle ? NumGet(hNotify, "ptr") : hNotify

        result := DllCall("SPOOLSS.dll\CallRouterFindFirstPrinterChangeNotification", "ptr", hPrinterRPC, "uint", fdwFilterFlags, "uint", fdwOptions, "ptr", hNotify, "ptr", pPrinterNotifyOptions, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} fdwFlags 
     * @param {Integer} fdwOptions 
     * @param {HANDLE} hNotify 
     * @param {Pointer<Void>} pPrinterNotifyOptions 
     * @param {Pointer<Void>} pvReserved1 
     * @returns {BOOL} 
     */
    static ProvidorFindFirstPrinterChangeNotification(hPrinter, fdwFlags, fdwOptions, hNotify, pPrinterNotifyOptions, pvReserved1) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hNotify := hNotify is Win32Handle ? NumGet(hNotify, "ptr") : hNotify

        result := DllCall("SPOOLSS.dll\ProvidorFindFirstPrinterChangeNotification", "ptr", hPrinter, "uint", fdwFlags, "uint", fdwOptions, "ptr", hNotify, "ptr", pPrinterNotifyOptions, "ptr", pvReserved1, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     */
    static ProvidorFindClosePrinterChangeNotification(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\ProvidorFindClosePrinterChangeNotification", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} fdwFilterFlags 
     * @param {Integer} fdwOptions 
     * @param {Pointer<Void>} pPrinterNotifyOptions 
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<Void>} pNotificationConfig 
     * @param {Pointer<HANDLE>} phNotify 
     * @param {Pointer<HANDLE>} phEvent 
     * @returns {BOOL} 
     */
    static SpoolerFindFirstPrinterChangeNotification(hPrinter, fdwFilterFlags, fdwOptions, pPrinterNotifyOptions, pvReserved, pNotificationConfig, phNotify, phEvent) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\SpoolerFindFirstPrinterChangeNotification", "ptr", hPrinter, "uint", fdwFilterFlags, "uint", fdwOptions, "ptr", pPrinterNotifyOptions, "ptr", pvReserved, "ptr", pNotificationConfig, "ptr", phNotify, "ptr", phEvent, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<Integer>} pfdwChange 
     * @param {Pointer<Void>} pPrinterNotifyOptions 
     * @param {Pointer<Pointer<Void>>} ppPrinterNotifyInfo 
     * @returns {BOOL} 
     */
    static SpoolerFindNextPrinterChangeNotification(hPrinter, pfdwChange, pPrinterNotifyOptions, ppPrinterNotifyInfo) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\SpoolerFindNextPrinterChangeNotification", "ptr", hPrinter, "uint*", pfdwChange, "ptr", pPrinterNotifyOptions, "ptr*", ppPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} dwColor 
     * @param {Pointer<PRINTER_NOTIFY_OPTIONS>} pOptions 
     * @param {Pointer<Pointer<PRINTER_NOTIFY_INFO>>} ppInfo 
     * @returns {BOOL} 
     */
    static SpoolerRefreshPrinterChangeNotification(hPrinter, dwColor, pOptions, ppInfo) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\SpoolerRefreshPrinterChangeNotification", "ptr", hPrinter, "uint", dwColor, "ptr", pOptions, "ptr*", ppInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    static SpoolerFreePrinterNotifyInfo(pInfo) {
        DllCall("SPOOLSS.dll\SpoolerFreePrinterNotifyInfo", "ptr", pInfo)
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @returns {BOOL} 
     */
    static SpoolerFindClosePrinterChangeNotification(hPrinter) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\SpoolerFindClosePrinterChangeNotification", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPrinterName 
     * @param {PWSTR} pszKey 
     * @param {Integer} dwCopyFileEvent 
     * @returns {BOOL} 
     */
    static SpoolerCopyFileEvent(pszPrinterName, pszKey, dwCopyFileEvent) {
        pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := DllCall("mscms.dll\SpoolerCopyFileEvent", "ptr", pszPrinterName, "ptr", pszKey, "uint", dwCopyFileEvent, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPrinterName 
     * @param {PWSTR} pszDirectory 
     * @param {Pointer<Integer>} pSplClientInfo 
     * @param {Integer} dwLevel 
     * @param {PWSTR} pszSourceDir 
     * @param {Pointer<Integer>} pcchSourceDirSize 
     * @param {PWSTR} pszTargetDir 
     * @param {Pointer<Integer>} pcchTargetDirSize 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static GenerateCopyFilePaths(pszPrinterName, pszDirectory, pSplClientInfo, dwLevel, pszSourceDir, pcchSourceDirSize, pszTargetDir, pcchTargetDirSize, dwFlags) {
        pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName
        pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory
        pszSourceDir := pszSourceDir is String ? StrPtr(pszSourceDir) : pszSourceDir
        pszTargetDir := pszTargetDir is String ? StrPtr(pszTargetDir) : pszTargetDir

        result := DllCall("mscms.dll\GenerateCopyFilePaths", "ptr", pszPrinterName, "ptr", pszDirectory, "char*", pSplClientInfo, "uint", dwLevel, "ptr", pszSourceDir, "uint*", pcchSourceDirSize, "ptr", pszTargetDir, "uint*", pcchTargetDirSize, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<SHOWUIPARAMS>} pUIParams 
     * @param {Pointer<Integer>} pResponse 
     * @returns {BOOL} 
     */
    static SplPromptUIInUsersSession(hPrinter, JobId, pUIParams, pResponse) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\SplPromptUIInUsersSession", "ptr", hPrinter, "uint", JobId, "ptr", pUIParams, "uint*", pResponse, "int")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<BOOL>} pIsSessionZero 
     * @returns {Integer} 
     */
    static SplIsSessionZero(hPrinter, JobId, pIsSessionZero) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\SplIsSessionZero", "ptr", hPrinter, "uint", JobId, "ptr", pIsSessionZero, "uint")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<HANDLE>} phDeviceObject 
     * @returns {HRESULT} 
     */
    static AddPrintDeviceObject(hPrinter, phDeviceObject) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter

        result := DllCall("SPOOLSS.dll\AddPrintDeviceObject", "ptr", hPrinter, "ptr", phDeviceObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {HANDLE} hDeviceObject 
     * @returns {HRESULT} 
     */
    static UpdatePrintDeviceObject(hPrinter, hDeviceObject) {
        hPrinter := hPrinter is Win32Handle ? NumGet(hPrinter, "ptr") : hPrinter
        hDeviceObject := hDeviceObject is Win32Handle ? NumGet(hDeviceObject, "ptr") : hDeviceObject

        result := DllCall("SPOOLSS.dll\UpdatePrintDeviceObject", "ptr", hPrinter, "ptr", hDeviceObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hDeviceObject 
     * @returns {HRESULT} 
     */
    static RemovePrintDeviceObject(hDeviceObject) {
        hDeviceObject := hDeviceObject is Win32Handle ? NumGet(hDeviceObject, "ptr") : hDeviceObject

        result := DllCall("SPOOLSS.dll\RemovePrintDeviceObject", "ptr", hDeviceObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
