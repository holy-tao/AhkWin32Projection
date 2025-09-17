#Requires AutoHotkey v2.0.0 64-bit

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
    static RIGHT_THEN_DOWN => 1

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
     * @param {Pointer<Void>} hWndOwner 
     * @param {Pointer<PFNPROPSHEETUI>} pfnPropSheetUI 
     * @param {Pointer} lParam 
     * @param {Pointer<UInt32>} pResult 
     * @returns {Integer} 
     */
    static CommonPropertySheetUIA(hWndOwner, pfnPropSheetUI, lParam, pResult) {
        result := DllCall("COMPSTUI.dll\CommonPropertySheetUIA", "ptr", hWndOwner, "ptr", pfnPropSheetUI, "ptr", lParam, "uint*", pResult, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWndOwner 
     * @param {Pointer<PFNPROPSHEETUI>} pfnPropSheetUI 
     * @param {Pointer} lParam 
     * @param {Pointer<UInt32>} pResult 
     * @returns {Integer} 
     */
    static CommonPropertySheetUIW(hWndOwner, pfnPropSheetUI, lParam, pResult) {
        result := DllCall("COMPSTUI.dll\CommonPropertySheetUIW", "ptr", hWndOwner, "ptr", pfnPropSheetUI, "ptr", lParam, "uint*", pResult, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hDlg 
     * @returns {Pointer} 
     */
    static GetCPSUIUserData(hDlg) {
        result := DllCall("COMPSTUI.dll\GetCPSUIUserData", "ptr", hDlg, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hDlg 
     * @param {Pointer} CPSUIUserData 
     * @returns {Integer} 
     */
    static SetCPSUIUserData(hDlg, CPSUIUserData) {
        result := DllCall("COMPSTUI.dll\SetCPSUIUserData", "ptr", hDlg, "ptr", CPSUIUserData, "int")
        return result
    }

    /**
     * The EnumPrinters function enumerates available printers, print servers, domains, or print providers.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If **EnumPrinters** returns a [**PRINTER\_INFO\_1**](printer-info-1.md) structure in which PRINTER\_ENUM\_CONTAINER is specified, this indicates that there is a hierarchy of printer objects. An application can enumerate the hierarchy by calling **EnumPrinters** again, setting *Name* to the value of the **PRINTER\_INFO\_1** structure's **pName** member.
     * 
     * The **EnumPrinters** function does not retrieve security information. If [**PRINTER\_INFO\_2**](printer-info-2.md) structures are returned in the array pointed to by *pPrinterEnum*, their *pSecurityDescriptor* members will be set to **NULL**.
     * 
     * To get information about the default printer, call [**GetDefaultPrinter**](getdefaultprinter.md).
     * 
     * The [**PRINTER\_INFO\_4**](printer-info-4.md) structure provides an easy and extremely fast way to retrieve the names of the printers installed on a local machine, as well as the remote connections that a user has established. When **EnumPrinters** is called with a **PRINTER\_INFO\_4** data structure, that function queries the registry for the specified information, then returns immediately. This differs from the behavior of **EnumPrinters** when called with other levels of **PRINTER\_INFO\_\*** data structures. In particular, when **EnumPrinters** is called with a level 2 ([**PRINTER\_INFO\_2**](printer-info-2.md)) data structure, it performs an [**OpenPrinter**](openprinter.md) call on each remote connection. If a remote connection is down, or the remote server no longer exists, or the remote printer no longer exists, the function must wait for RPC to time out and consequently fail the **OpenPrinter** call. This can take a while. Passing a **PRINTER\_INFO\_4** structure lets an application retrieve a bare minimum of required information; if more detailed information is desired, a subsequent **EnumPrinters** level 2 call can be made.
     * 
     * **Windows Vista:** The printer data returned by **EnumPrinters** is retrieved from a local cache when the value of *Level* is 4.
     * 
     * The following table shows the **EnumPrinters** output for various *Flags* values when the *Level* parameter is set to 1.
     * 
     * In the *Name* parameter column of the table, you should substitute an appropriate name for Print Provider, Domain, and Machine. For example, for "Print Provider," you could use the name of the network print provider or the name of the local print provider. To retrieve print provider names, call **EnumPrinters** with *Name* set to **NULL**.
     * 
     * 
     * 
     * | *Flags* parameter                                  | *Name* parameter                            | Result                                                                                            |
     * |----------------------------------------------------|---------------------------------------------|---------------------------------------------------------------------------------------------------|
     * | PRINTER\_ENUM\_LOCAL (and not PRINTER\_ENUM\_NAME) | The *Name* parameter is ignored.<br/> | All local printers.<br/>                                                                    |
     * | PRINTER\_ENUM\_NAME                                | "Print Provider"<br/>                 | All domain names<br/>                                                                       |
     * | PRINTER\_ENUM\_NAME                                | "Print Provider!Domain"<br/>          | All printers and print servers in the computer's domain<br/>                                |
     * | PRINTER\_ENUM\_NAME                                | "Print Provider!!\\\\Machine"<br/>    | All printers shared at \\\\Machine<br/>                                                     |
     * | PRINTER\_ENUM\_NAME                                | An empty string, ""<br/>              | All local printers.<br/>                                                                    |
     * | PRINTER\_ENUM\_NAME                                | **NULL**<br/>                         | All print providers in the computer's domain<br/>                                           |
     * | PRINTER\_ENUM\_CONNECTIONS                         | The *Name* parameter is ignored.<br/> | All connected remote printers<br/>                                                          |
     * | PRINTER\_ENUM\_NETWORK                             | The *Name* parameter is ignored.<br/> | All printers in the computer's domain<br/>                                                  |
     * | PRINTER\_ENUM\_REMOTE                              | An empty string, ""<br/>              | All printers and print servers in the computer's domain<br/>                                |
     * | PRINTER\_ENUM\_REMOTE                              | "Print Provider"<br/>                 | Same as PRINTER\_ENUM\_NAME<br/>                                                            |
     * | PRINTER\_ENUM\_REMOTE                              | "Print Provider!Domain"<br/>          | All printers and print servers in computer's domain, regardless of *Domain* specified.<br/> |
     * | PRINTER\_ENUM\_CATEGORY\_3D                        | The *Name* parameter is ignored.<br/> | Only 3D printers are enumerated.<br/>                                                       |
     * | PRINTER\_ENUM\_CATEGORY\_ALL                       | The *Name* parameter is ignored.<br/> | 3D printers are enumerated, along with all other printers.<br/>                             |
     * @param {Integer} Flags The types of print objects that the function should enumerate. This value can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                               | Meaning                                                                                                                                                                                                                                                |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="PRINTER_ENUM_LOCAL"></span><span id="printer_enum_local"></span><dl> <dt>**PRINTER\_ENUM\_LOCAL**</dt> </dl>                       | If the PRINTER\_ENUM\_NAME flag is not also passed, the function ignores the *Name* parameter, and enumerates the locally installed printers. If PRINTER\_ENUM\_NAME is also passed, the function enumerates the local printers on *Name*. <br/> |
     * | <span id="PRINTER_ENUM_NAME"></span><span id="printer_enum_name"></span><dl> <dt>**PRINTER\_ENUM\_NAME**</dt> </dl>                          | The function enumerates the printer identified by *Name*. This can be a server, a domain, or a print provider. If *Name* is **NULL**, the function enumerates available print providers.<br/>                                                    |
     * | <span id="PRINTER_ENUM_SHARED"></span><span id="printer_enum_shared"></span><dl> <dt>**PRINTER\_ENUM\_SHARED**</dt> </dl>                    | The function enumerates printers that have the shared attribute. Cannot be used in isolation; use an OR operation to combine with another PRINTER\_ENUM type.<br/>                                                                               |
     * | <span id="PRINTER_ENUM_CONNECTIONS"></span><span id="printer_enum_connections"></span><dl> <dt>**PRINTER\_ENUM\_CONNECTIONS**</dt> </dl>     | The function enumerates the list of printers to which the user has made previous connections.<br/>                                                                                                                                               |
     * | <span id="PRINTER_ENUM_NETWORK"></span><span id="printer_enum_network"></span><dl> <dt>**PRINTER\_ENUM\_NETWORK**</dt> </dl>                 | The function enumerates network printers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                                                |
     * | <span id="PRINTER_ENUM_REMOTE"></span><span id="printer_enum_remote"></span><dl> <dt>**PRINTER\_ENUM\_REMOTE**</dt> </dl>                    | The function enumerates network printers and print servers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                              |
     * | <span id="PRINTER_ENUM_CATEGORY_3D"></span><span id="printer_enum_category_3d"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_3D**</dt> </dl>    | The function enumerates only 3D printers.<br/>                                                                                                                                                                                                   |
     * | <span id="PRINTER_ENUM_CATEGORY_ALL"></span><span id="printer_enum_category_all"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_ALL**</dt> </dl> | The function enumerates all print devices, including 3D printers.<br/>                                                                                                                                                                           |
     * 
     * 
     * 
     *  
     * 
     * If *Level* is 4, you can only use the PRINTER\_ENUM\_CONNECTIONS and PRINTER\_ENUM\_LOCAL constants.
     * 
     * > [!Note]  
     * > 3D print devices are not enumerated by default. You must include both **PRINTER\_ENUM\_CATEGORY\_3D** and **PRINTER\_ENUM\_LOCAL** to enumerate only 3D printers. To include 3D printers, along with all other local printers, use **PRINTER\_ENUM\_CATEGORY\_ALL** and **PRINTER\_ENUM\_LOCAL**.
     * @param {Pointer<Byte>} Name If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is non-**NULL**, then *Name* is a pointer to a null-terminated string that specifies the name of the object to enumerate. This string can be the name of a server, a domain, or a print provider.
     * 
     * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is **NULL**, then the function enumerates the available print providers.
     * 
     * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_REMOTE, and *Name* is **NULL**, then the function enumerates the printers in the user's domain.
     * 
     * If *Level* is 2 or 5,*Name* is a pointer to a null-terminated string that specifies the name of a server whose printers are to be enumerated. If this string is **NULL**, then the function enumerates the printers installed on the local computer.
     * 
     * If *Level* is 4, *Name* should be **NULL**. The function always queries on the local computer.
     * 
     * When *Name* is **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_CONNECTIONS enumerates printers that are installed on the local machine. These printers include those that are physically attached to the local machine as well as remote printers to which it has a network connection.
     * 
     * When *Name* is not **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_NAME enumerates the local printers that are installed on the server *Name*.
     * @param {Integer} Level The type of data structures pointed to by *pPrinterEnum*. Valid values are 1, 2, 4, and 5, which correspond to the [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), and [**PRINTER\_INFO\_5**](printer-info-5.md) data structures.
     * 
     * This value can be 1, 2, 4, or 5.
     * @param {Pointer} pPrinterEnum A pointer to a buffer that receives an array of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures. Each structure contains data that describes an available print object.
     * 
     * If *Level* is 1, the array contains [**PRINTER\_INFO\_1**](printer-info-1.md) structures. If *Level* is 2, the array contains [**PRINTER\_INFO\_2**](printer-info-2.md) structures. If *Level* is 4, the array contains [**PRINTER\_INFO\_4**](printer-info-4.md) structures. If *Level* is 5, the array contains [**PRINTER\_INFO\_5**](printer-info-5.md) structures.
     * 
     * The buffer must be large enough to receive the array of data structures and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinterEnum*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @param {Pointer<UInt32>} pcReturned A pointer to a value that receives the number of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures that the function returns in the array to which *pPrinterEnum* points.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinters
     */
    static EnumPrintersA(Flags, Name, Level, pPrinterEnum, cbBuf, pcbNeeded, pcReturned) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrintersA", "uint", Flags, "ptr", Name, "uint", Level, "ptr", pPrinterEnum, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumPrinters function enumerates available printers, print servers, domains, or print providers.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If **EnumPrinters** returns a [**PRINTER\_INFO\_1**](printer-info-1.md) structure in which PRINTER\_ENUM\_CONTAINER is specified, this indicates that there is a hierarchy of printer objects. An application can enumerate the hierarchy by calling **EnumPrinters** again, setting *Name* to the value of the **PRINTER\_INFO\_1** structure's **pName** member.
     * 
     * The **EnumPrinters** function does not retrieve security information. If [**PRINTER\_INFO\_2**](printer-info-2.md) structures are returned in the array pointed to by *pPrinterEnum*, their *pSecurityDescriptor* members will be set to **NULL**.
     * 
     * To get information about the default printer, call [**GetDefaultPrinter**](getdefaultprinter.md).
     * 
     * The [**PRINTER\_INFO\_4**](printer-info-4.md) structure provides an easy and extremely fast way to retrieve the names of the printers installed on a local machine, as well as the remote connections that a user has established. When **EnumPrinters** is called with a **PRINTER\_INFO\_4** data structure, that function queries the registry for the specified information, then returns immediately. This differs from the behavior of **EnumPrinters** when called with other levels of **PRINTER\_INFO\_\*** data structures. In particular, when **EnumPrinters** is called with a level 2 ([**PRINTER\_INFO\_2**](printer-info-2.md)) data structure, it performs an [**OpenPrinter**](openprinter.md) call on each remote connection. If a remote connection is down, or the remote server no longer exists, or the remote printer no longer exists, the function must wait for RPC to time out and consequently fail the **OpenPrinter** call. This can take a while. Passing a **PRINTER\_INFO\_4** structure lets an application retrieve a bare minimum of required information; if more detailed information is desired, a subsequent **EnumPrinters** level 2 call can be made.
     * 
     * **Windows Vista:** The printer data returned by **EnumPrinters** is retrieved from a local cache when the value of *Level* is 4.
     * 
     * The following table shows the **EnumPrinters** output for various *Flags* values when the *Level* parameter is set to 1.
     * 
     * In the *Name* parameter column of the table, you should substitute an appropriate name for Print Provider, Domain, and Machine. For example, for "Print Provider," you could use the name of the network print provider or the name of the local print provider. To retrieve print provider names, call **EnumPrinters** with *Name* set to **NULL**.
     * 
     * 
     * 
     * | *Flags* parameter                                  | *Name* parameter                            | Result                                                                                            |
     * |----------------------------------------------------|---------------------------------------------|---------------------------------------------------------------------------------------------------|
     * | PRINTER\_ENUM\_LOCAL (and not PRINTER\_ENUM\_NAME) | The *Name* parameter is ignored.<br/> | All local printers.<br/>                                                                    |
     * | PRINTER\_ENUM\_NAME                                | "Print Provider"<br/>                 | All domain names<br/>                                                                       |
     * | PRINTER\_ENUM\_NAME                                | "Print Provider!Domain"<br/>          | All printers and print servers in the computer's domain<br/>                                |
     * | PRINTER\_ENUM\_NAME                                | "Print Provider!!\\\\Machine"<br/>    | All printers shared at \\\\Machine<br/>                                                     |
     * | PRINTER\_ENUM\_NAME                                | An empty string, ""<br/>              | All local printers.<br/>                                                                    |
     * | PRINTER\_ENUM\_NAME                                | **NULL**<br/>                         | All print providers in the computer's domain<br/>                                           |
     * | PRINTER\_ENUM\_CONNECTIONS                         | The *Name* parameter is ignored.<br/> | All connected remote printers<br/>                                                          |
     * | PRINTER\_ENUM\_NETWORK                             | The *Name* parameter is ignored.<br/> | All printers in the computer's domain<br/>                                                  |
     * | PRINTER\_ENUM\_REMOTE                              | An empty string, ""<br/>              | All printers and print servers in the computer's domain<br/>                                |
     * | PRINTER\_ENUM\_REMOTE                              | "Print Provider"<br/>                 | Same as PRINTER\_ENUM\_NAME<br/>                                                            |
     * | PRINTER\_ENUM\_REMOTE                              | "Print Provider!Domain"<br/>          | All printers and print servers in computer's domain, regardless of *Domain* specified.<br/> |
     * | PRINTER\_ENUM\_CATEGORY\_3D                        | The *Name* parameter is ignored.<br/> | Only 3D printers are enumerated.<br/>                                                       |
     * | PRINTER\_ENUM\_CATEGORY\_ALL                       | The *Name* parameter is ignored.<br/> | 3D printers are enumerated, along with all other printers.<br/>                             |
     * @param {Integer} Flags The types of print objects that the function should enumerate. This value can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                               | Meaning                                                                                                                                                                                                                                                |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="PRINTER_ENUM_LOCAL"></span><span id="printer_enum_local"></span><dl> <dt>**PRINTER\_ENUM\_LOCAL**</dt> </dl>                       | If the PRINTER\_ENUM\_NAME flag is not also passed, the function ignores the *Name* parameter, and enumerates the locally installed printers. If PRINTER\_ENUM\_NAME is also passed, the function enumerates the local printers on *Name*. <br/> |
     * | <span id="PRINTER_ENUM_NAME"></span><span id="printer_enum_name"></span><dl> <dt>**PRINTER\_ENUM\_NAME**</dt> </dl>                          | The function enumerates the printer identified by *Name*. This can be a server, a domain, or a print provider. If *Name* is **NULL**, the function enumerates available print providers.<br/>                                                    |
     * | <span id="PRINTER_ENUM_SHARED"></span><span id="printer_enum_shared"></span><dl> <dt>**PRINTER\_ENUM\_SHARED**</dt> </dl>                    | The function enumerates printers that have the shared attribute. Cannot be used in isolation; use an OR operation to combine with another PRINTER\_ENUM type.<br/>                                                                               |
     * | <span id="PRINTER_ENUM_CONNECTIONS"></span><span id="printer_enum_connections"></span><dl> <dt>**PRINTER\_ENUM\_CONNECTIONS**</dt> </dl>     | The function enumerates the list of printers to which the user has made previous connections.<br/>                                                                                                                                               |
     * | <span id="PRINTER_ENUM_NETWORK"></span><span id="printer_enum_network"></span><dl> <dt>**PRINTER\_ENUM\_NETWORK**</dt> </dl>                 | The function enumerates network printers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                                                |
     * | <span id="PRINTER_ENUM_REMOTE"></span><span id="printer_enum_remote"></span><dl> <dt>**PRINTER\_ENUM\_REMOTE**</dt> </dl>                    | The function enumerates network printers and print servers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                              |
     * | <span id="PRINTER_ENUM_CATEGORY_3D"></span><span id="printer_enum_category_3d"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_3D**</dt> </dl>    | The function enumerates only 3D printers.<br/>                                                                                                                                                                                                   |
     * | <span id="PRINTER_ENUM_CATEGORY_ALL"></span><span id="printer_enum_category_all"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_ALL**</dt> </dl> | The function enumerates all print devices, including 3D printers.<br/>                                                                                                                                                                           |
     * 
     * 
     * 
     *  
     * 
     * If *Level* is 4, you can only use the PRINTER\_ENUM\_CONNECTIONS and PRINTER\_ENUM\_LOCAL constants.
     * 
     * > [!Note]  
     * > 3D print devices are not enumerated by default. You must include both **PRINTER\_ENUM\_CATEGORY\_3D** and **PRINTER\_ENUM\_LOCAL** to enumerate only 3D printers. To include 3D printers, along with all other local printers, use **PRINTER\_ENUM\_CATEGORY\_ALL** and **PRINTER\_ENUM\_LOCAL**.
     * @param {Pointer<Char>} Name If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is non-**NULL**, then *Name* is a pointer to a null-terminated string that specifies the name of the object to enumerate. This string can be the name of a server, a domain, or a print provider.
     * 
     * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is **NULL**, then the function enumerates the available print providers.
     * 
     * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_REMOTE, and *Name* is **NULL**, then the function enumerates the printers in the user's domain.
     * 
     * If *Level* is 2 or 5,*Name* is a pointer to a null-terminated string that specifies the name of a server whose printers are to be enumerated. If this string is **NULL**, then the function enumerates the printers installed on the local computer.
     * 
     * If *Level* is 4, *Name* should be **NULL**. The function always queries on the local computer.
     * 
     * When *Name* is **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_CONNECTIONS enumerates printers that are installed on the local machine. These printers include those that are physically attached to the local machine as well as remote printers to which it has a network connection.
     * 
     * When *Name* is not **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_NAME enumerates the local printers that are installed on the server *Name*.
     * @param {Integer} Level The type of data structures pointed to by *pPrinterEnum*. Valid values are 1, 2, 4, and 5, which correspond to the [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), and [**PRINTER\_INFO\_5**](printer-info-5.md) data structures.
     * 
     * This value can be 1, 2, 4, or 5.
     * @param {Pointer} pPrinterEnum A pointer to a buffer that receives an array of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures. Each structure contains data that describes an available print object.
     * 
     * If *Level* is 1, the array contains [**PRINTER\_INFO\_1**](printer-info-1.md) structures. If *Level* is 2, the array contains [**PRINTER\_INFO\_2**](printer-info-2.md) structures. If *Level* is 4, the array contains [**PRINTER\_INFO\_4**](printer-info-4.md) structures. If *Level* is 5, the array contains [**PRINTER\_INFO\_5**](printer-info-5.md) structures.
     * 
     * The buffer must be large enough to receive the array of data structures and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinterEnum*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @param {Pointer<UInt32>} pcReturned A pointer to a value that receives the number of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures that the function returns in the array to which *pPrinterEnum* points.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinters
     */
    static EnumPrintersW(Flags, Name, Level, pPrinterEnum, cbBuf, pcbNeeded, pcReturned) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrintersW", "uint", Flags, "ptr", Name, "uint", Level, "ptr", pPrinterEnum, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetSpoolFileHandle function retrieves a handle for the spool file associated with the job currently submitted by the application.
     * @remarks
     * With the handle to the spool file, your application can write to the spool file with calls to [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile) followed by [**CommitSpoolData**](commitspooldata.md).
     * 
     * Your application must not call [**ClosePrinter**](closeprinter.md) on *hPrinter* until after it has accessed the spool file for the last time. Then it should call [**CloseSpoolFileHandle**](closespoolfilehandle.md) followed by **ClosePrinter**. Attempts to access the spool file handle after the original *hPrinter* has been closed will fail even if the file handle itself has not been closed. **CloseSpoolFileHandle** will itself fail if **ClosePrinter** is called first.
     * 
     * This function will fail if it is called before the print job has finished spooling.
     * @param {Pointer<Void>} hPrinter A handle to the printer to which the job was submitted. This should be the same handle that was used to submit the job. (Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.)
     * @returns {Pointer<Void>} If the function succeeds, it returns a handle to the spool file.
     * 
     * If the function fails, it returns **INVALID\_HANDLE\_VALUE**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getspoolfilehandle
     */
    static GetSpoolFileHandle(hPrinter) {
        A_LastError := 0

        result := DllCall("winspool.drv\GetSpoolFileHandle", "ptr", hPrinter)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CommitSpoolData function notifies the print spooler that a specified amount of data has been written to a specified spool file and is ready to be rendered.
     * @remarks
     * Applications submitting a spooler print job can call [**GetSpoolFileHandle**](getspoolfilehandle.md) and then directly write data to the spool file handle by calling [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile). To notify the print spooler that the file contains data which is ready to be rendered, the application must call **CommitSpoolData** and provide the number of available bytes.
     * 
     * If **CommitSpoolData** is called multiple times, each call must use the spool file handle returned by the previous call. When no more data will be written to the spool file, [**CloseSpoolFileHandle**](closespoolfilehandle.md) should be called for the file handle returned by the last call to **CommitSpoolData**.
     * 
     * Before calling **CommitSpoolData**, applications must set the file pointer to the position it had before it wrote data to the file. In the process of rendering the data in the spooler file, the print spooler will move the spool file pointer *cbCommit* bytes from the current value of file pointer.
     * @param {Pointer<Void>} hPrinter A handle to the printer to which the job was submitted. This should be the same handle that was used to obtain *hSpoolFile* with [**GetSpoolFileHandle**](getspoolfilehandle.md).
     * @param {Pointer<Void>} hSpoolFile A handle to the spool file being changed. On the first call of **CommitSpoolData**, this should be the same handle that was returned by [**GetSpoolFileHandle**](getspoolfilehandle.md). Subsequent calls to **CommitSpoolData** should pass the handle returned by the preceding call. See Remarks.
     * @param {Integer} cbCommit The number of bytes committed to the print spooler.
     * @returns {Pointer<Void>} If the function succeeds, it returns a handle to the spool file.
     * 
     * If the function fails, it returns INVALID\_HANDLE\_VALUE.
     * @see https://learn.microsoft.com/windows/win32/printdocs/commitspooldata
     */
    static CommitSpoolData(hPrinter, hSpoolFile, cbCommit) {
        result := DllCall("winspool.drv\CommitSpoolData", "ptr", hPrinter, "ptr", hSpoolFile, "uint", cbCommit)
        return result
    }

    /**
     * The CloseSpoolFileHandle function closes a handle to a spool file associated with the print job currently submitted by the application.
     * @remarks
     * Your application must not call [**ClosePrinter**](closeprinter.md) on *hPrinter* until after it has accessed the spool file for the last time. Then it should call **CloseSpoolFileHandle** followed by **ClosePrinter**. Attempts to access the spool file handle after the original *hPrinter* has been closed will fail even if the file handle itself has not been closed. **CloseSpoolFileHandle** will fail if **ClosePrinter** is called first.
     * @param {Pointer<Void>} hPrinter A handle to the printer to which the job was submitted. This should be the same handle that was used to obtain *hSpoolFile* with [**GetSpoolFileHandle**](getspoolfilehandle.md).
     * @param {Pointer<Void>} hSpoolFile A handle to the spool file being closed. If [**CommitSpoolData**](commitspooldata.md) has not been called since [**GetSpoolFileHandle**](getspoolfilehandle.md) was called, then this should be the same handle that was returned by **GetSpoolFileHandle**. Otherwise, it should be the handle that was returned by the most recent call to **CommitSpoolData**.
     * @returns {Integer} **TRUE**, if it succeeds, **FALSE** otherwise.
     * @see https://learn.microsoft.com/windows/win32/printdocs/closespoolfilehandle
     */
    static CloseSpoolFileHandle(hPrinter, hSpoolFile) {
        result := DllCall("winspool.drv\CloseSpoolFileHandle", "ptr", hPrinter, "ptr", hSpoolFile, "int")
        return result
    }

    /**
     * The OpenPrinter function retrieves a handle to the specified printer or print server or other types of handles in the print subsystem.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > A handle obtained for a remote printer by a call to **OpenPrinter** for a remote printer accesses the printer through a local cache in the print spooler service. This cache isn't real-time accurate. To obtain accurate data, replace the OpenPrinter call with [**OpenPrinter2**](openprinter2.md) with pOptions.dwFlags set to PRINTER\_OPTION\_NO\_CACHE. Note that only OpenPrinter2W is functional. The function returns a printer handle that uses other Printing API calls and bypasses the local cache. This method blocks while waiting for network communication with the remote printer, so it might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages user interface interaction might make the application appear unresponsive.
     * 
     *  
     * 
     * > [!Note]  
     * > A handle obtained by a call to **OpenPrinter** for a remote printer will access the printer through a local cache in the print spooler service. This cache is, by design, not real time accurate. If you need to obtain accurate data, replace the **OpenPrinter** call with [**OpenPrinter2**](openprinter2.md) with *pOptions.dwFlags* set to [**PRINTER\_OPTION\_NO\_CACHE**](printer-options.md). Note that only **OpenPrinter2W** is functional. Doing so the function returns a printer handle that makes other Printing API calls to bypass the local cache. Note that this approach will block while waiting for the round-trip network communication to the remote printer, so it may not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation - factors that are difficult to predict when writing an application. Therefore calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The handle pointed to by *phPrinter* is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
     * 
     * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
     * 
     * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) settings defined in the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure of the *pDefault* parameter are not used when the value of the *pDatatype* member of the [**DOC\_INFO\_1**](doc-info-1.md) structure that was passed in the *pDocInfo* parameter of the [**StartDocPrinter**](startdocprinter.md) call is "RAW". When a high-level document (such as an Adobe PDF or Microsoft Word file) or other printer data (such PCL, PS, or HPGL) is sent directly to a printer with *pDatatype* set to "RAW", the document must fully describe the **DEVMODE**-style print job settings in the language understood by the hardware.
     * 
     * You can call the **OpenPrinter** function to open a handle to a print server or to determine the access rights that a client has to a print server. To do so, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you finish with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
     * 
     * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the access rights that you need to the printer. The access rights can be one of the following. (If *pDefault* is **NULL**, then the access rights are PRINTER\_ACCESS\_USE.)
     * 
     * 
     * 
     * | Desired Access value                        | Meaning                                                                                                                                                                                      |
     * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
     * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
     * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except for SYNCHRONIZE (see [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                     |
     * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
     * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
     * 
     * 
     * 
     *  
     * 
     * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter** call will fail with a return value of zero and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
     * @param {Pointer<Byte>} pPrinterName A pointer to a null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
     * 
     * For a printer object use: PrinterName, Job xxxx. For an XcvMonitor, use: ServerName, XcvMonitor MonitorName. For an XcvPort, use: ServerName, XcvPort PortName.
     * 
     * If **NULL**, it indicates the local printer server.
     * @param {Pointer<Void>} phPrinter A pointer to a variable that receives a handle (not thread safe) to the open printer or print server object.
     * 
     * The *phPrinter* parameter can return an Xcv handle for use with the XcvData function. For more information about XcvData, see the DDK.
     * @param {Pointer<PRINTER_DEFAULTSA>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter
     */
    static OpenPrinterA(pPrinterName, phPrinter, pDefault) {
        pPrinterName := pPrinterName is String? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinterA", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The OpenPrinter function retrieves a handle to the specified printer or print server or other types of handles in the print subsystem.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > A handle obtained for a remote printer by a call to **OpenPrinter** for a remote printer accesses the printer through a local cache in the print spooler service. This cache isn't real-time accurate. To obtain accurate data, replace the OpenPrinter call with [**OpenPrinter2**](openprinter2.md) with pOptions.dwFlags set to PRINTER\_OPTION\_NO\_CACHE. Note that only OpenPrinter2W is functional. The function returns a printer handle that uses other Printing API calls and bypasses the local cache. This method blocks while waiting for network communication with the remote printer, so it might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages user interface interaction might make the application appear unresponsive.
     * 
     *  
     * 
     * > [!Note]  
     * > A handle obtained by a call to **OpenPrinter** for a remote printer will access the printer through a local cache in the print spooler service. This cache is, by design, not real time accurate. If you need to obtain accurate data, replace the **OpenPrinter** call with [**OpenPrinter2**](openprinter2.md) with *pOptions.dwFlags* set to [**PRINTER\_OPTION\_NO\_CACHE**](printer-options.md). Note that only **OpenPrinter2W** is functional. Doing so the function returns a printer handle that makes other Printing API calls to bypass the local cache. Note that this approach will block while waiting for the round-trip network communication to the remote printer, so it may not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation - factors that are difficult to predict when writing an application. Therefore calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The handle pointed to by *phPrinter* is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
     * 
     * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
     * 
     * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) settings defined in the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure of the *pDefault* parameter are not used when the value of the *pDatatype* member of the [**DOC\_INFO\_1**](doc-info-1.md) structure that was passed in the *pDocInfo* parameter of the [**StartDocPrinter**](startdocprinter.md) call is "RAW". When a high-level document (such as an Adobe PDF or Microsoft Word file) or other printer data (such PCL, PS, or HPGL) is sent directly to a printer with *pDatatype* set to "RAW", the document must fully describe the **DEVMODE**-style print job settings in the language understood by the hardware.
     * 
     * You can call the **OpenPrinter** function to open a handle to a print server or to determine the access rights that a client has to a print server. To do so, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you finish with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
     * 
     * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the access rights that you need to the printer. The access rights can be one of the following. (If *pDefault* is **NULL**, then the access rights are PRINTER\_ACCESS\_USE.)
     * 
     * 
     * 
     * | Desired Access value                        | Meaning                                                                                                                                                                                      |
     * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
     * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
     * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except for SYNCHRONIZE (see [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                     |
     * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
     * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
     * 
     * 
     * 
     *  
     * 
     * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter** call will fail with a return value of zero and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
     * @param {Pointer<Char>} pPrinterName A pointer to a null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
     * 
     * For a printer object use: PrinterName, Job xxxx. For an XcvMonitor, use: ServerName, XcvMonitor MonitorName. For an XcvPort, use: ServerName, XcvPort PortName.
     * 
     * If **NULL**, it indicates the local printer server.
     * @param {Pointer<Void>} phPrinter A pointer to a variable that receives a handle (not thread safe) to the open printer or print server object.
     * 
     * The *phPrinter* parameter can return an Xcv handle for use with the XcvData function. For more information about XcvData, see the DDK.
     * @param {Pointer<PRINTER_DEFAULTSW>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter
     */
    static OpenPrinterW(pPrinterName, phPrinter, pDefault) {
        pPrinterName := pPrinterName is String? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinterW", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The ResetPrinter function specifies the data type and device mode values to be used for printing documents submitted by the StartDocPrinter function. These values can be overridden by using the SetJob function after document printing has started.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter Handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<PRINTER_DEFAULTSA>} pDefault Pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure.
     * 
     * The **ResetPrinter** function ignores the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. Set that member to zero.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/resetprinter
     */
    static ResetPrinterA(hPrinter, pDefault) {
        result := DllCall("winspool.drv\ResetPrinterA", "ptr", hPrinter, "ptr", pDefault, "int")
        return result
    }

    /**
     * The ResetPrinter function specifies the data type and device mode values to be used for printing documents submitted by the StartDocPrinter function. These values can be overridden by using the SetJob function after document printing has started.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter Handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<PRINTER_DEFAULTSW>} pDefault Pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure.
     * 
     * The **ResetPrinter** function ignores the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. Set that member to zero.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/resetprinter
     */
    static ResetPrinterW(hPrinter, pDefault) {
        result := DllCall("winspool.drv\ResetPrinterW", "ptr", hPrinter, "ptr", pDefault, "int")
        return result
    }

    /**
     * The SetJob function pauses, resumes, cancels, or restarts a print job on a specified printer. You can also use the SetJob function to set print job parameters, such as the print job priority and the document name.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * You can use the **SetJob** function to set various print job parameters by supplying a pointer to a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), [**JOB\_INFO\_3**](job-info-3.md), or [**JOB\_INFO\_4**](job-info-4.md) structure that contains the necessary data.
     * 
     * To remove or delete all of the print jobs for a particular printer, call the [**SetPrinter**](setprinter.md) function with its *Command* parameter set to **PRINTER\_CONTROL\_PURGE**.
     * 
     * The following members of a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure are ignored on a call to **SetJob**: **JobId**, **pPrinterName**, **pMachineName**, **pUserName**, **pDrivername**, **Size**, **Submitted**, **Time**, and **TotalPages**.
     * 
     * You must have **PRINTER\_ACCESS\_ADMINISTER** access permission for a printer in order to change a print job's position in the print queue.
     * 
     * If you do not want to set a print job's position in the print queue, you should set the **Position** member of the [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure to **JOB\_POSITION\_UNSPECIFIED**.
     * 
     * Use the **SetJob** function with the [**JOB\_INFO\_3**](job-info-3.md) structure to link together a set of print jobs (also known as a chain). This is useful in situations where a single document consists of several parts that you want to render separately. To print jobs A, B, C, and D in order, call **SetJob** with [**JOB\_INFO\_4**](job-info-4.md) to link A to B, B to C, and C to D.
     * 
     * If you link print jobs, note the following:
     * 
     * -   Jobs can be added to the beginning or end of a chain.
     * -   All jobs in the chain must have the same data type.
     * -   The chain must be completely linked before spooling begins, otherwise the spooler may print and delete spooled jobs before you link them all. There are two ways to keep the chain from printing prematurely:
     * 
     *     -   Pause the first job in the chain until the chain is completely linked. The paused state of the first job governs the state of all jobs in the chain.
     *     -   Keep the first job incomplete, that is, do not call [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc) or [**ScheduleJob**](schedulejob.md) for the first job. However, if 'print while spooling' is enabled (the default), this method blocks the port while the chain is built, which also prevents the printing of non-related jobs.
     * 
     * -   The application must handle the case where the user deletes a job in the chain before the chain finishes printing. [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **INVALID\_PARAMETER** when a JobID does not exist.
     * @param {Pointer<Void>} hPrinter A handle to the printer object of interest. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} JobId Identifier that specifies the print job. You obtain a print job identifier by calling the [**AddJob**](addjob.md) function or the [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function.
     * 
     * If the *Level* parameter is set to 3, the *JobId* parameter must match the **JobId** member of the [**JOB\_INFO\_3**](job-info-3.md) structure pointed to by *pJob*
     * @param {Integer} Level The type of job information structure pointed to by the *pJob* parameter.
     * 
     * **All versions of Windows**: You can set the *Level* parameter to 0, 1, or 2. When you set *Level* to 0, *pJob* should be **NULL**. Use these values when you are not setting any print job parameters.
     * 
     * You can also set the *Level* parameter to 3.
     * 
     * Starting with **Windows Vista**: You can also set the *Level* parameter to 4.
     * @param {Integer} Command The print job operation to perform. This parameter can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                            | Meaning                                                                            |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
     * | <span id="JOB_CONTROL_CANCEL"></span><span id="job_control_cancel"></span><dl> <dt>**JOB\_CONTROL\_CANCEL**</dt> </dl>                                    | Do not use. To delete a print job, use **JOB\_CONTROL\_DELETE**.<br/>        |
     * | <span id="JOB_CONTROL_PAUSE"></span><span id="job_control_pause"></span><dl> <dt>**JOB\_CONTROL\_PAUSE**</dt> </dl>                                       | Pause the print job.<br/>                                                    |
     * | <span id="JOB_CONTROL_RESTART"></span><span id="job_control_restart"></span><dl> <dt>**JOB\_CONTROL\_RESTART**</dt> </dl>                                 | Restart the print job. A job can only be restarted if it was printing.<br/>  |
     * | <span id="JOB_CONTROL_RESUME"></span><span id="job_control_resume"></span><dl> <dt>**JOB\_CONTROL\_RESUME**</dt> </dl>                                    | Resume a paused print job.<br/>                                              |
     * | <span id="JOB_CONTROL_DELETE"></span><span id="job_control_delete"></span><dl> <dt>**JOB\_CONTROL\_DELETE**</dt> </dl>                                    | Delete the print job.<br/>                                                   |
     * | <span id="JOB_CONTROL_SENT_TO_PRINTER"></span><span id="job_control_sent_to_printer"></span><dl> <dt>**JOB\_CONTROL\_SENT\_TO\_PRINTER**</dt> </dl>       | Used by port monitors to end the print job.<br/>                             |
     * | <span id="JOB_CONTROL_LAST_PAGE_EJECTED"></span><span id="job_control_last_page_ejected"></span><dl> <dt>**JOB\_CONTROL\_LAST\_PAGE\_EJECTED**</dt> </dl> | Used by language monitors to end the print job.<br/>                         |
     * | <span id="JOB_CONTROL_RETAIN"></span><span id="job_control_retain"></span><dl> <dt>**JOB\_CONTROL\_RETAIN**</dt> </dl>                                    | **Windows Vista and later**: Keep the job in the queue after it prints.<br/> |
     * | <span id="JOB_CONTROL_RELEASE"></span><span id="job_control_release"></span><dl> <dt>**JOB\_CONTROL\_RELEASE**</dt> </dl>                                 | **Windows Vista and later**: Release the print job.<br/>                     |
     * 
     * 
     * 
     *  
     * 
     * You can use the same call to the **SetJob** function to set print job parameters and to give a command to a print job. Thus, *Command* does not need to be 0 if you are setting print job parameters, although it can be.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setjob
     */
    static SetJobA(hPrinter, JobId, Level, Command) {
        static pJob := 0 ;Reserved parameters must always be NULL

        result := DllCall("winspool.drv\SetJobA", "ptr", hPrinter, "uint", JobId, "uint", Level, "char*", pJob, "uint", Command, "int")
        return result
    }

    /**
     * The SetJob function pauses, resumes, cancels, or restarts a print job on a specified printer. You can also use the SetJob function to set print job parameters, such as the print job priority and the document name.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * You can use the **SetJob** function to set various print job parameters by supplying a pointer to a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), [**JOB\_INFO\_3**](job-info-3.md), or [**JOB\_INFO\_4**](job-info-4.md) structure that contains the necessary data.
     * 
     * To remove or delete all of the print jobs for a particular printer, call the [**SetPrinter**](setprinter.md) function with its *Command* parameter set to **PRINTER\_CONTROL\_PURGE**.
     * 
     * The following members of a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure are ignored on a call to **SetJob**: **JobId**, **pPrinterName**, **pMachineName**, **pUserName**, **pDrivername**, **Size**, **Submitted**, **Time**, and **TotalPages**.
     * 
     * You must have **PRINTER\_ACCESS\_ADMINISTER** access permission for a printer in order to change a print job's position in the print queue.
     * 
     * If you do not want to set a print job's position in the print queue, you should set the **Position** member of the [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure to **JOB\_POSITION\_UNSPECIFIED**.
     * 
     * Use the **SetJob** function with the [**JOB\_INFO\_3**](job-info-3.md) structure to link together a set of print jobs (also known as a chain). This is useful in situations where a single document consists of several parts that you want to render separately. To print jobs A, B, C, and D in order, call **SetJob** with [**JOB\_INFO\_4**](job-info-4.md) to link A to B, B to C, and C to D.
     * 
     * If you link print jobs, note the following:
     * 
     * -   Jobs can be added to the beginning or end of a chain.
     * -   All jobs in the chain must have the same data type.
     * -   The chain must be completely linked before spooling begins, otherwise the spooler may print and delete spooled jobs before you link them all. There are two ways to keep the chain from printing prematurely:
     * 
     *     -   Pause the first job in the chain until the chain is completely linked. The paused state of the first job governs the state of all jobs in the chain.
     *     -   Keep the first job incomplete, that is, do not call [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc) or [**ScheduleJob**](schedulejob.md) for the first job. However, if 'print while spooling' is enabled (the default), this method blocks the port while the chain is built, which also prevents the printing of non-related jobs.
     * 
     * -   The application must handle the case where the user deletes a job in the chain before the chain finishes printing. [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **INVALID\_PARAMETER** when a JobID does not exist.
     * @param {Pointer<Void>} hPrinter A handle to the printer object of interest. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} JobId Identifier that specifies the print job. You obtain a print job identifier by calling the [**AddJob**](addjob.md) function or the [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function.
     * 
     * If the *Level* parameter is set to 3, the *JobId* parameter must match the **JobId** member of the [**JOB\_INFO\_3**](job-info-3.md) structure pointed to by *pJob*
     * @param {Integer} Level The type of job information structure pointed to by the *pJob* parameter.
     * 
     * **All versions of Windows**: You can set the *Level* parameter to 0, 1, or 2. When you set *Level* to 0, *pJob* should be **NULL**. Use these values when you are not setting any print job parameters.
     * 
     * You can also set the *Level* parameter to 3.
     * 
     * Starting with **Windows Vista**: You can also set the *Level* parameter to 4.
     * @param {Integer} Command The print job operation to perform. This parameter can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                            | Meaning                                                                            |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
     * | <span id="JOB_CONTROL_CANCEL"></span><span id="job_control_cancel"></span><dl> <dt>**JOB\_CONTROL\_CANCEL**</dt> </dl>                                    | Do not use. To delete a print job, use **JOB\_CONTROL\_DELETE**.<br/>        |
     * | <span id="JOB_CONTROL_PAUSE"></span><span id="job_control_pause"></span><dl> <dt>**JOB\_CONTROL\_PAUSE**</dt> </dl>                                       | Pause the print job.<br/>                                                    |
     * | <span id="JOB_CONTROL_RESTART"></span><span id="job_control_restart"></span><dl> <dt>**JOB\_CONTROL\_RESTART**</dt> </dl>                                 | Restart the print job. A job can only be restarted if it was printing.<br/>  |
     * | <span id="JOB_CONTROL_RESUME"></span><span id="job_control_resume"></span><dl> <dt>**JOB\_CONTROL\_RESUME**</dt> </dl>                                    | Resume a paused print job.<br/>                                              |
     * | <span id="JOB_CONTROL_DELETE"></span><span id="job_control_delete"></span><dl> <dt>**JOB\_CONTROL\_DELETE**</dt> </dl>                                    | Delete the print job.<br/>                                                   |
     * | <span id="JOB_CONTROL_SENT_TO_PRINTER"></span><span id="job_control_sent_to_printer"></span><dl> <dt>**JOB\_CONTROL\_SENT\_TO\_PRINTER**</dt> </dl>       | Used by port monitors to end the print job.<br/>                             |
     * | <span id="JOB_CONTROL_LAST_PAGE_EJECTED"></span><span id="job_control_last_page_ejected"></span><dl> <dt>**JOB\_CONTROL\_LAST\_PAGE\_EJECTED**</dt> </dl> | Used by language monitors to end the print job.<br/>                         |
     * | <span id="JOB_CONTROL_RETAIN"></span><span id="job_control_retain"></span><dl> <dt>**JOB\_CONTROL\_RETAIN**</dt> </dl>                                    | **Windows Vista and later**: Keep the job in the queue after it prints.<br/> |
     * | <span id="JOB_CONTROL_RELEASE"></span><span id="job_control_release"></span><dl> <dt>**JOB\_CONTROL\_RELEASE**</dt> </dl>                                 | **Windows Vista and later**: Release the print job.<br/>                     |
     * 
     * 
     * 
     *  
     * 
     * You can use the same call to the **SetJob** function to set print job parameters and to give a command to a print job. Thus, *Command* does not need to be 0 if you are setting print job parameters, although it can be.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setjob
     */
    static SetJobW(hPrinter, JobId, Level, Command) {
        static pJob := 0 ;Reserved parameters must always be NULL

        result := DllCall("winspool.drv\SetJobW", "ptr", hPrinter, "uint", JobId, "uint", Level, "char*", pJob, "uint", Command, "int")
        return result
    }

    /**
     * The GetJob function retrieves information about a specified print job.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the print-job data is retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} JobId Identifies the print job for which to retrieve data. Use the [**AddJob**](addjob.md) function or [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function to get a print job identifier.
     * @param {Integer} Level The type of information returned in the *pJob* buffer. If *Level* is 1, *pJob* receives a [**JOB\_INFO\_1**](job-info-1.md) structure. If *Level* is 2, *pJob* receives a [**JOB\_INFO\_2**](job-info-2.md) structure.
     * @param {Pointer} pJob A pointer to a buffer that receives a [**JOB\_INFO\_1**](job-info-1.md) or a [**JOB\_INFO\_2**](job-info-2.md) structure containing information about the job. The buffer must be large enough to store the strings pointed to by the structure members.
     * 
     * To determine the required buffer size, call **GetJob** with *cbBuf* set to zero. **GetJob** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the array.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getjob
     */
    static GetJobA(hPrinter, JobId, Level, pJob, cbBuf, pcbNeeded) {
        result := DllCall("winspool.drv\GetJobA", "ptr", hPrinter, "uint", JobId, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetJob function retrieves information about a specified print job.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the print-job data is retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} JobId Identifies the print job for which to retrieve data. Use the [**AddJob**](addjob.md) function or [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function to get a print job identifier.
     * @param {Integer} Level The type of information returned in the *pJob* buffer. If *Level* is 1, *pJob* receives a [**JOB\_INFO\_1**](job-info-1.md) structure. If *Level* is 2, *pJob* receives a [**JOB\_INFO\_2**](job-info-2.md) structure.
     * @param {Pointer} pJob A pointer to a buffer that receives a [**JOB\_INFO\_1**](job-info-1.md) or a [**JOB\_INFO\_2**](job-info-2.md) structure containing information about the job. The buffer must be large enough to store the strings pointed to by the structure members.
     * 
     * To determine the required buffer size, call **GetJob** with *cbBuf* set to zero. **GetJob** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the array.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getjob
     */
    static GetJobW(hPrinter, JobId, Level, pJob, cbBuf, pcbNeeded) {
        result := DllCall("winspool.drv\GetJobW", "ptr", hPrinter, "uint", JobId, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The EnumJobs function retrieves information about a specified set of print jobs for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The [**JOB\_INFO\_1**](job-info-1.md) structure contains general print-job information; the [**JOB\_INFO\_2**](job-info-2.md) structure has much more detailed information. The [**JOB\_INFO\_3**](job-info-3.md) structure contains information about how jobs are linked.
     * 
     * To determine the number of print jobs in the printer queue, call the [**GetPrinter**](getprinter.md) function with the *Level* parameter set to 2.
     * @param {Pointer<Void>} hPrinter A handle to the printer object whose print jobs the function enumerates. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} FirstJob The zero-based position within the print queue of the first print job to enumerate. For example, a value of 0 specifies that enumeration should begin at the first print job in the print queue; a value of 9 specifies that enumeration should begin at the tenth print job in the print queue.
     * @param {Integer} NoJobs The total number of print jobs to enumerate.
     * @param {Integer} Level The type of information returned in the *pJob* buffer.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                                                              |
     * |------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_1**](job-info-1.md) structures<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_2**](job-info-2.md) structures<br/> |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_3**](job-info-3.md) structures<br/> |
     * @param {Pointer} pJob A pointer to a buffer that receives an array of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumJobs** with *cbBuf* set to zero. **EnumJobs** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the *pJob* buffer.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds. If the function fails, the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures returned in the *pJob* buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumjobs
     */
    static EnumJobsA(hPrinter, FirstJob, NoJobs, Level, pJob, cbBuf, pcbNeeded, pcReturned) {
        A_LastError := 0

        result := DllCall("winspool.drv\EnumJobsA", "ptr", hPrinter, "uint", FirstJob, "uint", NoJobs, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumJobs function retrieves information about a specified set of print jobs for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The [**JOB\_INFO\_1**](job-info-1.md) structure contains general print-job information; the [**JOB\_INFO\_2**](job-info-2.md) structure has much more detailed information. The [**JOB\_INFO\_3**](job-info-3.md) structure contains information about how jobs are linked.
     * 
     * To determine the number of print jobs in the printer queue, call the [**GetPrinter**](getprinter.md) function with the *Level* parameter set to 2.
     * @param {Pointer<Void>} hPrinter A handle to the printer object whose print jobs the function enumerates. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} FirstJob The zero-based position within the print queue of the first print job to enumerate. For example, a value of 0 specifies that enumeration should begin at the first print job in the print queue; a value of 9 specifies that enumeration should begin at the tenth print job in the print queue.
     * @param {Integer} NoJobs The total number of print jobs to enumerate.
     * @param {Integer} Level The type of information returned in the *pJob* buffer.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                                                              |
     * |------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_1**](job-info-1.md) structures<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_2**](job-info-2.md) structures<br/> |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_3**](job-info-3.md) structures<br/> |
     * @param {Pointer} pJob A pointer to a buffer that receives an array of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumJobs** with *cbBuf* set to zero. **EnumJobs** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the *pJob* buffer.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds. If the function fails, the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures returned in the *pJob* buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumjobs
     */
    static EnumJobsW(hPrinter, FirstJob, NoJobs, Level, pJob, cbBuf, pcbNeeded, pcReturned) {
        A_LastError := 0

        result := DllCall("winspool.drv\EnumJobsW", "ptr", hPrinter, "uint", FirstJob, "uint", NoJobs, "uint", Level, "ptr", pJob, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddPrinter function adds a printer to the list of supported printers for a specified server.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * The returned handle is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
     * 
     * The following are the members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure that can be set before the **AddPrinter** function is called:
     * 
     * -   **Attributes**
     * -   **pPrintProcessor**
     * -   **DefaultPriority**
     * -   **Priority**
     * -   **pComment**
     * -   **pSecurityDescriptor**
     * -   **pDatatype**
     * -   **pSepFile**
     * -   **pDevMode**
     * -   **pShareName**
     * -   **pLocation**
     * -   **StartTime**
     * -   **pParameters**
     * -   **UntilTime**
     * 
     * The **Status**, **cJobs**, and **AveragePPM** members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure are reserved for use by the [**GetPrinter**](getprinter.md) function. They must not be set before calling **AddPrinter**.
     * 
     * If **pSecurityDescriptor** is **NULL**, the system assigns a default security descriptor to the printer. The default security descriptor has the following permissions.
     * 
     * 
     * 
     * | Value                          | Description                                                                                                                                                                                                                                                                                                                                            |
     * |--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | Administrators and Power Users | Full control on the print queue. This means members of these groups can print, manage the queue (can delete the queue, change any setting of the queue, including the security descriptor), and manage the print jobs of all users (delete, pause, resume, restart jobs).Note that Power Users do not exist before Windows XP Professional.<br/> |
     * | Creator/Owner                  | Can manage own jobs. This means that user who submit jobs can manage (delete, pause, resume, restart) their own jobs.                                                                                                                                                                                                                                  |
     * | Everyone                       | Execute and standard read control. This means that members of the everyone group can print and read properties of the print queue.                                                                                                                                                                                                                     |
     * 
     * 
     * 
     *  
     * 
     * After an application creates a printer object with the **AddPrinter** function, it must use the [**PrinterProperties**](printerproperties.md) function to specify the correct settings for the printer driver associated with the printer object.
     * 
     * The **AddPrinter** function returns an error if a printer object with the same name already exists, unless that object is marked as pending deletion. In that case, the existing printer is not deleted, and the **AddPrinter** creation parameters are used to change the existing printer settings (as if the application had used the [**SetPrinter**](setprinter.md) function).
     * 
     * Use the [**EnumPrintProcessors**](enumprintprocessors.md) function to enumerate the set of print processors installed on a server. Use the [**EnumPrintProcessorDatatypes**](enumprintprocessordatatypes.md) function to enumerate the set of data types that a print processor supports. Use the [**EnumPorts**](enumports.md) function to enumerate the set of available ports. Use the [**EnumPrinterDrivers**](enumprinterdrivers.md) function to enumerate the installed printer drivers.
     * 
     * The caller of the **AddPrinter** function must have SERVER\_ACCESS\_ADMINISTER access to the server on which the printer is to be created. The handle returned by the function will have PRINTER\_ALL\_ACCESS permission, and can be used to perform administrative operations on the printer.
     * 
     * If the **DrvPrinterEvent** function is passed the PRINTER\_EVENT\_FLAG\_NO\_UI flag, the driver should not use a UI call during **DrvPrinterEvent**. To do UI-related jobs, the installer should either use the **VendorSetup** entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about **VendorSetup**, see the Microsoft Windows Driver Development Kit (DDK).
     * 
     * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing is enabled when you run **AddPrinter**.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the printer should be installed. If this string is **NULL**, the printer is installed locally.
     * @param {Integer} Level The version of the structure to which *pPrinter* points. This value must be 2.
     * @param {Pointer<Byte>} pPrinter A pointer to a [**PRINTER\_INFO\_2**](printer-info-2.md) structure that contains information about the printer. You must specify non-**NULL** values for the **pPrinterName**, **pPortName**, **pDriverName**, and **pPrintProcessor** members of this structure before calling **AddPrinter**.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle (not thread safe) to a new printer object. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
     * 
     * If the function fails, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinter
     */
    static AddPrinterA(pName, Level, pPrinter) {
        pName := pName is String? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterA", "ptr", pName, "uint", Level, "char*", pPrinter)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddPrinter function adds a printer to the list of supported printers for a specified server.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * The returned handle is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
     * 
     * The following are the members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure that can be set before the **AddPrinter** function is called:
     * 
     * -   **Attributes**
     * -   **pPrintProcessor**
     * -   **DefaultPriority**
     * -   **Priority**
     * -   **pComment**
     * -   **pSecurityDescriptor**
     * -   **pDatatype**
     * -   **pSepFile**
     * -   **pDevMode**
     * -   **pShareName**
     * -   **pLocation**
     * -   **StartTime**
     * -   **pParameters**
     * -   **UntilTime**
     * 
     * The **Status**, **cJobs**, and **AveragePPM** members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure are reserved for use by the [**GetPrinter**](getprinter.md) function. They must not be set before calling **AddPrinter**.
     * 
     * If **pSecurityDescriptor** is **NULL**, the system assigns a default security descriptor to the printer. The default security descriptor has the following permissions.
     * 
     * 
     * 
     * | Value                          | Description                                                                                                                                                                                                                                                                                                                                            |
     * |--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | Administrators and Power Users | Full control on the print queue. This means members of these groups can print, manage the queue (can delete the queue, change any setting of the queue, including the security descriptor), and manage the print jobs of all users (delete, pause, resume, restart jobs).Note that Power Users do not exist before Windows XP Professional.<br/> |
     * | Creator/Owner                  | Can manage own jobs. This means that user who submit jobs can manage (delete, pause, resume, restart) their own jobs.                                                                                                                                                                                                                                  |
     * | Everyone                       | Execute and standard read control. This means that members of the everyone group can print and read properties of the print queue.                                                                                                                                                                                                                     |
     * 
     * 
     * 
     *  
     * 
     * After an application creates a printer object with the **AddPrinter** function, it must use the [**PrinterProperties**](printerproperties.md) function to specify the correct settings for the printer driver associated with the printer object.
     * 
     * The **AddPrinter** function returns an error if a printer object with the same name already exists, unless that object is marked as pending deletion. In that case, the existing printer is not deleted, and the **AddPrinter** creation parameters are used to change the existing printer settings (as if the application had used the [**SetPrinter**](setprinter.md) function).
     * 
     * Use the [**EnumPrintProcessors**](enumprintprocessors.md) function to enumerate the set of print processors installed on a server. Use the [**EnumPrintProcessorDatatypes**](enumprintprocessordatatypes.md) function to enumerate the set of data types that a print processor supports. Use the [**EnumPorts**](enumports.md) function to enumerate the set of available ports. Use the [**EnumPrinterDrivers**](enumprinterdrivers.md) function to enumerate the installed printer drivers.
     * 
     * The caller of the **AddPrinter** function must have SERVER\_ACCESS\_ADMINISTER access to the server on which the printer is to be created. The handle returned by the function will have PRINTER\_ALL\_ACCESS permission, and can be used to perform administrative operations on the printer.
     * 
     * If the **DrvPrinterEvent** function is passed the PRINTER\_EVENT\_FLAG\_NO\_UI flag, the driver should not use a UI call during **DrvPrinterEvent**. To do UI-related jobs, the installer should either use the **VendorSetup** entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about **VendorSetup**, see the Microsoft Windows Driver Development Kit (DDK).
     * 
     * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing is enabled when you run **AddPrinter**.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the printer should be installed. If this string is **NULL**, the printer is installed locally.
     * @param {Integer} Level The version of the structure to which *pPrinter* points. This value must be 2.
     * @param {Pointer<Byte>} pPrinter A pointer to a [**PRINTER\_INFO\_2**](printer-info-2.md) structure that contains information about the printer. You must specify non-**NULL** values for the **pPrinterName**, **pPortName**, **pDriverName**, and **pPrintProcessor** members of this structure before calling **AddPrinter**.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle (not thread safe) to a new printer object. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
     * 
     * If the function fails, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinter
     */
    static AddPrinterW(pName, Level, pPrinter) {
        pName := pName is String? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterW", "ptr", pName, "uint", Level, "char*", pPrinter)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The DeletePrinter function deletes the specified printer object.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If there are print jobs remaining to be processed for the specified printer, **DeletePrinter** marks the printer for pending deletion, and then deletes it when all the print jobs have been printed. No print jobs can be added to a printer that is marked for pending deletion.
     * 
     * A printer marked for pending deletion cannot be held, but its print jobs can be held, resumed, and restarted. If the printer is held and there are jobs for the printer, **DeletePrinter** fails with ERROR\_ACCESS\_DENIED.
     * 
     * Note that **DeletePrinter** does not close the handle that is passed to it. Thus, the application must still call [**ClosePrinter**](closeprinter.md).
     * @param {Pointer<Void>} hPrinter Handle to a printer object that will be deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinter
     */
    static DeletePrinter(hPrinter) {
        A_LastError := 0

        result := DllCall("winspool.drv\DeletePrinter", "ptr", hPrinter, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SetPrinter function sets the data for a specified printer or sets the state of the specified printer by pausing printing, resuming printing, or clearing all print jobs.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * You cannot use **SetPrinter** to change the default printer.
     * 
     * To modify the current printer settings, call the [**GetPrinter**](getprinter.md) function to retrieve the current settings into a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, modify the members of that structure as necessary, and then call **SetPrinter**.
     * 
     * The **SetPrinter** function ignores the **pServerName**, **AveragePPM**, **Status**, and **cJobs** members of a [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
     * 
     * Pausing a printer suspends scheduling of all print jobs for that printer, except for the one print job that may be currently printing. Print jobs can be submitted to a paused printer, but no jobs will be scheduled to print on that printer until printing is resumed. If a printer is cleared, all print jobs for that printer are deleted, except for the current print job.
     * 
     * If you use **SetPrinter** to modify the default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure for a printer (globally setting the printer defaults), you must first call the [**DocumentProperties**](documentproperties.md) function to validate the **DEVMODE** structure.
     * 
     * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function can set only those components of the security descriptor that the caller has permission to modify. To set particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) or [**OpenPrinter2**](openprinter2.md) function to retrieve a handle to the printer. The following table shows the access rights required to modify the various security descriptor components.
     * 
     * 
     * 
     * | Access permission            | Security descriptor component             |
     * |------------------------------|-------------------------------------------|
     * | **WRITE\_OWNER**             | Owner<br/> Primary group<br/> |
     * | **WRITE\_DAC**               | Discretionary access-control list (DACL)  |
     * | **ACCESS\_SYSTEM\_SECURITY** | System access-control list (SACL)         |
     * 
     * 
     * 
     *  
     * 
     * If the security descriptor contains a component that the caller does not have the access right to modify, **SetPrinter** fails. Those components of a security descriptor that you don't want to modify should be **NULL** or not be present, as appropriate. If you do not want to modify the security descriptor, and are calling **SetPrinter** with a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, set the **pSecurityDescriptor** member of that structure to **NULL**.
     * 
     * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If **SetPrinter** is called by a machine admin, it enables the exception. If it is called by a non-admin and the exception has not already been enabled, the call fails.
     * 
     * You can use level 7 with the [**PRINTER\_INFO\_7**](printer-info-7.md) structure to publish, unpublish, or update directory service data for the printer. The directory service data for a printer includes all the data stored under the SPLDS\_\* keys by calls to the [**SetPrinterDataEx**](setprinterdataex.md) function for the printer. Before calling **SetPrinter**, set the **pszObjectGUID** member of **PRINTER\_INFO\_7** to **NULL** and set the *dwAction* member to one of the following values.
     * 
     * 
     * 
     * | Value                             | Description                                                                                                                                                                                                                                                                                                                                                                             |
     * |-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **DSPRINT\_PUBLISH**<br/>   | Publishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                        |
     * | **DSPRINT\_REPUBLISH**<br/> | The directory service data for the printer is unpublished and then published again, refreshing all properties in the published printer. Re-publishing also changes the GUID of the published printer. Use this value if you suspect the printer's published data has been corrupted.<br/>                                                                                         |
     * | **DSPRINT\_UNPUBLISH**<br/> | Unpublishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                      |
     * | **DSPRINT\_UPDATE**<br/>    | Updates the directory service data. This is the same as **DSPRINT\_PUBLISH**, except that **SetPrinter** fails with **ERROR\_FILE\_NOT\_FOUND** if the printer is not already published.<br/> Use **DSPRINT\_UPDATE** to update published properties but not force publishing. Printer drivers should always use **DSPRINT\_UPDATE** rather than **DSPRINT\_PUBLISH**.<br/> |
     * 
     * 
     * 
     *  
     * 
     * **DSPRINT\_PENDING** is not a valid *dwAction* value for **SetPrinter**.
     * @param {Pointer<Void>} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The type of data that the function stores into the buffer pointed to by *pPrinter*. If the *Command* parameter is not equal to zero, the *Level* parameter must be zero.
     * 
     * This value can be 0, 2, 3, 4, 5, 6, 7, 8, or 9.
     * @param {Pointer<Byte>} pPrinter A pointer to a buffer containing data to set for the printer, or containing information for the command specified by the *Command* parameter. The type of data in the buffer is determined by the value of *Level*.
     * 
     * 
     * 
     * | Level                                                                                                | Structure                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
     * |------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="0"></span><dl> <dt>**0**</dt> </dl> | If the *Command* parameter is **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must contain a **DWORD** value that specifies the new printer status to set. For a list of the possible status values, see the **Status** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure. Note that **PRINTER\_STATUS\_PAUSED** and **PRINTER\_STATUS\_PENDING\_DELETION** are not valid status values to set.<br/> If *Level* is 0, but the *Command* parameter is not **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must be **NULL**.<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                     |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                         |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/>                                                                                                                                                                                                                                                                                                                                         |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                       |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                              |
     * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure. The *dwAction* member of this structure indicates whether **SetPrinter** should publish, unpublish, re-publish, or update the printer's data in the directory service.<br/>                                                                                                                                                                                                                                                                                                                |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                        |
     * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                      |
     * @param {Integer} Command The action to perform.
     * 
     * If the *Level* parameter is nonzero, set the value of this parameter to zero. In this case, the printer retains its current state and the function reconfigures the printer data as specified by the *Level* and *pPrinter* parameters.
     * 
     * If the *Level* parameter is zero, set the value of this parameter to one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                  | Meaning                                                                                                                                             |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="PRINTER_CONTROL_PAUSE"></span><span id="printer_control_pause"></span><dl> <dt>**PRINTER\_CONTROL\_PAUSE**</dt> </dl>                 | Pause the printer.<br/>                                                                                                                       |
     * | <span id="PRINTER_CONTROL_PURGE"></span><span id="printer_control_purge"></span><dl> <dt>**PRINTER\_CONTROL\_PURGE**</dt> </dl>                 | Delete all print jobs in the printer.<br/>                                                                                                    |
     * | <span id="PRINTER_CONTROL_RESUME"></span><span id="printer_control_resume"></span><dl> <dt>**PRINTER\_CONTROL\_RESUME**</dt> </dl>              | Resume a paused printer.<br/>                                                                                                                 |
     * | <span id="PRINTER_CONTROL_SET_STATUS"></span><span id="printer_control_set_status"></span><dl> <dt>**PRINTER\_CONTROL\_SET\_STATUS**</dt> </dl> | Set the printer status.<br/> Set the *pPrinter* parameter to a pointer to a **DWORD** value that specifies the new printer status.<br/> |
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * 
     * If *Level* is 7 and the publish action failed, **SetPrinter** returns **ERROR\_IO\_PENDING** and attempts to complete the action in the background. If *Level* is 7 and the update action failed, **SetPrinter** returns **ERROR\_FILE\_NOT\_FOUND**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinter
     */
    static SetPrinterA(hPrinter, Level, pPrinter, Command) {
        A_LastError := 0

        result := DllCall("winspool.drv\SetPrinterA", "ptr", hPrinter, "uint", Level, "char*", pPrinter, "uint", Command, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SetPrinter function sets the data for a specified printer or sets the state of the specified printer by pausing printing, resuming printing, or clearing all print jobs.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * You cannot use **SetPrinter** to change the default printer.
     * 
     * To modify the current printer settings, call the [**GetPrinter**](getprinter.md) function to retrieve the current settings into a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, modify the members of that structure as necessary, and then call **SetPrinter**.
     * 
     * The **SetPrinter** function ignores the **pServerName**, **AveragePPM**, **Status**, and **cJobs** members of a [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
     * 
     * Pausing a printer suspends scheduling of all print jobs for that printer, except for the one print job that may be currently printing. Print jobs can be submitted to a paused printer, but no jobs will be scheduled to print on that printer until printing is resumed. If a printer is cleared, all print jobs for that printer are deleted, except for the current print job.
     * 
     * If you use **SetPrinter** to modify the default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure for a printer (globally setting the printer defaults), you must first call the [**DocumentProperties**](documentproperties.md) function to validate the **DEVMODE** structure.
     * 
     * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function can set only those components of the security descriptor that the caller has permission to modify. To set particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) or [**OpenPrinter2**](openprinter2.md) function to retrieve a handle to the printer. The following table shows the access rights required to modify the various security descriptor components.
     * 
     * 
     * 
     * | Access permission            | Security descriptor component             |
     * |------------------------------|-------------------------------------------|
     * | **WRITE\_OWNER**             | Owner<br/> Primary group<br/> |
     * | **WRITE\_DAC**               | Discretionary access-control list (DACL)  |
     * | **ACCESS\_SYSTEM\_SECURITY** | System access-control list (SACL)         |
     * 
     * 
     * 
     *  
     * 
     * If the security descriptor contains a component that the caller does not have the access right to modify, **SetPrinter** fails. Those components of a security descriptor that you don't want to modify should be **NULL** or not be present, as appropriate. If you do not want to modify the security descriptor, and are calling **SetPrinter** with a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, set the **pSecurityDescriptor** member of that structure to **NULL**.
     * 
     * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If **SetPrinter** is called by a machine admin, it enables the exception. If it is called by a non-admin and the exception has not already been enabled, the call fails.
     * 
     * You can use level 7 with the [**PRINTER\_INFO\_7**](printer-info-7.md) structure to publish, unpublish, or update directory service data for the printer. The directory service data for a printer includes all the data stored under the SPLDS\_\* keys by calls to the [**SetPrinterDataEx**](setprinterdataex.md) function for the printer. Before calling **SetPrinter**, set the **pszObjectGUID** member of **PRINTER\_INFO\_7** to **NULL** and set the *dwAction* member to one of the following values.
     * 
     * 
     * 
     * | Value                             | Description                                                                                                                                                                                                                                                                                                                                                                             |
     * |-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **DSPRINT\_PUBLISH**<br/>   | Publishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                        |
     * | **DSPRINT\_REPUBLISH**<br/> | The directory service data for the printer is unpublished and then published again, refreshing all properties in the published printer. Re-publishing also changes the GUID of the published printer. Use this value if you suspect the printer's published data has been corrupted.<br/>                                                                                         |
     * | **DSPRINT\_UNPUBLISH**<br/> | Unpublishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                      |
     * | **DSPRINT\_UPDATE**<br/>    | Updates the directory service data. This is the same as **DSPRINT\_PUBLISH**, except that **SetPrinter** fails with **ERROR\_FILE\_NOT\_FOUND** if the printer is not already published.<br/> Use **DSPRINT\_UPDATE** to update published properties but not force publishing. Printer drivers should always use **DSPRINT\_UPDATE** rather than **DSPRINT\_PUBLISH**.<br/> |
     * 
     * 
     * 
     *  
     * 
     * **DSPRINT\_PENDING** is not a valid *dwAction* value for **SetPrinter**.
     * @param {Pointer<Void>} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The type of data that the function stores into the buffer pointed to by *pPrinter*. If the *Command* parameter is not equal to zero, the *Level* parameter must be zero.
     * 
     * This value can be 0, 2, 3, 4, 5, 6, 7, 8, or 9.
     * @param {Pointer<Byte>} pPrinter A pointer to a buffer containing data to set for the printer, or containing information for the command specified by the *Command* parameter. The type of data in the buffer is determined by the value of *Level*.
     * 
     * 
     * 
     * | Level                                                                                                | Structure                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
     * |------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="0"></span><dl> <dt>**0**</dt> </dl> | If the *Command* parameter is **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must contain a **DWORD** value that specifies the new printer status to set. For a list of the possible status values, see the **Status** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure. Note that **PRINTER\_STATUS\_PAUSED** and **PRINTER\_STATUS\_PENDING\_DELETION** are not valid status values to set.<br/> If *Level* is 0, but the *Command* parameter is not **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must be **NULL**.<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                     |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                         |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/>                                                                                                                                                                                                                                                                                                                                         |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                       |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                              |
     * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure. The *dwAction* member of this structure indicates whether **SetPrinter** should publish, unpublish, re-publish, or update the printer's data in the directory service.<br/>                                                                                                                                                                                                                                                                                                                |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                        |
     * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                      |
     * @param {Integer} Command The action to perform.
     * 
     * If the *Level* parameter is nonzero, set the value of this parameter to zero. In this case, the printer retains its current state and the function reconfigures the printer data as specified by the *Level* and *pPrinter* parameters.
     * 
     * If the *Level* parameter is zero, set the value of this parameter to one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                  | Meaning                                                                                                                                             |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="PRINTER_CONTROL_PAUSE"></span><span id="printer_control_pause"></span><dl> <dt>**PRINTER\_CONTROL\_PAUSE**</dt> </dl>                 | Pause the printer.<br/>                                                                                                                       |
     * | <span id="PRINTER_CONTROL_PURGE"></span><span id="printer_control_purge"></span><dl> <dt>**PRINTER\_CONTROL\_PURGE**</dt> </dl>                 | Delete all print jobs in the printer.<br/>                                                                                                    |
     * | <span id="PRINTER_CONTROL_RESUME"></span><span id="printer_control_resume"></span><dl> <dt>**PRINTER\_CONTROL\_RESUME**</dt> </dl>              | Resume a paused printer.<br/>                                                                                                                 |
     * | <span id="PRINTER_CONTROL_SET_STATUS"></span><span id="printer_control_set_status"></span><dl> <dt>**PRINTER\_CONTROL\_SET\_STATUS**</dt> </dl> | Set the printer status.<br/> Set the *pPrinter* parameter to a pointer to a **DWORD** value that specifies the new printer status.<br/> |
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * 
     * If *Level* is 7 and the publish action failed, **SetPrinter** returns **ERROR\_IO\_PENDING** and attempts to complete the action in the background. If *Level* is 7 and the update action failed, **SetPrinter** returns **ERROR\_FILE\_NOT\_FOUND**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinter
     */
    static SetPrinterW(hPrinter, Level, pPrinter, Command) {
        A_LastError := 0

        result := DllCall("winspool.drv\SetPrinterW", "ptr", hPrinter, "uint", Level, "char*", pPrinter, "uint", Command, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetPrinter function retrieves information about a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **pDevMode** member in the [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_8**](printer-info-8.md), and [**PRINTER\_INFO\_9**](printer-info-9.md) structures can be **NULL**. When this happens, the printer is unusable until the driver is reinstalled successfully.
     * 
     * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function retrieves only those components of the security descriptor that the caller has permission to read. To retrieve particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) function to retrieve a handle to the printer. The following table shows the access rights required to read the various security descriptor components.
     * 
     * 
     * 
     * | Access Right                        | Security Descriptor Component                                                                 |
     * |-------------------------------------|-----------------------------------------------------------------------------------------------|
     * | READ\_CONTROL<br/>            | Owner<br/> Primary group<br/> Discretionary access-control list (DACL)<br/> |
     * | ACCESS\_SYSTEM\_SECURITY<br/> | System access-control list (SACL)<br/>                                                  |
     * 
     * 
     * 
     *  
     * 
     * If you specify level 7, the **dwAction** member of [**PRINTER\_INFO\_7**](printer-info-7.md) returns one of the following values to indicate whether the printer is published in the directory service.
     * 
     * 
     * 
     * | dwAction value     | Meaning                                                                                                                                                                                                                                                  |
     * |--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | DSPRINT\_PUBLISH   | The printer is published. The **pszObjectGUID** member contains the GUID of the directory services print queue object associated with the printer.                                                                                                       |
     * | DSPRINT\_UNPUBLISH | The printer is not published.                                                                                                                                                                                                                            |
     * | DSPRINT\_PENDING   | Indicates that the system is attempting to complete a publish or unpublish operation. If a [**SetPrinter**](setprinter.md) call fails to publish or unpublish a printer, the system makes further attempts to complete the operation in the background. |
     * 
     * 
     * 
     *  
     * 
     * Starting with Windows Vista, the printer data returned by **GetPrinter** is retrieved from a local cache when *hPrinter* refers to a printer hosted by a print server and there is at least one open connection to the print server. In all other configurations, the printer data is queried from the print server.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function retrieves information. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The level or type of structure that the function stores into the buffer pointed to by *pPrinter*.
     * 
     * This value can be 1, 2, 3, 4, 5, 6, 7, 8 or 9.
     * @param {Pointer} pPrinter A pointer to a buffer that receives a structure containing information about the specified printer. The buffer must be large enough to receive the structure and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
     * 
     * The type of structure is determined by the value of *Level*.
     * 
     * 
     * 
     * | Level                                                                                                | Structure                                                                                                                                                                                                        |
     * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | A [**PRINTER\_INFO\_1**](printer-info-1.md) structure containing general printer information.<br/>                                                                                                        |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                             |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                 |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/> |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                               |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                      |
     * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure that indicates whether the printer is published in the directory service.<br/>                                                                      |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                |
     * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                              |
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinter*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that the function sets to the size, in bytes, of the printer information. If *cbBuf* is smaller than this value, **GetPrinter** fails, and the value represents the required buffer size. If *cbBuf* is equal to or greater than this value, **GetPrinter** succeeds, and the value represents the number of bytes stored in the buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinter
     */
    static GetPrinterA(hPrinter, Level, pPrinter, cbBuf, pcbNeeded) {
        A_LastError := 0

        result := DllCall("winspool.drv\GetPrinterA", "ptr", hPrinter, "uint", Level, "ptr", pPrinter, "uint", cbBuf, "uint*", pcbNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetPrinter function retrieves information about a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **pDevMode** member in the [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_8**](printer-info-8.md), and [**PRINTER\_INFO\_9**](printer-info-9.md) structures can be **NULL**. When this happens, the printer is unusable until the driver is reinstalled successfully.
     * 
     * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function retrieves only those components of the security descriptor that the caller has permission to read. To retrieve particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) function to retrieve a handle to the printer. The following table shows the access rights required to read the various security descriptor components.
     * 
     * 
     * 
     * | Access Right                        | Security Descriptor Component                                                                 |
     * |-------------------------------------|-----------------------------------------------------------------------------------------------|
     * | READ\_CONTROL<br/>            | Owner<br/> Primary group<br/> Discretionary access-control list (DACL)<br/> |
     * | ACCESS\_SYSTEM\_SECURITY<br/> | System access-control list (SACL)<br/>                                                  |
     * 
     * 
     * 
     *  
     * 
     * If you specify level 7, the **dwAction** member of [**PRINTER\_INFO\_7**](printer-info-7.md) returns one of the following values to indicate whether the printer is published in the directory service.
     * 
     * 
     * 
     * | dwAction value     | Meaning                                                                                                                                                                                                                                                  |
     * |--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | DSPRINT\_PUBLISH   | The printer is published. The **pszObjectGUID** member contains the GUID of the directory services print queue object associated with the printer.                                                                                                       |
     * | DSPRINT\_UNPUBLISH | The printer is not published.                                                                                                                                                                                                                            |
     * | DSPRINT\_PENDING   | Indicates that the system is attempting to complete a publish or unpublish operation. If a [**SetPrinter**](setprinter.md) call fails to publish or unpublish a printer, the system makes further attempts to complete the operation in the background. |
     * 
     * 
     * 
     *  
     * 
     * Starting with Windows Vista, the printer data returned by **GetPrinter** is retrieved from a local cache when *hPrinter* refers to a printer hosted by a print server and there is at least one open connection to the print server. In all other configurations, the printer data is queried from the print server.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function retrieves information. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The level or type of structure that the function stores into the buffer pointed to by *pPrinter*.
     * 
     * This value can be 1, 2, 3, 4, 5, 6, 7, 8 or 9.
     * @param {Pointer} pPrinter A pointer to a buffer that receives a structure containing information about the specified printer. The buffer must be large enough to receive the structure and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
     * 
     * The type of structure is determined by the value of *Level*.
     * 
     * 
     * 
     * | Level                                                                                                | Structure                                                                                                                                                                                                        |
     * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | A [**PRINTER\_INFO\_1**](printer-info-1.md) structure containing general printer information.<br/>                                                                                                        |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                             |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                 |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/> |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                               |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                      |
     * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure that indicates whether the printer is published in the directory service.<br/>                                                                      |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                |
     * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                              |
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinter*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that the function sets to the size, in bytes, of the printer information. If *cbBuf* is smaller than this value, **GetPrinter** fails, and the value represents the required buffer size. If *cbBuf* is equal to or greater than this value, **GetPrinter** succeeds, and the value represents the number of bytes stored in the buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinter
     */
    static GetPrinterW(hPrinter, Level, pPrinter, cbBuf, pcbNeeded) {
        A_LastError := 0

        result := DllCall("winspool.drv\GetPrinterW", "ptr", hPrinter, "uint", Level, "ptr", pPrinter, "uint", cbBuf, "uint*", pcbNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddPrinterDriver function installs a local or remote printer driver and associates the configuration, data, and driver files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before an application calls the **AddPrinterDriver** function, all files required by the driver must be copied to the system's printer-driver directory. An application can retrieve the name of this directory by calling the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
     * 
     * An application can determine which printer drivers are currently installed by calling the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed.
     * 
     * If *pName* is **NULL**, the driver will be installed locally.
     * @param {Integer} Level The version of the structure to which *pDriverInfo* points.
     * 
     * This value can be 2, 3, 4, 6, or 8.
     * @param {Pointer<Byte>} pDriverInfo A pointer to a structure containing printer driver information. This depends on the value of *Level*.
     * 
     * 
     * 
     * | Value | Printer Drive Structure                  |
     * |-------|------------------------------------------|
     * | 2     | [**DRIVER\_INFO\_2**](driver-info-2.md) |
     * | 3     | [**DRIVER\_INFO\_3**](driver-info-3.md) |
     * | 4     | [**DRIVER\_INFO\_4**](driver-info-4.md) |
     * | 6     | [**DRIVER\_INFO\_6**](driver-info-6.md) |
     * | 8     | [**DRIVER\_INFO\_8**](driver-info-8.md) |
     * 
     * 
     * 
     *  
     * 
     * If the **pEnvironment** member of the structure pointed to by *pDriverInfo* is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriver
     */
    static AddPrinterDriverA(pName, Level, pDriverInfo) {
        pName := pName is String? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterDriverA", "ptr", pName, "uint", Level, "char*", pDriverInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddPrinterDriver function installs a local or remote printer driver and associates the configuration, data, and driver files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before an application calls the **AddPrinterDriver** function, all files required by the driver must be copied to the system's printer-driver directory. An application can retrieve the name of this directory by calling the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
     * 
     * An application can determine which printer drivers are currently installed by calling the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed.
     * 
     * If *pName* is **NULL**, the driver will be installed locally.
     * @param {Integer} Level The version of the structure to which *pDriverInfo* points.
     * 
     * This value can be 2, 3, 4, 6, or 8.
     * @param {Pointer<Byte>} pDriverInfo A pointer to a structure containing printer driver information. This depends on the value of *Level*.
     * 
     * 
     * 
     * | Value | Printer Drive Structure                  |
     * |-------|------------------------------------------|
     * | 2     | [**DRIVER\_INFO\_2**](driver-info-2.md) |
     * | 3     | [**DRIVER\_INFO\_3**](driver-info-3.md) |
     * | 4     | [**DRIVER\_INFO\_4**](driver-info-4.md) |
     * | 6     | [**DRIVER\_INFO\_6**](driver-info-6.md) |
     * | 8     | [**DRIVER\_INFO\_8**](driver-info-8.md) |
     * 
     * 
     * 
     *  
     * 
     * If the **pEnvironment** member of the structure pointed to by *pDriverInfo* is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriver
     */
    static AddPrinterDriverW(pName, Level, pDriverInfo) {
        pName := pName is String? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPrinterDriverW", "ptr", pName, "uint", Level, "char*", pDriverInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddPrinterDriverEx function installs a local or remote printer driver and links the configuration, data, and driver files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before calling the **AddPrinterDriverEx** function, all files required by the driver must be copied to the system's printer-driver directory. To retrieve the name of this directory, call the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
     * 
     * To determine which printer drivers are currently installed, call the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
     * 
     * If the printer driver has been successfully added, the function calls the DrvDriverEvent (DRIVER\_EVENT\_INITIALIZE, Level, DRIVER\_INFO\_\*, lparam ) function to allow the driver to perform any initializations required during the installation of a printer driver. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK)
     * 
     * The driver should not use a UI call during the call to **DrvDriverEvent**. To do UI-related jobs, the installer should either use the VendorSetup entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about VendorSetup, see the DDK.
     * 
     * The files that are referenced in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure must be local to the machine from which the call is made. A file name can be a UNC name as long as the UNC name is the local machine.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed. If this parameter is **NULL**, the function installs the driver on the local computer.
     * @param {Integer} Level The version of the structure to which *pDriverInfo* points. This value can be 2, 3, 4, 6, or 8.
     * @param {Pointer<Byte>} lpbDriverInfo 
     * @param {Integer} dwFileCopyFlags The options for copying the driver files. This parameter can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                         | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="APD_COPY_ALL_FILES"></span><span id="apd_copy_all_files"></span><dl> <dt>**APD\_COPY\_ALL\_FILES**</dt> </dl>                | Add the printer driver and copy all the files in the printer-driver directory. The file time stamps are ignored with this option.<br/>                                                                                                                                                                                                                                                                                                                                                                                  |
     * | <span id="APD_COPY_FROM_DIRECTORY"></span><span id="apd_copy_from_directory"></span><dl> <dt>**APD\_COPY\_FROM\_DIRECTORY**</dt> </dl> | Add the printer driver using the fully qualified file names specified in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure. This flag is ORed in conjunction with one of the other copy flags. If this flag is set, **AddPrinterDriverEx** will fail if the files do not exist where they are specified to exist by the **DRIVER\_INFO\_6** structure. The files do not need to be copied to the system's printer-driver directory. See the Remarks.<br/> **Windows 2000:** This flag is not supported.<br/> |
     * | <span id="APD_COPY_NEW_FILES"></span><span id="apd_copy_new_files"></span><dl> <dt>**APD\_COPY\_NEW\_FILES**</dt> </dl>                | Add the printer driver and copy the files in the printer-driver directory that are newer than any corresponding files that are currently in use. This flag emulates the behavior of [**AddPrinterDriver**](addprinterdriver.md).<br/>                                                                                                                                                                                                                                                                                  |
     * | <span id="APD_STRICT_DOWNGRADE"></span><span id="apd_strict_downgrade"></span><dl> <dt>**APD\_STRICT\_DOWNGRADE**</dt> </dl>           | Add the printer driver only if all the files in the printer-driver directory are older than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
     * | <span id="APD_STRICT_UPGRADE"></span><span id="apd_strict_upgrade"></span><dl> <dt>**APD\_STRICT\_UPGRADE**</dt> </dl>                 | Add the printer driver only if all the files in the printer-driver directory are newer than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * 
     * If the printer driver is known to have problems working with the operating system, **AddPrinterDriverEx** will fail with one of the following error codes:
     * 
     * 
     * 
     * | Error Code                      | Meaning                                                                                                                                                   |
     * |---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | ERROR\_PRINTER\_DRIVER\_BLOCKED | The driver does not work on the operating system.                                                                                                         |
     * | ERROR\_PRINTER\_DRIVER\_WARNED  | The driver is unreliable on the operating system. However, if APD\_INSTALL\_WARNED\_DRIVER is specified, the driver is installed and no warning is given. |
     * 
     * 
     * 
     *  
     * 
     * For more information, see the Remarks.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriverex
     */
    static AddPrinterDriverExA(pName, Level, lpbDriverInfo, dwFileCopyFlags) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterDriverExA", "ptr", pName, "uint", Level, "char*", lpbDriverInfo, "uint", dwFileCopyFlags, "int")
        return result
    }

    /**
     * The AddPrinterDriverEx function installs a local or remote printer driver and links the configuration, data, and driver files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before calling the **AddPrinterDriverEx** function, all files required by the driver must be copied to the system's printer-driver directory. To retrieve the name of this directory, call the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
     * 
     * To determine which printer drivers are currently installed, call the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
     * 
     * If the printer driver has been successfully added, the function calls the DrvDriverEvent (DRIVER\_EVENT\_INITIALIZE, Level, DRIVER\_INFO\_\*, lparam ) function to allow the driver to perform any initializations required during the installation of a printer driver. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK)
     * 
     * The driver should not use a UI call during the call to **DrvDriverEvent**. To do UI-related jobs, the installer should either use the VendorSetup entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about VendorSetup, see the DDK.
     * 
     * The files that are referenced in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure must be local to the machine from which the call is made. A file name can be a UNC name as long as the UNC name is the local machine.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed. If this parameter is **NULL**, the function installs the driver on the local computer.
     * @param {Integer} Level The version of the structure to which *pDriverInfo* points. This value can be 2, 3, 4, 6, or 8.
     * @param {Pointer<Byte>} lpbDriverInfo 
     * @param {Integer} dwFileCopyFlags The options for copying the driver files. This parameter can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                         | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="APD_COPY_ALL_FILES"></span><span id="apd_copy_all_files"></span><dl> <dt>**APD\_COPY\_ALL\_FILES**</dt> </dl>                | Add the printer driver and copy all the files in the printer-driver directory. The file time stamps are ignored with this option.<br/>                                                                                                                                                                                                                                                                                                                                                                                  |
     * | <span id="APD_COPY_FROM_DIRECTORY"></span><span id="apd_copy_from_directory"></span><dl> <dt>**APD\_COPY\_FROM\_DIRECTORY**</dt> </dl> | Add the printer driver using the fully qualified file names specified in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure. This flag is ORed in conjunction with one of the other copy flags. If this flag is set, **AddPrinterDriverEx** will fail if the files do not exist where they are specified to exist by the **DRIVER\_INFO\_6** structure. The files do not need to be copied to the system's printer-driver directory. See the Remarks.<br/> **Windows 2000:** This flag is not supported.<br/> |
     * | <span id="APD_COPY_NEW_FILES"></span><span id="apd_copy_new_files"></span><dl> <dt>**APD\_COPY\_NEW\_FILES**</dt> </dl>                | Add the printer driver and copy the files in the printer-driver directory that are newer than any corresponding files that are currently in use. This flag emulates the behavior of [**AddPrinterDriver**](addprinterdriver.md).<br/>                                                                                                                                                                                                                                                                                  |
     * | <span id="APD_STRICT_DOWNGRADE"></span><span id="apd_strict_downgrade"></span><dl> <dt>**APD\_STRICT\_DOWNGRADE**</dt> </dl>           | Add the printer driver only if all the files in the printer-driver directory are older than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
     * | <span id="APD_STRICT_UPGRADE"></span><span id="apd_strict_upgrade"></span><dl> <dt>**APD\_STRICT\_UPGRADE**</dt> </dl>                 | Add the printer driver only if all the files in the printer-driver directory are newer than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * 
     * If the printer driver is known to have problems working with the operating system, **AddPrinterDriverEx** will fail with one of the following error codes:
     * 
     * 
     * 
     * | Error Code                      | Meaning                                                                                                                                                   |
     * |---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | ERROR\_PRINTER\_DRIVER\_BLOCKED | The driver does not work on the operating system.                                                                                                         |
     * | ERROR\_PRINTER\_DRIVER\_WARNED  | The driver is unreliable on the operating system. However, if APD\_INSTALL\_WARNED\_DRIVER is specified, the driver is installed and no warning is given. |
     * 
     * 
     * 
     *  
     * 
     * For more information, see the Remarks.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriverex
     */
    static AddPrinterDriverExW(pName, Level, lpbDriverInfo, dwFileCopyFlags) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterDriverExW", "ptr", pName, "uint", Level, "char*", lpbDriverInfo, "uint", dwFileCopyFlags, "int")
        return result
    }

    /**
     * The EnumPrinterDrivers function enumerates the printer drivers installed on a specified printer server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the printer drivers are enumerated.
     * 
     * If *pName* is **NULL**, the function enumerates the local printer drivers.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, Windows x64, or Windows NT R4000). If this parameter is **NULL**, the function uses the current environment of the caller/client (not of the destination/server).
     * 
     * If the *pEnvironment* string specifies "all", **EnumPrinterDrivers** enumerates printer drivers for all platforms installed on the specified server.
     * @param {Integer} Level The type of information structure returned in the *pDriverInfo* buffer. It can be one of the following.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                             |
     * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
     * @param {Pointer} pDriverInfo A pointer to a buffer that receives an array of DRIVER\_INFO\_\* structures, as specified by *Level*. Each structure contains data that describes an available printer driver. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumPrinterDrivers** with *cbBuf* set to zero. **EnumPrinterDrivers** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDriverInfo*
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDriverInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDriverInfo* buffer. This is the number of printer drivers installed on the specified print server.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdrivers
     */
    static EnumPrinterDriversA(pName, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrinterDriversA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumPrinterDrivers function enumerates the printer drivers installed on a specified printer server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the printer drivers are enumerated.
     * 
     * If *pName* is **NULL**, the function enumerates the local printer drivers.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, Windows x64, or Windows NT R4000). If this parameter is **NULL**, the function uses the current environment of the caller/client (not of the destination/server).
     * 
     * If the *pEnvironment* string specifies "all", **EnumPrinterDrivers** enumerates printer drivers for all platforms installed on the specified server.
     * @param {Integer} Level The type of information structure returned in the *pDriverInfo* buffer. It can be one of the following.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                             |
     * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
     * @param {Pointer} pDriverInfo A pointer to a buffer that receives an array of DRIVER\_INFO\_\* structures, as specified by *Level*. Each structure contains data that describes an available printer driver. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumPrinterDrivers** with *cbBuf* set to zero. **EnumPrinterDrivers** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDriverInfo*
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDriverInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDriverInfo* buffer. This is the number of printer drivers installed on the specified print server.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdrivers
     */
    static EnumPrinterDriversW(pName, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        A_LastError := 0

        result := DllCall("winspool.drv\EnumPrinterDriversW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetPrinterDriver function retrieves driver data for the specified printer. If the driver is not installed on the local computer, GetPrinterDriver installs it.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The [**DRIVER\_INFO\_2**](driver-info-2.md), [**DRIVER\_INFO\_3**](driver-info-3.md), [**DRIVER\_INFO\_4**](driver-info-4.md), [**DRIVER\_INFO\_5**](driver-info-5.md), and [**DRIVER\_INFO\_6**](driver-info-6.md) structures contain the file name or the full path and file name of the printer driver in the **pDriverPath** member. An application can use the path and file name to load a printer driver by calling the [**LoadLibrary**](/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya) function and supplying the path and file name as the single argument.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the driver data should be retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The printer driver structure returned in the *pDriverInfo* buffer. This parameter can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                             |
     * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
     * @param {Pointer} pDriverInfo A pointer to a buffer that receives a structure containing information about the driver, as specified by Level. The buffer must be large enough to store the strings pointed to by the structure members.
     * 
     * To determine the required buffer size, call **GetPrinterDriver** with *cbBuf* set to zero. **GetPrinterDriver** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the array at which *pDriverInfo* points.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * 
     * For a non-existent driver, the function returns ERROR\_UNKNOWN\_PRINTER\_DRIVER.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver
     */
    static GetPrinterDriverA(hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriverA", "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetPrinterDriver function retrieves driver data for the specified printer. If the driver is not installed on the local computer, GetPrinterDriver installs it.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The [**DRIVER\_INFO\_2**](driver-info-2.md), [**DRIVER\_INFO\_3**](driver-info-3.md), [**DRIVER\_INFO\_4**](driver-info-4.md), [**DRIVER\_INFO\_5**](driver-info-5.md), and [**DRIVER\_INFO\_6**](driver-info-6.md) structures contain the file name or the full path and file name of the printer driver in the **pDriverPath** member. An application can use the path and file name to load a printer driver by calling the [**LoadLibrary**](/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya) function and supplying the path and file name as the single argument.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the driver data should be retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The printer driver structure returned in the *pDriverInfo* buffer. This parameter can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                             |
     * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
     * @param {Pointer} pDriverInfo A pointer to a buffer that receives a structure containing information about the driver, as specified by Level. The buffer must be large enough to store the strings pointed to by the structure members.
     * 
     * To determine the required buffer size, call **GetPrinterDriver** with *cbBuf* set to zero. **GetPrinterDriver** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the array at which *pDriverInfo* points.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * 
     * For a non-existent driver, the function returns ERROR\_UNKNOWN\_PRINTER\_DRIVER.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver
     */
    static GetPrinterDriverW(hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriverW", "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetPrinterDriverDirectory function retrieves the path of the printer-driver directory.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the printer driver resides. If this parameter is **NULL**, the local driver-directory path is retrieved.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The structure level. This value must be 1.
     * @param {Pointer} pDriverDirectory A pointer to a buffer that receives the path.
     * @param {Integer} cbBuf The size of the buffer to which *pDriverDirectory* points.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverdirectory
     */
    static GetPrinterDriverDirectoryA(pName, pEnvironment, Level, pDriverDirectory, cbBuf, pcbNeeded) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriverDirectoryA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverDirectory, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetPrinterDriverDirectory function retrieves the path of the printer-driver directory.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the printer driver resides. If this parameter is **NULL**, the local driver-directory path is retrieved.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The structure level. This value must be 1.
     * @param {Pointer} pDriverDirectory A pointer to a buffer that receives the path.
     * @param {Integer} cbBuf The size of the buffer to which *pDriverDirectory* points.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverdirectory
     */
    static GetPrinterDriverDirectoryW(pName, pEnvironment, Level, pDriverDirectory, cbBuf, pcbNeeded) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriverDirectoryW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverDirectory, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The DeletePrinterDriver function removes the specified printer-driver name from the list of names of supported drivers on a server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * The **DeletePrinterDriver** function does not delete the associated files, it merely removes the driver name from the list returned by the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
     * 
     * Before calling **DeletePrinterDriver**, you must delete all printer objects that use the printer driver.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the printer-driver name will be removed locally.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client machine (not of the destination application and print server).
     * @param {Pointer<Byte>} pDriverName A pointer to a null-terminated string specifying the name of the driver that should be deleted.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriver
     */
    static DeletePrinterDriverA(pName, pEnvironment, pDriverName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverA", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "int")
        return result
    }

    /**
     * The DeletePrinterDriver function removes the specified printer-driver name from the list of names of supported drivers on a server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * The **DeletePrinterDriver** function does not delete the associated files, it merely removes the driver name from the list returned by the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
     * 
     * Before calling **DeletePrinterDriver**, you must delete all printer objects that use the printer driver.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the printer-driver name will be removed locally.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client machine (not of the destination application and print server).
     * @param {Pointer<Char>} pDriverName A pointer to a null-terminated string specifying the name of the driver that should be deleted.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriver
     */
    static DeletePrinterDriverW(pName, pEnvironment, pDriverName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverW", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "int")
        return result
    }

    /**
     * The DeletePrinterDriverEx function removes the specified printer-driver name from the list of names of supported drivers on a server and deletes the files associated with the driver. This function can also delete specific versions of the driver.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * Before the function deletes the driver files, it calls the driver's **DrvDriverEvent** function, allowing the driver to remove any private files that are not used. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK).
     * 
     * If the driver files are currently loaded, the function moves them to a temp directory and marks them for deletion on restart.
     * 
     * Before calling **DeletePrinterDriverEx**, you must delete all printer objects that use the printer driver.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the function deletes the printer-driver from the local computer.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client computer (not of the destination application and print server).
     * @param {Pointer<Byte>} pDriverName A pointer to a null-terminated string specifying the name of the driver to delete.
     * @param {Integer} dwDeleteFlag The options for deleting files and versions of the driver. This parameter can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                     | Meaning                                                                                                                                                                               |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="DPD_DELETE_SPECIFIC_VERSION"></span><span id="dpd_delete_specific_version"></span><dl> <dt>**DPD\_DELETE\_SPECIFIC\_VERSION**</dt> </dl> | Deletes the version specified in *dwVersionFlag*. This does not ensure that the driver will be removed from the list of supported drivers for the server.<br/>                  |
     * | <span id="DPD_DELETE_UNUSED_FILES"></span><span id="dpd_delete_unused_files"></span><dl> <dt>**DPD\_DELETE\_UNUSED\_FILES**</dt> </dl>             | Removes any unused driver files.<br/>                                                                                                                                           |
     * | <span id="DPD_DELETE_ALL_FILES"></span><span id="dpd_delete_all_files"></span><dl> <dt>**DPD\_DELETE\_ALL\_FILES**</dt> </dl>                      | Deletes the driver only if all its associated files can be removed. The delete operation fails if any of the driver's files are being used by some other installed driver.<br/> |
     * 
     * 
     * 
     *  
     * 
     * If DPD\_DELETE\_SPECIFIC\_VERSION is not specified, the function deletes all versions of the driver if none of them is in use. If neither DPD\_DELETE\_UNUSED\_FILES nor DPD\_DELETE\_ALL\_FILES is specified, the function does not delete driver files.
     * @param {Integer} dwVersionFlag The version of the driver to be deleted. This parameter can be 0, 1, 2 or 3. This parameter is used only if *dwDeleteFlag* includes the DPD\_DELETE\_SPECIFIC\_VERSION flag.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverex
     */
    static DeletePrinterDriverExA(pName, pEnvironment, pDriverName, dwDeleteFlag, dwVersionFlag) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverExA", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "uint", dwDeleteFlag, "uint", dwVersionFlag, "int")
        return result
    }

    /**
     * The DeletePrinterDriverEx function removes the specified printer-driver name from the list of names of supported drivers on a server and deletes the files associated with the driver. This function can also delete specific versions of the driver.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * Before the function deletes the driver files, it calls the driver's **DrvDriverEvent** function, allowing the driver to remove any private files that are not used. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK).
     * 
     * If the driver files are currently loaded, the function moves them to a temp directory and marks them for deletion on restart.
     * 
     * Before calling **DeletePrinterDriverEx**, you must delete all printer objects that use the printer driver.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the function deletes the printer-driver from the local computer.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client computer (not of the destination application and print server).
     * @param {Pointer<Char>} pDriverName A pointer to a null-terminated string specifying the name of the driver to delete.
     * @param {Integer} dwDeleteFlag The options for deleting files and versions of the driver. This parameter can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                     | Meaning                                                                                                                                                                               |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="DPD_DELETE_SPECIFIC_VERSION"></span><span id="dpd_delete_specific_version"></span><dl> <dt>**DPD\_DELETE\_SPECIFIC\_VERSION**</dt> </dl> | Deletes the version specified in *dwVersionFlag*. This does not ensure that the driver will be removed from the list of supported drivers for the server.<br/>                  |
     * | <span id="DPD_DELETE_UNUSED_FILES"></span><span id="dpd_delete_unused_files"></span><dl> <dt>**DPD\_DELETE\_UNUSED\_FILES**</dt> </dl>             | Removes any unused driver files.<br/>                                                                                                                                           |
     * | <span id="DPD_DELETE_ALL_FILES"></span><span id="dpd_delete_all_files"></span><dl> <dt>**DPD\_DELETE\_ALL\_FILES**</dt> </dl>                      | Deletes the driver only if all its associated files can be removed. The delete operation fails if any of the driver's files are being used by some other installed driver.<br/> |
     * 
     * 
     * 
     *  
     * 
     * If DPD\_DELETE\_SPECIFIC\_VERSION is not specified, the function deletes all versions of the driver if none of them is in use. If neither DPD\_DELETE\_UNUSED\_FILES nor DPD\_DELETE\_ALL\_FILES is specified, the function does not delete driver files.
     * @param {Integer} dwVersionFlag The version of the driver to be deleted. This parameter can be 0, 1, 2 or 3. This parameter is used only if *dwDeleteFlag* includes the DPD\_DELETE\_SPECIFIC\_VERSION flag.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverex
     */
    static DeletePrinterDriverExW(pName, pEnvironment, pDriverName, dwDeleteFlag, dwVersionFlag) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pDriverName := pDriverName is String? StrPtr(pDriverName) : pDriverName

        result := DllCall("winspool.drv\DeletePrinterDriverExW", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "uint", dwDeleteFlag, "uint", dwVersionFlag, "int")
        return result
    }

    /**
     * The AddPrintProcessor function installs a print processor on the specified server and adds the print-processor name to the list of supported print processors.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before calling the **AddPrintProcessor** function, an application should verify that the file containing the print processor is stored in the system print-processor directory. An application can retrieve the name of the system print-processor directory by calling the [**GetPrintProcessorDirectory**](getprintprocessordirectory.md) function.
     * 
     * An application can determine the name of existing print processors by calling the [**EnumPrintProcessors**](enumprintprocessors.md) function.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor should be installed. If this parameter is **NULL**, the print processor is installed locally.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
     * @param {Pointer<Byte>} pPathName A pointer to a null-terminated string that specifies the name of the file that contains the print processor. This file must be in the system print-processor directory.
     * @param {Pointer<Byte>} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprocessor
     */
    static AddPrintProcessorA(pName, pEnvironment, pPathName, pPrintProcessorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pPathName := pPathName is String? StrPtr(pPathName) : pPathName
        pPrintProcessorName := pPrintProcessorName is String? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\AddPrintProcessorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPathName, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * The AddPrintProcessor function installs a print processor on the specified server and adds the print-processor name to the list of supported print processors.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before calling the **AddPrintProcessor** function, an application should verify that the file containing the print processor is stored in the system print-processor directory. An application can retrieve the name of the system print-processor directory by calling the [**GetPrintProcessorDirectory**](getprintprocessordirectory.md) function.
     * 
     * An application can determine the name of existing print processors by calling the [**EnumPrintProcessors**](enumprintprocessors.md) function.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor should be installed. If this parameter is **NULL**, the print processor is installed locally.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
     * @param {Pointer<Char>} pPathName A pointer to a null-terminated string that specifies the name of the file that contains the print processor. This file must be in the system print-processor directory.
     * @param {Pointer<Char>} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprocessor
     */
    static AddPrintProcessorW(pName, pEnvironment, pPathName, pPrintProcessorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pPathName := pPathName is String? StrPtr(pPathName) : pPathName
        pPrintProcessorName := pPrintProcessorName is String? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\AddPrintProcessorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPathName, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * The EnumPrintProcessors function enumerates the print processors installed on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the print processors reside. If this parameter is **NULL**, the local print processors are enumerated.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The type of information returned in the *pPrintProcessorInfo* buffer. This parameter must be 1.
     * @param {Pointer} pPrintProcessorInfo A pointer to a buffer that receives an array of [**PRINTPROCESSOR\_INFO\_1**](printprocessor-info-1.md) structures. Each structure describes an available print processor. The buffer must be large enough to receive the array of structures and any strings to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumPrintProcessors** with *cbBuf* set to zero. **EnumPrintProcessors** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrintProcessorInfo*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPrintProcessorInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures returned in the *pPrintProcessorInfo* buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessors
     */
    static EnumPrintProcessorsA(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\EnumPrintProcessorsA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The EnumPrintProcessors function enumerates the print processors installed on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the print processors reside. If this parameter is **NULL**, the local print processors are enumerated.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The type of information returned in the *pPrintProcessorInfo* buffer. This parameter must be 1.
     * @param {Pointer} pPrintProcessorInfo A pointer to a buffer that receives an array of [**PRINTPROCESSOR\_INFO\_1**](printprocessor-info-1.md) structures. Each structure describes an available print processor. The buffer must be large enough to receive the array of structures and any strings to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumPrintProcessors** with *cbBuf* set to zero. **EnumPrintProcessors** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrintProcessorInfo*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPrintProcessorInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures returned in the *pPrintProcessorInfo* buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessors
     */
    static EnumPrintProcessorsW(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\EnumPrintProcessorsW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The GetPrintProcessorDirectory function retrieves the path to the print processor directory on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server. If this parameter is **NULL**, a local path is returned.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The structure level. This value must be 1.
     * @param {Pointer} pPrintProcessorInfo A pointer to a buffer that receives the path. Note that, for operating systems prior to Windows Server 2003 SP 1, the path is in the local format for the server, not the true remote format. For example, the path is given as "%Windir%\\System32\\Spool\\Prtprocs\\%Environment%" instead of "\\\\ServerName\\Print$\\Prtprocs\\%Environment%", even when called for a remote server. For the operating systems Windows Server 2003 SP 1 and later, the true remote path is returned.
     * @param {Integer} cbBuf The size of the buffer pointed to by *pPrintProcessorInfo*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprintprocessordirectory
     */
    static GetPrintProcessorDirectoryA(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrintProcessorDirectoryA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetPrintProcessorDirectory function retrieves the path to the print processor directory on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server. If this parameter is **NULL**, a local path is returned.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The structure level. This value must be 1.
     * @param {Pointer} pPrintProcessorInfo A pointer to a buffer that receives the path. Note that, for operating systems prior to Windows Server 2003 SP 1, the path is in the local format for the server, not the true remote format. For example, the path is given as "%Windir%\\System32\\Spool\\Prtprocs\\%Environment%" instead of "\\\\ServerName\\Print$\\Prtprocs\\%Environment%", even when called for a remote server. For the operating systems Windows Server 2003 SP 1 and later, the true remote path is returned.
     * @param {Integer} cbBuf The size of the buffer pointed to by *pPrintProcessorInfo*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprintprocessordirectory
     */
    static GetPrintProcessorDirectoryW(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrintProcessorDirectoryW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The EnumPrintProcessorDatatypes function enumerates the data types that a specified print processor supports.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * v
     * 
     * Starting with Windows Vista, the data type information from remote print servers is retrieved from a local cache.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor resides. If this parameter is **NULL**, the data types for the local print processor are enumerated.
     * @param {Pointer<Byte>} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor whose data types are enumerated.
     * @param {Integer} Level The type of information returned in the *pDatatypes* buffer. This parameter must be 1.
     * @param {Pointer} pDatatypes A pointer to a buffer that receives an array of [**DATATYPES\_INFO\_1**](datatypes-info-1.md) structures. Each structure describes an available data type. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumPrintProcessorDatatypes** with *cbBuf* set to zero. **EnumPrintProcessorDatatypes** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDatatypes*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDatatypes* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDatatypes* buffer. This is the number of supported data types.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessordatatypes
     */
    static EnumPrintProcessorDatatypesA(pName, pPrintProcessorName, Level, pDatatypes, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName
        pPrintProcessorName := pPrintProcessorName is String? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\EnumPrintProcessorDatatypesA", "ptr", pName, "ptr", pPrintProcessorName, "uint", Level, "ptr", pDatatypes, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The EnumPrintProcessorDatatypes function enumerates the data types that a specified print processor supports.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * v
     * 
     * Starting with Windows Vista, the data type information from remote print servers is retrieved from a local cache.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor resides. If this parameter is **NULL**, the data types for the local print processor are enumerated.
     * @param {Pointer<Char>} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor whose data types are enumerated.
     * @param {Integer} Level The type of information returned in the *pDatatypes* buffer. This parameter must be 1.
     * @param {Pointer} pDatatypes A pointer to a buffer that receives an array of [**DATATYPES\_INFO\_1**](datatypes-info-1.md) structures. Each structure describes an available data type. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
     * 
     * To determine the required buffer size, call **EnumPrintProcessorDatatypes** with *cbBuf* set to zero. **EnumPrintProcessorDatatypes** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDatatypes*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDatatypes* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDatatypes* buffer. This is the number of supported data types.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessordatatypes
     */
    static EnumPrintProcessorDatatypesW(pName, pPrintProcessorName, Level, pDatatypes, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName
        pPrintProcessorName := pPrintProcessorName is String? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\EnumPrintProcessorDatatypesW", "ptr", pName, "ptr", pPrintProcessorName, "uint", Level, "ptr", pDatatypes, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The DeletePrintProcessor function removes a print processor added by the AddPrintProcessor function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server from which the processor is to be removed. If this parameter is **NULL**, the printer processor is removed locally.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the processor is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the processor is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value, as it provides maximum portability.
     * @param {Pointer<Byte>} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the processor to be removed.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprocessor
     */
    static DeletePrintProcessorA(pName, pEnvironment, pPrintProcessorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pPrintProcessorName := pPrintProcessorName is String? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\DeletePrintProcessorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * The DeletePrintProcessor function removes a print processor added by the AddPrintProcessor function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server from which the processor is to be removed. If this parameter is **NULL**, the printer processor is removed locally.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the processor is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the processor is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value, as it provides maximum portability.
     * @param {Pointer<Char>} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the processor to be removed.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprocessor
     */
    static DeletePrintProcessorW(pName, pEnvironment, pPrintProcessorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pPrintProcessorName := pPrintProcessorName is String? StrPtr(pPrintProcessorName) : pPrintProcessorName

        result := DllCall("winspool.drv\DeletePrintProcessorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProcessorName, "int")
        return result
    }

    /**
     * The StartDocPrinter function notifies the print spooler that a document is to be spooled for printing.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The typical sequence for a print job is as follows:
     * 
     * 1.  To begin a print job, call **StartDocPrinter**.
     * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
     * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
     * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
     * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
     * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
     * 
     * Note that calling [**StartPagePrinter**](startpageprinter.md) and [**EndPagePrinter**](endpageprinter.md) may not be necessary, such as if the print data type includes the page information.
     * 
     * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
     * @param {Pointer<Void>} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The version of the structure to which *pDocInfo* points. This value must be 1.
     * @param {Pointer<DOC_INFO_1A>} pDocInfo A pointer to a [**DOC\_INFO\_1**](doc-info-1.md) structure that describes the document to print.
     * @returns {Integer} If the function succeeds, the return value identifies the print job.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/startdocprinter
     */
    static StartDocPrinterA(hPrinter, Level, pDocInfo) {
        result := DllCall("winspool.drv\StartDocPrinterA", "ptr", hPrinter, "uint", Level, "ptr", pDocInfo, "uint")
        return result
    }

    /**
     * The StartDocPrinter function notifies the print spooler that a document is to be spooled for printing.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The typical sequence for a print job is as follows:
     * 
     * 1.  To begin a print job, call **StartDocPrinter**.
     * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
     * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
     * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
     * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
     * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
     * 
     * Note that calling [**StartPagePrinter**](startpageprinter.md) and [**EndPagePrinter**](endpageprinter.md) may not be necessary, such as if the print data type includes the page information.
     * 
     * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
     * @param {Pointer<Void>} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The version of the structure to which *pDocInfo* points. This value must be 1.
     * @param {Pointer<DOC_INFO_1W>} pDocInfo A pointer to a [**DOC\_INFO\_1**](doc-info-1.md) structure that describes the document to print.
     * @returns {Integer} If the function succeeds, the return value identifies the print job.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/startdocprinter
     */
    static StartDocPrinterW(hPrinter, Level, pDocInfo) {
        result := DllCall("winspool.drv\StartDocPrinterW", "ptr", hPrinter, "uint", Level, "ptr", pDocInfo, "uint")
        return result
    }

    /**
     * The StartPagePrinter function notifies the spooler that a page is about to be printed on the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The sequence for a print job is as follows:
     * 
     * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
     * 2.  To begin each page, call **StartPagePrinter**.
     * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
     * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
     * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
     * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
     * 
     * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
     * @param {Pointer<Void>} hPrinter Handle to a printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/startpageprinter
     */
    static StartPagePrinter(hPrinter) {
        result := DllCall("winspool.drv\StartPagePrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * The WritePrinter function notifies the print spooler that data should be written to the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The sequence for a print job is as follows:
     * 
     * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
     * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
     * 3.  To write data to a page, call **WritePrinter**.
     * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
     * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
     * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
     * 
     * When a high-level document (such as an Adobe PDF or Microsoft Word file) or other printer data (such PCL, PS, or HPGL) is sent directly to a printer, the print settings defined in the document take precedent over Windows print settings. Documents output when the value of the *pDatatype* member of the [**DOC\_INFO\_1**](doc-info-1.md) structure that was passed in the *pDocInfo* parameter of the [**StartDocPrinter**](startdocprinter.md) call is "RAW" must fully describe the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea)-style print job settings in the language understood by the hardware.
     * 
     * In versions of Windows prior to Windows XP, when a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit in versions of Windows prior to Windows XP depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap. In Windows XP and later versions of Windows, EMF files must be 2GB or less in size. If **WritePrinter** is used to write non EMF data, such as printer-ready PDL, the size of the file is limited only by the available disk space.
     * @param {Pointer<Void>} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer} pBuf A pointer to an array of bytes that contains the data that should be written to the printer.
     * @param {Integer} cbBuf The size, in bytes, of the array.
     * @param {Pointer<UInt32>} pcWritten A pointer to a value that receives the number of bytes of data that were written to the printer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/writeprinter
     */
    static WritePrinter(hPrinter, pBuf, cbBuf, pcWritten) {
        result := DllCall("winspool.drv\WritePrinter", "ptr", hPrinter, "ptr", pBuf, "uint", cbBuf, "uint*", pcWritten, "int")
        return result
    }

    /**
     * The FlushPrinter function sends a buffer to the printer in order to clear it from a transient state.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **FlushPrinter** should be called only if [**WritePrinter**](writeprinter.md) failed, leaving the printer in a transient state. For example, the printer could get into a transient state when the job gets aborted and the printer driver has partially sent some raw data to the printer.
     * 
     * **FlushPrinter** also can specify an idle period during which the print spooler does not schedule any jobs to the corresponding printer port.
     * @param {Pointer<Void>} hPrinter A handle to the printer object. This should be the same handle that was used, in a prior [**WritePrinter**](writeprinter.md) call, by the printer driver.
     * @param {Pointer} pBuf A pointer to an array of bytes that contains the data to be written to the printer.
     * @param {Integer} cbBuf The size, in bytes, of the array pointed to by *pBuf*.
     * @param {Pointer<UInt32>} pcWritten A pointer to a value that receives the number of bytes of data that were written to the printer.
     * @param {Integer} cSleep The time, in milliseconds, for which the I/O line to the printer port should be kept idle.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/flushprinter
     */
    static FlushPrinter(hPrinter, pBuf, cbBuf, pcWritten, cSleep) {
        result := DllCall("winspool.drv\FlushPrinter", "ptr", hPrinter, "ptr", pBuf, "uint", cbBuf, "uint*", pcWritten, "uint", cSleep, "int")
        return result
    }

    /**
     * The EndPagePrinter function notifies the print spooler that the application is at the end of a page in a print job.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The sequence for a print job is as follows:
     * 
     * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
     * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
     * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
     * 4.  To end each page, call **EndPagePrinter**.
     * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
     * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
     * 
     * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
     * @param {Pointer<Void>} hPrinter Handle to the printer for which the page will be concluded. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/endpageprinter
     */
    static EndPagePrinter(hPrinter) {
        result := DllCall("winspool.drv\EndPagePrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * The AbortPrinter function deletes a printers spool file if the printer is configured for spooling.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If the printer is not configured for spooling, the **AbortPrinter** function has no effect.
     * 
     * The sequence for a print job is as follows:
     * 
     * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
     * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
     * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
     * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
     * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
     * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
     * 
     * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
     * @param {Pointer<Void>} hPrinter Handle to the printer from which the spool file is deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/abortprinter
     */
    static AbortPrinter(hPrinter) {
        result := DllCall("winspool.drv\AbortPrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * The ReadPrinter function retrieves data from the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **ReadPrinter** returns an error if the device or the printer is not bidirectional.
     * @param {Pointer<Void>} hPrinter A handle to the printer object for which to retrieve data. Use the [**OpenPrinter**](openprinter.md) function to retrieve a printer object handle. Use the format: Printername, Job xxxx.
     * @param {Pointer} pBuf A pointer to a buffer that receives the printer data.
     * @param {Integer} cbBuf The size, in bytes, of the buffer to which *pBuf* points.
     * @param {Pointer<UInt32>} pNoBytesRead A pointer to a variable that receives the number of bytes of data copied into the array to which *pBuf* points.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/readprinter
     */
    static ReadPrinter(hPrinter, pBuf, cbBuf, pNoBytesRead) {
        result := DllCall("winspool.drv\ReadPrinter", "ptr", hPrinter, "ptr", pBuf, "uint", cbBuf, "uint*", pNoBytesRead, "int")
        return result
    }

    /**
     * The EndDocPrinter function ends a print job for the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **EndDocPrinter** function returns an error if the print job was not started by calling the [**StartDocPrinter**](startdocprinter.md) function.
     * 
     * The sequence for a print job is as follows:
     * 
     * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
     * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
     * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
     * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
     * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
     * 6.  To end the print job, call **EndDocPrinter**.
     * 
     * When a page in a spooled file exceeds approximately 350 MB, it may fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
     * @param {Pointer<Void>} hPrinter Handle to a printer for which the print job should be ended. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enddocprinter
     */
    static EndDocPrinter(hPrinter) {
        result := DllCall("winspool.drv\EndDocPrinter", "ptr", hPrinter, "int")
        return result
    }

    /**
     * The AddJob function adds a print job to the list of print jobs that can be scheduled by the print spooler. The function retrieves the name of the file you can use to store the job.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * You can call the [**CreateFile**](/windows/desktop/api/fileapi/nf-fileapi-createfilea) function to open the spool file specified by the **Path** member of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure, and then call the [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile) function to write print job data to it. After that is done, call the [**ScheduleJob**](schedulejob.md) function to notify the print spooler that the print job can now be scheduled by the spooler for printing.
     * @param {Pointer<Void>} hPrinter A handle that specifies the printer for the print job. This must be a local printer that is configured as a spooled printer. If *hPrinter* is a handle to a remote printer connection, or if the printer is configured for direct printing, the **AddJob** function fails. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The version of the print job information data structure that the function stores into the buffer pointed to by *pData*. Set this parameter to one.
     * @param {Pointer} pData A pointer to a buffer that receives an [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure and a path string.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pData*. The buffer needs to be large enough to contain an [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure and a path string.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the total size, in bytes, of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure plus the path string. If this value is less than or equal to *cbBuf* and the function succeeds, this is the actual number of bytes written to the buffer pointed to by *pData*. If this number is greater than *cbBuf*, the buffer is too small, and you must call the function again with a buffer size at least as large as \**pcbNeeded*.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addjob
     */
    static AddJobA(hPrinter, Level, pData, cbBuf, pcbNeeded) {
        result := DllCall("winspool.drv\AddJobA", "ptr", hPrinter, "uint", Level, "ptr", pData, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The AddJob function adds a print job to the list of print jobs that can be scheduled by the print spooler. The function retrieves the name of the file you can use to store the job.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * You can call the [**CreateFile**](/windows/desktop/api/fileapi/nf-fileapi-createfilea) function to open the spool file specified by the **Path** member of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure, and then call the [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile) function to write print job data to it. After that is done, call the [**ScheduleJob**](schedulejob.md) function to notify the print spooler that the print job can now be scheduled by the spooler for printing.
     * @param {Pointer<Void>} hPrinter A handle that specifies the printer for the print job. This must be a local printer that is configured as a spooled printer. If *hPrinter* is a handle to a remote printer connection, or if the printer is configured for direct printing, the **AddJob** function fails. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level The version of the print job information data structure that the function stores into the buffer pointed to by *pData*. Set this parameter to one.
     * @param {Pointer} pData A pointer to a buffer that receives an [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure and a path string.
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pData*. The buffer needs to be large enough to contain an [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure and a path string.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the total size, in bytes, of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure plus the path string. If this value is less than or equal to *cbBuf* and the function succeeds, this is the actual number of bytes written to the buffer pointed to by *pData*. If this number is greater than *cbBuf*, the buffer is too small, and you must call the function again with a buffer size at least as large as \**pcbNeeded*.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addjob
     */
    static AddJobW(hPrinter, Level, pData, cbBuf, pcbNeeded) {
        result := DllCall("winspool.drv\AddJobW", "ptr", hPrinter, "uint", Level, "ptr", pData, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The ScheduleJob function requests that the print spooler schedule a specified print job for printing.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * You must successfully call the [**AddJob**](addjob.md) function before calling the **ScheduleJob** function. **AddJob** obtains the print job identifier that you pass to **ScheduleJob** as *dwJobID*. Both calls must use the same value for *hPrinter*.
     * 
     * The **ScheduleJob** function checks for a valid spool file. If there is an invalid spool file, or if it is empty, **ScheduleJob** deletes both the spool file and the corresponding print job entry in the print spooler.
     * @param {Pointer<Void>} hPrinter A handle to the printer for the print job. This must be a local printer that is configured as a spooled printer. If *hPrinter* is a handle to a remote printer connection, or if the printer is configured for direct printing, the **ScheduleJob** function fails. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} JobId 
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/schedulejob
     */
    static ScheduleJob(hPrinter, JobId) {
        result := DllCall("winspool.drv\ScheduleJob", "ptr", hPrinter, "uint", JobId, "int")
        return result
    }

    /**
     * The PrinterProperties function displays a printer-properties property sheet for the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the property sheet.
     * @param {Pointer<Void>} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/printerproperties
     */
    static PrinterProperties(hWnd, hPrinter) {
        result := DllCall("winspool.drv\PrinterProperties", "ptr", hWnd, "ptr", hPrinter, "int")
        return result
    }

    /**
     * The DocumentProperties function retrieves or modifies printer initialization information or displays a printer-configuration property sheet for the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The string pointed to by the *pDeviceName* parameter can be obtained by calling the [**GetPrinter**](getprinter.md) function.
     * 
     * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure actually used by a printer driver contains the device-independent part (as defined above) followed by a driver-specific part that varies in size and content with each driver and driver version. Because of this driver dependence, it is very important for applications to query the driver for the correct size of the **DEVMODE** structure before allocating a buffer for it.
     * 
     * **To make changes to print settings that are local to an application, an application should follow these steps:**
     * 
     * 1.  Get the number of bytes required for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure by calling **DocumentProperties** and specifying zero in the *fMode* parameter.
     * 2.  Allocate memory for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure.
     * 3.  Get the current printer settings by calling **DocumentProperties**. Pass a pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure allocated in Step 2 as the *pDevModeOutput* parameter and specify the **DM\_OUT\_BUFFER** value.
     * 4.  Modify the appropriate members of the returned [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure and indicate which members were changed by setting the corresponding bits in the **dmFields** member of the **DEVMODE**.
     * 5.  Call **DocumentProperties** and pass the modified [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure back as both the *pDevModeInput* and *pDevModeOutput* parameters and specify both the **DM\_IN\_BUFFER** and **DM\_OUT\_BUFFER** values (which are combined using the OR operator).The **DEVMODE** structure returned by the third call to **DocumentProperties** can be used as an argument in a call to the [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) function.
     * 
     * To create a handle to a printer-device context using the current printer settings, you only need to call **DocumentProperties** twice, as described above. The first call gets the size of the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) and the second call initializes the **DEVMODE** with the current printer settings. Pass the initialized **DEVMODE** to [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) to obtain the handle to the printer device context.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the printer-configuration property sheet.
     * @param {Pointer<Void>} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pDeviceName A pointer to a null-terminated string that specifies the name of the device for which the printer-configuration property sheet is displayed.
     * @param {Pointer<DEVMODEA>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that receives the printer configuration data specified by the user.
     * @param {Pointer<DEVMODEA>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that the operating system uses to initialize the property sheet controls.
     * 
     * This parameter is only used if the **DM\_IN\_BUFFER** flag is set in the *fMode* parameter. If **DM\_IN\_BUFFER** is not set, the operating system uses the printer's default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea).
     * @param {Integer} fMode The operations the function performs. If this parameter is zero, the **DocumentProperties** function returns the number of bytes required by the printer driver's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure. Otherwise, use one or more of the following constants to construct a value for this parameter; note, however, that in order to change the print settings, an application must specify at least one input value and one output value.
     * 
     * 
     * 
     * | Value                                                                                                                                                          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="DM_IN_BUFFER"></span><span id="dm_in_buffer"></span><dl> <dt>**DM\_IN\_BUFFER**</dt> </dl>    | Input value. Before prompting, copying, or updating, the function merges the printer driver's current print settings with the settings in the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure specified by the *pDevModeInput* parameter. The function updates the structure only for those members specified by the **DEVMODE** structure's **dmFields** member. This value is also defined as **DM\_MODIFY**. In cases of conflict during the merge, the settings in the **DEVMODE** structure specified by *pDevModeInput* override the printer driver's current print settings.<br/> |
     * | <span id="DM_IN_PROMPT"></span><span id="dm_in_prompt"></span><dl> <dt>**DM\_IN\_PROMPT**</dt> </dl>    | Input value. The function presents the printer driver's Print Setup property sheet and then changes the settings in the printer's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure to those values specified by the user. This value is also defined as **DM\_PROMPT**.<br/>                                                                                                                                                                                                                                                                                                         |
     * | <span id="DM_OUT_BUFFER"></span><span id="dm_out_buffer"></span><dl> <dt>**DM\_OUT\_BUFFER**</dt> </dl> | Output value. The function writes the printer driver's current print settings, including private data, to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure specified by the *pDevModeOutput* parameter. The caller must allocate a buffer sufficiently large to contain the information. If the bit **DM\_OUT\_BUFFER** sets is clear, the *pDevModeOutput* parameter can be **NULL**. This value is also defined as **DM\_COPY**.<br/>                                                                                                                                          |
     * @returns {Integer} If the *fMode* parameter is zero, the return value is the size of the buffer required to contain the printer driver initialization data. Note that this buffer can be larger than a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure if the printer driver appends private data to the structure.
     * 
     * If the function displays the property sheet, the return value is either **IDOK** or **IDCANCEL**, depending on which button the user selects.
     * 
     * If the function does not display the property sheet and is successful, the return value is **IDOK**.
     * 
     * If the function fails, the return value is less than zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/documentproperties
     */
    static DocumentPropertiesA(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("winspool.drv\DocumentPropertiesA", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "uint", fMode, "int")
        return result
    }

    /**
     * The DocumentProperties function retrieves or modifies printer initialization information or displays a printer-configuration property sheet for the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The string pointed to by the *pDeviceName* parameter can be obtained by calling the [**GetPrinter**](getprinter.md) function.
     * 
     * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure actually used by a printer driver contains the device-independent part (as defined above) followed by a driver-specific part that varies in size and content with each driver and driver version. Because of this driver dependence, it is very important for applications to query the driver for the correct size of the **DEVMODE** structure before allocating a buffer for it.
     * 
     * **To make changes to print settings that are local to an application, an application should follow these steps:**
     * 
     * 1.  Get the number of bytes required for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure by calling **DocumentProperties** and specifying zero in the *fMode* parameter.
     * 2.  Allocate memory for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure.
     * 3.  Get the current printer settings by calling **DocumentProperties**. Pass a pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure allocated in Step 2 as the *pDevModeOutput* parameter and specify the **DM\_OUT\_BUFFER** value.
     * 4.  Modify the appropriate members of the returned [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure and indicate which members were changed by setting the corresponding bits in the **dmFields** member of the **DEVMODE**.
     * 5.  Call **DocumentProperties** and pass the modified [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure back as both the *pDevModeInput* and *pDevModeOutput* parameters and specify both the **DM\_IN\_BUFFER** and **DM\_OUT\_BUFFER** values (which are combined using the OR operator).The **DEVMODE** structure returned by the third call to **DocumentProperties** can be used as an argument in a call to the [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) function.
     * 
     * To create a handle to a printer-device context using the current printer settings, you only need to call **DocumentProperties** twice, as described above. The first call gets the size of the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) and the second call initializes the **DEVMODE** with the current printer settings. Pass the initialized **DEVMODE** to [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) to obtain the handle to the printer device context.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the printer-configuration property sheet.
     * @param {Pointer<Void>} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pDeviceName A pointer to a null-terminated string that specifies the name of the device for which the printer-configuration property sheet is displayed.
     * @param {Pointer<DEVMODEW>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that receives the printer configuration data specified by the user.
     * @param {Pointer<DEVMODEW>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that the operating system uses to initialize the property sheet controls.
     * 
     * This parameter is only used if the **DM\_IN\_BUFFER** flag is set in the *fMode* parameter. If **DM\_IN\_BUFFER** is not set, the operating system uses the printer's default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea).
     * @param {Integer} fMode The operations the function performs. If this parameter is zero, the **DocumentProperties** function returns the number of bytes required by the printer driver's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure. Otherwise, use one or more of the following constants to construct a value for this parameter; note, however, that in order to change the print settings, an application must specify at least one input value and one output value.
     * 
     * 
     * 
     * | Value                                                                                                                                                          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="DM_IN_BUFFER"></span><span id="dm_in_buffer"></span><dl> <dt>**DM\_IN\_BUFFER**</dt> </dl>    | Input value. Before prompting, copying, or updating, the function merges the printer driver's current print settings with the settings in the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure specified by the *pDevModeInput* parameter. The function updates the structure only for those members specified by the **DEVMODE** structure's **dmFields** member. This value is also defined as **DM\_MODIFY**. In cases of conflict during the merge, the settings in the **DEVMODE** structure specified by *pDevModeInput* override the printer driver's current print settings.<br/> |
     * | <span id="DM_IN_PROMPT"></span><span id="dm_in_prompt"></span><dl> <dt>**DM\_IN\_PROMPT**</dt> </dl>    | Input value. The function presents the printer driver's Print Setup property sheet and then changes the settings in the printer's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure to those values specified by the user. This value is also defined as **DM\_PROMPT**.<br/>                                                                                                                                                                                                                                                                                                         |
     * | <span id="DM_OUT_BUFFER"></span><span id="dm_out_buffer"></span><dl> <dt>**DM\_OUT\_BUFFER**</dt> </dl> | Output value. The function writes the printer driver's current print settings, including private data, to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure specified by the *pDevModeOutput* parameter. The caller must allocate a buffer sufficiently large to contain the information. If the bit **DM\_OUT\_BUFFER** sets is clear, the *pDevModeOutput* parameter can be **NULL**. This value is also defined as **DM\_COPY**.<br/>                                                                                                                                          |
     * @returns {Integer} If the *fMode* parameter is zero, the return value is the size of the buffer required to contain the printer driver initialization data. Note that this buffer can be larger than a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure if the printer driver appends private data to the structure.
     * 
     * If the function displays the property sheet, the return value is either **IDOK** or **IDCANCEL**, depending on which button the user selects.
     * 
     * If the function does not display the property sheet and is successful, the return value is **IDOK**.
     * 
     * If the function fails, the return value is less than zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/documentproperties
     */
    static DocumentPropertiesW(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("winspool.drv\DocumentPropertiesW", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "uint", fMode, "int")
        return result
    }

    /**
     * The AdvancedDocumentProperties function displays a printer-configuration dialog box for the specified printer, allowing the user to configure that printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * This function can only display the printer-configuration dialog box so a user can configure it. For more control, use [**DocumentProperties**](documentproperties.md). The input parameters for this function are passed directly to **DocumentProperties** and the *fMode* value is set to DM\_IN\_BUFFER \| DM\_IN\_PROMPT \| DM\_OUT\_BUFFER. Unlike **DocumentProperties**, this function only returns 1 or 0. Thus, you cannot determine the required size of [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) by setting *pDevMode* to zero.
     * 
     * An application can obtain the name pointed to by the *pDeviceName* parameter by calling the [**GetPrinter**](getprinter.md) function and then examining the **pPrinterName** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the printer-configuration dialog box.
     * @param {Pointer<Void>} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pDeviceName A pointer to a null-terminated string specifying the name of the device for which a printer-configuration dialog box should be displayed.
     * @param {Pointer<DEVMODEA>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that will contain the configuration data specified by the user.
     * @param {Pointer<DEVMODEA>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that contains the configuration data used to initialize the controls of the printer-configuration dialog box.
     * @returns {Integer} If the [**DocumentProperties**](documentproperties.md) function with these parameters is successful, the return value of **AdvancedDocumentProperties** is 1. Otherwise, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/advanceddocumentproperties
     */
    static AdvancedDocumentPropertiesA(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("winspool.drv\AdvancedDocumentPropertiesA", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "int")
        return result
    }

    /**
     * The AdvancedDocumentProperties function displays a printer-configuration dialog box for the specified printer, allowing the user to configure that printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * This function can only display the printer-configuration dialog box so a user can configure it. For more control, use [**DocumentProperties**](documentproperties.md). The input parameters for this function are passed directly to **DocumentProperties** and the *fMode* value is set to DM\_IN\_BUFFER \| DM\_IN\_PROMPT \| DM\_OUT\_BUFFER. Unlike **DocumentProperties**, this function only returns 1 or 0. Thus, you cannot determine the required size of [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) by setting *pDevMode* to zero.
     * 
     * An application can obtain the name pointed to by the *pDeviceName* parameter by calling the [**GetPrinter**](getprinter.md) function and then examining the **pPrinterName** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the printer-configuration dialog box.
     * @param {Pointer<Void>} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pDeviceName A pointer to a null-terminated string specifying the name of the device for which a printer-configuration dialog box should be displayed.
     * @param {Pointer<DEVMODEW>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that will contain the configuration data specified by the user.
     * @param {Pointer<DEVMODEW>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that contains the configuration data used to initialize the controls of the printer-configuration dialog box.
     * @returns {Integer} If the [**DocumentProperties**](documentproperties.md) function with these parameters is successful, the return value of **AdvancedDocumentProperties** is 1. Otherwise, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/advanceddocumentproperties
     */
    static AdvancedDocumentPropertiesW(hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("winspool.drv\AdvancedDocumentPropertiesW", "ptr", hWnd, "ptr", hPrinter, "ptr", pDeviceName, "ptr", pDevModeOutput, "ptr", pDevModeInput, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWnd 
     * @param {Pointer<Void>} hInst 
     * @param {Pointer<DEVMODEA>} pDevModeOutput 
     * @param {Pointer<Byte>} pDeviceName 
     * @param {Pointer<Byte>} pPort 
     * @param {Pointer<DEVMODEA>} pDevModeInput 
     * @param {Pointer<Byte>} pProfile 
     * @param {Integer} fMode 
     * @returns {Integer} 
     */
    static ExtDeviceMode(hWnd, hInst, pDevModeOutput, pDeviceName, pPort, pDevModeInput, pProfile, fMode) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName
        pPort := pPort is String? StrPtr(pPort) : pPort
        pProfile := pProfile is String? StrPtr(pProfile) : pProfile

        result := DllCall("winspool.drv\ExtDeviceMode", "ptr", hWnd, "ptr", hInst, "ptr", pDevModeOutput, "ptr", pDeviceName, "ptr", pPort, "ptr", pDevModeInput, "ptr", pProfile, "uint", fMode, "int")
        return result
    }

    /**
     * The GetPrinterData function retrieves configuration data for the specified printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **GetPrinterData** retrieves printer configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) or [**SetPrinterData**](setprinterdata.md) function.
     * 
     * **GetPrinterData** might trigger a Windows call to [**GetPrinterDataFromPort**](/previous-versions//ff550506(v=vs.85)), which might write to the registry. If it does, side effects can occur, such as triggering an update or upgrade printer event ID 20 in the client, if the printer is shared in a network.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
     * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
     * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
     * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
     * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
     * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The following values configure client-side rendering of a print jobs and can be read if you set the following values in *pValueName*.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
     * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
     * 
     * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Pointer<UInt32>} pType A pointer to a variable that receives a value that indicates the type of data retrieved in *pData*. The function returns the type specified in the [**SetPrinterData**](setprinterdata.md) or [**SetPrinterDataEx**](setprinterdataex.md) call that stored the data. Set this parameter to **NULL** if you don't need the data type.
     * @param {Pointer} pData A pointer to a buffer that receives the configuration data.
     * @param {Integer} nSize The size, in bytes, of the buffer that *pData* points to.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**. If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdata
     */
    static GetPrinterDataA(hPrinter, pValueName, pType, pData, nSize, pcbNeeded) {
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\GetPrinterDataA", "ptr", hPrinter, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * The GetPrinterData function retrieves configuration data for the specified printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **GetPrinterData** retrieves printer configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) or [**SetPrinterData**](setprinterdata.md) function.
     * 
     * **GetPrinterData** might trigger a Windows call to [**GetPrinterDataFromPort**](/previous-versions//ff550506(v=vs.85)), which might write to the registry. If it does, side effects can occur, such as triggering an update or upgrade printer event ID 20 in the client, if the printer is shared in a network.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
     * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
     * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
     * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
     * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
     * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The following values configure client-side rendering of a print jobs and can be read if you set the following values in *pValueName*.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
     * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
     * 
     * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Pointer<UInt32>} pType A pointer to a variable that receives a value that indicates the type of data retrieved in *pData*. The function returns the type specified in the [**SetPrinterData**](setprinterdata.md) or [**SetPrinterDataEx**](setprinterdataex.md) call that stored the data. Set this parameter to **NULL** if you don't need the data type.
     * @param {Pointer} pData A pointer to a buffer that receives the configuration data.
     * @param {Integer} nSize The size, in bytes, of the buffer that *pData* points to.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**. If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdata
     */
    static GetPrinterDataW(hPrinter, pValueName, pType, pData, nSize, pcbNeeded) {
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\GetPrinterDataW", "ptr", hPrinter, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * The GetPrinterDataEx function retrieves configuration data for the specified printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **GetPrinterDataEx** retrieves printer-configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
     * 
     * Calling **GetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**GetPrinterData**](getprinterdata.md) function.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
     * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
     * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
     * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
     * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
     * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * If *pKeyName* is one of the predefined Directory Service (DS) keys (see [**SetPrinter**](setprinter.md)) and *pValueName* contains a comma (','), then the portion of *pValueName* before the comma is the value name and the portion of *pValueName* to the right of the comma is the DS Property OID. A subkey called OID is created and a new value that consists of the value name and OID is entered under the OID key. [**SetPrinterDataEx**](setprinterdataex.md) also adds the value name and data under the DS key.
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The configuration of client-side rendering for a printer can be read by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
     * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pKeyName A pointer to a null-terminated string that specifies the key containing the value to be retrieved. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
     * 
     * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **GetPrinterDataEx** returns **ERROR\_INVALID\_PARAMETER**.
     * 
     * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
     * @param {Pointer<Byte>} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
     * 
     * For printers, this string specifies the name of a value under the *pKeyName* key.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Pointer<UInt32>} pType A pointer to a variable that receives the type of data stored in the value. The function returns the type specified in the [**SetPrinterDataEx**](setprinterdataex.md) call when the data was stored. This parameter can be **NULL** if you don't need the information. **GetPrinterDataEx** passes *pType* on as the *lpdwType* parameter of a [**RegQueryValueEx**](/windows/desktop/api/winreg/nf-winreg-regqueryvalueexa) function call.
     * @param {Pointer} pData A pointer to a buffer that receives the configuration data.
     * @param {Integer} nSize The size, in bytes, of the buffer pointed to by *pData*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
     * 
     * If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdataex
     */
    static GetPrinterDataExA(hPrinter, pKeyName, pValueName, pType, pData, nSize, pcbNeeded) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\GetPrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * The GetPrinterDataEx function retrieves configuration data for the specified printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **GetPrinterDataEx** retrieves printer-configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
     * 
     * Calling **GetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**GetPrinterData**](getprinterdata.md) function.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
     * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
     * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
     * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
     * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
     * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
     * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * If *pKeyName* is one of the predefined Directory Service (DS) keys (see [**SetPrinter**](setprinter.md)) and *pValueName* contains a comma (','), then the portion of *pValueName* before the comma is the value name and the portion of *pValueName* to the right of the comma is the DS Property OID. A subkey called OID is created and a new value that consists of the value name and OID is entered under the OID key. [**SetPrinterDataEx**](setprinterdataex.md) also adds the value name and data under the DS key.
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The configuration of client-side rendering for a printer can be read by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
     * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pKeyName A pointer to a null-terminated string that specifies the key containing the value to be retrieved. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
     * 
     * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **GetPrinterDataEx** returns **ERROR\_INVALID\_PARAMETER**.
     * 
     * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
     * @param {Pointer<Char>} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
     * 
     * For printers, this string specifies the name of a value under the *pKeyName* key.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Pointer<UInt32>} pType A pointer to a variable that receives the type of data stored in the value. The function returns the type specified in the [**SetPrinterDataEx**](setprinterdataex.md) call when the data was stored. This parameter can be **NULL** if you don't need the information. **GetPrinterDataEx** passes *pType* on as the *lpdwType* parameter of a [**RegQueryValueEx**](/windows/desktop/api/winreg/nf-winreg-regqueryvalueexa) function call.
     * @param {Pointer} pData A pointer to a buffer that receives the configuration data.
     * @param {Integer} nSize The size, in bytes, of the buffer pointed to by *pData*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
     * 
     * If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdataex
     */
    static GetPrinterDataExW(hPrinter, pKeyName, pValueName, pType, pData, nSize, pcbNeeded) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\GetPrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint*", pType, "ptr", pData, "uint", nSize, "uint*", pcbNeeded, "uint")
        return result
    }

    /**
     * The EnumPrinterData function enumerates configuration data for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **EnumPrinterData** retrieves printer configuration data set by the [**SetPrinterData**](setprinterdata.md) function. A printer's configuration data consists of a set of named and typed values. The **EnumPrinterData** function obtains one of these values, and its name and a type code, each time you call it. Call the **EnumPrinterData** function several times in succession to obtain all of a printer's configuration data values.
     * 
     * Printer configuration data is stored in the registry. While enumerating printer configuration data, you should avoid calling registry functions that might change that data.
     * 
     * If you want to have the operating system supply an adequate buffer size, first call **EnumPrinterData** with both the *cbValueName* and *cbData* parameters set to zero, as noted earlier in the Parameters section. The value of *dwIndex* does not matter for this call. When the function returns, \**pcbValueName* and \**pcbData* will contain buffer sizes that are large enough to enumerate all of the printer's configuration data value names and values. On the next call, allocate value name and data buffers, set *cbValueName* and *cbData* to the sizes in bytes of the allocated buffers, and set *dwIndex* to zero. Thereafter, continue to call the **EnumPrinterData** function, incrementing *dwIndex* by one each time, until the function returns ERROR\_NO\_MORE\_ITEMS.
     * @param {Pointer<Void>} hPrinter A handle to the printer whose configuration data is to be obtained. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} dwIndex An index value that specifies the configuration data value to retrieve.
     * 
     * Set this parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. Then increment the parameter by one for subsequent calls involving the same printer, until the function returns ERROR\_NO\_MORE\_ITEMS. See the following Remarks section for further information.
     * 
     * If you use the technique mentioned in the descriptions of the *cbValueName* and *cbData* parameters to obtain adequate buffer size values, setting both those parameters to zero in a first call to **EnumPrinterData** for a specified printer handle, the value of *dwIndex* does not matter for that call. Set *dwIndex* to zero in the next call to **EnumPrinterData** to start the actual enumeration process.
     * 
     * Configuration data values are not ordered. New values will have an arbitrary index. This means that the **EnumPrinterData** function may return values in any order.
     * @param {Pointer} pValueName A pointer to a buffer that receives the name of the configuration data value, including a terminating null character.
     * @param {Integer} cbValueName The size, in bytes, of the buffer pointed to by *pValueName*.
     * 
     * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbData* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbValueName* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
     * @param {Pointer<UInt32>} pcbValueName A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pValueName*.
     * @param {Pointer<UInt32>} pType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types). The *pType* parameter can be **NULL** if the type code is not required.
     * @param {Pointer<Byte>} pData A pointer to a buffer that receives the configuration data value.
     * 
     * This parameter can be **NULL** if the configuration data value is not required.
     * @param {Integer} cbData The size, in bytes, of the buffer pointed to by *pData*.
     * 
     * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbValueName* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbData* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
     * @param {Pointer<UInt32>} pcbData A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pData*.
     * 
     * This parameter can be **NULL** if *pData* is **NULL**.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * 
     * The function returns ERROR\_NO\_MORE\_ITEMS when there are no more configuration data values to retrieve for a specified printer handle.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdata
     */
    static EnumPrinterDataA(hPrinter, dwIndex, pValueName, cbValueName, pcbValueName, pType, pData, cbData, pcbData) {
        result := DllCall("winspool.drv\EnumPrinterDataA", "ptr", hPrinter, "uint", dwIndex, "ptr", pValueName, "uint", cbValueName, "uint*", pcbValueName, "uint*", pType, "char*", pData, "uint", cbData, "uint*", pcbData, "uint")
        return result
    }

    /**
     * The EnumPrinterData function enumerates configuration data for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **EnumPrinterData** retrieves printer configuration data set by the [**SetPrinterData**](setprinterdata.md) function. A printer's configuration data consists of a set of named and typed values. The **EnumPrinterData** function obtains one of these values, and its name and a type code, each time you call it. Call the **EnumPrinterData** function several times in succession to obtain all of a printer's configuration data values.
     * 
     * Printer configuration data is stored in the registry. While enumerating printer configuration data, you should avoid calling registry functions that might change that data.
     * 
     * If you want to have the operating system supply an adequate buffer size, first call **EnumPrinterData** with both the *cbValueName* and *cbData* parameters set to zero, as noted earlier in the Parameters section. The value of *dwIndex* does not matter for this call. When the function returns, \**pcbValueName* and \**pcbData* will contain buffer sizes that are large enough to enumerate all of the printer's configuration data value names and values. On the next call, allocate value name and data buffers, set *cbValueName* and *cbData* to the sizes in bytes of the allocated buffers, and set *dwIndex* to zero. Thereafter, continue to call the **EnumPrinterData** function, incrementing *dwIndex* by one each time, until the function returns ERROR\_NO\_MORE\_ITEMS.
     * @param {Pointer<Void>} hPrinter A handle to the printer whose configuration data is to be obtained. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} dwIndex An index value that specifies the configuration data value to retrieve.
     * 
     * Set this parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. Then increment the parameter by one for subsequent calls involving the same printer, until the function returns ERROR\_NO\_MORE\_ITEMS. See the following Remarks section for further information.
     * 
     * If you use the technique mentioned in the descriptions of the *cbValueName* and *cbData* parameters to obtain adequate buffer size values, setting both those parameters to zero in a first call to **EnumPrinterData** for a specified printer handle, the value of *dwIndex* does not matter for that call. Set *dwIndex* to zero in the next call to **EnumPrinterData** to start the actual enumeration process.
     * 
     * Configuration data values are not ordered. New values will have an arbitrary index. This means that the **EnumPrinterData** function may return values in any order.
     * @param {Pointer} pValueName A pointer to a buffer that receives the name of the configuration data value, including a terminating null character.
     * @param {Integer} cbValueName The size, in bytes, of the buffer pointed to by *pValueName*.
     * 
     * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbData* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbValueName* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
     * @param {Pointer<UInt32>} pcbValueName A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pValueName*.
     * @param {Pointer<UInt32>} pType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types). The *pType* parameter can be **NULL** if the type code is not required.
     * @param {Pointer<Byte>} pData A pointer to a buffer that receives the configuration data value.
     * 
     * This parameter can be **NULL** if the configuration data value is not required.
     * @param {Integer} cbData The size, in bytes, of the buffer pointed to by *pData*.
     * 
     * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbValueName* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbData* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
     * @param {Pointer<UInt32>} pcbData A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pData*.
     * 
     * This parameter can be **NULL** if *pData* is **NULL**.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * 
     * The function returns ERROR\_NO\_MORE\_ITEMS when there are no more configuration data values to retrieve for a specified printer handle.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdata
     */
    static EnumPrinterDataW(hPrinter, dwIndex, pValueName, cbValueName, pcbValueName, pType, pData, cbData, pcbData) {
        result := DllCall("winspool.drv\EnumPrinterDataW", "ptr", hPrinter, "uint", dwIndex, "ptr", pValueName, "uint", cbValueName, "uint*", pcbValueName, "uint*", pType, "char*", pData, "uint", cbData, "uint*", pcbData, "uint")
        return result
    }

    /**
     * The EnumPrinterDataEx function enumerates all value names and data for a specified printer and key.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **EnumPrinterDataEx** retrieves printer configuration data set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pKeyName A pointer to a null-terminated string that specifies the key containing the values to enumerate. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys. **EnumPrinterDataEx** enumerates all values of the key, but does not enumerate values of subkeys of the specified key. Use the [**EnumPrinterKey**](enumprinterkey.md) function to enumerate subkeys.
     * 
     * If *pKeyName* is **NULL** or an empty string, **EnumPrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
     * @param {Pointer} pEnumValues A pointer to a buffer that receives an array of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures. Each structure contains the value name, type, data, and sizes of a value under the key.
     * @param {Integer} cbEnumValues The size, in bytes, of the buffer pointed to by *pcbEnumValues*. If you set *cbEnumValues* to zero, the *pcbEnumValues* parameter returns the required buffer size.
     * @param {Pointer<UInt32>} pcbEnumValues A pointer to a variable that receives the size, in bytes, of the retrieved configuration data. If the buffer size specified by *cbEnumValues* is too small, the function returns ERROR\_MORE\_DATA and *pcbEnumValues* indicates the required buffer size.
     * @param {Pointer<UInt32>} pnEnumValues A pointer to a variable that receives the number of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures returned in *pEnumValues*.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdataex
     */
    static EnumPrinterDataExA(hPrinter, pKeyName, pEnumValues, cbEnumValues, pcbEnumValues, pnEnumValues) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName

        result := DllCall("winspool.drv\EnumPrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pEnumValues, "uint", cbEnumValues, "uint*", pcbEnumValues, "uint*", pnEnumValues, "uint")
        return result
    }

    /**
     * The EnumPrinterDataEx function enumerates all value names and data for a specified printer and key.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **EnumPrinterDataEx** retrieves printer configuration data set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pKeyName A pointer to a null-terminated string that specifies the key containing the values to enumerate. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys. **EnumPrinterDataEx** enumerates all values of the key, but does not enumerate values of subkeys of the specified key. Use the [**EnumPrinterKey**](enumprinterkey.md) function to enumerate subkeys.
     * 
     * If *pKeyName* is **NULL** or an empty string, **EnumPrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
     * @param {Pointer} pEnumValues A pointer to a buffer that receives an array of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures. Each structure contains the value name, type, data, and sizes of a value under the key.
     * @param {Integer} cbEnumValues The size, in bytes, of the buffer pointed to by *pcbEnumValues*. If you set *cbEnumValues* to zero, the *pcbEnumValues* parameter returns the required buffer size.
     * @param {Pointer<UInt32>} pcbEnumValues A pointer to a variable that receives the size, in bytes, of the retrieved configuration data. If the buffer size specified by *cbEnumValues* is too small, the function returns ERROR\_MORE\_DATA and *pcbEnumValues* indicates the required buffer size.
     * @param {Pointer<UInt32>} pnEnumValues A pointer to a variable that receives the number of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures returned in *pEnumValues*.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdataex
     */
    static EnumPrinterDataExW(hPrinter, pKeyName, pEnumValues, cbEnumValues, pcbEnumValues, pnEnumValues) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName

        result := DllCall("winspool.drv\EnumPrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pEnumValues, "uint", cbEnumValues, "uint*", pcbEnumValues, "uint*", pnEnumValues, "uint")
        return result
    }

    /**
     * The EnumPrinterKey function enumerates the subkeys of a specified key for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function enumerates subkeys. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pKeyName A pointer to a null-terminated string that specifies the key containing the subkeys to enumerate. Use the backslash '\\' character as a delimiter to specify a path with one or more subkeys. **EnumPrinterKey** enumerates all subkeys of the key, but does not enumerate the subkeys of those subkeys.
     * 
     * If *pKeyName* is an empty string (""), **EnumPrinterKey** enumerates the top-level key for the printer. If *pKeyName* is **NULL**, **EnumPrinterKey** returns ERROR\_INVALID\_PARAMETER.
     * @param {Pointer} pSubkey A pointer to a buffer that receives an array of null-terminated subkey names. The array is terminated by two null characters.
     * @param {Integer} cbSubkey The size, in bytes, of the buffer pointed to by *pSubkey*. If you set *cbSubkey* to zero, the *pcbSubkey* parameter returns the required buffer size.
     * @param {Pointer<UInt32>} pcbSubkey A pointer to a variable that receives the number of bytes retrieved in the *pSubkey* buffer. If the buffer size specified by *cbSubkey* is too small, the function returns ERROR\_MORE\_DATA and *pcbSubkey* indicates the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code. If *pKeyName* does not exist, the return value is ERROR\_FILE\_NOT\_FOUND.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterkey
     */
    static EnumPrinterKeyA(hPrinter, pKeyName, pSubkey, cbSubkey, pcbSubkey) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName

        result := DllCall("winspool.drv\EnumPrinterKeyA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pSubkey, "uint", cbSubkey, "uint*", pcbSubkey, "uint")
        return result
    }

    /**
     * The EnumPrinterKey function enumerates the subkeys of a specified key for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function enumerates subkeys. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pKeyName A pointer to a null-terminated string that specifies the key containing the subkeys to enumerate. Use the backslash '\\' character as a delimiter to specify a path with one or more subkeys. **EnumPrinterKey** enumerates all subkeys of the key, but does not enumerate the subkeys of those subkeys.
     * 
     * If *pKeyName* is an empty string (""), **EnumPrinterKey** enumerates the top-level key for the printer. If *pKeyName* is **NULL**, **EnumPrinterKey** returns ERROR\_INVALID\_PARAMETER.
     * @param {Pointer} pSubkey A pointer to a buffer that receives an array of null-terminated subkey names. The array is terminated by two null characters.
     * @param {Integer} cbSubkey The size, in bytes, of the buffer pointed to by *pSubkey*. If you set *cbSubkey* to zero, the *pcbSubkey* parameter returns the required buffer size.
     * @param {Pointer<UInt32>} pcbSubkey A pointer to a variable that receives the number of bytes retrieved in the *pSubkey* buffer. If the buffer size specified by *cbSubkey* is too small, the function returns ERROR\_MORE\_DATA and *pcbSubkey* indicates the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code. If *pKeyName* does not exist, the return value is ERROR\_FILE\_NOT\_FOUND.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterkey
     */
    static EnumPrinterKeyW(hPrinter, pKeyName, pSubkey, cbSubkey, pcbSubkey) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName

        result := DllCall("winspool.drv\EnumPrinterKeyW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pSubkey, "uint", cbSubkey, "uint*", pcbSubkey, "uint")
        return result
    }

    /**
     * The SetPrinterData function sets the configuration data for a printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * To retrieve existing configuration data for a printer, call the [**GetPrinterDataEx**](getprinterdataex.md) or [**GetPrinterData**](getprinterdata.md) function.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * The following values of *pValueName* determine the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of a print jobs can be configured for each printer by setting the following values in *pValueName*.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                   |
     * |------------------------------|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                      |
     * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, causes the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pValueName A pointer to a null-terminated string that identifies the data to set.
     * 
     * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Integer} Type A code that indicates the type of data that the *pData* parameter points to. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
     * @param {Pointer} pData A pointer to an array of bytes that contains the printer configuration data.
     * @param {Integer} cbData The size, in bytes, of the array.
     * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
     * 
     * If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdata
     */
    static SetPrinterDataA(hPrinter, pValueName, Type, pData, cbData) {
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\SetPrinterDataA", "ptr", hPrinter, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * The SetPrinterData function sets the configuration data for a printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * To retrieve existing configuration data for a printer, call the [**GetPrinterDataEx**](getprinterdataex.md) or [**GetPrinterData**](getprinterdata.md) function.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * The following values of *pValueName* determine the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
     * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of a print jobs can be configured for each printer by setting the following values in *pValueName*.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                   |
     * |------------------------------|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                      |
     * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, causes the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pValueName A pointer to a null-terminated string that identifies the data to set.
     * 
     * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Integer} Type A code that indicates the type of data that the *pData* parameter points to. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
     * @param {Pointer} pData A pointer to an array of bytes that contains the printer configuration data.
     * @param {Integer} cbData The size, in bytes, of the array.
     * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
     * 
     * If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdata
     */
    static SetPrinterDataW(hPrinter, pValueName, Type, pData, cbData) {
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\SetPrinterDataW", "ptr", hPrinter, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * The SetPrinterDataEx function sets the configuration data for a printer or print server. The function stores the configuration data under the printers registry key.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * To retrieve existing configuration data for a printer or print spooler, call the [**GetPrinterDataEx**](getprinterdataex.md) function.
     * 
     * Calling **SetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**SetPrinterData**](setprinterdata.md) function.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG_ALLOW_USER_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG_BEEP_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG_DEFAULT_SPOOL_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG_EVENT_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG_NET_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG_PORT_THREAD_PRIORITY_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG_PORT_THREAD_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_TIME_BEFORE_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_MAX_OBJECTS_BEFORE_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_IDLE_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_EXECUTION_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_OVERRIDE_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_RETRY_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG_SCHEDULER_THREAD_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * Passing one of the following predefined values as *pValueName* sets the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG_RESTART_JOB_ON_POOL_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG_RESTART_JOB_ON_POOL_ENABLED**.<br/> |
     * | **SPLREG_RESTART_JOB_ON_POOL_ENABLED** | A nonzero value in *pData* indicates that **SPLREG_RESTART_JOB_ON_POOL_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG_RESTART_JOB_ON_POOL_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * To ensure that the spooler redirects jobs to the next available printer in the pool (when the print job is not printed within the set time), the port monitor must support SNMP and the network ports in the pool must be configured as "SNMP status enabled." The port monitor that supports SNMP is Standard TCP/IP port monitor.
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of print jobs can be configured by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
     * | **ForceClientSideRendering** | **REG_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pKeyName A pointer to a null-terminated string that specifies the key containing the value to set. If the specified key or subkeys do not exist, the function creates them.
     * 
     * To store configuration data that can be published in the directory service (DS), specify one of the following predefined registry keys.
     * 
     * 
     * 
     * | Value                                                                                                                                                                      | Meaning                                                                                         |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
     * | <span id="SPLDS_DRIVER_KEY"></span><span id="splds_driver_key"></span><dl> <dt>**SPLDS_DRIVER_KEY**</dt> </dl>    | Printer drivers use this key to store driver properties.<br/>                             |
     * | <span id="SPLDS_SPOOLER_KEY"></span><span id="splds_spooler_key"></span><dl> <dt>**SPLDS_SPOOLER_KEY**</dt> </dl> | Reserved. Used only by the print spooler to store internal spooler properties.<br/>       |
     * | <span id="SPLDS_USER_KEY"></span><span id="splds_user_key"></span><dl> <dt>**SPLDS_USER_KEY**</dt> </dl>          | Applications use this key to store printer properties such as printer asset numbers.<br/> |
     * 
     * 
     * 
     *  
     * 
     * Values that are stored under the SPLDS_USER_KEY key are published in the directory service only if there is a corresponding property in the schema. A domain administrator must create the property if it doesn't already exist. To publish a user-defined property after you use **SetPrinterDataEx** to add or change a value, call [**SetPrinter**](setprinter.md) with *Level* = 7 and with the **dwAction** member of [**PRINTER_INFO_7**](printer-info-7.md) set to **DSPRINT_UPDATE**.
     * 
     * You can specify other keys to store non-DS configuration data. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
     * 
     * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **SetPrinterDataEx** returns **ERROR_INVALID_PARAMETER**.
     * 
     * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
     * 
     * Do not use **SPLDS_SPOOLER_KEY**. To change the spooler printer properties, use [**SetPrinter**](setprinter.md) with *Level* = 2.
     * @param {Pointer<Byte>} pValueName A pointer to a null-terminated string that identifies the data to set.
     * 
     * For printers, this string specifies the name of a value under the *pKeyName* key.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Integer} Type A code indicating the type of data pointed to by the *pData* parameter. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
     * 
     * If *pKeyName* specifies one of the predefined directory service keys, *Type* must be **REG_SZ**, **REG_MULTI_SZ**, **REG_DWORD**, or **REG_BINARY**. If **REG_BINARY** is used, *cbData* must be equal to 1, and the directory service treats the data as a Boolean value.
     * @param {Pointer} pData A pointer to a buffer that contains the printer configuration data.
     * @param {Integer} cbData The size, in bytes, of the array.
     * @returns {Integer} If the function succeeds, the return value is **ERROR_SUCCESS**.
     * 
     * If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdataex
     */
    static SetPrinterDataExA(hPrinter, pKeyName, pValueName, Type, pData, cbData) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\SetPrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * The SetPrinterDataEx function sets the configuration data for a printer or print server. The function stores the configuration data under the printers registry key.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * To retrieve existing configuration data for a printer or print spooler, call the [**GetPrinterDataEx**](getprinterdataex.md) function.
     * 
     * Calling **SetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**SetPrinterData**](setprinterdata.md) function.
     * 
     * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
     * 
     * 
     * 
     * | Value                                                               | Comments                                                                                                                                                                                                                        |
     * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG_ALLOW_USER_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
     * | **SPLREG_BEEP_ENABLED**                                           |                                                                                                                                                                                                                                 |
     * | **SPLREG_DEFAULT_SPOOL_DIRECTORY**                               |                                                                                                                                                                                                                                 |
     * | **SPLREG_EVENT_LOG**                                              |                                                                                                                                                                                                                                 |
     * | **SPLREG_NET_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
     * | **SPLREG_PORT_THREAD_PRIORITY_DEFAULT**                         |                                                                                                                                                                                                                                 |
     * | **SPLREG_PORT_THREAD_PRIORITY**                                  |                                                                                                                                                                                                                                 |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_TIME_BEFORE_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_MAX_OBJECTS_BEFORE_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_IDLE_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_EXECUTION_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_PRINT_DRIVER_ISOLATION_OVERRIDE_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
     * | **SPLREG_RETRY_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
     * | **SPLREG_SCHEDULER_THREAD_PRIORITY**                             |                                                                                                                                                                                                                                 |
     * | **SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT**                    |                                                                                                                                                                                                                                 |
     * | **SPLREG_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
     * 
     * 
     * 
     *  
     * 
     * Passing one of the following predefined values as *pValueName* sets the pool printing behavior when an error occurs.
     * 
     * 
     * 
     * | Value                                       | Comments                                                                                                                                                                                              |
     * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **SPLREG_RESTART_JOB_ON_POOL_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG_RESTART_JOB_ON_POOL_ENABLED**.<br/> |
     * | **SPLREG_RESTART_JOB_ON_POOL_ENABLED** | A nonzero value in *pData* indicates that **SPLREG_RESTART_JOB_ON_POOL_ERROR** is enabled.<br/>                                                                                            |
     * 
     * 
     * 
     *  
     * 
     * The time specified in **SPLREG_RESTART_JOB_ON_POOL_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
     * 
     * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
     * 
     * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
     * 
     * 
     * 
     * | Port monitor setting     | Data type      | Meaning                                                                                                        |
     * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
     * | **StatusUpdateEnabled**  | **REG_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
     * | **StatusUpdateInterval** | **REG_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
     * 
     * 
     * 
     *  
     * 
     * To ensure that the spooler redirects jobs to the next available printer in the pool (when the print job is not printed within the set time), the port monitor must support SNMP and the network ports in the pool must be configured as "SNMP status enabled." The port monitor that supports SNMP is Standard TCP/IP port monitor.
     * 
     * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of print jobs can be configured by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
     * 
     * 
     * 
     * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
     * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EMFDespoolingSetting**     | **REG_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
     * | **ForceClientSideRendering** | **REG_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pKeyName A pointer to a null-terminated string that specifies the key containing the value to set. If the specified key or subkeys do not exist, the function creates them.
     * 
     * To store configuration data that can be published in the directory service (DS), specify one of the following predefined registry keys.
     * 
     * 
     * 
     * | Value                                                                                                                                                                      | Meaning                                                                                         |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
     * | <span id="SPLDS_DRIVER_KEY"></span><span id="splds_driver_key"></span><dl> <dt>**SPLDS_DRIVER_KEY**</dt> </dl>    | Printer drivers use this key to store driver properties.<br/>                             |
     * | <span id="SPLDS_SPOOLER_KEY"></span><span id="splds_spooler_key"></span><dl> <dt>**SPLDS_SPOOLER_KEY**</dt> </dl> | Reserved. Used only by the print spooler to store internal spooler properties.<br/>       |
     * | <span id="SPLDS_USER_KEY"></span><span id="splds_user_key"></span><dl> <dt>**SPLDS_USER_KEY**</dt> </dl>          | Applications use this key to store printer properties such as printer asset numbers.<br/> |
     * 
     * 
     * 
     *  
     * 
     * Values that are stored under the SPLDS_USER_KEY key are published in the directory service only if there is a corresponding property in the schema. A domain administrator must create the property if it doesn't already exist. To publish a user-defined property after you use **SetPrinterDataEx** to add or change a value, call [**SetPrinter**](setprinter.md) with *Level* = 7 and with the **dwAction** member of [**PRINTER_INFO_7**](printer-info-7.md) set to **DSPRINT_UPDATE**.
     * 
     * You can specify other keys to store non-DS configuration data. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
     * 
     * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **SetPrinterDataEx** returns **ERROR_INVALID_PARAMETER**.
     * 
     * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
     * 
     * Do not use **SPLDS_SPOOLER_KEY**. To change the spooler printer properties, use [**SetPrinter**](setprinter.md) with *Level* = 2.
     * @param {Pointer<Char>} pValueName A pointer to a null-terminated string that identifies the data to set.
     * 
     * For printers, this string specifies the name of a value under the *pKeyName* key.
     * 
     * For print servers, this string is one of the predefined strings listed in the following Remarks section.
     * @param {Integer} Type A code indicating the type of data pointed to by the *pData* parameter. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
     * 
     * If *pKeyName* specifies one of the predefined directory service keys, *Type* must be **REG_SZ**, **REG_MULTI_SZ**, **REG_DWORD**, or **REG_BINARY**. If **REG_BINARY** is used, *cbData* must be equal to 1, and the directory service treats the data as a Boolean value.
     * @param {Pointer} pData A pointer to a buffer that contains the printer configuration data.
     * @param {Integer} cbData The size, in bytes, of the array.
     * @returns {Integer} If the function succeeds, the return value is **ERROR_SUCCESS**.
     * 
     * If the function fails, the return value is an error value.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdataex
     */
    static SetPrinterDataExW(hPrinter, pKeyName, pValueName, Type, pData, cbData) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\SetPrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * The DeletePrinterData function deletes specified configuration data for a printer. A printers configuration data consists of a set of named and typed values. The DeletePrinterData function deletes one of these values, specified by its value name.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer whose configuration data is to be deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pValueName A pointer to the null-terminated name of the configuration data value to be deleted.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdata
     */
    static DeletePrinterDataA(hPrinter, pValueName) {
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\DeletePrinterDataA", "ptr", hPrinter, "ptr", pValueName, "uint")
        return result
    }

    /**
     * The DeletePrinterData function deletes specified configuration data for a printer. A printers configuration data consists of a set of named and typed values. The DeletePrinterData function deletes one of these values, specified by its value name.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer whose configuration data is to be deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pValueName A pointer to the null-terminated name of the configuration data value to be deleted.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdata
     */
    static DeletePrinterDataW(hPrinter, pValueName) {
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\DeletePrinterDataW", "ptr", hPrinter, "ptr", pValueName, "uint")
        return result
    }

    /**
     * The DeletePrinterDataEx function deletes a specified value from the configuration data for a printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function deletes a value. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pKeyName A pointer to a null-terminated string that specifies the key containing the value to delete. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
     * 
     * If *pKeyName* is **NULL** or an empty string, **DeletePrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
     * @param {Pointer<Byte>} pValueName A pointer to a null-terminated string that specifies the name of the value to delete.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdataex
     */
    static DeletePrinterDataExA(hPrinter, pKeyName, pValueName) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\DeletePrinterDataExA", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint")
        return result
    }

    /**
     * The DeletePrinterDataEx function deletes a specified value from the configuration data for a printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function deletes a value. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pKeyName A pointer to a null-terminated string that specifies the key containing the value to delete. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
     * 
     * If *pKeyName* is **NULL** or an empty string, **DeletePrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
     * @param {Pointer<Char>} pValueName A pointer to a null-terminated string that specifies the name of the value to delete.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdataex
     */
    static DeletePrinterDataExW(hPrinter, pKeyName, pValueName) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName
        pValueName := pValueName is String? StrPtr(pValueName) : pValueName

        result := DllCall("winspool.drv\DeletePrinterDataExW", "ptr", hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint")
        return result
    }

    /**
     * The DeletePrinterKey function deletes a specified key and all its subkeys for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function deletes a key. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pKeyName A pointer to a null-terminated string that specifies the key to delete. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys.
     * 
     * If *pKeyName* is an empty string (""), **DeletePrinterKey** deletes all keys below the top-level key for the printer. If *pKeyName* is **NULL**, **DeletePrinterKey** returns ERROR\_INVALID\_PARAMETER.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterkey
     */
    static DeletePrinterKeyA(hPrinter, pKeyName) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName

        result := DllCall("winspool.drv\DeletePrinterKeyA", "ptr", hPrinter, "ptr", pKeyName, "uint")
        return result
    }

    /**
     * The DeletePrinterKey function deletes a specified key and all its subkeys for a specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the function deletes a key. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pKeyName A pointer to a null-terminated string that specifies the key to delete. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys.
     * 
     * If *pKeyName* is an empty string (""), **DeletePrinterKey** deletes all keys below the top-level key for the printer. If *pKeyName* is **NULL**, **DeletePrinterKey** returns ERROR\_INVALID\_PARAMETER.
     * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterkey
     */
    static DeletePrinterKeyW(hPrinter, pKeyName) {
        pKeyName := pKeyName is String? StrPtr(pKeyName) : pKeyName

        result := DllCall("winspool.drv\DeletePrinterKeyW", "ptr", hPrinter, "ptr", pKeyName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static WaitForPrinterChange(hPrinter, Flags) {
        result := DllCall("winspool.drv\WaitForPrinterChange", "ptr", hPrinter, "uint", Flags, "uint")
        return result
    }

    /**
     * The FindFirstPrinterChangeNotification function creates a change notification object and returns a handle to the object. You can then use this handle in a call to one of the wait functions to monitor changes to the printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * To monitor a printer or print server, call the **FindFirstPrinterChangeNotification** function, then use the returned change notification object handle in a call to one of the [wait functions](/windows/desktop/Sync/wait-functions). A wait operation on a change notification object is satisfied when the change notification object enters the signaled state. The system signals the object when one or more of the changes specified by *fdwFilter* or *pPrinterNotifyOptions* occurs in the monitored printer or print server.
     * 
     * When you call **FindFirstPrinterChangeNotification**, either *fdwFilter* must be nonzero or *pPrinterNotifyOptions* must be non-**NULL**. If both are specified, notifications will occur for both.
     * 
     * When a wait operation on a printer change notification object is satisfied, call the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function to determine the cause of the notification. For a condition specified by *fdwFilter*, **FindNextPrinterChangeNotification** reports the condition or conditions that changed. For a printer information field specified by *pPrinterNotifyOptions*, **FindNextPrinterChangeNotification** reports the field or fields that changed as well as the new information for these fields. **FindNextPrinterChangeNotification** also resets the change notification object to the nonsignaled state so you can use it in another wait operation to continue monitoring the printer or print server.
     * 
     * With one exception, do not call the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function if the change notification object is not in the signaled state. If the wait function returns the value WAIT\_TIMEOUT, the change object is not in the signaled state. Call the **FindNextPrinterChangeNotification** function only if the wait function succeeds without timing out. The exception is when **FindNextPrinterChangeNotification** is called with the PRINTER\_NOTIFY\_OPTIONS\_REFRESH bit set in the *pPrinterNotifyOptions* parameter.
     * 
     * When you no longer need the change notification object, close it by calling the [**FindClosePrinterChangeNotification**](findcloseprinterchangenotification.md) function.
     * 
     * Callers of **FindFirstPrinterChangeNotification** must ensure that the printer handle passed into **FindFirstPrinterChangeNotification** remains valid until [**FindClosePrinterChangeNotification**](findcloseprinterchangenotification.md) is called. If the printer handle is closed before the printer change notification handle, further notifications will fail to be delivered.
     * 
     * **FindFirstPrinterChangeNotification** will not send change notifications for 3D printers to server handles.
     * 
     * > [!Note]  
     * > In Windows XP with Service Pack 2 (SP2) and later, the Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If a user makes a printer connection to another machine, and the exception is not enabled, then the user will not receive printer change notifications from the server. A machine admin will have to enable exception.
     * @param {Pointer<Void>} hPrinter A handle to the printer or print server that you want to monitor. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} fdwFilter The conditions that will cause the change notification object to enter a signaled state. A change notification occurs when one or more of the specified conditions are met. The *fdwFilter* parameter can be zero if *pPrinterNotifyOptions* is non-**NULL**.
     * 
     * This parameter can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                              | Meaning                                                                                                                                                                                                                                                                                                                                                                      |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="PRINTER_CHANGE_FORM"></span><span id="printer_change_form"></span><dl> <dt>**PRINTER\_CHANGE\_FORM**</dt> </dl>                                   | Notify of any changes to a form. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_FORM</dd> <dd>PRINTER\_CHANGE\_SET\_FORM</dd> <dd>PRINTER\_CHANGE\_DELETE\_FORM</dd> </dl>                                                                              |
     * | <span id="PRINTER_CHANGE_JOB"></span><span id="printer_change_job"></span><dl> <dt>**PRINTER\_CHANGE\_JOB**</dt> </dl>                                      | Notify of any changes to a job. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_JOB</dd> <dd>PRINTER\_CHANGE\_SET\_JOB</dd> <dd>PRINTER\_CHANGE\_DELETE\_JOB</dd> <dd>PRINTER\_CHANGE\_WRITE\_JOB</dd> </dl>                                  |
     * | <span id="PRINTER_CHANGE_PORT"></span><span id="printer_change_port"></span><dl> <dt>**PRINTER\_CHANGE\_PORT**</dt> </dl>                                   | Notify of any changes to a port. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PORT</dd> <dd>PRINTER\_CHANGE\_CONFIGURE\_PORT </dd> <dd>PRINTER\_CHANGE\_DELETE\_PORT</dd> </dl>                                                                       |
     * | <span id="PRINTER_CHANGE_PRINT_PROCESSOR"></span><span id="printer_change_print_processor"></span><dl> <dt>**PRINTER\_CHANGE\_PRINT\_PROCESSOR**</dt> </dl> | Notify of any changes to a print processor. You can set this general flag or one or more of the following specific flags: <br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PRINT\_PROCESSOR </dd> <dd>PRINTER\_CHANGE\_DELETE\_PRINT\_PROCESSOR</dd> </dl>                                                                                        |
     * | <span id="PRINTER_CHANGE_PRINTER"></span><span id="printer_change_printer"></span><dl> <dt>**PRINTER\_CHANGE\_PRINTER**</dt> </dl>                          | Notify of any changes to a printer. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PRINTER</dd> <dd>PRINTER\_CHANGE\_SET\_PRINTER</dd> <dd>PRINTER\_CHANGE\_DELETE\_PRINTER</dd> <dd>PRINTER\_CHANGE\_FAILED\_CONNECTION\_PRINTER</dd> </dl> |
     * | <span id="PRINTER_CHANGE_PRINTER_DRIVER"></span><span id="printer_change_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_PRINTER\_DRIVER**</dt> </dl>    | Notify of any changes to a printer driver. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PRINTER\_DRIVER</dd> <dd>PRINTER\_CHANGE\_SET\_PRINTER\_DRIVER</dd> <dd>PRINTER\_CHANGE\_DELETE\_PRINTER\_DRIVER</dd> </dl>                                   |
     * | <span id="PRINTER_CHANGE_ALL"></span><span id="printer_change_all"></span><dl> <dt>**PRINTER\_CHANGE\_ALL**</dt> </dl>                                      | Notify if any of the preceding changes occur.<br/>                                                                                                                                                                                                                                                                                                                     |
     * | <span id="PRINTER_CHANGE_SERVER"></span><span id="printer_change_server"></span><dl> <dt>**PRINTER\_CHANGE\_SERVER**</dt> </dl>                             | Windows 7: Notify of any changes to the server.<br/> This flag is not included in the changes monitored by setting the **PRINTER\_CHANGE\_ALL** value.<br/>                                                                                                                                                                                                      |
     * 
     * 
     * 
     *  
     * 
     * For descriptions of the more specific flags in the preceding table, see the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function.
     * @param {Integer} fdwOptions The flag that determines the category of printers for which notifications will work.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                               | Meaning                                                                                                                                      |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="PRINTER_NOTIFY_CATEGORY_ALL"></span><span id="printer_notify_category_all"></span><dl> <dt>**PRINTER\_NOTIFY\_CATEGORY\_ALL**</dt> <dt>0x001000</dt> </dl> | [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) returns notifications for both 2D and 3D printers.<br/> |
     * | <span id="PRINTER_NOTIFY_CATEGORY_3D"></span><span id="printer_notify_category_3d"></span><dl> <dt>**PRINTER\_NOTIFY\_CATEGORY\_3D**</dt> <dt>0x002000</dt> </dl>    | [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) returns notifications only for 3D printers.<br/>        |
     * 
     * 
     * 
     *  
     * 
     * When this flag is set to zero (0), **FindFirstPrinterChangeNotification** will only work for 2D printers. This is the default value.
     * @param {Pointer<Void>} pPrinterNotifyOptions A pointer to a [**PRINTER\_NOTIFY\_OPTIONS**](printer-notify-options.md) structure. The **pTypes** member of this structure is an array of one or more [**PRINTER\_NOTIFY\_OPTIONS\_TYPE**](printer-notify-options-type.md) structures, each of which specifies a printer information field to monitor. A change notification occurs when one or more of the specified fields changes. When a change occurs, the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function can retrieve the new printer information. This parameter can be **NULL** if *fdwFilter* is nonzero.
     * 
     * For a list of fields that can be monitored, see [**PRINTER\_NOTIFY\_OPTIONS\_TYPE**](printer-notify-options-type.md).
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to a change notification object associated with the specified printer or print server.
     * 
     * If the function fails, the return value is INVALID\_HANDLE\_VALUE.
     * @see https://learn.microsoft.com/windows/win32/printdocs/findfirstprinterchangenotification
     */
    static FindFirstPrinterChangeNotification(hPrinter, fdwFilter, fdwOptions, pPrinterNotifyOptions) {
        result := DllCall("winspool.drv\FindFirstPrinterChangeNotification", "ptr", hPrinter, "uint", fdwFilter, "uint", fdwOptions, "ptr", pPrinterNotifyOptions)
        return result
    }

    /**
     * The FindNextPrinterChangeNotification function retrieves information about the most recent change notification for a change notification object associated with a printer or print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * Call the **FindNextPrinterChangeNotification** function after a wait operation on a notification object created by [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) has been satisfied. Calling **FindNextPrinterChangeNotification** lets you obtain information about the change that satisfied the wait operation, and resets the notification object so it can be signaled when the next change occurs.
     * 
     * With one exception, do not call the **FindNextPrinterChangeNotification** function if the change notification object is not in the signaled state. If a wait function returns the value **WAIT\_TIMEOUT**, the change object is not in the signaled state. Call the **FindNextPrinterChangeNotification** function only if the wait function succeeds without timing out. The exception is when **FindNextPrinterChangeNotification** is called with the **PRINTER\_NOTIFY\_OPTIONS\_REFRESH** bit set in the *pPrinterNotifyOptions* parameter. Note that even when this flag is set, it is still possible for the **PRINTER\_NOTIFY\_INFO\_DISCARDED** flag to be set in the *ppPrinterNotifyInfo* parameter.
     * 
     * To continue monitoring the printer or print server for changes, repeat the cycle of calling one of the [wait functions](/windows/desktop/Sync/wait-functions) , and then calling the **FindNextPrinterChangeNotification** function to examine the change and reset the notification object.
     * 
     * **FindNextPrinterChangeNotification** may combine multiple changes to the same printer information field into a single notification. When this occurs, the function typically collapses all changes for the field into a single entry in the array of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structures in *ppPrinterNotifyInfo*; the single entry reports only the most current information. However, for some job and printer information fields, the function can return multiple array entries for the same field. In this case, the last array entry for the field reports the current data, and the earlier entries contain the data for the intermediate stages.
     * 
     * When you no longer need the change notification object, close it by calling the [**FindClosePrinterChangeNotification**](findcloseprinterchangenotification.md) function.
     * 
     * > [!Note]  
     * > In Windows XP with Service Pack 2 (SP2) and later, the Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If a user makes a printer connection to another machine, and the exception is not enabled, then the user will not receive printer change notifications from the server. A machine admin will have to enable exception.
     * @param {Pointer<Void>} hChange A handle to a change notification object associated with a printer or print server. You obtain such a handle by calling the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function. The operating system sets this change notification object to the signaled state when it detects one of the changes specified in the object's change notification filter.
     * @param {Pointer<UInt32>} pdwChange A pointer to a variable whose bits are set to indicate the changes that occurred to cause the most recent notification. The bit flags that might be set correspond to those specified in the *fdwFilter* parameter of the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) call. The system sets one or more of the following bit flags.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                             | Meaning                                                   |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|
     * | <span id="PRINTER_CHANGE_ADD_FORM"></span><span id="printer_change_add_form"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_FORM**</dt> </dl>                                                     | A form was added to the server.<br/>                |
     * | <span id="PRINTER_CHANGE_ADD_JOB"></span><span id="printer_change_add_job"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_JOB**</dt> </dl>                                                        | A print job was sent to the printer.<br/>           |
     * | <span id="PRINTER_CHANGE_ADD_PORT"></span><span id="printer_change_add_port"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PORT**</dt> </dl>                                                     | A port or monitor was added to the server.<br/>     |
     * | <span id="PRINTER_CHANGE_ADD_PRINT_PROCESSOR"></span><span id="printer_change_add_print_processor"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PRINT\_PROCESSOR**</dt> </dl>                   | A print processor was added to the server.<br/>     |
     * | <span id="PRINTER_CHANGE_ADD_PRINTER"></span><span id="printer_change_add_printer"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PRINTER**</dt> </dl>                                            | A printer was added to the server.<br/>             |
     * | <span id="PRINTER_CHANGE_ADD_PRINTER_DRIVER"></span><span id="printer_change_add_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PRINTER\_DRIVER**</dt> </dl>                      | A printer driver was added to the server.<br/>      |
     * | <span id="PRINTER_CHANGE_CONFIGURE_PORT"></span><span id="printer_change_configure_port"></span><dl> <dt>**PRINTER\_CHANGE\_CONFIGURE\_PORT**</dt> </dl>                                   | A port was configured on the server.<br/>           |
     * | <span id="PRINTER_CHANGE_DELETE_FORM"></span><span id="printer_change_delete_form"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_FORM**</dt> </dl>                                            | A form was deleted from the server.<br/>            |
     * | <span id="PRINTER_CHANGE_DELETE_JOB"></span><span id="printer_change_delete_job"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_JOB**</dt> </dl>                                               | A job was deleted.<br/>                             |
     * | <span id="PRINTER_CHANGE_DELETE_PORT"></span><span id="printer_change_delete_port"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PORT**</dt> </dl>                                            | A port or monitor was deleted from the server.<br/> |
     * | <span id="PRINTER_CHANGE_DELETE_PRINT_PROCESSOR"></span><span id="printer_change_delete_print_processor"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PRINT\_PROCESSOR**</dt> </dl>          | A print processor was deleted from the server.<br/> |
     * | <span id="PRINTER_CHANGE_DELETE_PRINTER"></span><span id="printer_change_delete_printer"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PRINTER**</dt> </dl>                                   | A printer was deleted.<br/>                         |
     * | <span id="PRINTER_CHANGE_DELETE_PRINTER_DRIVER"></span><span id="printer_change_delete_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PRINTER\_DRIVER**</dt> </dl>             | A printer driver was deleted from the server.<br/>  |
     * | <span id="PRINTER_CHANGE_FAILED_CONNECTION_PRINTER"></span><span id="printer_change_failed_connection_printer"></span><dl> <dt>**PRINTER\_CHANGE\_FAILED\_CONNECTION\_PRINTER**</dt> </dl> | A printer connection has failed.<br/>               |
     * | <span id="PRINTER_CHANGE_SET_FORM"></span><span id="printer_change_set_form"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_FORM**</dt> </dl>                                                     | A form was set on the server.<br/>                  |
     * | <span id="PRINTER_CHANGE_SET_JOB"></span><span id="printer_change_set_job"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_JOB**</dt> </dl>                                                        | A job was set.<br/>                                 |
     * | <span id="PRINTER_CHANGE_SET_PRINTER"></span><span id="printer_change_set_printer"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_PRINTER**</dt> </dl>                                            | A printer was set.<br/>                             |
     * | <span id="PRINTER_CHANGE_SET_PRINTER_DRIVER"></span><span id="printer_change_set_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_PRINTER\_DRIVER**</dt> </dl>                      | A printer driver was set.<br/>                      |
     * | <span id="PRINTER_CHANGE_WRITE_JOB"></span><span id="printer_change_write_job"></span><dl> <dt>**PRINTER\_CHANGE\_WRITE\_JOB**</dt> </dl>                                                  | Job data was written.<br/>                          |
     * | <span id="PRINTER_CHANGE_TIMEOUT"></span><span id="printer_change_timeout"></span><dl> <dt>**PRINTER\_CHANGE\_TIMEOUT**</dt> </dl>                                                         | The job timed out.<br/>                             |
     * | <span id="PRINTER_CHANGE_SERVER"></span><span id="printer_change_server"></span><dl> <dt>**PRINTER\_CHANGE\_SERVER**</dt> </dl>                                                            | Windows 7: A change occurred on the server.<br/>    |
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<Void>} ppPrinterNotifyInfo A pointer to a pointer variable that receives a pointer to a system-allocated, read-only buffer. Call the [**FreePrinterNotifyInfo**](freeprinternotifyinfo.md) function to free the buffer when you are finished with it. This parameter can be **NULL** if no information is required.
     * 
     * The buffer contains a [**PRINTER\_NOTIFY\_INFO**](printer-notify-info.md) structure, which contains an array of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structures. Each element of the array contains information about one of the fields specified in the *pPrinterNotifyOptions* parameter of the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) call. Typically, the function provides data only for the fields that changed to cause the most recent notification. However, if the structure pointed to by the *pPrinterNotifyOptions* parameter specifies **PRINTER\_NOTIFY\_OPTIONS\_REFRESH**, the function provides data for all monitored fields.
     * 
     * If the **PRINTER\_NOTIFY\_INFO\_DISCARDED** bit is set in the **Flags** member of the [**PRINTER\_NOTIFY\_INFO**](printer-notify-info.md) structure, an overflow or error occurred, and notifications may have been lost. In this case, no additional notifications will be sent until you make a second **FindNextPrinterChangeNotification** call that specifies **PRINTER\_NOTIFY\_OPTIONS\_REFRESH**.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/findnextprinterchangenotification
     */
    static FindNextPrinterChangeNotification(hChange, pdwChange, pvReserved, ppPrinterNotifyInfo) {
        result := DllCall("winspool.drv\FindNextPrinterChangeNotification", "ptr", hChange, "uint*", pdwChange, "ptr", pvReserved, "ptr", ppPrinterNotifyInfo, "int")
        return result
    }

    /**
     * The FreePrinterNotifyInfo function frees a system-allocated buffer created by the FindNextPrinterChangeNotification function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pPrinterNotifyInfo Pointer to a [**PRINTER\_NOTIFY\_INFO**](printer-notify-info.md) buffer returned from a call to the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function. **FreePrinterNotifyInfo** deallocates this buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/freeprinternotifyinfo
     */
    static FreePrinterNotifyInfo(pPrinterNotifyInfo) {
        result := DllCall("winspool.drv\FreePrinterNotifyInfo", "ptr", pPrinterNotifyInfo, "int")
        return result
    }

    /**
     * The FindClosePrinterChangeNotification function closes a change notification object created by calling the FindFirstPrinterChangeNotification function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * After calling the **FindClosePrinterChangeNotification** function, you cannot use the *hChange* handle in subsequent calls to either [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) or [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md).
     * @param {Pointer<Void>} hChange A handle to the change notification object to be closed. This is a handle created by calling the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/findcloseprinterchangenotification
     */
    static FindClosePrinterChangeNotification(hChange) {
        result := DllCall("winspool.drv\FindClosePrinterChangeNotification", "ptr", hChange, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} Error 
     * @param {Pointer<Void>} hWnd 
     * @param {Pointer<Byte>} pText 
     * @param {Pointer<Byte>} pCaption 
     * @param {Integer} dwType 
     * @returns {Integer} 
     */
    static PrinterMessageBoxA(hPrinter, Error, hWnd, pText, pCaption, dwType) {
        pText := pText is String? StrPtr(pText) : pText
        pCaption := pCaption is String? StrPtr(pCaption) : pCaption

        result := DllCall("winspool.drv\PrinterMessageBoxA", "ptr", hPrinter, "uint", Error, "ptr", hWnd, "ptr", pText, "ptr", pCaption, "uint", dwType, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} Error 
     * @param {Pointer<Void>} hWnd 
     * @param {Pointer<Char>} pText 
     * @param {Pointer<Char>} pCaption 
     * @param {Integer} dwType 
     * @returns {Integer} 
     */
    static PrinterMessageBoxW(hPrinter, Error, hWnd, pText, pCaption, dwType) {
        pText := pText is String? StrPtr(pText) : pText
        pCaption := pCaption is String? StrPtr(pCaption) : pCaption

        result := DllCall("winspool.drv\PrinterMessageBoxW", "ptr", hPrinter, "uint", Error, "ptr", hWnd, "ptr", pText, "ptr", pCaption, "uint", dwType, "uint")
        return result
    }

    /**
     * The ClosePrinter function closes the specified printer object.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * When the **ClosePrinter** function returns, the handle *hPrinter* is invalid, regardless of whether the function has succeeded or failed.
     * @param {Pointer<Void>} hPrinter A handle to the printer object to be closed. This handle is returned by the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/closeprinter
     */
    static ClosePrinter(hPrinter) {
        A_LastError := 0

        result := DllCall("winspool.drv\ClosePrinter", "ptr", hPrinter, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<Byte>} pForm 
     * @returns {Integer} 
     */
    static AddFormA(hPrinter, Level, pForm) {
        result := DllCall("winspool.drv\AddFormA", "ptr", hPrinter, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} Level 
     * @param {Pointer<Byte>} pForm 
     * @returns {Integer} 
     */
    static AddFormW(hPrinter, Level, pForm) {
        result := DllCall("winspool.drv\AddFormW", "ptr", hPrinter, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * The DeleteForm function removes a form name from the list of supported forms.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **DeleteForm** can only delete form names that were added by using the [**AddForm**](addform.md) function.
     * @param {Pointer<Void>} hPrinter Indicates the open printer handle that this function is to be performed upon. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pFormName Pointer to the form name to be removed.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteform
     */
    static DeleteFormA(hPrinter, pFormName) {
        pFormName := pFormName is String? StrPtr(pFormName) : pFormName

        result := DllCall("winspool.drv\DeleteFormA", "ptr", hPrinter, "ptr", pFormName, "int")
        return result
    }

    /**
     * The DeleteForm function removes a form name from the list of supported forms.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **DeleteForm** can only delete form names that were added by using the [**AddForm**](addform.md) function.
     * @param {Pointer<Void>} hPrinter Indicates the open printer handle that this function is to be performed upon. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pFormName Pointer to the form name to be removed.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteform
     */
    static DeleteFormW(hPrinter, pFormName) {
        pFormName := pFormName is String? StrPtr(pFormName) : pFormName

        result := DllCall("winspool.drv\DeleteFormW", "ptr", hPrinter, "ptr", pFormName, "int")
        return result
    }

    /**
     * The GetForm function retrieves information about a specified form.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) will always be STRING\_LANGPAIR.
     * @param {Pointer<Void>} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pFormName A pointer to a null-terminated string that specifies the name of the form. To get the names of the forms supported by the printer, call the [**EnumForms**](enumforms.md) function.
     * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
     * @param {Pointer} pForm A pointer to an array of bytes that receives the initialized [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
     * @param {Integer} cbBuf The size, in bytes, of the *pForm* array.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getform
     */
    static GetFormA(hPrinter, pFormName, Level, pForm, cbBuf, pcbNeeded) {
        pFormName := pFormName is String? StrPtr(pFormName) : pFormName

        result := DllCall("winspool.drv\GetFormA", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetForm function retrieves information about a specified form.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) will always be STRING\_LANGPAIR.
     * @param {Pointer<Void>} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pFormName A pointer to a null-terminated string that specifies the name of the form. To get the names of the forms supported by the printer, call the [**EnumForms**](enumforms.md) function.
     * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
     * @param {Pointer} pForm A pointer to an array of bytes that receives the initialized [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
     * @param {Integer} cbBuf The size, in bytes, of the *pForm* array.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getform
     */
    static GetFormW(hPrinter, pFormName, Level, pForm, cbBuf, pcbNeeded) {
        pFormName := pFormName is String? StrPtr(pFormName) : pFormName

        result := DllCall("winspool.drv\GetFormW", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The SetForm function sets the form information for the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **SetForm** can be called multiple times for an existing [**FORM\_INFO\_2**](form-info-2.md), each call adding additional pairs of **pDisplayName** and **wLangId** values. All languages versions of the form will get the **Size** and **ImageableArea** values of the **FORM\_INFO\_2** in the most recent call to **SetForm**.
     * 
     * If the caller is remote and the *Level* is 2, the **StringType** value of the [**FORM\_INFO\_2**](form-info-2.md) cannot be STRING\_MUIDLL.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the form information is set. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Byte>} pFormName A pointer to a null-terminated string that specifies the form name for which the form information is set.
     * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
     * @param {Pointer<Byte>} pForm A pointer to a [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setform
     */
    static SetFormA(hPrinter, pFormName, Level, pForm) {
        pFormName := pFormName is String? StrPtr(pFormName) : pFormName

        result := DllCall("winspool.drv\SetFormA", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * The SetForm function sets the form information for the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * **SetForm** can be called multiple times for an existing [**FORM\_INFO\_2**](form-info-2.md), each call adding additional pairs of **pDisplayName** and **wLangId** values. All languages versions of the form will get the **Size** and **ImageableArea** values of the **FORM\_INFO\_2** in the most recent call to **SetForm**.
     * 
     * If the caller is remote and the *Level* is 2, the **StringType** value of the [**FORM\_INFO\_2**](form-info-2.md) cannot be STRING\_MUIDLL.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the form information is set. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pFormName A pointer to a null-terminated string that specifies the form name for which the form information is set.
     * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
     * @param {Pointer<Byte>} pForm A pointer to a [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setform
     */
    static SetFormW(hPrinter, pFormName, Level, pForm) {
        pFormName := pFormName is String? StrPtr(pFormName) : pFormName

        result := DllCall("winspool.drv\SetFormW", "ptr", hPrinter, "ptr", pFormName, "uint", Level, "char*", pForm, "int")
        return result
    }

    /**
     * The EnumForms function enumerates the forms supported by the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) structures will always be **STRING\_LANGPAIR**.
     * 
     * In Windows Vista, the form data returned by **EnumForms** is retrieved from a local cache when *hPrinter* refers to a remote print server or a printer hosted by a print server and there is at least one open connection to a printer on the remote print server. In all other configurations, the form data is queried from the remote print server.
     * @param {Pointer<Void>} hPrinter Handle to the printer for which the forms should be enumerated. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level Specifies the version of the structure to which *pForm* points. This value must be 1 or 2.
     * @param {Pointer} pForm Pointer to one or more [**FORM\_INFO\_1**](form-info-1.md) structures or to one or more [**FORM\_INFO\_2**](form-info-2.md) structures. All the structures will have the same level.
     * @param {Integer} cbBuf Specifies the size, in bytes, of the buffer to which *pForm* points.
     * @param {Pointer<UInt32>} pcbNeeded Pointer to a variable that receives the number of bytes copied to the array to which *pForm* points (if the operation succeeds) or the number of bytes required (if it fails because *cbBuf* is too small).
     * @param {Pointer<UInt32>} pcReturned Pointer to a variable that receives the number of structures copied into the array to which *pForm* points.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumforms
     */
    static EnumFormsA(hPrinter, Level, pForm, cbBuf, pcbNeeded, pcReturned) {
        result := DllCall("winspool.drv\EnumFormsA", "ptr", hPrinter, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The EnumForms function enumerates the forms supported by the specified printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) structures will always be **STRING\_LANGPAIR**.
     * 
     * In Windows Vista, the form data returned by **EnumForms** is retrieved from a local cache when *hPrinter* refers to a remote print server or a printer hosted by a print server and there is at least one open connection to a printer on the remote print server. In all other configurations, the form data is queried from the remote print server.
     * @param {Pointer<Void>} hPrinter Handle to the printer for which the forms should be enumerated. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} Level Specifies the version of the structure to which *pForm* points. This value must be 1 or 2.
     * @param {Pointer} pForm Pointer to one or more [**FORM\_INFO\_1**](form-info-1.md) structures or to one or more [**FORM\_INFO\_2**](form-info-2.md) structures. All the structures will have the same level.
     * @param {Integer} cbBuf Specifies the size, in bytes, of the buffer to which *pForm* points.
     * @param {Pointer<UInt32>} pcbNeeded Pointer to a variable that receives the number of bytes copied to the array to which *pForm* points (if the operation succeeds) or the number of bytes required (if it fails because *cbBuf* is too small).
     * @param {Pointer<UInt32>} pcReturned Pointer to a variable that receives the number of structures copied into the array to which *pForm* points.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumforms
     */
    static EnumFormsW(hPrinter, Level, pForm, cbBuf, pcbNeeded, pcReturned) {
        result := DllCall("winspool.drv\EnumFormsW", "ptr", hPrinter, "uint", Level, "ptr", pForm, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The EnumMonitors function retrieves information about the port monitors installed on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the monitors reside. If this parameter is **NULL**, the local monitors are enumerated.
     * @param {Integer} Level The version of the structure pointed to by *pMonitors*.
     * 
     * This value can be 1 or 2.
     * @param {Pointer} pMonitor 
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pMonitors*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures that were returned in the buffer pointed to by *pMonitors*.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enummonitors
     */
    static EnumMonitorsA(pName, Level, pMonitor, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumMonitorsA", "ptr", pName, "uint", Level, "ptr", pMonitor, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The EnumMonitors function retrieves information about the port monitors installed on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the monitors reside. If this parameter is **NULL**, the local monitors are enumerated.
     * @param {Integer} Level The version of the structure pointed to by *pMonitors*.
     * 
     * This value can be 1 or 2.
     * @param {Pointer} pMonitor 
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pMonitors*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of structures that were returned in the buffer pointed to by *pMonitors*.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enummonitors
     */
    static EnumMonitorsW(pName, Level, pMonitor, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumMonitorsW", "ptr", pName, "uint", Level, "ptr", pMonitor, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The AddMonitor function installs a local port monitor and links the configuration, data, and monitor files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before an application calls the **AddMonitor** function, all files required by the monitor must be copied to the SYSTEM32 directory.
     * 
     * To determine the port monitors that are currently installed, call the [**EnumMonitors**](enummonitors.md) function.
     * 
     * To remove a monitor added by **AddMonitor**, call the [**DeleteMonitor**](deletemonitor.md) function.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the monitor should be installed. For systems that support only local installation of monitors, this string should be **NULL**.
     * @param {Integer} Level The version of the structure to which *pMonitors* points. This value must be 2.
     * @param {Pointer<Byte>} pMonitors A pointer to a [**MONITOR\_INFO\_2**](monitor-info-2.md) structure. If the **pEnvironment** member of the *pMonitors* structure is **NULL**, the current environment of the caller (client), not of the destination (server), is used.
     * 
     * Note that the call will fail if the environment does not match the environment of the server, that is, you can only add a monitor that was written for the architecture of the server.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addmonitor
     */
    static AddMonitorA(pName, Level, pMonitors) {
        pName := pName is String? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddMonitorA", "ptr", pName, "uint", Level, "char*", pMonitors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddMonitor function installs a local port monitor and links the configuration, data, and monitor files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * 
     * Before an application calls the **AddMonitor** function, all files required by the monitor must be copied to the SYSTEM32 directory.
     * 
     * To determine the port monitors that are currently installed, call the [**EnumMonitors**](enummonitors.md) function.
     * 
     * To remove a monitor added by **AddMonitor**, call the [**DeleteMonitor**](deletemonitor.md) function.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the monitor should be installed. For systems that support only local installation of monitors, this string should be **NULL**.
     * @param {Integer} Level The version of the structure to which *pMonitors* points. This value must be 2.
     * @param {Pointer<Byte>} pMonitors A pointer to a [**MONITOR\_INFO\_2**](monitor-info-2.md) structure. If the **pEnvironment** member of the *pMonitors* structure is **NULL**, the current environment of the caller (client), not of the destination (server), is used.
     * 
     * Note that the call will fail if the environment does not match the environment of the server, that is, you can only add a monitor that was written for the architecture of the server.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addmonitor
     */
    static AddMonitorW(pName, Level, pMonitors) {
        pName := pName is String? StrPtr(pName) : pName

        A_LastError := 0

        result := DllCall("winspool.drv\AddMonitorW", "ptr", pName, "uint", Level, "char*", pMonitors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The DeleteMonitor function removes a port monitor added by the AddMonitor function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server from which the monitor is to be removed. If this parameter is **NULL**, the port monitor is removed locally.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the monitor is to be removed (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the monitor is removed from the current environment of the calling application and client machine (not of the destination application and print server).
     * @param {Pointer<Byte>} pMonitorName A pointer to a null-terminated string that specifies the name of the monitor to be removed.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deletemonitor
     */
    static DeleteMonitorA(pName, pEnvironment, pMonitorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pMonitorName := pMonitorName is String? StrPtr(pMonitorName) : pMonitorName

        A_LastError := 0

        result := DllCall("winspool.drv\DeleteMonitorA", "ptr", pName, "ptr", pEnvironment, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The DeleteMonitor function removes a port monitor added by the AddMonitor function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller must have [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server from which the monitor is to be removed. If this parameter is **NULL**, the port monitor is removed locally.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the monitor is to be removed (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the monitor is removed from the current environment of the calling application and client machine (not of the destination application and print server).
     * @param {Pointer<Char>} pMonitorName A pointer to a null-terminated string that specifies the name of the monitor to be removed.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deletemonitor
     */
    static DeleteMonitorW(pName, pEnvironment, pMonitorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pMonitorName := pMonitorName is String? StrPtr(pMonitorName) : pMonitorName

        A_LastError := 0

        result := DllCall("winspool.drv\DeleteMonitorW", "ptr", pName, "ptr", pEnvironment, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumPorts function enumerates the ports that are available for printing on a specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **EnumPorts** function can succeed even if the server specified by *pName* does not have a printer defined.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server whose printer ports you want to enumerate.
     * 
     * If *pName* is **NULL**, the function enumerates the local machine's printer ports.
     * @param {Integer} Level The type of information returned in the *pPorts* buffer. If *Level* is 1, *pPorts* receives an array of [**PORT\_INFO\_1**](port-info-1.md) structures. If *Level* is 2, *pPorts* receives an array of [**PORT\_INFO\_2**](port-info-2.md) structures.
     * @param {Pointer} pPort 
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPorts*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPorts* buffer. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of [**PORT\_INFO\_1**](port-info-1.md) or [**PORT\_INFO\_2**](port-info-2.md) structures returned in the *pPorts* buffer. This is the number of printer ports that are available on the specified server.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumports
     */
    static EnumPortsA(pName, Level, pPort, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumPortsA", "ptr", pName, "uint", Level, "ptr", pPort, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The EnumPorts function enumerates the ports that are available for printing on a specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **EnumPorts** function can succeed even if the server specified by *pName* does not have a printer defined.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server whose printer ports you want to enumerate.
     * 
     * If *pName* is **NULL**, the function enumerates the local machine's printer ports.
     * @param {Integer} Level The type of information returned in the *pPorts* buffer. If *Level* is 1, *pPorts* receives an array of [**PORT\_INFO\_1**](port-info-1.md) structures. If *Level* is 2, *pPorts* receives an array of [**PORT\_INFO\_2**](port-info-2.md) structures.
     * @param {Pointer} pPort 
     * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPorts*.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPorts* buffer. If the buffer is too small, the function fails and the variable receives the number of bytes required.
     * @param {Pointer<UInt32>} pcReturned A pointer to a variable that receives the number of [**PORT\_INFO\_1**](port-info-1.md) or [**PORT\_INFO\_2**](port-info-2.md) structures returned in the *pPorts* buffer. This is the number of printer ports that are available on the specified server.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumports
     */
    static EnumPortsW(pName, Level, pPort, cbBuf, pcbNeeded, pcReturned) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\EnumPortsW", "ptr", pName, "uint", Level, "ptr", pPort, "uint", cbBuf, "uint*", pcbNeeded, "uint*", pcReturned, "int")
        return result
    }

    /**
     * The AddPort function adds the name of a port to the list of supported ports. The AddPort function is exported by the port monitor.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **AddPort** function browses the network to find existing ports, and displays a dialog box for the user. The **AddPort** function should validate the port name entered by the user by calling [**EnumPorts**](enumports.md) to ensure that no duplicate names exist.
     * 
     * The caller of the **AddPort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * 
     * To add a port without displaying a dialog box, call the **XcvData** function instead of **AddPort**. For more information about **XcvData**, see the Microsoft Windows Driver Development Kit (DDK).
     * @param {Pointer<Byte>} pName A pointer to a zero-terminated string that specifies the name of the server to which the port is connected. If this parameter is **NULL**, the port is local.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the **AddPort** dialog box.
     * @param {Pointer<Byte>} pMonitorName A pointer to a zero-terminated string that specifies the monitor associated with the port.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addport
     */
    static AddPortA(pName, hWnd, pMonitorName) {
        pName := pName is String? StrPtr(pName) : pName
        pMonitorName := pMonitorName is String? StrPtr(pMonitorName) : pMonitorName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPortA", "ptr", pName, "ptr", hWnd, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddPort function adds the name of a port to the list of supported ports. The AddPort function is exported by the port monitor.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **AddPort** function browses the network to find existing ports, and displays a dialog box for the user. The **AddPort** function should validate the port name entered by the user by calling [**EnumPorts**](enumports.md) to ensure that no duplicate names exist.
     * 
     * The caller of the **AddPort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * 
     * To add a port without displaying a dialog box, call the **XcvData** function instead of **AddPort**. For more information about **XcvData**, see the Microsoft Windows Driver Development Kit (DDK).
     * @param {Pointer<Char>} pName A pointer to a zero-terminated string that specifies the name of the server to which the port is connected. If this parameter is **NULL**, the port is local.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the **AddPort** dialog box.
     * @param {Pointer<Char>} pMonitorName A pointer to a zero-terminated string that specifies the monitor associated with the port.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addport
     */
    static AddPortW(pName, hWnd, pMonitorName) {
        pName := pName is String? StrPtr(pName) : pName
        pMonitorName := pMonitorName is String? StrPtr(pMonitorName) : pMonitorName

        A_LastError := 0

        result := DllCall("winspool.drv\AddPortW", "ptr", pName, "ptr", hWnd, "ptr", pMonitorName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The ConfigurePort function displays the port-configuration dialog box for a port on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * Before calling the **ConfigurePort** function, an application should call the [**EnumPorts**](enumports.md) function to determine valid port names.
     * @param {Pointer<Byte>} pName Pointer to a null-terminated string that specifies the name of the server on which the specified port exists. If this parameter is **NULL**, the port is local.
     * @param {Pointer<Void>} hWnd Handle to the parent window of the port-configuration dialog box.
     * @param {Pointer<Byte>} pPortName Pointer to a null-terminated string that specifies the name of the port to be configured.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/configureport
     */
    static ConfigurePortA(pName, hWnd, pPortName) {
        pName := pName is String? StrPtr(pName) : pName
        pPortName := pPortName is String? StrPtr(pPortName) : pPortName

        result := DllCall("winspool.drv\ConfigurePortA", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        return result
    }

    /**
     * The ConfigurePort function displays the port-configuration dialog box for a port on the specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * Before calling the **ConfigurePort** function, an application should call the [**EnumPorts**](enumports.md) function to determine valid port names.
     * @param {Pointer<Char>} pName Pointer to a null-terminated string that specifies the name of the server on which the specified port exists. If this parameter is **NULL**, the port is local.
     * @param {Pointer<Void>} hWnd Handle to the parent window of the port-configuration dialog box.
     * @param {Pointer<Char>} pPortName Pointer to a null-terminated string that specifies the name of the port to be configured.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/configureport
     */
    static ConfigurePortW(pName, hWnd, pPortName) {
        pName := pName is String? StrPtr(pName) : pName
        pPortName := pPortName is String? StrPtr(pPortName) : pPortName

        result := DllCall("winspool.drv\ConfigurePortW", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        return result
    }

    /**
     * The DeletePort function displays a dialog box that allows the user to delete a port name.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * An application can retrieve the names of valid ports by calling the [**EnumPorts**](enumports.md) function.
     * 
     * The **DeletePort** function returns an error if a printer is currently connected to the specified port.
     * 
     * The caller of the **DeletePort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * @param {Pointer<Byte>} pName A pointer to a zero-terminated string that specifies the name of the server for which the port should be deleted. If this parameter is **NULL**, a local port is deleted.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the port-deletion dialog box.
     * @param {Pointer<Byte>} pPortName A pointer to a zero-terminated string that specifies the name of the port that should be deleted.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteport
     */
    static DeletePortA(pName, hWnd, pPortName) {
        pName := pName is String? StrPtr(pName) : pName
        pPortName := pPortName is String? StrPtr(pPortName) : pPortName

        A_LastError := 0

        result := DllCall("winspool.drv\DeletePortA", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The DeletePort function displays a dialog box that allows the user to delete a port name.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * An application can retrieve the names of valid ports by calling the [**EnumPorts**](enumports.md) function.
     * 
     * The **DeletePort** function returns an error if a printer is currently connected to the specified port.
     * 
     * The caller of the **DeletePort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * @param {Pointer<Char>} pName A pointer to a zero-terminated string that specifies the name of the server for which the port should be deleted. If this parameter is **NULL**, a local port is deleted.
     * @param {Pointer<Void>} hWnd A handle to the parent window of the port-deletion dialog box.
     * @param {Pointer<Char>} pPortName A pointer to a zero-terminated string that specifies the name of the port that should be deleted.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteport
     */
    static DeletePortW(pName, hWnd, pPortName) {
        pName := pName is String? StrPtr(pName) : pName
        pPortName := pPortName is String? StrPtr(pPortName) : pPortName

        A_LastError := 0

        result := DllCall("winspool.drv\DeletePortW", "ptr", pName, "ptr", hWnd, "ptr", pPortName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hXcv 
     * @param {Pointer<Char>} pszDataName 
     * @param {Pointer} pInputData 
     * @param {Integer} cbInputData 
     * @param {Pointer} pOutputData 
     * @param {Integer} cbOutputData 
     * @param {Pointer<UInt32>} pcbOutputNeeded 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {Integer} 
     */
    static XcvDataW(hXcv, pszDataName, pInputData, cbInputData, pOutputData, cbOutputData, pcbOutputNeeded, pdwStatus) {
        pszDataName := pszDataName is String? StrPtr(pszDataName) : pszDataName

        result := DllCall("winspool.drv\XcvDataW", "ptr", hXcv, "ptr", pszDataName, "ptr", pInputData, "uint", cbInputData, "ptr", pOutputData, "uint", cbOutputData, "uint*", pcbOutputNeeded, "uint*", pdwStatus, "int")
        return result
    }

    /**
     * The GetDefaultPrinter function retrieves the printer name of the default printer for the current user on the local computer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pszBuffer A pointer to a buffer that receives a null-terminated character string containing the default printer name. If this parameter is **NULL**, the function fails and the variable pointed to by *pcchBuffer* returns the required buffer size, in characters.
     * @param {Pointer<UInt32>} pcchBuffer On input, specifies the size, in characters, of the *pszBuffer* buffer. On output, receives the size, in characters, of the printer name string, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value and the variable pointed to by *pcchBuffer* contains the number of characters copied to the *pszBuffer* buffer, including the terminating null character.
     * 
     * If the function fails, the return value is zero.
     * 
     * 
     * 
     * | Value                       | Meaning                                                                                                                        |
     * |-----------------------------|--------------------------------------------------------------------------------------------------------------------------------|
     * | ERROR\_INSUFFICIENT\_BUFFER | The *pszBuffer* buffer is too small. The variable pointed to by *pcchBuffer* contains the required buffer size, in characters. |
     * | ERROR\_FILE\_NOT\_FOUND     | There is no default printer.                                                                                                   |
     * @see https://learn.microsoft.com/windows/win32/printdocs/getdefaultprinter
     */
    static GetDefaultPrinterA(pszBuffer, pcchBuffer) {
        pszBuffer := pszBuffer is String? StrPtr(pszBuffer) : pszBuffer

        result := DllCall("winspool.drv\GetDefaultPrinterA", "ptr", pszBuffer, "uint*", pcchBuffer, "int")
        return result
    }

    /**
     * The GetDefaultPrinter function retrieves the printer name of the default printer for the current user on the local computer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pszBuffer A pointer to a buffer that receives a null-terminated character string containing the default printer name. If this parameter is **NULL**, the function fails and the variable pointed to by *pcchBuffer* returns the required buffer size, in characters.
     * @param {Pointer<UInt32>} pcchBuffer On input, specifies the size, in characters, of the *pszBuffer* buffer. On output, receives the size, in characters, of the printer name string, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value and the variable pointed to by *pcchBuffer* contains the number of characters copied to the *pszBuffer* buffer, including the terminating null character.
     * 
     * If the function fails, the return value is zero.
     * 
     * 
     * 
     * | Value                       | Meaning                                                                                                                        |
     * |-----------------------------|--------------------------------------------------------------------------------------------------------------------------------|
     * | ERROR\_INSUFFICIENT\_BUFFER | The *pszBuffer* buffer is too small. The variable pointed to by *pcchBuffer* contains the required buffer size, in characters. |
     * | ERROR\_FILE\_NOT\_FOUND     | There is no default printer.                                                                                                   |
     * @see https://learn.microsoft.com/windows/win32/printdocs/getdefaultprinter
     */
    static GetDefaultPrinterW(pszBuffer, pcchBuffer) {
        pszBuffer := pszBuffer is String? StrPtr(pszBuffer) : pszBuffer

        result := DllCall("winspool.drv\GetDefaultPrinterW", "ptr", pszBuffer, "uint*", pcchBuffer, "int")
        return result
    }

    /**
     * The SetDefaultPrinter function sets the printer name of the default printer for the current user on the local computer.
     * @remarks
     * When using this method, you must specify a valid printer, driver, and port. If they are invalid, the APIs do not fail but the result is not defined. This could cause other programs to set the printer back to the previous valid printer. You can use [**EnumPrinters**](enumprinters.md) to retrieve the printer name, driver name, and port name of all available printers.
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pszPrinter A pointer to a null-terminated string containing the default printer name. For a remote printer connection, the name format is **\\\\***server***\\***printername*. For a local printer, the name format is *printername*.
     * 
     * If this parameter is **NULL** or an empty string, that is, "", **SetDefaultPrinter** will select a default printer from one of the installed printers. If a default printer already exists, calling **SetDefaultPrinter** with a **NULL** or an empty string in this parameter might change the default printer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setdefaultprinter
     */
    static SetDefaultPrinterA(pszPrinter) {
        pszPrinter := pszPrinter is String? StrPtr(pszPrinter) : pszPrinter

        result := DllCall("winspool.drv\SetDefaultPrinterA", "ptr", pszPrinter, "int")
        return result
    }

    /**
     * The SetDefaultPrinter function sets the printer name of the default printer for the current user on the local computer.
     * @remarks
     * When using this method, you must specify a valid printer, driver, and port. If they are invalid, the APIs do not fail but the result is not defined. This could cause other programs to set the printer back to the previous valid printer. You can use [**EnumPrinters**](enumprinters.md) to retrieve the printer name, driver name, and port name of all available printers.
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pszPrinter A pointer to a null-terminated string containing the default printer name. For a remote printer connection, the name format is **\\\\***server***\\***printername*. For a local printer, the name format is *printername*.
     * 
     * If this parameter is **NULL** or an empty string, that is, "", **SetDefaultPrinter** will select a default printer from one of the installed printers. If a default printer already exists, calling **SetDefaultPrinter** with a **NULL** or an empty string in this parameter might change the default printer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setdefaultprinter
     */
    static SetDefaultPrinterW(pszPrinter) {
        pszPrinter := pszPrinter is String? StrPtr(pszPrinter) : pszPrinter

        result := DllCall("winspool.drv\SetDefaultPrinterW", "ptr", pszPrinter, "int")
        return result
    }

    /**
     * The SetPort function sets the status associated with a printer port.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller of the **SetPort** function must be executing as an Administrator. Additionally, if the caller is a Port Monitor or Language Monitor, it must call [**RevertToSelf**](/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself) to cease impersonation before it calls **SetPort**.
     * 
     * All programs that call **SetPort** must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * 
     * When you set a printer port status value with the severity value PORT\_STATUS\_TYPE\_ERROR, the print spooler stops sending jobs to the port. The print spooler resumes sending jobs to the port when the port status is cleared by another call to **SetPort**.
     * @param {Pointer<Byte>} pName Pointer to a zero-terminated string that specifies the name of the printer server to which the port is connected. Set this parameter to **NULL** if the port is on the local machine.
     * @param {Pointer<Byte>} pPortName Pointer to a zero-terminated string that specifies the name of the printer port.
     * @param {Integer} dwLevel Specifies the type of structure pointed to by the *pPortInfo* parameter.
     * 
     * This value must be 3, which corresponds to a [**PORT\_INFO\_3**](port-info-3.md) data structure.
     * @param {Pointer<Byte>} pPortInfo Pointer to a [**PORT\_INFO\_3**](port-info-3.md) structure that contains the port status information to set.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setport
     */
    static SetPortA(pName, pPortName, dwLevel, pPortInfo) {
        pName := pName is String? StrPtr(pName) : pName
        pPortName := pPortName is String? StrPtr(pPortName) : pPortName

        A_LastError := 0

        result := DllCall("winspool.drv\SetPortA", "ptr", pName, "ptr", pPortName, "uint", dwLevel, "char*", pPortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SetPort function sets the status associated with a printer port.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller of the **SetPort** function must be executing as an Administrator. Additionally, if the caller is a Port Monitor or Language Monitor, it must call [**RevertToSelf**](/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself) to cease impersonation before it calls **SetPort**.
     * 
     * All programs that call **SetPort** must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * 
     * When you set a printer port status value with the severity value PORT\_STATUS\_TYPE\_ERROR, the print spooler stops sending jobs to the port. The print spooler resumes sending jobs to the port when the port status is cleared by another call to **SetPort**.
     * @param {Pointer<Char>} pName Pointer to a zero-terminated string that specifies the name of the printer server to which the port is connected. Set this parameter to **NULL** if the port is on the local machine.
     * @param {Pointer<Char>} pPortName Pointer to a zero-terminated string that specifies the name of the printer port.
     * @param {Integer} dwLevel Specifies the type of structure pointed to by the *pPortInfo* parameter.
     * 
     * This value must be 3, which corresponds to a [**PORT\_INFO\_3**](port-info-3.md) data structure.
     * @param {Pointer<Byte>} pPortInfo Pointer to a [**PORT\_INFO\_3**](port-info-3.md) structure that contains the port status information to set.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setport
     */
    static SetPortW(pName, pPortName, dwLevel, pPortInfo) {
        pName := pName is String? StrPtr(pName) : pName
        pPortName := pPortName is String? StrPtr(pPortName) : pPortName

        A_LastError := 0

        result := DllCall("winspool.drv\SetPortW", "ptr", pName, "ptr", pPortName, "uint", dwLevel, "char*", pPortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The AddPrinterConnection function adds a connection to the specified printer for the current user.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * When Windows makes a connection to a printer, it may need to copy printer driver files to the server to which the printer is attached. If the user does not have permission to copy files to the appropriate location, the **AddPrinterConnection** function fails, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_ACCESS\_DENIED.
     * 
     * A printer connection established by calling **AddPrinterConnection** will be enumerated when [**EnumPrinters**](enumprinters.md) is called with *dwType* set to PRINTER\_ENUM\_CONNECTION.
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of a printer to which the current user wishes to establish a connection.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection
     */
    static AddPrinterConnectionA(pName) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterConnectionA", "ptr", pName, "int")
        return result
    }

    /**
     * The AddPrinterConnection function adds a connection to the specified printer for the current user.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * When Windows makes a connection to a printer, it may need to copy printer driver files to the server to which the printer is attached. If the user does not have permission to copy files to the appropriate location, the **AddPrinterConnection** function fails, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_ACCESS\_DENIED.
     * 
     * A printer connection established by calling **AddPrinterConnection** will be enumerated when [**EnumPrinters**](enumprinters.md) is called with *dwType* set to PRINTER\_ENUM\_CONNECTION.
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of a printer to which the current user wishes to establish a connection.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection
     */
    static AddPrinterConnectionW(pName) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrinterConnectionW", "ptr", pName, "int")
        return result
    }

    /**
     * The DeletePrinterConnection function deletes a connection to a printer that was established by a call to AddPrinterConnection or ConnectToPrinterDlg.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **DeletePrinterConnection** function does not delete any printer driver files that were copied to the server to which the printer is attached.
     * @param {Pointer<Byte>} pName Pointer to a null-terminated string that specifies the name of the printer connection to delete.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterconnection
     */
    static DeletePrinterConnectionA(pName) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\DeletePrinterConnectionA", "ptr", pName, "int")
        return result
    }

    /**
     * The DeletePrinterConnection function deletes a connection to a printer that was established by a call to AddPrinterConnection or ConnectToPrinterDlg.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **DeletePrinterConnection** function does not delete any printer driver files that were copied to the server to which the printer is attached.
     * @param {Pointer<Char>} pName Pointer to a null-terminated string that specifies the name of the printer connection to delete.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterconnection
     */
    static DeletePrinterConnectionW(pName) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\DeletePrinterConnectionW", "ptr", pName, "int")
        return result
    }

    /**
     * The ConnectToPrinterDlg function displays a dialog box that lets users browse and connect to printers on a network.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **ConnectToPrinterDlg** function attempts to create a connection to the selected printer. However, if the server on which the printer resides does not have a suitable driver installed, the function offers the user the option of creating a printer locally. A calling application can determine whether the function has created a printer locally by calling [**GetPrinter**](getprinter.md) with a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, then examining that structure's **Attributes** member.
     * 
     * An application should call [**DeletePrinter**](deleteprinter.md) to delete a local printer. An application should call [**DeletePrinterConnection**](deleteprinterconnection.md) to delete a connection to a printer.
     * @param {Pointer<Void>} hwnd Specifies the parent window of the dialog box.
     * @param {Integer} Flags This parameter is reserved and must be zero.
     * @returns {Pointer<Void>} If the function succeeds and the user selects a printer, the return value is a handle to the selected printer.
     * 
     * If the function fails, or the user cancels the dialog box without selecting a printer, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/connecttoprinterdlg
     */
    static ConnectToPrinterDlg(hwnd, Flags) {
        result := DllCall("winspool.drv\ConnectToPrinterDlg", "ptr", hwnd, "uint", Flags)
        return result
    }

    /**
     * The AddPrintProvidor function installs a local print provider and links the configuration, data, and provider files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * Before an application calls the **AddPrintProvidor** function, all files required by the provider must be copied to the SYSTEM32 directory.
     * 
     * A provider added by **AddPrintProvidor** may be removed by calling [**DeletePrintProvidor**](deleteprintprovidor.md).
     * @param {Pointer<Byte>} pName A pointer to a null-terminated string that specifies the name of the server on which the provider should be installed. For systems that only support local installation of providers, this parameter should be **NULL**.
     * @param {Integer} Level The level of the structure to which *pProviderInfo* points. It can be one of the following.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                                                            |
     * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_1**](providor-info-1.md) structure.<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_2**](providor-info-2.md) structure.<br/> |
     * @param {Pointer<Byte>} pProvidorInfo 
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprovidor
     */
    static AddPrintProvidorA(pName, Level, pProvidorInfo) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrintProvidorA", "ptr", pName, "uint", Level, "char*", pProvidorInfo, "int")
        return result
    }

    /**
     * The AddPrintProvidor function installs a local print provider and links the configuration, data, and provider files.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * Before an application calls the **AddPrintProvidor** function, all files required by the provider must be copied to the SYSTEM32 directory.
     * 
     * A provider added by **AddPrintProvidor** may be removed by calling [**DeletePrintProvidor**](deleteprintprovidor.md).
     * @param {Pointer<Char>} pName A pointer to a null-terminated string that specifies the name of the server on which the provider should be installed. For systems that only support local installation of providers, this parameter should be **NULL**.
     * @param {Integer} Level The level of the structure to which *pProviderInfo* points. It can be one of the following.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                                                            |
     * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_1**](providor-info-1.md) structure.<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_2**](providor-info-2.md) structure.<br/> |
     * @param {Pointer<Byte>} pProvidorInfo 
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprovidor
     */
    static AddPrintProvidorW(pName, Level, pProvidorInfo) {
        pName := pName is String? StrPtr(pName) : pName

        result := DllCall("winspool.drv\AddPrintProvidorW", "ptr", pName, "uint", Level, "char*", pProvidorInfo, "int")
        return result
    }

    /**
     * The DeletePrintProvidor function removes a print provider added by the AddPrintProvidor function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pName Reserved; must be **NULL**.
     * @param {Pointer<Byte>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the provider is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the provider is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value because it provides maximum portability.
     * @param {Pointer<Byte>} pPrintProvidorName 
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprovidor
     */
    static DeletePrintProvidorA(pName, pEnvironment, pPrintProvidorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pPrintProvidorName := pPrintProvidorName is String? StrPtr(pPrintProvidorName) : pPrintProvidorName

        result := DllCall("winspool.drv\DeletePrintProvidorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProvidorName, "int")
        return result
    }

    /**
     * The DeletePrintProvidor function removes a print provider added by the AddPrintProvidor function.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pName Reserved; must be **NULL**.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment from which the provider is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the provider is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value because it provides maximum portability.
     * @param {Pointer<Char>} pPrintProvidorName 
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprovidor
     */
    static DeletePrintProvidorW(pName, pEnvironment, pPrintProvidorName) {
        pName := pName is String? StrPtr(pName) : pName
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment
        pPrintProvidorName := pPrintProvidorName is String? StrPtr(pPrintProvidorName) : pPrintProvidorName

        result := DllCall("winspool.drv\DeletePrintProvidorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProvidorName, "int")
        return result
    }

    /**
     * The IsValidDevmode function verifies that the contents of a DEVMODE structure are valid.
     * @remarks
     * No private printer driver fields of the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) are checked, only the public fields.
     * 
     * Callers should use **dmSize**+**dmDriverExtra** for **DevmodeSize** only if they can guarantee that the input buffer size is at least that big. Since the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is generally untrusted data, the values that are in the input buffer at the **dmSize** and **dmDriverExtra** offsets are also untrusted.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Pointer<DEVMODEA>} pDevmode A pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) to validate.
     * @param {Pointer} DevmodeSize The size in bytes of the input byte buffer.
     * @returns {Integer} **TRUE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is structurally valid. If minor errors are found the function will fix them and return **TRUE**.
     * 
     * **FALSE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) has one or more significant structural problems. For example, its **dmSize** member is misaligned or specifies a buffer that is too small. Also, **FALSE** if **pDevmode** is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/isvaliddevmode
     */
    static IsValidDevmodeA(pDevmode, DevmodeSize) {
        result := DllCall("winspool.drv\IsValidDevmodeA", "ptr", pDevmode, "ptr", DevmodeSize, "int")
        return result
    }

    /**
     * The IsValidDevmode function verifies that the contents of a DEVMODE structure are valid.
     * @remarks
     * No private printer driver fields of the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) are checked, only the public fields.
     * 
     * Callers should use **dmSize**+**dmDriverExtra** for **DevmodeSize** only if they can guarantee that the input buffer size is at least that big. Since the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is generally untrusted data, the values that are in the input buffer at the **dmSize** and **dmDriverExtra** offsets are also untrusted.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Pointer<DEVMODEW>} pDevmode A pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) to validate.
     * @param {Pointer} DevmodeSize The size in bytes of the input byte buffer.
     * @returns {Integer} **TRUE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is structurally valid. If minor errors are found the function will fix them and return **TRUE**.
     * 
     * **FALSE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) has one or more significant structural problems. For example, its **dmSize** member is misaligned or specifies a buffer that is too small. Also, **FALSE** if **pDevmode** is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/printdocs/isvaliddevmode
     */
    static IsValidDevmodeW(pDevmode, DevmodeSize) {
        result := DllCall("winspool.drv\IsValidDevmodeW", "ptr", pDevmode, "ptr", DevmodeSize, "int")
        return result
    }

    /**
     * Retrieves a handle to the specified printer, print server, or other types of handles in the print subsystem, while setting some of the printer options.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The ANSI version of this function is not implemented and returns ERROR\_NOT\_SUPPORTED.
     * 
     * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
     * 
     * You can call the **OpenPrinter2** function to open a handle to a print server or to determine client access rights to a print server. To do this, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
     * 
     * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the necessary access rights. The access rights can be one of the following.
     * 
     * 
     * 
     * | Desired Access value                        | Meaning                                                                                                                                                                                      |
     * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
     * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
     * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except SYNCHRONIZE. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                         |
     * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
     * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
     * 
     * 
     * 
     *  
     * 
     * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter2** call will fail, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
     * 
     * When *pPrinterName* is a local printer, then **OpenPrinter2** ignores all values of the **dwFlags** that the [**PRINTER\_OPTIONS**](printer-options.md) structure pointed to using *pOptions*, except PRINTER\_OPTION\_CLIENT\_CHANGE. If the latter is passed, then **OpenPrinter2** will return ERROR\_ACCESS\_DENIED. Accordingly, when opening a local printer, **OpenPrinter2** provides no advantage over [**OpenPrinter**](openprinter.md).
     * 
     * **Windows Vista:** The printer data returned by **OpenPrinter2** is retrieved from a local cache unless the **PRINTER\_OPTION\_NO\_CACHE** flag is set in the **dwFlags** field of the [**PRINTER\_OPTIONS**](printer-options.md) structure referenced by *pOptions*.
     * @param {Pointer<Byte>} pPrinterName A pointer to a constant null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
     * 
     * For a printer object, use: PrinterName,Job xxxx. For an XcvMonitor, use: ServerName,XcvMonitor MonitorName. For an XcvPort, use: ServerName,XcvPort PortName.
     * 
     * **Windows Vista:** If **NULL**, it indicates the local print server.
     * @param {Pointer<Void>} phPrinter A pointer to a variable that receives a handle to the open printer or print server object.
     * @param {Pointer<PRINTER_DEFAULTSA>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
     * @param {Pointer<PRINTER_OPTIONSA>} pOptions A pointer to a [**PRINTER\_OPTIONS**](printer-options.md) structure. This value can be **NULL**.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. For extended error information, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter2
     */
    static OpenPrinter2A(pPrinterName, phPrinter, pDefault, pOptions) {
        pPrinterName := pPrinterName is String? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinter2A", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "ptr", pOptions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a handle to the specified printer, print server, or other types of handles in the print subsystem, while setting some of the printer options.
     * @remarks
     * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
     * 
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The ANSI version of this function is not implemented and returns ERROR\_NOT\_SUPPORTED.
     * 
     * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
     * 
     * You can call the **OpenPrinter2** function to open a handle to a print server or to determine client access rights to a print server. To do this, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
     * 
     * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the necessary access rights. The access rights can be one of the following.
     * 
     * 
     * 
     * | Desired Access value                        | Meaning                                                                                                                                                                                      |
     * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
     * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
     * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except SYNCHRONIZE. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                         |
     * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
     * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
     * 
     * 
     * 
     *  
     * 
     * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter2** call will fail, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
     * 
     * When *pPrinterName* is a local printer, then **OpenPrinter2** ignores all values of the **dwFlags** that the [**PRINTER\_OPTIONS**](printer-options.md) structure pointed to using *pOptions*, except PRINTER\_OPTION\_CLIENT\_CHANGE. If the latter is passed, then **OpenPrinter2** will return ERROR\_ACCESS\_DENIED. Accordingly, when opening a local printer, **OpenPrinter2** provides no advantage over [**OpenPrinter**](openprinter.md).
     * 
     * **Windows Vista:** The printer data returned by **OpenPrinter2** is retrieved from a local cache unless the **PRINTER\_OPTION\_NO\_CACHE** flag is set in the **dwFlags** field of the [**PRINTER\_OPTIONS**](printer-options.md) structure referenced by *pOptions*.
     * @param {Pointer<Char>} pPrinterName A pointer to a constant null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
     * 
     * For a printer object, use: PrinterName,Job xxxx. For an XcvMonitor, use: ServerName,XcvMonitor MonitorName. For an XcvPort, use: ServerName,XcvPort PortName.
     * 
     * **Windows Vista:** If **NULL**, it indicates the local print server.
     * @param {Pointer<Void>} phPrinter A pointer to a variable that receives a handle to the open printer or print server object.
     * @param {Pointer<PRINTER_DEFAULTSW>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
     * @param {Pointer<PRINTER_OPTIONSW>} pOptions A pointer to a [**PRINTER\_OPTIONS**](printer-options.md) structure. This value can be **NULL**.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. For extended error information, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter2
     */
    static OpenPrinter2W(pPrinterName, phPrinter, pDefault, pOptions) {
        pPrinterName := pPrinterName is String? StrPtr(pPrinterName) : pPrinterName

        A_LastError := 0

        result := DllCall("winspool.drv\OpenPrinter2W", "ptr", pPrinterName, "ptr", phPrinter, "ptr", pDefault, "ptr", pOptions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWnd 
     * @param {Pointer<Byte>} pszName 
     * @param {Integer} dwLevel 
     * @param {Pointer<Void>} pConnectionInfo 
     * @returns {Integer} 
     */
    static AddPrinterConnection2A(hWnd, pszName, dwLevel, pConnectionInfo) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\AddPrinterConnection2A", "ptr", hWnd, "ptr", pszName, "uint", dwLevel, "ptr", pConnectionInfo, "int")
        return result
    }

    /**
     * Adds a connection to the specified printer for the current user and specifies connection details.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * When Windows Vista makes a connection to a printer, it may need to copy printer driver files from the server to which the printer is attached. If the user does not have permission to copy files to the appropriate location, the **AddPrinterConnection2** function fails and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_ACCESS\_DENIED.
     * 
     * If the printer driver files must be copied from the print server but cannot be copied silently due to the group policies that are in effect and PRINTER\_CONNECTION\_NO\_UI is set in *pConnectionInfo->dwFlags*, no dialog boxes will be displayed and the call will fail.
     * 
     * If the local printer driver can be used to render print jobs for this printer and the version of the local driver must not match the version of the printer driver on the server, set PRINTER\_CONNECTION\_MISMATCH in *pConnectionInfo->dwFlags* and assign the pointer to a string variable that contains the path to the local printer driver to *pConnectionInfo->pszDriverName*.
     * 
     * A printer connection that is established by calling **AddPrinterConnection2** will be enumerated when [**EnumPrinters**](enumprinters.md) is called with *dwType* set to PRINTER\_ENUM\_CONNECTION.
     * 
     * The ANSI version of this function, **AddPrinterConnection2A**, is not supported and returns **ERROR\_NOT\_SUPPORTED**.
     * @param {Pointer<Void>} hWnd A handle to the parent window in which the dialog box will be displayed if the print system must download a printer driver from the print server for this connection.
     * @param {Pointer<Char>} pszName A pointer to a constant null-terminated string specifying the name of the printer to which the current user wishes to connect.
     * @param {Integer} dwLevel The version of the structure pointed to by *pConnectionInfo*. Currently, only level 1 is defined so the value of *dwLevel* must be 1.
     * @param {Pointer<Void>} pConnectionInfo A pointer to a [**PRINTER\_CONNECTION\_INFO\_1**](printer-connection-info-1.md) structure. See the Remarks section for more about this parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. For extended error information, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection2
     */
    static AddPrinterConnection2W(hWnd, pszName, dwLevel, pConnectionInfo) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\AddPrinterConnection2W", "ptr", hWnd, "ptr", pszName, "uint", dwLevel, "ptr", pConnectionInfo, "int")
        return result
    }

    /**
     * Installs a printer driver from a driver package that is in the print servers driver store.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
     * 
     * **InstallPrinterDriverFromPackage** also installs other files in the package, such as color profiles and print processors.
     * 
     * Users must have printer administration rights to install either on a remote computer or on the local computer when the user is logged in with Terminal Services.
     * 
     * Only signed packages can be installed on a remote computer.
     * @param {Pointer<Byte>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. **NULL** means the local computer.
     * @param {Pointer<Byte>} pszInfPath A pointer to a constant, null-terminated string that specifies the driver store path to the print driver's .inf file. **NULL** means the driver is in an inf file that shipped with Windows.
     * @param {Pointer<Byte>} pszDriverName A pointer to a constant, null-terminated string that specifies the name of the driver.
     * @param {Pointer<Byte>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Integer} dwFlags This can only be 0 or IPDFP\_COPY\_ALL\_FILES. A value of 0 means that the printer driver must be added and any files in the printer driver directory that are newer than corresponding files currently in use must be copied. A value of IPDFP\_COPY\_ALL\_FILES means the printer driver and all the files in the printer driver directory must be added. The file time stamps are ignored when *dwFlags* has a value of IPDFP\_COPY\_ALL\_FILES.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/installprinterdriverfrompackage
     */
    static InstallPrinterDriverFromPackageA(pszServer, pszInfPath, pszDriverName, pszEnvironment, dwFlags) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String? StrPtr(pszInfPath) : pszInfPath
        pszDriverName := pszDriverName is String? StrPtr(pszDriverName) : pszDriverName
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\InstallPrinterDriverFromPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszDriverName, "ptr", pszEnvironment, "uint", dwFlags, "int")
        return result
    }

    /**
     * Installs a printer driver from a driver package that is in the print servers driver store.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
     * 
     * **InstallPrinterDriverFromPackage** also installs other files in the package, such as color profiles and print processors.
     * 
     * Users must have printer administration rights to install either on a remote computer or on the local computer when the user is logged in with Terminal Services.
     * 
     * Only signed packages can be installed on a remote computer.
     * @param {Pointer<Char>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. **NULL** means the local computer.
     * @param {Pointer<Char>} pszInfPath A pointer to a constant, null-terminated string that specifies the driver store path to the print driver's .inf file. **NULL** means the driver is in an inf file that shipped with Windows.
     * @param {Pointer<Char>} pszDriverName A pointer to a constant, null-terminated string that specifies the name of the driver.
     * @param {Pointer<Char>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Integer} dwFlags This can only be 0 or IPDFP\_COPY\_ALL\_FILES. A value of 0 means that the printer driver must be added and any files in the printer driver directory that are newer than corresponding files currently in use must be copied. A value of IPDFP\_COPY\_ALL\_FILES means the printer driver and all the files in the printer driver directory must be added. The file time stamps are ignored when *dwFlags* has a value of IPDFP\_COPY\_ALL\_FILES.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/installprinterdriverfrompackage
     */
    static InstallPrinterDriverFromPackageW(pszServer, pszInfPath, pszDriverName, pszEnvironment, dwFlags) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String? StrPtr(pszInfPath) : pszInfPath
        pszDriverName := pszDriverName is String? StrPtr(pszDriverName) : pszDriverName
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\InstallPrinterDriverFromPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszDriverName, "ptr", pszEnvironment, "uint", dwFlags, "int")
        return result
    }

    /**
     * Uploads a printer driver to the print servers driver store so that it can be installed by calling InstallPrinterDriverFromPackage.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
     * 
     * Only one package at a time can be uploaded. If a package is dependent on others, they must be uploaded separately.
     * 
     * Only signed driver packages can be uploaded.
     * @param {Pointer<Byte>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** if the server is the local computer.
     * @param {Pointer<Byte>} pszInfPath A pointer to a constant ,null-terminated string that specifies the source path to the driver's .inf file.
     * @param {Pointer<Byte>} pszEnvironment A pointer to a constant, null-terminated string that specifies the server's processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Integer} dwFlags This can be any of the following values:
     * 
     * 
     * 
     * | Value                                                                                                                                                                                     | Meaning                                                                                                                                                            |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="UPDP_SILENT_UPLOAD"></span><span id="updp_silent_upload"></span><dl> <dt>**UPDP_SILENT_UPLOAD**</dt> </dl>             | The UI will not be shown during the upload.<br/>                                                                                                             |
     * | <span id="UPDP_UPLOAD_ALWAYS"></span><span id="updp_upload_always"></span><dl> <dt>**UPDP_UPLOAD_ALWAYS**</dt> </dl>             | The files will be uploaded even if the package is already in the server's driver store.<br/>                                                                 |
     * | <span id="UPDP_CHECK_DRIVERSTORE"></span><span id="updp_check_driverstore"></span><dl> <dt>**UPDP_CHECK_DRIVERSTORE**</dt> </dl> | The server's driver store will be checked before upload to see if the package is already there. This setting is ignored if UPDP_UPLOAD_ALWAYS is set.<br/> |
     * @param {Pointer<Void>} hwnd A handle to the copying user interface.
     * @param {Pointer<Byte>} pszDestInfPath A pointer to the destination path, in the driver store, to which the driver's .inf file was copied.
     * @param {Pointer<UInt32>} pcchDestInfPath On input, specifies the size, in characters, of the *pszDestInfPath* buffer. On output, receives the size, in characters, of the path string, including the terminating null character.
     * @returns {Integer} If the operation succeeds, the return value is S_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/uploadprinterdriverpackage
     */
    static UploadPrinterDriverPackageA(pszServer, pszInfPath, pszEnvironment, dwFlags, hwnd, pszDestInfPath, pcchDestInfPath) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment
        pszDestInfPath := pszDestInfPath is String? StrPtr(pszDestInfPath) : pszDestInfPath

        result := DllCall("winspool.drv\UploadPrinterDriverPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "uint", dwFlags, "ptr", hwnd, "ptr", pszDestInfPath, "uint*", pcchDestInfPath, "int")
        return result
    }

    /**
     * Uploads a printer driver to the print servers driver store so that it can be installed by calling InstallPrinterDriverFromPackage.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
     * 
     * Only one package at a time can be uploaded. If a package is dependent on others, they must be uploaded separately.
     * 
     * Only signed driver packages can be uploaded.
     * @param {Pointer<Char>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** if the server is the local computer.
     * @param {Pointer<Char>} pszInfPath A pointer to a constant ,null-terminated string that specifies the source path to the driver's .inf file.
     * @param {Pointer<Char>} pszEnvironment A pointer to a constant, null-terminated string that specifies the server's processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Integer} dwFlags This can be any of the following values:
     * 
     * 
     * 
     * | Value                                                                                                                                                                                     | Meaning                                                                                                                                                            |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="UPDP_SILENT_UPLOAD"></span><span id="updp_silent_upload"></span><dl> <dt>**UPDP_SILENT_UPLOAD**</dt> </dl>             | The UI will not be shown during the upload.<br/>                                                                                                             |
     * | <span id="UPDP_UPLOAD_ALWAYS"></span><span id="updp_upload_always"></span><dl> <dt>**UPDP_UPLOAD_ALWAYS**</dt> </dl>             | The files will be uploaded even if the package is already in the server's driver store.<br/>                                                                 |
     * | <span id="UPDP_CHECK_DRIVERSTORE"></span><span id="updp_check_driverstore"></span><dl> <dt>**UPDP_CHECK_DRIVERSTORE**</dt> </dl> | The server's driver store will be checked before upload to see if the package is already there. This setting is ignored if UPDP_UPLOAD_ALWAYS is set.<br/> |
     * @param {Pointer<Void>} hwnd A handle to the copying user interface.
     * @param {Pointer<Char>} pszDestInfPath A pointer to the destination path, in the driver store, to which the driver's .inf file was copied.
     * @param {Pointer<UInt32>} pcchDestInfPath On input, specifies the size, in characters, of the *pszDestInfPath* buffer. On output, receives the size, in characters, of the path string, including the terminating null character.
     * @returns {Integer} If the operation succeeds, the return value is S_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/uploadprinterdriverpackage
     */
    static UploadPrinterDriverPackageW(pszServer, pszInfPath, pszEnvironment, dwFlags, hwnd, pszDestInfPath, pcchDestInfPath) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment
        pszDestInfPath := pszDestInfPath is String? StrPtr(pszDestInfPath) : pszDestInfPath

        result := DllCall("winspool.drv\UploadPrinterDriverPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "uint", dwFlags, "ptr", hwnd, "ptr", pszDestInfPath, "uint*", pcchDestInfPath, "int")
        return result
    }

    /**
     * Retrieves GUID, version, and date of the specified core printer drivers and the path to their packages.
     * @remarks
     * This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
     * @param {Pointer<Byte>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Pointer<Byte>} pszzCoreDriverDependencies A pointer to a null-terminated multi-string that specifies the GUIDs of the core printer drivers.
     * @param {Integer} cCorePrinterDrivers The number of strings in *pszzCoreDriverDependencies*.
     * @param {Pointer<CORE_PRINTER_DRIVERA>} pCorePrinterDrivers A pointer to an array of one or more [**CORE\_PRINTER\_DRIVER**](core-printer-driver.md) structures.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/getcoreprinterdrivers
     */
    static GetCorePrinterDriversA(pszServer, pszEnvironment, pszzCoreDriverDependencies, cCorePrinterDrivers, pCorePrinterDrivers) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment
        pszzCoreDriverDependencies := pszzCoreDriverDependencies is String? StrPtr(pszzCoreDriverDependencies) : pszzCoreDriverDependencies

        result := DllCall("winspool.drv\GetCorePrinterDriversA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszzCoreDriverDependencies, "uint", cCorePrinterDrivers, "ptr", pCorePrinterDrivers, "int")
        return result
    }

    /**
     * Retrieves GUID, version, and date of the specified core printer drivers and the path to their packages.
     * @remarks
     * This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
     * @param {Pointer<Char>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Pointer<Char>} pszzCoreDriverDependencies A pointer to a null-terminated multi-string that specifies the GUIDs of the core printer drivers.
     * @param {Integer} cCorePrinterDrivers The number of strings in *pszzCoreDriverDependencies*.
     * @param {Pointer<CORE_PRINTER_DRIVERW>} pCorePrinterDrivers A pointer to an array of one or more [**CORE\_PRINTER\_DRIVER**](core-printer-driver.md) structures.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/getcoreprinterdrivers
     */
    static GetCorePrinterDriversW(pszServer, pszEnvironment, pszzCoreDriverDependencies, cCorePrinterDrivers, pCorePrinterDrivers) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment
        pszzCoreDriverDependencies := pszzCoreDriverDependencies is String? StrPtr(pszzCoreDriverDependencies) : pszzCoreDriverDependencies

        result := DllCall("winspool.drv\GetCorePrinterDriversW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszzCoreDriverDependencies, "uint", cCorePrinterDrivers, "ptr", pCorePrinterDrivers, "int")
        return result
    }

    /**
     * The CorePrinterDriverInstalled function reports whether a core printer driver with a specified GUID, date, and version is installed.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Byte>} pszServer Pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
     * @param {Pointer<Byte>} pszEnvironment Pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Pointer<Guid>} CoreDriverGUID The GUID of the core printer driver.
     * @param {Pointer} ftDriverDate The date of the core printer driver.
     * @param {Integer} dwlDriverVersion The version of the core printer driver.
     * @param {Pointer<Int32>} pbDriverInstalled A pointer to **TRUE** if the driver, or a newer version, is installed, **FALSE** otherwise.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/coreprinterdriverinstalled
     */
    static CorePrinterDriverInstalledA(pszServer, pszEnvironment, CoreDriverGUID, ftDriverDate, dwlDriverVersion, pbDriverInstalled) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\CorePrinterDriverInstalledA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", CoreDriverGUID, "ptr", ftDriverDate, "uint", dwlDriverVersion, "int*", pbDriverInstalled, "int")
        return result
    }

    /**
     * The CorePrinterDriverInstalled function reports whether a core printer driver with a specified GUID, date, and version is installed.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * @param {Pointer<Char>} pszServer Pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
     * @param {Pointer<Char>} pszEnvironment Pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Pointer<Guid>} CoreDriverGUID The GUID of the core printer driver.
     * @param {Pointer} ftDriverDate The date of the core printer driver.
     * @param {Integer} dwlDriverVersion The version of the core printer driver.
     * @param {Pointer<Int32>} pbDriverInstalled A pointer to **TRUE** if the driver, or a newer version, is installed, **FALSE** otherwise.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/coreprinterdriverinstalled
     */
    static CorePrinterDriverInstalledW(pszServer, pszEnvironment, CoreDriverGUID, ftDriverDate, dwlDriverVersion, pbDriverInstalled) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\CorePrinterDriverInstalledW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", CoreDriverGUID, "ptr", ftDriverDate, "uint", dwlDriverVersion, "int*", pbDriverInstalled, "int")
        return result
    }

    /**
     * Retrieves the path to the specified printer driver package on a print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * To obtain a value for *cchDriverPackageCab*, call the function with **NULL** as the value of *pszDriverPackageCab*. Use the value returned in *pcchRequiredSize* as the value of *cchDriverPackageCab* and call the function again.
     * 
     * The *pszPackageID* is typically obtained from a call to [**GetCorePrinterDrivers**](getcoreprinterdrivers.md).
     * @param {Pointer<Byte>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
     * @param {Pointer<Byte>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Pointer<Byte>} pszLanguage A pointer to a constant, null-terminated string that specifies the [Multilingual User Interface](/windows/desktop/Intl/mui-resource-management) language for the driver being installed. This can be **NULL**.
     * @param {Pointer<Byte>} pszPackageID A pointer to a constant, null-terminated string that specifies the ID of the driver package.
     * @param {Pointer<Byte>} pszDriverPackageCab A pointer to a null-terminated string that specifies the path to the cabinet file for the driver package. This can be **NULL**. See Remarks.
     * @param {Integer} cchDriverPackageCab The size, in characters, of the *pszDriverPackageCab* buffer. This can be **NULL**.
     * @param {Pointer<UInt32>} pcchRequiredSize A pointer to the required size of the *pszDriverPackageCab* buffer.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverpackagepath
     */
    static GetPrinterDriverPackagePathA(pszServer, pszEnvironment, pszLanguage, pszPackageID, pszDriverPackageCab, cchDriverPackageCab, pcchRequiredSize) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment
        pszLanguage := pszLanguage is String? StrPtr(pszLanguage) : pszLanguage
        pszPackageID := pszPackageID is String? StrPtr(pszPackageID) : pszPackageID
        pszDriverPackageCab := pszDriverPackageCab is String? StrPtr(pszDriverPackageCab) : pszDriverPackageCab

        result := DllCall("winspool.drv\GetPrinterDriverPackagePathA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszLanguage, "ptr", pszPackageID, "ptr", pszDriverPackageCab, "uint", cchDriverPackageCab, "uint*", pcchRequiredSize, "int")
        return result
    }

    /**
     * Retrieves the path to the specified printer driver package on a print server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * To obtain a value for *cchDriverPackageCab*, call the function with **NULL** as the value of *pszDriverPackageCab*. Use the value returned in *pcchRequiredSize* as the value of *cchDriverPackageCab* and call the function again.
     * 
     * The *pszPackageID* is typically obtained from a call to [**GetCorePrinterDrivers**](getcoreprinterdrivers.md).
     * @param {Pointer<Char>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
     * @param {Pointer<Char>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @param {Pointer<Char>} pszLanguage A pointer to a constant, null-terminated string that specifies the [Multilingual User Interface](/windows/desktop/Intl/mui-resource-management) language for the driver being installed. This can be **NULL**.
     * @param {Pointer<Char>} pszPackageID A pointer to a constant, null-terminated string that specifies the ID of the driver package.
     * @param {Pointer<Char>} pszDriverPackageCab A pointer to a null-terminated string that specifies the path to the cabinet file for the driver package. This can be **NULL**. See Remarks.
     * @param {Integer} cchDriverPackageCab The size, in characters, of the *pszDriverPackageCab* buffer. This can be **NULL**.
     * @param {Pointer<UInt32>} pcchRequiredSize A pointer to the required size of the *pszDriverPackageCab* buffer.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverpackagepath
     */
    static GetPrinterDriverPackagePathW(pszServer, pszEnvironment, pszLanguage, pszPackageID, pszDriverPackageCab, cchDriverPackageCab, pcchRequiredSize) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment
        pszLanguage := pszLanguage is String? StrPtr(pszLanguage) : pszLanguage
        pszPackageID := pszPackageID is String? StrPtr(pszPackageID) : pszPackageID
        pszDriverPackageCab := pszDriverPackageCab is String? StrPtr(pszDriverPackageCab) : pszDriverPackageCab

        result := DllCall("winspool.drv\GetPrinterDriverPackagePathW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszLanguage, "ptr", pszPackageID, "ptr", pszDriverPackageCab, "uint", cchDriverPackageCab, "uint*", pcchRequiredSize, "int")
        return result
    }

    /**
     * Deletes a printer driver package from the driver store.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The driver store is typically %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
     * 
     * A driver package that shipped with Windows cannot be removed with this function.
     * 
     * The user must have printer administration privileges.
     * @param {Pointer<Byte>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server from which the driver package is being deleted. A **NULL** pointer value means the local computer.
     * @param {Pointer<Byte>} pszInfPath A pointer to a constant, null-terminated string that specifies the path to the driver's \*.inf file.
     * @param {Pointer<Byte>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @returns {Integer} S\_OK, if the operation succeeds.
     * 
     * E\_ACCESSDENIED, if the package was shipped with Windows.
     * 
     * HRESULT\_CODE(ERROR\_PRINT\_DRIVER\_PACKAGE\_IN\_USE), if the package is being used.
     * 
     * Otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverpackage
     */
    static DeletePrinterDriverPackageA(pszServer, pszInfPath, pszEnvironment) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\DeletePrinterDriverPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "int")
        return result
    }

    /**
     * Deletes a printer driver package from the driver store.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The driver store is typically %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
     * 
     * A driver package that shipped with Windows cannot be removed with this function.
     * 
     * The user must have printer administration privileges.
     * @param {Pointer<Char>} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server from which the driver package is being deleted. A **NULL** pointer value means the local computer.
     * @param {Pointer<Char>} pszInfPath A pointer to a constant, null-terminated string that specifies the path to the driver's \*.inf file.
     * @param {Pointer<Char>} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
     * @returns {Integer} S\_OK, if the operation succeeds.
     * 
     * E\_ACCESSDENIED, if the package was shipped with Windows.
     * 
     * HRESULT\_CODE(ERROR\_PRINT\_DRIVER\_PACKAGE\_IN\_USE), if the package is being used.
     * 
     * Otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverpackage
     */
    static DeletePrinterDriverPackageW(pszServer, pszInfPath, pszEnvironment) {
        pszServer := pszServer is String? StrPtr(pszServer) : pszServer
        pszInfPath := pszInfPath is String? StrPtr(pszInfPath) : pszInfPath
        pszEnvironment := pszEnvironment is String? StrPtr(pszEnvironment) : pszEnvironment

        result := DllCall("winspool.drv\DeletePrinterDriverPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "int")
        return result
    }

    /**
     * Reports to the Print Spooler service whether an XPS print job is in the spooling or the rendering phase and what part of the processing is currently underway.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * > [!Note]  
     * > **ReportJobProcessingProgress** will only report the progress of the XPS print job if the print job is in the spooling or rendering phase. **ReportJobProcessingProgress** will fail if it is called when the XPS print job is not in the spooling or rendering phase.
     * @param {Pointer<Void>} printerHandle A printer handle for which the function is to retrieve information. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Integer} jobId Identifies the print job for which to retrieve data. Use the [**AddJob**](addjob.md) function or [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function to get a print job identifier.
     * @param {Integer} jobOperation Specifies whether the job is in the spooling phase or the rendering phase.
     * @param {Integer} jobProgress Specifies what part of the processing is currently underway. This value refers to events in either the spooling or rendering phase depending on the value of *jobOperation*.
     * @returns {Integer} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
     * 
     * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/reportjobprocessingprogress
     */
    static ReportJobProcessingProgress(printerHandle, jobId, jobOperation, jobProgress) {
        result := DllCall("winspool.drv\ReportJobProcessingProgress", "ptr", printerHandle, "uint", jobId, "int", jobOperation, "int", jobProgress, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWnd 
     * @param {Pointer<Void>} hPrinter 
     * @param {Pointer<Byte>} pEnvironment 
     * @param {Integer} Level 
     * @param {Pointer} pDriverInfo 
     * @param {Integer} cbBuf 
     * @param {Pointer<UInt32>} pcbNeeded 
     * @returns {Integer} 
     */
    static GetPrinterDriver2A(hWnd, hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriver2A", "ptr", hWnd, "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetPrinterDriver2 function retrieves driver data for the specified printer. If the driver is not installed on the local computer, GetPrinterDriver2 installs it and displays any user interface to the specified window.
     * @remarks
     * The [**DRIVER\_INFO\_2**](driver-info-2.md), [**DRIVER\_INFO\_3**](driver-info-3.md), [**DRIVER\_INFO\_4**](driver-info-4.md), [**DRIVER\_INFO\_5**](driver-info-5.md), [**DRIVER\_INFO\_6**](driver-info-6.md), and [**DRIVER\_INFO\_8**](driver-info-8.md) structures contain the file name or the full path and file name of the printer driver in the **pDriverPath** member. An application can use the path and file name to load a printer driver by calling the [**LoadLibrary**](/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya) function and supplying the path and file name as the single argument.
     * 
     * The ANSI version of this function, **GetPrinterDriver2A** is not supported and returns **ERROR\_NOT\_SUPPORTED**.
     * @param {Pointer<Void>} hWnd A handle of the window that will be used as the parent window of any user interface, such as a dialog box, that the driver displays during installation. If the value of this parameter is **NULL**, the driver's user interface will still be displayed to the user during installation, but it will not have a parent window.
     * @param {Pointer<Void>} hPrinter A handle to the printer for which the driver data should be retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
     * @param {Pointer<Char>} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
     * @param {Integer} Level The printer driver structure returned in the *pDriverInfo* buffer. This parameter can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                | Meaning                                             |
     * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
     * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
     * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
     * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
     * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
     * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
     * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
     * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
     * @param {Pointer} pDriverInfo A pointer to a buffer that receives a structure containing information about the driver, as specified by *Level*. The buffer must be large enough to store the strings pointed to by the structure members.
     * 
     * To determine the required buffer size, call **GetPrinterDriver2** with *cbBuf* set to zero. **GetPrinterDriver2** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **ERROR\_INSUFFICIENT\_BUFFER**, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
     * @param {Integer} cbBuf The size, in bytes, of the array at which *pDriverInfo* points.
     * @param {Pointer<UInt32>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get the return status, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver2
     */
    static GetPrinterDriver2W(hWnd, hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
        pEnvironment := pEnvironment is String? StrPtr(pEnvironment) : pEnvironment

        result := DllCall("winspool.drv\GetPrinterDriver2W", "ptr", hWnd, "ptr", hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, "uint*", pcbNeeded, "int")
        return result
    }

    /**
     * The GetPrintExecutionData retrieves the current print context.
     * @remarks
     * Printer drivers should call [**GetProcAddress**](/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress) on the winspool.drv module to get the address of the **GetPrintExecutionData** function because **GetPrintExecutionData** is not supported on Windows Vista or earlier versions of Windows.
     * 
     * **GetPrintExecutionData** only fails if the value of *pData* is **NULL**.
     * 
     * The value of the **clientAppPID** member of [**PRINT\_EXECUTION\_DATA**](print-execution-data.md) is only meaningful if the value of **context** is **PRINT\_EXECUTION\_CONTEXT\_WOW64**. If the value of **context** is not **PRINT\_EXECUTION\_CONTEXT\_WOW64**, the value of **clientAppPID** is 0.
     * @param {Pointer<PRINT_EXECUTION_DATA>} pData A pointer to a variable that receives the address of the [**PRINT\_EXECUTION\_DATA**](print-execution-data.md) structure.
     * @returns {Integer} Returns **TRUE** if the function succeeds; otherwise **FALSE**. If the return value is **FALSE**, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) to get the error status.
     * @see https://learn.microsoft.com/windows/win32/printdocs/getprintexecutiondata
     */
    static GetPrintExecutionData(pData) {
        result := DllCall("winspool.drv\GetPrintExecutionData", "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<Char>} pszName 
     * @param {Pointer<PrintPropertyValue>} pValue 
     * @returns {Integer} 
     */
    static GetJobNamedPropertyValue(hPrinter, JobId, pszName, pValue) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\GetJobNamedPropertyValue", "ptr", hPrinter, "uint", JobId, "ptr", pszName, "ptr", pValue, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PrintPropertyValue>} pValue 
     * @returns {Pointer} 
     */
    static FreePrintPropertyValue(pValue) {
        result := DllCall("winspool.drv\FreePrintPropertyValue", "ptr", pValue)
        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PrintNamedProperty>} ppProperties 
     * @returns {Pointer} 
     */
    static FreePrintNamedPropertyArray(cProperties, ppProperties) {
        result := DllCall("winspool.drv\FreePrintNamedPropertyArray", "uint", cProperties, "ptr", ppProperties)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<PrintNamedProperty>} pProperty 
     * @returns {Integer} 
     */
    static SetJobNamedProperty(hPrinter, JobId, pProperty) {
        result := DllCall("winspool.drv\SetJobNamedProperty", "ptr", hPrinter, "uint", JobId, "ptr", pProperty, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<Char>} pszName 
     * @returns {Integer} 
     */
    static DeleteJobNamedProperty(hPrinter, JobId, pszName) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\DeleteJobNamedProperty", "ptr", hPrinter, "uint", JobId, "ptr", pszName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<UInt32>} pcProperties 
     * @param {Pointer<PrintNamedProperty>} ppProperties 
     * @returns {Integer} 
     */
    static EnumJobNamedProperties(hPrinter, JobId, pcProperties, ppProperties) {
        result := DllCall("winspool.drv\EnumJobNamedProperties", "ptr", hPrinter, "uint", JobId, "uint*", pcProperties, "ptr", ppProperties, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWnd 
     * @param {Pointer<Char>} pszPrinter 
     * @param {Pointer<Void>} phFile 
     * @param {Pointer<Char>} ppszOutputFile 
     * @returns {Integer} 
     */
    static GetPrintOutputInfo(hWnd, pszPrinter, phFile, ppszOutputFile) {
        pszPrinter := pszPrinter is String? StrPtr(pszPrinter) : pszPrinter

        result := DllCall("winspool.drv\GetPrintOutputInfo", "ptr", hWnd, "ptr", pszPrinter, "ptr", phFile, "ptr", ppszOutputFile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVQUERYPRINT_INFO>} pDQPInfo 
     * @returns {Integer} 
     */
    static DevQueryPrintEx(pDQPInfo) {
        result := DllCall("winspool.drv\DevQueryPrintEx", "ptr", pDQPInfo, "int")
        return result
    }

    /**
     * Enables an application to register for notifications from Print Spooler-hosted printing components such as printer drivers, print processors, and port monitors.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * To stop notifications through a unidirectional channel, the listening application passes the <i>pRegistrationHandler</i> value returned by <b>RegisterForPrintAsyncNotifications</b> to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-unregisterforprintasyncnotifications">UnRegisterForPrintAsyncNotifications</a>. For a bidirectional channel, call <b>UnRegisterForPrintAsyncNotifications</b> to block notifications in any new channels that were created after that call. To block notifications on existing bidirectional channels, the listening application must close the channel with <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a>.
     * 
     * As a result of a <b>RegisterForPrintAsyncNotifications</b> call, the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> method is called for the <i>pCallback</i> object. Calling <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-unregisterforprintasyncnotifications">UnRegisterForPrintAsyncNotifications</a> will release the <i>pCallback</i> object. The reference count of <i>pCallback</i> object will be also incremented when a channel is created and decremented when the channel is closed.
     * 
     * The <i>pSchema</i> parameter is a GUID pointer that the spooler accepts and uses to filter the listener clients. Any client of the spooler asynchronous notification mechanism can define its own notification type. Even though the spooler is unaware of the notification type that is sent, it still filters the listener clients based on the notification type. The notification schema that <i>pSchema</i> references is the schema that is used by the notification object that exposes <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifydataobject">IPrintAsyncNotifyDataObject</a>. Clients of the spooler notification pipe can define their own data schema and can send any data type back and forth and the GUID referenced by <i>pSchema</i> is unique to that data schema.
     * @param {Pointer<Char>} pszName A pointer to the name of a print server or print queue.
     * @param {Pointer<Guid>} pNotificationType A pointer to the GUID of the data schema for the type of notifications that the application must receive.
     * @param {Integer} eUserFilter A value specifying whether notifications will be sent to:
     * 
     * <ul>
     * <li>Only applications that are running as the same user as the Print Spooler-hosted plug-in sender.</li>
     * <li>A broader set of listening applications.</li>
     * </ul>
     * @param {Integer} eConversationStyle A value specifying whether communication is bidirectional or unidirectional.
     * @param {Pointer<IPrintAsyncNotifyCallback>} pCallback A pointer to an object that the Print Spooler-hosted component will use to call back the application. This should never be <b>NULL</b>.
     * @param {Pointer<Void>} phNotify A pointer to a structure that represents the registration.
     * @returns {Integer} <table>
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
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-registerforprintasyncnotifications
     * @since windows6.0.6000
     */
    static RegisterForPrintAsyncNotifications(pszName, pNotificationType, eUserFilter, eConversationStyle, pCallback, phNotify) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\RegisterForPrintAsyncNotifications", "ptr", pszName, "ptr", pNotificationType, "int", eUserFilter, "int", eConversationStyle, "ptr", pCallback, "ptr", phNotify, "int")
        return result
    }

    /**
     * Enables an application that has registered to receive notifications from Print Spooler-hosted printing components to unregister.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * A call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-registerforprintasyncnotifications">RegisterForPrintAsyncNotifications</a> must return <i>hRegistrationHandler</i>.
     * 
     * If the channel is bidirectional, a call to <b>UnRegisterForPrintAsyncNotifications</b> only prevents notifications from communication channels created after that point. To end notifications from the existing channel, the listening application must close the channel with <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a>.
     * 
     * A call to <b>UnRegisterForPrintAsyncNotifications</b> will decrement the reference count of the <i>pCallback</i> object passed to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-registerforprintasyncnotifications">RegisterForPrintAsyncNotifications</a>.
     * 
     * After this function succeeds, <i>hRegistrationHandler</i> is invalid and must not be used again.
     * @param {Pointer<Void>} param0 
     * @returns {Integer} <table>
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
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-unregisterforprintasyncnotifications
     * @since windows6.0.6000
     */
    static UnRegisterForPrintAsyncNotifications(param0) {
        result := DllCall("winspool.drv\UnRegisterForPrintAsyncNotifications", "ptr", param0, "int")
        return result
    }

    /**
     * Creates a communication channel between a Print Spooler-hosted printing component, such as a print driver or port monitor, and an application that receives notifications from the component.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * A component can open a channel only if it runs in the Print Spooler's process. For example, if an application loads a printer driver, the driver cannot open a channel, but a printer driver loaded inside the Print Spooler can open a channel. Listening applications can either be inside or outside the Print Spooler's process.
     * 
     * To close a channel, call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a>; however, <b>IPrintAsyncNotifyChannel::CloseChannel</b> cannot be called immediately after the call to <b>CreatePrintAsyncNotifyChannel</b>.
     * 
     * Call IPrintAsyncNotifyChannel::Release() only:
     * 
     * <ol>
     * <li>if it is an explicit match to an earlier IPrintAsyncNotifyChannel::AddRef() call.</li>
     * <li>if the channel is a UniDirectional channel and you are abandoning the pointer received in a successful call to CreatePrintAsyncNotifyChannel.</li>
     * <li>if, after you created a BiDirectional channel or in the implementation of IPrintNotifyAsyncCallback::OnEventNotify and:<ol>
     * <li>you did not call IPrintAsyncNotifyChannel::SendNotification or IPrintAsyncNotifyChannel::CloseChannel OR</li>
     * <li>you did not retry a call to IPrintAsyncNotifyChannel::SendNotification or IPrintAsyncNotifyChannel::CloseChannel that failed OR</li>
     * <li>on the server side, you didn't retry a call to IPrintAsyncNotifyChannel::SendNotification that succeeded with the return value NO_LISTENER OR</li>
     * <li>on the client side, you didn't retry a call to IPrintAsyncNotifyChannel::SendNotification that succeeded with return value CHANNEL_ACQUIRED.</li>
     * </ol>
     * </li>
     * </ol>
     * @param {Pointer<Char>} pszName A pointer to the name of a print server or print queue.
     * @param {Pointer<Guid>} pNotificationType A pointer to the GUID of the data schema for the type of notifications to be sent in the channel.
     * @param {Integer} eUserFilter A value specifying whether notifications will be sent to:
     * 
     * <ul>
     * <li>Only applications that are running as the same user as the Print Spooler-hosted plug-in sender.</li>
     * <li>A broader set of listening applications.</li>
     * </ul>
     * @param {Integer} eConversationStyle A value specifying whether communication is bidirectional or unidirectional.
     * @param {Pointer<IPrintAsyncNotifyCallback>} pCallback A pointer to an object that the listening application will use to call back the Print Spooler-hosted component. This should be <b>NULL</b> if <i>directionality</i> is <b>kUniDirectional</b>.
     * @param {Pointer<IPrintAsyncNotifyChannel>} ppIAsynchNotification A pointer to the new channel.
     * @returns {Integer} <table>
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
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-createprintasyncnotifychannel
     * @since windows6.0.6000
     */
    static CreatePrintAsyncNotifyChannel(pszName, pNotificationType, eUserFilter, eConversationStyle, pCallback, ppIAsynchNotification) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("winspool.drv\CreatePrintAsyncNotifyChannel", "ptr", pszName, "ptr", pNotificationType, "int", eUserFilter, "int", eConversationStyle, "ptr", pCallback, "ptr", ppIAsynchNotification, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pwszPrinterName 
     * @param {Pointer<DEVMODEW>} pDevmode 
     * @param {Pointer<Char>} pwszDocName 
     * @returns {Pointer<Void>} 
     */
    static GdiGetSpoolFileHandle(pwszPrinterName, pDevmode, pwszDocName) {
        pwszPrinterName := pwszPrinterName is String? StrPtr(pwszPrinterName) : pwszPrinterName
        pwszDocName := pwszDocName is String? StrPtr(pwszDocName) : pwszDocName

        result := DllCall("GDI32.dll\GdiGetSpoolFileHandle", "ptr", pwszPrinterName, "ptr", pDevmode, "ptr", pwszDocName)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @returns {Integer} 
     */
    static GdiDeleteSpoolFileHandle(SpoolFileHandle) {
        result := DllCall("GDI32.dll\GdiDeleteSpoolFileHandle", "ptr", SpoolFileHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @returns {Integer} 
     */
    static GdiGetPageCount(SpoolFileHandle) {
        result := DllCall("GDI32.dll\GdiGetPageCount", "ptr", SpoolFileHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @returns {Pointer<Void>} 
     */
    static GdiGetDC(SpoolFileHandle) {
        result := DllCall("GDI32.dll\GdiGetDC", "ptr", SpoolFileHandle)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @param {Integer} Page 
     * @param {Pointer<UInt32>} pdwPageType 
     * @returns {Pointer<Void>} 
     */
    static GdiGetPageHandle(SpoolFileHandle, Page, pdwPageType) {
        result := DllCall("GDI32.dll\GdiGetPageHandle", "ptr", SpoolFileHandle, "uint", Page, "uint*", pdwPageType)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @param {Pointer<DOCINFOW>} pDocInfo 
     * @returns {Integer} 
     */
    static GdiStartDocEMF(SpoolFileHandle, pDocInfo) {
        result := DllCall("GDI32.dll\GdiStartDocEMF", "ptr", SpoolFileHandle, "ptr", pDocInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @returns {Integer} 
     */
    static GdiStartPageEMF(SpoolFileHandle) {
        result := DllCall("GDI32.dll\GdiStartPageEMF", "ptr", SpoolFileHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @param {Pointer<Void>} hemf 
     * @param {Pointer<RECT>} prectDocument 
     * @param {Pointer<RECT>} prectBorder 
     * @param {Pointer<RECT>} prectClip 
     * @returns {Integer} 
     */
    static GdiPlayPageEMF(SpoolFileHandle, hemf, prectDocument, prectBorder, prectClip) {
        result := DllCall("GDI32.dll\GdiPlayPageEMF", "ptr", SpoolFileHandle, "ptr", hemf, "ptr", prectDocument, "ptr", prectBorder, "ptr", prectClip, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @param {Integer} dwOptimization 
     * @returns {Integer} 
     */
    static GdiEndPageEMF(SpoolFileHandle, dwOptimization) {
        result := DllCall("GDI32.dll\GdiEndPageEMF", "ptr", SpoolFileHandle, "uint", dwOptimization, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @returns {Integer} 
     */
    static GdiEndDocEMF(SpoolFileHandle) {
        result := DllCall("GDI32.dll\GdiEndDocEMF", "ptr", SpoolFileHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @param {Integer} dwPageNumber 
     * @param {Pointer<DEVMODEW>} pCurrDM 
     * @param {Pointer<DEVMODEW>} pLastDM 
     * @returns {Integer} 
     */
    static GdiGetDevmodeForPage(SpoolFileHandle, dwPageNumber, pCurrDM, pLastDM) {
        result := DllCall("GDI32.dll\GdiGetDevmodeForPage", "ptr", SpoolFileHandle, "uint", dwPageNumber, "ptr", pCurrDM, "ptr", pLastDM, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SpoolFileHandle 
     * @param {Pointer<DEVMODEW>} pCurrDM 
     * @returns {Integer} 
     */
    static GdiResetDCEMF(SpoolFileHandle, pCurrDM) {
        result := DllCall("GDI32.dll\GdiResetDCEMF", "ptr", SpoolFileHandle, "ptr", pCurrDM, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pPrinterName 
     * @param {Pointer<DEVMODEW>} pDevmode 
     * @param {Pointer<ATTRIBUTE_INFO_3>} pAttributeInfo 
     * @returns {Integer} 
     */
    static GetJobAttributes(pPrinterName, pDevmode, pAttributeInfo) {
        pPrinterName := pPrinterName is String? StrPtr(pPrinterName) : pPrinterName

        result := DllCall("SPOOLSS.dll\GetJobAttributes", "ptr", pPrinterName, "ptr", pDevmode, "ptr", pAttributeInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pPrinterName 
     * @param {Pointer<DEVMODEW>} pDevmode 
     * @param {Integer} dwLevel 
     * @param {Pointer} pAttributeInfo 
     * @param {Integer} nSize 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static GetJobAttributesEx(pPrinterName, pDevmode, dwLevel, pAttributeInfo, nSize, dwFlags) {
        pPrinterName := pPrinterName is String? StrPtr(pPrinterName) : pPrinterName

        result := DllCall("SPOOLSS.dll\GetJobAttributesEx", "ptr", pPrinterName, "ptr", pDevmode, "uint", dwLevel, "ptr", pAttributeInfo, "uint", nSize, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Pointer<DEVMODEW>} pDevMode 
     * @returns {Pointer<Void>} 
     */
    static CreatePrinterIC(hPrinter, pDevMode) {
        result := DllCall("winspool.drv\CreatePrinterIC", "ptr", hPrinter, "ptr", pDevMode)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinterIC 
     * @param {Pointer} pIn 
     * @param {Integer} cIn 
     * @param {Pointer} pOut 
     * @param {Integer} cOut 
     * @param {Integer} ul 
     * @returns {Integer} 
     */
    static PlayGdiScriptOnPrinterIC(hPrinterIC, pIn, cIn, pOut, cOut, ul) {
        result := DllCall("winspool.drv\PlayGdiScriptOnPrinterIC", "ptr", hPrinterIC, "ptr", pIn, "uint", cIn, "ptr", pOut, "uint", cOut, "uint", ul, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinterIC 
     * @returns {Integer} 
     */
    static DeletePrinterIC(hPrinterIC) {
        result := DllCall("winspool.drv\DeletePrinterIC", "ptr", hPrinterIC, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Pointer<UInt32>} pResID 
     * @returns {Integer} 
     */
    static DevQueryPrint(hPrinter, pDevMode, pResID) {
        result := DllCall("winspool.drv\DevQueryPrint", "ptr", hPrinter, "ptr", pDevMode, "uint*", pResID, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    static RevertToPrinterSelf() {
        result := DllCall("SPOOLSS.dll\RevertToPrinterSelf")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hToken 
     * @returns {Integer} 
     */
    static ImpersonatePrinterClient(hToken) {
        result := DllCall("SPOOLSS.dll\ImpersonatePrinterClient", "ptr", hToken, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} fdwChangeFlags 
     * @param {Pointer<UInt32>} pdwResult 
     * @param {Pointer<Void>} pPrinterNotifyInfo 
     * @returns {Integer} 
     */
    static ReplyPrinterChangeNotification(hPrinter, fdwChangeFlags, pdwResult, pPrinterNotifyInfo) {
        result := DllCall("SPOOLSS.dll\ReplyPrinterChangeNotification", "ptr", hPrinter, "uint", fdwChangeFlags, "uint*", pdwResult, "ptr", pPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hNotify 
     * @param {Integer} dwColor 
     * @param {Integer} fdwFlags 
     * @param {Pointer<UInt32>} pdwResult 
     * @param {Pointer<Void>} pPrinterNotifyInfo 
     * @returns {Integer} 
     */
    static ReplyPrinterChangeNotificationEx(hNotify, dwColor, fdwFlags, pdwResult, pPrinterNotifyInfo) {
        result := DllCall("SPOOLSS.dll\ReplyPrinterChangeNotificationEx", "ptr", hNotify, "uint", dwColor, "uint", fdwFlags, "uint*", pdwResult, "ptr", pPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Pointer<PRINTER_NOTIFY_INFO_DATA>} pDataSrc 
     * @returns {Integer} 
     */
    static PartialReplyPrinterChangeNotification(hPrinter, pDataSrc) {
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
     * @returns {Integer} 
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
        result := DllCall("SPOOLSS.dll\RouterAllocBidiMem", "ptr", NumBytes)
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
     * @returns {Pointer} 
     */
    static RouterFreeBidiMem(pMemPointer) {
        result := DllCall("SPOOLSS.dll\RouterFreeBidiMem", "ptr", pMemPointer)
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfoDest 
     * @param {Pointer<PRINTER_NOTIFY_INFO_DATA>} pDataSrc 
     * @param {Integer} fdwFlags 
     * @returns {Integer} 
     */
    static AppendPrinterNotifyInfoData(pInfoDest, pDataSrc, fdwFlags) {
        result := DllCall("SPOOLSS.dll\AppendPrinterNotifyInfoData", "ptr", pInfoDest, "ptr", pDataSrc, "uint", fdwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinterRPC 
     * @param {Integer} fdwFilterFlags 
     * @param {Integer} fdwOptions 
     * @param {Pointer<Void>} hNotify 
     * @param {Pointer<PRINTER_NOTIFY_OPTIONS>} pPrinterNotifyOptions 
     * @returns {Integer} 
     */
    static CallRouterFindFirstPrinterChangeNotification(hPrinterRPC, fdwFilterFlags, fdwOptions, hNotify, pPrinterNotifyOptions) {
        result := DllCall("SPOOLSS.dll\CallRouterFindFirstPrinterChangeNotification", "ptr", hPrinterRPC, "uint", fdwFilterFlags, "uint", fdwOptions, "ptr", hNotify, "ptr", pPrinterNotifyOptions, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} fdwFlags 
     * @param {Integer} fdwOptions 
     * @param {Pointer<Void>} hNotify 
     * @param {Pointer<Void>} pPrinterNotifyOptions 
     * @param {Pointer<Void>} pvReserved1 
     * @returns {Integer} 
     */
    static ProvidorFindFirstPrinterChangeNotification(hPrinter, fdwFlags, fdwOptions, hNotify, pPrinterNotifyOptions, pvReserved1) {
        result := DllCall("SPOOLSS.dll\ProvidorFindFirstPrinterChangeNotification", "ptr", hPrinter, "uint", fdwFlags, "uint", fdwOptions, "ptr", hNotify, "ptr", pPrinterNotifyOptions, "ptr", pvReserved1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @returns {Integer} 
     */
    static ProvidorFindClosePrinterChangeNotification(hPrinter) {
        result := DllCall("SPOOLSS.dll\ProvidorFindClosePrinterChangeNotification", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} fdwFilterFlags 
     * @param {Integer} fdwOptions 
     * @param {Pointer<Void>} pPrinterNotifyOptions 
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<Void>} pNotificationConfig 
     * @param {Pointer<Void>} phNotify 
     * @param {Pointer<Void>} phEvent 
     * @returns {Integer} 
     */
    static SpoolerFindFirstPrinterChangeNotification(hPrinter, fdwFilterFlags, fdwOptions, pPrinterNotifyOptions, pvReserved, pNotificationConfig, phNotify, phEvent) {
        result := DllCall("SPOOLSS.dll\SpoolerFindFirstPrinterChangeNotification", "ptr", hPrinter, "uint", fdwFilterFlags, "uint", fdwOptions, "ptr", pPrinterNotifyOptions, "ptr", pvReserved, "ptr", pNotificationConfig, "ptr", phNotify, "ptr", phEvent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Pointer<UInt32>} pfdwChange 
     * @param {Pointer<Void>} pPrinterNotifyOptions 
     * @param {Pointer<Void>} ppPrinterNotifyInfo 
     * @returns {Integer} 
     */
    static SpoolerFindNextPrinterChangeNotification(hPrinter, pfdwChange, pPrinterNotifyOptions, ppPrinterNotifyInfo) {
        result := DllCall("SPOOLSS.dll\SpoolerFindNextPrinterChangeNotification", "ptr", hPrinter, "uint*", pfdwChange, "ptr", pPrinterNotifyOptions, "ptr", ppPrinterNotifyInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} dwColor 
     * @param {Pointer<PRINTER_NOTIFY_OPTIONS>} pOptions 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} ppInfo 
     * @returns {Integer} 
     */
    static SpoolerRefreshPrinterChangeNotification(hPrinter, dwColor, pOptions, ppInfo) {
        result := DllCall("SPOOLSS.dll\SpoolerRefreshPrinterChangeNotification", "ptr", hPrinter, "uint", dwColor, "ptr", pOptions, "ptr", ppInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfo 
     * @returns {Pointer} 
     */
    static SpoolerFreePrinterNotifyInfo(pInfo) {
        result := DllCall("SPOOLSS.dll\SpoolerFreePrinterNotifyInfo", "ptr", pInfo)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @returns {Integer} 
     */
    static SpoolerFindClosePrinterChangeNotification(hPrinter) {
        result := DllCall("SPOOLSS.dll\SpoolerFindClosePrinterChangeNotification", "ptr", hPrinter, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pszPrinterName 
     * @param {Pointer<Char>} pszKey 
     * @param {Integer} dwCopyFileEvent 
     * @returns {Integer} 
     */
    static SpoolerCopyFileEvent(pszPrinterName, pszKey, dwCopyFileEvent) {
        pszPrinterName := pszPrinterName is String? StrPtr(pszPrinterName) : pszPrinterName
        pszKey := pszKey is String? StrPtr(pszKey) : pszKey

        result := DllCall("mscms.dll\SpoolerCopyFileEvent", "ptr", pszPrinterName, "ptr", pszKey, "uint", dwCopyFileEvent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pszPrinterName 
     * @param {Pointer<Char>} pszDirectory 
     * @param {Pointer<Byte>} pSplClientInfo 
     * @param {Integer} dwLevel 
     * @param {Pointer<Char>} pszSourceDir 
     * @param {Pointer<UInt32>} pcchSourceDirSize 
     * @param {Pointer<Char>} pszTargetDir 
     * @param {Pointer<UInt32>} pcchTargetDirSize 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static GenerateCopyFilePaths(pszPrinterName, pszDirectory, pSplClientInfo, dwLevel, pszSourceDir, pcchSourceDirSize, pszTargetDir, pcchTargetDirSize, dwFlags) {
        pszPrinterName := pszPrinterName is String? StrPtr(pszPrinterName) : pszPrinterName
        pszDirectory := pszDirectory is String? StrPtr(pszDirectory) : pszDirectory
        pszSourceDir := pszSourceDir is String? StrPtr(pszSourceDir) : pszSourceDir
        pszTargetDir := pszTargetDir is String? StrPtr(pszTargetDir) : pszTargetDir

        result := DllCall("mscms.dll\GenerateCopyFilePaths", "ptr", pszPrinterName, "ptr", pszDirectory, "char*", pSplClientInfo, "uint", dwLevel, "ptr", pszSourceDir, "uint*", pcchSourceDirSize, "ptr", pszTargetDir, "uint*", pcchTargetDirSize, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<SHOWUIPARAMS>} pUIParams 
     * @param {Pointer<UInt32>} pResponse 
     * @returns {Integer} 
     */
    static SplPromptUIInUsersSession(hPrinter, JobId, pUIParams, pResponse) {
        result := DllCall("SPOOLSS.dll\SplPromptUIInUsersSession", "ptr", hPrinter, "uint", JobId, "ptr", pUIParams, "uint*", pResponse, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Integer} JobId 
     * @param {Pointer<Int32>} pIsSessionZero 
     * @returns {Integer} 
     */
    static SplIsSessionZero(hPrinter, JobId, pIsSessionZero) {
        result := DllCall("SPOOLSS.dll\SplIsSessionZero", "ptr", hPrinter, "uint", JobId, "int*", pIsSessionZero, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Pointer<Void>} phDeviceObject 
     * @returns {Integer} 
     */
    static AddPrintDeviceObject(hPrinter, phDeviceObject) {
        result := DllCall("SPOOLSS.dll\AddPrintDeviceObject", "ptr", hPrinter, "ptr", phDeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hPrinter 
     * @param {Pointer<Void>} hDeviceObject 
     * @returns {Integer} 
     */
    static UpdatePrintDeviceObject(hPrinter, hDeviceObject) {
        result := DllCall("SPOOLSS.dll\UpdatePrintDeviceObject", "ptr", hPrinter, "ptr", hDeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hDeviceObject 
     * @returns {Integer} 
     */
    static RemovePrintDeviceObject(hDeviceObject) {
        result := DllCall("SPOOLSS.dll\RemovePrintDeviceObject", "ptr", hDeviceObject, "int")
        return result
    }

;@endregion Methods
}
