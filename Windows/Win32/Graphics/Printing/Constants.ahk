#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global USB_PRINTER_INTERFACE_CLASSIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_PRINTER_INTERFACE_IPP := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_PRINTER_INTERFACE_DUAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_PRINT_IPP_COMPAT_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_PRINT_IPP_FAXOUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global USBPRINT_IOCTL_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_GET_LPT_STATUS := 2228272

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_GET_1284_ID := 2228276

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_VENDOR_SET_COMMAND := 2228280

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_VENDOR_GET_COMMAND := 2228284

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_SOFT_RESET := 2228288

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_GET_PROTOCOL := 2228292

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_SET_PROTOCOL := 2228296

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_GET_INTERFACE_TYPE := 2228300

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_SET_PORT_NUMBER := 2228304

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_ADD_MSIPP_COMPAT_ID := 2228308

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_SET_DEVICE_ID := 2228312

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_ADD_CHILD_DEVICE := 2228316

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_CYCLE_PORT := 2228320

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USBPRINT_GET_MFG_MDL_ID := 2228324

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_2STATES := 0

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_3STATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_UDARROW := 2

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_TRACKBAR := 3

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_SCROLLBAR := 4

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_LISTBOX := 5

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_COMBOBOX := 6

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_EDITBOX := 7

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_PUSHBUTTON := 8

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_CHKBOX := 9

/**
 * @type {Integer (UInt32)}
 */
export global TVOT_NSTATES_EX := 10

/**
 * @type {Integer (UInt32)}
 */
export global CHKBOXS_FALSE_TRUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CHKBOXS_NO_YES := 1

/**
 * @type {Integer (UInt32)}
 */
export global CHKBOXS_OFF_ON := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHKBOXS_FALSE_PDATA := 3

/**
 * @type {Integer (UInt32)}
 */
export global CHKBOXS_NO_PDATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global CHKBOXS_OFF_PDATA := 5

/**
 * @type {Integer (UInt32)}
 */
export global CHKBOXS_NONE_PDATA := 6

/**
 * @type {Integer (UInt32)}
 */
export global PUSHBUTTON_TYPE_DLGPROC := 0

/**
 * @type {Integer (UInt32)}
 */
export global PUSHBUTTON_TYPE_CALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global PUSHBUTTON_TYPE_HTCLRADJ := 2

/**
 * @type {Integer (UInt32)}
 */
export global PUSHBUTTON_TYPE_HTSETUP := 3

/**
 * @type {Integer (UInt32)}
 */
export global MAX_RES_STR_CHARS := 160

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_HIDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_DISABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_ICONID_AS_HICON := 4

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_OVERLAY_WARNING_ICON := 8

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_OVERLAY_STOP_ICON := 16

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_OVERLAY_NO_ICON := 32

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_USE_HDLGTEMPLATE := 64

/**
 * @type {Integer (UInt32)}
 */
export global OPTPF_MASK := 127

/**
 * @type {Integer (UInt32)}
 */
export global OPTCF_HIDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPTCF_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPTTF_TYPE_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPTTF_NOSPACE_BEFORE_POSTFIX := 2

/**
 * @type {Integer (UInt32)}
 */
export global OPTTF_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global OTS_LBCB_SORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global OTS_LBCB_PROPPAGE_LBUSECB := 2

/**
 * @type {Integer (UInt32)}
 */
export global OTS_LBCB_PROPPAGE_CBUSELB := 4

/**
 * @type {Integer (UInt32)}
 */
export global OTS_LBCB_INCL_ITEM_NONE := 8

/**
 * @type {Integer (UInt32)}
 */
export global OTS_LBCB_NO_ICON16_IN_ITEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global OTS_PUSH_INCL_SETUP_TITLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global OTS_PUSH_NO_DOT_DOT_DOT := 64

/**
 * @type {Integer (UInt32)}
 */
export global OTS_PUSH_ENABLE_ALWAYS := 128

/**
 * @type {Integer (UInt32)}
 */
export global OTS_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global EPF_PUSH_TYPE_DLGPROC := 1

/**
 * @type {Integer (UInt32)}
 */
export global EPF_INCL_SETUP_TITLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EPF_NO_DOT_DOT_DOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global EPF_ICONID_AS_HICON := 8

/**
 * @type {Integer (UInt32)}
 */
export global EPF_OVERLAY_WARNING_ICON := 16

/**
 * @type {Integer (UInt32)}
 */
export global EPF_OVERLAY_STOP_ICON := 32

/**
 * @type {Integer (UInt32)}
 */
export global EPF_OVERLAY_NO_ICON := 64

/**
 * @type {Integer (UInt32)}
 */
export global EPF_USE_HDLGTEMPLATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global EPF_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_CHECKNAME_AT_FRONT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_CHECKNAME_ONLY_ENABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_ICONID_AS_HICON := 4

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_OVERLAY_WARNING_ICON := 8

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_OVERLAY_ECBICON_IF_CHECKED := 16

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_OVERLAY_STOP_ICON := 32

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_OVERLAY_NO_ICON := 64

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_CHECKNAME_ONLY := 128

/**
 * @type {Integer (UInt32)}
 */
export global ECBF_MASK := 255

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_COLLAPSE := 1

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_HIDE := 2

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_CALLBACK := 4

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_CHANGED := 8

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_CHANGEONCE := 16

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_DISABLED := 32

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_ECB_CHECKED := 64

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_EXT_HIDE := 128

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_EXT_DISABLED := 256

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_SEL_AS_HICON := 512

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_EXT_IS_EXTPUSH := 1024

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_NO_GROUPBOX_NAME := 2048

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_OVERLAY_WARNING_ICON := 4096

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_OVERLAY_STOP_ICON := 8192

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_OVERLAY_NO_ICON := 16384

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_INITIAL_TVITEM := 32768

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_HAS_POIEXT := 65536

/**
 * @type {Integer (Int32)}
 */
export global OPTIF_MASK := 131071

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_FIRST := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_ORIENTATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_SCALE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_COPIES_COLLATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_DEFSOURCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_PRINTQUALITY := 5

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_COLOR := 6

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_DUPLEX := 7

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_TTOPTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_FORMNAME := 9

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_ICMMETHOD := 10

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_ICMINTENT := 11

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_MEDIATYPE := 12

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_DITHERTYPE := 13

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_OUTPUTBIN := 14

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_QUALITY := 15

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_NUP := 16

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_PAGEORDER := 17

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_NUP_DIRECTION := 18

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_MANUAL_DUPLEX := 19

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_STAPLE := 20

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_BOOKLET_EDGE := 21

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_LAST := 21

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_OEM_PAPER_ITEM := 97

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_OEM_GRAPHIC_ITEM := 98

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_OEM_ROOT_ITEM := 99

/**
 * @type {Integer (UInt32)}
 */
export global DMPUB_USER := 100

/**
 * @type {Integer (UInt32)}
 */
export global OIEXTF_ANSI_STRING := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_SEL_CHANGED := 0

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_PUSHBUTTON := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_ECB_CHANGED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_DLGPROC := 3

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_UNDO_CHANGES := 4

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_EXTPUSH := 5

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_APPLYNOW := 6

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_OPTITEM_SETFOCUS := 7

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_ITEMS_REVERTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_ABOUT := 9

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_SETACTIVE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_REASON_KILLACTIVE := 11

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_ACTION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_ACTION_OPTIF_CHANGED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_ACTION_REINIT_ITEMS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_ACTION_NO_APPLY_EXIT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CPSUICB_ACTION_ITEMS_APPLIED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DP_STD_TREEVIEWPAGE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DP_STD_DOCPROPPAGE2 := 65534

/**
 * @type {Integer (UInt32)}
 */
export global DP_STD_DOCPROPPAGE1 := 65533

/**
 * @type {Integer (UInt32)}
 */
export global DP_STD_RESERVED_START := 65520

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DLGPAGE_COUNT := 64

/**
 * @type {Integer (UInt32)}
 */
export global DPF_ICONID_AS_HICON := 1

/**
 * @type {Integer (UInt32)}
 */
export global DPF_USE_HDLGTEMPLATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPSUIF_UPDATE_PERMISSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPSUIF_ICONID_AS_HICON := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPSUIF_ABOUT_CALLBACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_HPROPSHEETPAGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PROPSHEETPAGEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PCOMPROPSHEETUIA := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PCOMPROPSHEETUIW := 3

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PFNPROPSHEETUIA := 4

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PFNPROPSHEETUIW := 5

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_DELETE_HCOMPROPSHEET := 6

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_HSTARTPAGE := 7

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_GET_PAGECOUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_RESULT := 9

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_GET_HPSUIPAGES := 10

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_LOAD_CPSUI_STRINGA := 11

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_LOAD_CPSUI_STRINGW := 12

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_LOAD_CPSUI_ICON := 13

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_GET_PFNPROPSHEETUI_ICON := 14

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PROPSHEETPAGEA := 15

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_INSERT_PSUIPAGEA := 16

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_INSERT_PSUIPAGEW := 17

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_PSUIPAGE_TITLEA := 18

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_PSUIPAGE_TITLEW := 19

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_PSUIPAGE_ICON := 20

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_DATABLOCK := 21

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_QUERY_DATABLOCK := 22

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_DMPUB_HIDEBITS := 23

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_IGNORE_CPSUI_PSN_APPLY := 24

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_DO_APPLY_CPSUI := 25

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_FUSION_CONTEXT := 26

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CPSFUNC_INDEX := 26

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PCOMPROPSHEETUI := 3

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PFNPROPSHEETUI := 5

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_LOAD_CPSUI_STRING := 12

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_ADD_PROPSHEETPAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_INSERT_PSUIPAGE := 17

/**
 * @type {Integer (UInt32)}
 */
export global CPSFUNC_SET_PSUIPAGE_TITLE := 19

/**
 * @type {Integer (UInt32)}
 */
export global SR_OWNER := 0

/**
 * @type {Integer (UInt32)}
 */
export global SR_OWNER_PARENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSUIPAGEINSERT_GROUP_PARENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSUIPAGEINSERT_PCOMPROPSHEETUI := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSUIPAGEINSERT_PFNPROPSHEETUI := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSUIPAGEINSERT_PROPSHEETPAGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PSUIPAGEINSERT_HPROPSHEETPAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PSUIPAGEINSERT_DLL := 5

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PSUIPAGEINSERT_INDEX := 5

/**
 * @type {Integer (UInt32)}
 */
export global INSPSUIPAGE_MODE_BEFORE := 0

/**
 * @type {Integer (UInt32)}
 */
export global INSPSUIPAGE_MODE_AFTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global INSPSUIPAGE_MODE_FIRST_CHILD := 2

/**
 * @type {Integer (UInt32)}
 */
export global INSPSUIPAGE_MODE_LAST_CHILD := 3

/**
 * @type {Integer (UInt32)}
 */
export global INSPSUIPAGE_MODE_INDEX := 4

/**
 * @type {Integer (UInt32)}
 */
export global SSP_TVPAGE := 10000

/**
 * @type {Integer (UInt32)}
 */
export global SSP_STDPAGE1 := 10001

/**
 * @type {Integer (UInt32)}
 */
export global SSP_STDPAGE2 := 10002

/**
 * @type {Integer (UInt32)}
 */
export global APPLYCPSUI_NO_NEWDEF := 1

/**
 * @type {Integer (UInt32)}
 */
export global APPLYCPSUI_OK_CANCEL_BUTTON := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROPSHEETUI_REASON_INIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROPSHEETUI_REASON_GET_INFO_HEADER := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROPSHEETUI_REASON_DESTROY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROPSHEETUI_REASON_SET_RESULT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PROPSHEETUI_REASON_GET_ICON := 4

/**
 * @type {Integer (UInt32)}
 */
export global PROPSHEETUI_REASON_BEFORE_INIT := 5

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PROPSHEETUI_REASON_INDEX := 5

/**
 * @type {Integer (UInt32)}
 */
export global PROPSHEETUI_INFO_VERSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global PSUIINFO_UNICODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSUIHDRF_OBSOLETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSUIHDRF_NOAPPLYNOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSUIHDRF_PROPTITLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PSUIHDRF_USEHICON := 8

/**
 * @type {Integer (UInt32)}
 */
export global PSUIHDRF_DEFTITLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PSUIHDRF_EXACT_PTITLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CPSUI_CANCEL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CPSUI_OK := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPSUI_RESTARTWINDOWS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPSUI_REBOOTSYSTEM := 3

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_GETLASTERROR := -1

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_ALLOCMEM_FAILED := -2

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_PDATA := -3

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_LPARAM := -4

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_HINST := -5

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_CALLERNAME := -6

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_OPTITEMNAME := -7

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NO_PROPSHEETPAGE := -8

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_TOO_MANY_PROPSHEETPAGES := -9

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_CREATEPROPPAGE_FAILED := -10

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_MORE_THAN_ONE_TVPAGE := -11

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_MORE_THAN_ONE_STDPAGE := -12

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_PDLGPAGE := -13

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_DLGPAGE_CBSIZE := -14

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_TOO_MANY_DLGPAGES := -15

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_DLGPAGEIDX := -16

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_SUBITEM_DIFF_DLGPAGEIDX := -17

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_POPTITEM := -18

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_OPTITEM_CBSIZE := -19

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_OPTTYPE_CBSIZE := -20

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_OPTTYPE_COUNT := -21

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_POPTPARAM := -22

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_OPTPARAM_CBSIZE := -23

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_EDITBOX_PSEL := -24

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_EDITBOX_BUF_SIZE := -25

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_ECB_CBSIZE := -26

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_ECB_PTITLE := -27

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_ECB_PCHECKEDNAME := -28

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_DMPUBID := -29

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_DMPUB_TVOT := -30

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_CREATE_TRACKBAR_FAILED := -31

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_CREATE_UDARROW_FAILED := -32

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_CREATE_IMAGELIST_FAILED := -33

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_TVOT_TYPE := -34

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_LBCB_TYPE := -35

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_SUBITEM_DIFF_OPTIF_HIDE := -36

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_PUSHBUTTON_TYPE := -38

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INVALID_EXTPUSH_CBSIZE := -39

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_EXTPUSH_DLGPROC := -40

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NO_EXTPUSH_DLGTEMPLATEID := -41

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_NULL_EXTPUSH_CALLBACK := -42

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_DMCOPIES_USE_EXTPUSH := -43

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_ZERO_OPTITEM := -44

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_FUNCTION_NOT_IMPLEMENTED := -9999

/**
 * @type {Integer (Int32)}
 */
export global ERR_CPSUI_INTERNAL_ERROR := -10000

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ICONID_FIRST := 64000

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_EMPTY := 64000

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_SEL_NONE := 64001

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_WARNING := 64002

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_NO := 64003

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_YES := 64004

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_FALSE := 64005

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_TRUE := 64006

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_OFF := 64007

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ON := 64008

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PAPER_OUTPUT := 64009

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ENVELOPE := 64010

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_MEM := 64011

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_FONTCARTHDR := 64012

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_FONTCART := 64013

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_STAPLER_ON := 64014

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_STAPLER_OFF := 64015

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_HT_HOST := 64016

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_HT_DEVICE := 64017

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_TT_PRINTASGRAPHIC := 64018

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_TT_DOWNLOADSOFT := 64019

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_TT_DOWNLOADVECT := 64020

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_TT_SUBDEV := 64021

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PORTRAIT := 64022

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LANDSCAPE := 64023

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ROT_LAND := 64024

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_AUTOSEL := 64025

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PAPER_TRAY := 64026

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PAPER_TRAY2 := 64027

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PAPER_TRAY3 := 64028

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_TRANSPARENT := 64029

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_COLLATE := 64030

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DUPLEX_NONE := 64031

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DUPLEX_HORZ := 64032

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DUPLEX_VERT := 64033

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_RES_DRAFT := 64034

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_RES_LOW := 64035

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_RES_MEDIUM := 64036

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_RES_HIGH := 64037

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_RES_PRESENTATION := 64038

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_MONO := 64039

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_COLOR := 64040

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DITHER_NONE := 64041

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DITHER_COARSE := 64042

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DITHER_FINE := 64043

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DITHER_LINEART := 64044

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_SCALING := 64045

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_COPY := 64046

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_HTCLRADJ := 64047

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_HALFTONE_SETUP := 64048

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_WATERMARK := 64049

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ERROR := 64050

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ICM_OPTION := 64051

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ICM_METHOD := 64052

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ICM_INTENT := 64053

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_STD_FORM := 64054

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_OUTBIN := 64055

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_OUTPUT := 64056

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_GRAPHIC := 64057

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ADVANCE := 64058

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DOCUMENT := 64059

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DEVICE := 64060

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DEVICE2 := 64061

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PRINTER := 64062

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PRINTER2 := 64063

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PRINTER3 := 64064

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PRINTER4 := 64065

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_OPTION := 64066

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_OPTION2 := 64067

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_STOP := 64068

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_NOTINSTALLED := 64069

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_WARNING_OVERLAY := 64070

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_STOP_WARNING_OVERLAY := 64071

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_GENERIC_OPTION := 64072

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_GENERIC_ITEM := 64073

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_RUN_DIALOG := 64074

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_QUESTION := 64075

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_FORMTRAYASSIGN := 64076

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PRINTER_FOLDER := 64077

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_INSTALLABLE_OPTION := 64078

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PRINTER_FEATURE := 64079

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DEVICE_FEATURE := 64080

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_FONTSUB := 64081

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_POSTSCRIPT := 64082

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_TELEPHONE := 64083

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DUPLEX_NONE_L := 64084

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DUPLEX_HORZ_L := 64085

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_DUPLEX_VERT_L := 64086

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LF_PEN_PLOTTER := 64087

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_SF_PEN_PLOTTER := 64088

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LF_RASTER_PLOTTER := 64089

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_SF_RASTER_PLOTTER := 64090

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ROLL_PAPER := 64091

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PEN_CARROUSEL := 64092

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PLOTTER_PEN := 64093

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_MANUAL_FEED := 64094

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_FAX := 64095

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_PAGE_PROTECT := 64096

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ENVELOPE_FEED := 64097

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_FONTCART_SLOT := 64098

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_PORTRAIT := 64099

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_ARROWL := 64100

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_ARROWS := 64101

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_BOOKLETL := 64102

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_BOOKLETP := 64103

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_ARROWLR := 64104

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_ROT_PORT := 64105

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_BOOKLETL_NB := 64106

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_LAYOUT_BMP_BOOKLETP_NB := 64107

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ROT_PORT := 64110

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_NUP_BORDER := 64111

/**
 * @type {Integer (UInt32)}
 */
export global IDI_CPSUI_ICONID_LAST := 64111

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STRID_FIRST := 64700

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SETUP := 64700

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MORE := 64701

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_CHANGE := 64702

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_OPTION := 64703

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_OF := 64704

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_RANGE_FROM := 64705

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TO := 64706

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COLON_SEP := 64707

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LEFT_ANGLE := 64708

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_RIGHT_ANGLE := 64709

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SLASH_SEP := 64710

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PERCENT := 64711

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LBCB_NOSEL := 64712

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PROPERTIES := 64713

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DEFAULTDOCUMENT := 64714

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DOCUMENT := 64715

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ADVANCEDOCUMENT := 64716

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PRINTER := 64717

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_AUTOSELECT := 64718

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PAPER_OUTPUT := 64719

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_GRAPHIC := 64720

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_OPTIONS := 64721

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ADVANCED := 64722

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STDDOCPROPTAB := 64723

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STDDOCPROPTVTAB := 64724

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DEVICEOPTIONS := 64725

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FALSE := 64726

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TRUE := 64727

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NO := 64728

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_YES := 64729

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_OFF := 64730

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ON := 64731

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DEFAULT := 64732

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ERROR := 64733

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NONE := 64734

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NOT := 64735

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_EXIST := 64736

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NOTINSTALLED := 64737

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ORIENTATION := 64738

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SCALING := 64739

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUM_OF_COPIES := 64740

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SOURCE := 64741

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PRINTQUALITY := 64742

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_RESOLUTION := 64743

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COLOR_APPERANCE := 64744

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DUPLEX := 64745

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TTOPTION := 64746

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FORMNAME := 64747

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICM := 64748

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICMMETHOD := 64749

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICMINTENT := 64750

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MEDIA := 64751

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DITHERING := 64752

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PORTRAIT := 64753

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LANDSCAPE := 64754

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ROT_LAND := 64755

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COLLATE := 64756

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COLLATED := 64757

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PRINTFLDSETTING := 64758

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DRAFT := 64759

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LOW := 64760

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MEDIUM := 64761

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_HIGH := 64762

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PRESENTATION := 64763

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COLOR := 64764

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_GRAYSCALE := 64765

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MONOCHROME := 64766

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SIMPLEX := 64767

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_HORIZONTAL := 64768

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_VERTICAL := 64769

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LONG_SIDE := 64770

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SHORT_SIDE := 64771

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TT_PRINTASGRAPHIC := 64772

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TT_DOWNLOADSOFT := 64773

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TT_DOWNLOADVECT := 64774

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TT_SUBDEV := 64775

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICM_BLACKWHITE := 64776

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICM_NO := 64777

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICM_YES := 64778

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICM_SATURATION := 64779

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICM_CONTRAST := 64780

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ICM_COLORMETRIC := 64781

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STANDARD := 64782

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_GLOSSY := 64783

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TRANSPARENCY := 64784

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_REGULAR := 64785

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_BOND := 64786

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COARSE := 64787

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FINE := 64788

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LINEART := 64789

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ERRDIFFUSE := 64790

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_HALFTONE := 64791

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_HTCLRADJ := 64792

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_USE_HOST_HT := 64793

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_USE_DEVICE_HT := 64794

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_USE_PRINTER_HT := 64795

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_OUTBINASSIGN := 64796

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_WATERMARK := 64797

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FORMTRAYASSIGN := 64798

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_UPPER_TRAY := 64799

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ONLYONE := 64800

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LOWER_TRAY := 64801

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MIDDLE_TRAY := 64802

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MANUAL_TRAY := 64803

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ENVELOPE_TRAY := 64804

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ENVMANUAL_TRAY := 64805

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TRACTOR_TRAY := 64806

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SMALLFMT_TRAY := 64807

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LARGEFMT_TRAY := 64808

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LARGECAP_TRAY := 64809

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_CASSETTE_TRAY := 64810

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DEFAULT_TRAY := 64811

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FORMSOURCE := 64812

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MANUALFEED := 64813

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PRINTERMEM_KB := 64814

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PRINTERMEM_MB := 64815

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PAGEPROTECT := 64816

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_HALFTONE_SETUP := 64817

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_INSTFONTCART := 64818

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SLOT1 := 64819

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SLOT2 := 64820

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SLOT3 := 64821

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SLOT4 := 64822

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LEFT_SLOT := 64823

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_RIGHT_SLOT := 64824

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STAPLER := 64825

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STAPLER_ON := 64826

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STAPLER_OFF := 64827

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STACKER := 64828

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MAILBOX := 64829

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COPY := 64830

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_COPIES := 64831

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_TOTAL := 64832

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MAKE := 64833

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PRINT := 64834

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FAX := 64835

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PLOT := 64836

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SLOW := 64837

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FAST := 64838

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ROTATED := 64839

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_RESET := 64840

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ALL := 64841

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DEVICE := 64842

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SETTINGS := 64843

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_REVERT := 64844

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_CHANGES := 64845

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_CHANGED := 64846

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_WARNING := 64847

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ABOUT := 64848

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_VERSION := 64849

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NO_NAME := 64850

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SETTING := 64851

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DEVICE_SETTINGS := 64852

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STDDOCPROPTAB1 := 64853

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STDDOCPROPTAB2 := 64854

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_PAGEORDER := 64855

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_FRONTTOBACK := 64856

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_BACKTOFRONT := 64857

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_QUALITY_SETTINGS := 64858

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_QUALITY_DRAFT := 64859

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_QUALITY_BETTER := 64860

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_QUALITY_BEST := 64861

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_QUALITY_CUSTOM := 64862

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_OUTPUTBIN := 64863

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP := 64864

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_NORMAL := 64865

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_TWOUP := 64866

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_FOURUP := 64867

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_SIXUP := 64868

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_NINEUP := 64869

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_SIXTEENUP := 64870

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SIDE1 := 64871

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_SIDE2 := 64872

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_BOOKLET := 64873

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_POSTER := 64874

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_POSTER_2x2 := 64875

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_POSTER_3x3 := 64876

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_POSTER_4x4 := 64877

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_DIRECTION := 64878

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_RIGHT_THEN_DOWN := 64879

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DOWN_THEN_RIGHT := 64880

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_LEFT_THEN_DOWN := 64881

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_DOWN_THEN_LEFT := 64882

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MANUAL_DUPLEX := 64883

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MANUAL_DUPLEX_ON := 64884

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_MANUAL_DUPLEX_OFF := 64885

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_ROT_PORT := 64886

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STAPLE := 64887

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_BOOKLET_EDGE := 64888

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_BOOKLET_EDGE_LEFT := 64889

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_BOOKLET_EDGE_RIGHT := 64890

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_BORDER := 64891

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_NUP_BORDERED := 64892

/**
 * @type {Integer (UInt32)}
 */
export global IDS_CPSUI_STRID_LAST := 64892

/**
 * @type {String}
 */
export global XPS_FP_PRINTER_NAME := "PrinterName"

/**
 * @type {String}
 */
export global XPS_FP_PROGRESS_REPORT := "ProgressReport"

/**
 * @type {String}
 */
export global XPS_FP_PRINTER_HANDLE := "PrinterHandle"

/**
 * @type {String}
 */
export global XPS_FP_USER_PRINT_TICKET := "PerUserPrintTicket"

/**
 * @type {String}
 */
export global XPS_FP_USER_TOKEN := "UserSecurityToken"

/**
 * @type {String}
 */
export global XPS_FP_JOB_ID := "PrintJobId"

/**
 * @type {String}
 */
export global XPS_FP_PRINT_CLASS_FACTORY := "PrintClassFactory"

/**
 * @type {String}
 */
export global XPS_FP_OUTPUT_FILE := "PrintOutputFileName"

/**
 * @type {String}
 */
export global XPS_FP_MS_CONTENT_TYPE := "DriverMultiContentType"

/**
 * @type {String}
 */
export global XPS_FP_MS_CONTENT_TYPE_XPS := "XPS"

/**
 * @type {String}
 */
export global XPS_FP_MS_CONTENT_TYPE_OPENXPS := "OpenXPS"

/**
 * @type {String}
 */
export global XPS_FP_DRIVER_PROPERTY_BAG := "DriverPropertyBag"

/**
 * @type {String}
 */
export global XPS_FP_QUEUE_PROPERTY_BAG := "QueuePropertyBag"

/**
 * @type {String}
 */
export global XPS_FP_MERGED_DATAFILE_PATH := "MergedDataFilePath"

/**
 * @type {String}
 */
export global XPS_FP_RESOURCE_DLL_PATHS := "ResourceDLLPaths"

/**
 * @type {String}
 */
export global XPS_FP_JOB_LEVEL_PRINTTICKET := "JobPrintTicket"

/**
 * @type {String}
 */
export global XPS_FP_PRINTDEVICECAPABILITIES := "PrintDeviceCapabilities"

/**
 * @type {String}
 */
export global XPS_FP_FAX_JOB_PROPERTIES := "JobFaxProperties"

/**
 * @type {Integer (UInt32)}
 */
export global MXDC_ESCAPE := 4122

/**
 * @type {Integer (UInt32)}
 */
export global MXDCOP_GET_FILENAME := 14

/**
 * @type {Integer (UInt32)}
 */
export global MXDCOP_PRINTTICKET_FIXED_DOC_SEQ := 22

/**
 * @type {Integer (UInt32)}
 */
export global MXDCOP_PRINTTICKET_FIXED_DOC := 24

/**
 * @type {Integer (UInt32)}
 */
export global MXDCOP_PRINTTICKET_FIXED_PAGE := 26

/**
 * @type {Integer (UInt32)}
 */
export global MXDCOP_SET_S0PAGE := 28

/**
 * @type {Integer (UInt32)}
 */
export global MXDCOP_SET_S0PAGE_RESOURCE := 30

/**
 * @type {Integer (UInt32)}
 */
export global MXDCOP_SET_XPSPASSTHRU_MODE := 32

/**
 * @type {Guid}
 */
export global CLSID_OEMRENDER := Guid("{6d6abf26-9f38-11d1-882a-00c04fb961ec}")

/**
 * @type {Guid}
 */
export global CLSID_OEMUI := Guid("{abce80d7-9f46-11d1-882a-00c04fb961ec}")

/**
 * @type {Guid}
 */
export global CLSID_OEMUIMXDC := Guid("{4e144300-5b43-4288-932a-5e4dd6d82bed}")

/**
 * @type {Guid}
 */
export global CLSID_OEMPTPROVIDER := Guid("{91723892-45d2-48e2-9ec9-562379daf992}")

/**
 * @type {Integer (Int32)}
 */
export global S_DEVCAP_OUTPUT_FULL_REPLACEMENT := 318465

/**
 * @type {Guid}
 */
export global CLSID_PTPROVIDER := Guid("{46ac151b-8490-4531-96cc-55bf2bf19e11}")

/**
 * @type {Integer (UInt32)}
 */
export global E_VERSION_NOT_SUPPORTED := 2147745793

/**
 * @type {Integer (UInt32)}
 */
export global S_NO_CONFLICT := 262145

/**
 * @type {Integer (UInt32)}
 */
export global S_CONFLICT_RESOLVED := 262146

/**
 * @type {Guid}
 */
export global PRINTER_EXTENSION_DETAILEDREASON_PRINTER_STATUS := Guid("{5d5a1704-dfd1-4181-8eee-815c86edad31}")

/**
 * @type {Guid}
 */
export global PRINTER_EXTENSION_REASON_PRINT_PREFERENCES := Guid("{ec8f261f-267c-469f-b5d6-3933023c29cc}")

/**
 * @type {Guid}
 */
export global PRINTER_EXTENSION_REASON_DRIVER_EVENT := Guid("{23bb1328-63de-4293-915b-a6a23d929acb}")

/**
 * @type {Guid}
 */
export global FMTID_PrinterPropertyBag := Guid("{75f9adca-097d-45c3-a6e4-bab29e276f3e}")

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_OEMINTF_VERSION := 65536

/**
 * @type {Integer (UInt32)}
 */
export global OEM_MODE_PUBLISHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMGI_GETSIGNATURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMGI_GETINTERFACEVERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global OEMGI_GETVERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global OEMGI_GETPUBLISHERINFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global OEMGI_GETREQUESTEDHELPERINTERFACES := 5

/**
 * @type {Integer (UInt32)}
 */
export global OEMPUBLISH_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global OEMPUBLISH_IPRINTCOREHELPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMDM_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMDM_DEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global OEMDM_CONVERT := 3

/**
 * @type {Integer (UInt32)}
 */
export global OEMDM_MERGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_MIN_DOCSTICKY := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PSDM_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PSDM_DIALECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PSDM_TTDLFMT := 3

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PSDM_NUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PSDM_PSLEVEL := 5

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PSDM_CUSTOMSIZE := 6

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_UNIDM_GPDVER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_UNIDM_FLAGS := 16385

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_MIN_PRINTERSTICKY := 32768

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PRINTFLAGS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_FREEMEM := 32769

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_JOBTIMEOUT := 32770

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_WAITTIMEOUT := 32771

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_PROTOCOL := 32772

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_MINOUTLINE := 32773

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_MAXBITMAP := 32774

/**
 * @type {Integer (UInt32)}
 */
export global OEMGDS_MAX := 65536

/**
 * @type {Integer (UInt32)}
 */
export global GPD_OEMCUSTOMDATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global MV_UPDATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MV_RELATIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MV_GRAPHICS := 4

/**
 * @type {Integer (UInt32)}
 */
export global MV_PHYSICAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global MV_SENDXMOVECMD := 16

/**
 * @type {Integer (UInt32)}
 */
export global MV_SENDYMOVECMD := 32

/**
 * @type {Integer (UInt32)}
 */
export global OEMTTY_INFO_MARGINS := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMTTY_INFO_CODEPAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global OEMTTY_INFO_NUM_UFMS := 3

/**
 * @type {Integer (UInt32)}
 */
export global OEMTTY_INFO_UFM_IDS := 4

/**
 * @type {Integer (UInt32)}
 */
export global UFOFLAG_TTFONT := 1

/**
 * @type {Integer (UInt32)}
 */
export global UFOFLAG_TTDOWNLOAD_BITMAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global UFOFLAG_TTDOWNLOAD_TTOUTLINE := 4

/**
 * @type {Integer (UInt32)}
 */
export global UFOFLAG_TTOUTLINE_BOLD_SIM := 8

/**
 * @type {Integer (UInt32)}
 */
export global UFOFLAG_TTOUTLINE_ITALIC_SIM := 16

/**
 * @type {Integer (UInt32)}
 */
export global UFOFLAG_TTOUTLINE_VERTICAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global UFOFLAG_TTSUBSTITUTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global UFO_GETINFO_FONTOBJ := 1

/**
 * @type {Integer (UInt32)}
 */
export global UFO_GETINFO_GLYPHSTRING := 2

/**
 * @type {Integer (UInt32)}
 */
export global UFO_GETINFO_GLYPHBITMAP := 3

/**
 * @type {Integer (UInt32)}
 */
export global UFO_GETINFO_GLYPHWIDTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global UFO_GETINFO_MEMORY := 5

/**
 * @type {Integer (UInt32)}
 */
export global UFO_GETINFO_STDVARIABLE := 6

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_PRINTDIRINCCDEGREES := 0

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_GRAYPERCENTAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_NEXTFONTID := 2

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_NEXTGLYPH := 3

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_FONTHEIGHT := 4

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_FONTWIDTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_FONTBOLD := 6

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_FONTITALIC := 7

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_FONTUNDERLINE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_FONTSTRIKETHRU := 9

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_CURRENTFONTID := 10

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_TEXTYRES := 11

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_TEXTXRES := 12

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_FONTMAXWIDTH := 13

/**
 * @type {Integer (UInt32)}
 */
export global FNT_INFO_MAX := 14

/**
 * @type {Integer (UInt32)}
 */
export global TTDOWNLOAD_DONTCARE := 0

/**
 * @type {Integer (UInt32)}
 */
export global TTDOWNLOAD_GRAPHICS := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTDOWNLOAD_BITMAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTDOWNLOAD_TTOUTLINE := 3

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_UNICODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_TRANSDATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_GLYPHHANDLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_GLYPHID := 4

/**
 * @type {Integer (UInt32)}
 */
export global PDEV_ADJUST_PAPER_MARGIN_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PDEV_HOSTFONT_ENABLED_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PDEV_USE_TRUE_COLOR_TYPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PDEV_ADJUST_GRAPHICS_RESOLUTION_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PDEV_ADJUST_IMAGEABLE_ORIGIN_AREA_TYPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PDEV_ADJUST_PHYSICAL_PAPER_SIZE_TYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global OEMCUIP_DOCPROP := 1

/**
 * @type {Integer (UInt32)}
 */
export global OEMCUIP_PRNPROP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CUSTOMPARAM_WIDTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global CUSTOMPARAM_HEIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CUSTOMPARAM_WIDTHOFFSET := 2

/**
 * @type {Integer (UInt32)}
 */
export global CUSTOMPARAM_HEIGHTOFFSET := 3

/**
 * @type {Integer (UInt32)}
 */
export global CUSTOMPARAM_ORIENTATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global CUSTOMPARAM_MAX := 5

/**
 * @type {Integer (UInt32)}
 */
export global SETOPTIONS_FLAG_RESOLVE_CONFLICT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SETOPTIONS_FLAG_KEEP_CONFLICT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SETOPTIONS_RESULT_NO_CONFLICT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SETOPTIONS_RESULT_CONFLICT_RESOLVED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SETOPTIONS_RESULT_CONFLICT_REMAINED := 2

/**
 * @type {Integer (UInt32)}
 */
export global UNIFM_VERSION_1_0 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global UFM_SOFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global UFM_CART := 2

/**
 * @type {Integer (UInt32)}
 */
export global UFM_SCALABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DF_TYPE_HPINTELLIFONT := 0

/**
 * @type {Integer (UInt32)}
 */
export global DF_TYPE_TRUETYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DF_TYPE_PST1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DF_TYPE_CAPSL := 3

/**
 * @type {Integer (UInt32)}
 */
export global DF_TYPE_OEM1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DF_TYPE_OEM2 := 5

/**
 * @type {Integer (UInt32)}
 */
export global DF_NOITALIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global DF_NOUNDER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DF_XM_CR := 4

/**
 * @type {Integer (UInt32)}
 */
export global DF_NO_BOLD := 8

/**
 * @type {Integer (UInt32)}
 */
export global DF_NO_DOUBLE_UNDERLINE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DF_NO_STRIKETHRU := 32

/**
 * @type {Integer (UInt32)}
 */
export global DF_BKSP_OK := 64

/**
 * @type {Integer (UInt32)}
 */
export global UNI_GLYPHSETDATA_VERSION_1_0 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_FORMAT_MASK := 7

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_COMPOSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_DIRECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_PAIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_DOUBLEBYTECHAR_MASK := 24

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_SINGLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_DOUBLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_PREDEFIN_MASK := 224

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_REPLACE := 32

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_ADD := 64

/**
 * @type {Integer (UInt32)}
 */
export global MTYPE_DISABLE := 128

/**
 * @type {Integer (UInt32)}
 */
export global CC_NOPRECNV := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CC_DEFAULT := 0

/**
 * @type {Integer (Int32)}
 */
export global CC_CP437 := -1

/**
 * @type {Integer (Int32)}
 */
export global CC_CP850 := -2

/**
 * @type {Integer (Int32)}
 */
export global CC_CP863 := -3

/**
 * @type {Integer (Int32)}
 */
export global CC_BIG5 := -10

/**
 * @type {Integer (Int32)}
 */
export global CC_ISC := -11

/**
 * @type {Integer (Int32)}
 */
export global CC_JIS := -12

/**
 * @type {Integer (Int32)}
 */
export global CC_JIS_ANK := -13

/**
 * @type {Integer (Int32)}
 */
export global CC_NS86 := -14

/**
 * @type {Integer (Int32)}
 */
export global CC_TCA := -15

/**
 * @type {Integer (Int32)}
 */
export global CC_GB2312 := -16

/**
 * @type {Integer (Int32)}
 */
export global CC_SJIS := -17

/**
 * @type {Integer (Int32)}
 */
export global CC_WANSUNG := -18

/**
 * @type {Integer (UInt32)}
 */
export global UFF_VERSION_NUMBER := 65537

/**
 * @type {Integer (UInt32)}
 */
export global FONT_DIR_SORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_UFM := 1

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_IFI := 2

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_SOFTFONT := 4

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_PERMANENT_SF := 8

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_DEVICEFONT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_GLYPHSET_GTT := 32

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_GLYPHSET_RLE := 64

/**
 * @type {Integer (UInt32)}
 */
export global FONT_FL_RESERVED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FG_CANCHANGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global WM_FI_FILENAME := 900

/**
 * @type {Integer (UInt32)}
 */
export global UNKNOWN_PROTOCOL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROTOCOL_UNKNOWN_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RAWTCP := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROTOCOL_RAWTCP_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LPR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROTOCOL_LPR_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PORTNAME_LEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NETWORKNAME_LEN := 49

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NETWORKNAME2_LEN := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SNMP_COMMUNITY_STR_LEN := 33

/**
 * @type {Integer (UInt32)}
 */
export global MAX_QUEUENAME_LEN := 33

/**
 * @type {Integer (UInt32)}
 */
export global MAX_IPADDR_STR_LEN := 16

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ADDRESS_STR_LEN := 13

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DEVICEDESCRIPTION_STR_LEN := 257

/**
 * @type {Integer (UInt32)}
 */
export global DPS_NOPERMISSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DM_ADVANCED := 16

/**
 * @type {Integer (UInt32)}
 */
export global DM_NOPERMISSION := 32

/**
 * @type {Integer (UInt32)}
 */
export global DM_USER_DEFAULT := 64

/**
 * @type {Integer (UInt32)}
 */
export global DM_PROMPT_NON_MODAL := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global DM_INVALIDATE_DRIVER_CACHE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global DM_RESERVED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CDM_CONVERT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CDM_CONVERT351 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CDM_DRIVER_DEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_FIRST := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_CREATEDCPRE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_CREATEDCPOST := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_RESETDCPRE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_RESETDCPOST := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_STARTDOC := 5

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_STARTDOCPRE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_STARTPAGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_ENDPAGE := 7

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_ENDDOC := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_ENDDOCPRE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_ABORTDOC := 9

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_DELETEDC := 10

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_ESCAPE := 11

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_ENDDOCPOST := 12

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_STARTDOCPOST := 13

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_QUERYFILTER := 14

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDPAGEEPRE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDPAGEPOST := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPOST := 5

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_CANCELJOB := 6

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPRE := 7

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPRE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPRE := 9

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPOST := 10

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPOST := 11

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPOST := 12

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPOST := 13

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_LAST := 15

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_SPOOLED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOCUMENTEVENT_UNSUPPORTED := 0

/**
 * @type {Integer (Int32)}
 */
export global DOCUMENTEVENT_FAILURE := -1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_CONFIGURATION_CHANGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_ADD_CONNECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_DELETE_CONNECTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_INITIALIZE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_DELETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_CACHE_REFRESH := 5

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_CACHE_DELETE := 6

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_ATTRIBUTES_CHANGED := 7

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_CONFIGURATION_UPDATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_ADD_CONNECTION_NO_UI := 9

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_DELETE_CONNECTION_NO_UI := 10

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_EVENT_FLAG_NO_UI := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_EVENT_INITIALIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_EVENT_DELETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BORDER_PRINT := 0

/**
 * @type {Integer (UInt32)}
 */
export global NO_BORDER_PRINT := 1

/**
 * @type {Integer (UInt32)}
 */
export global NORMAL_PRINT := 0

/**
 * @type {Integer (UInt32)}
 */
export global REVERSE_PRINT := 1

/**
 * @type {Integer (UInt32)}
 */
export global BOOKLET_PRINT := 2

/**
 * @type {Integer (UInt32)}
 */
export global NO_COLOR_OPTIMIZATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_OPTIMIZATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global REVERSE_PAGES_FOR_REVERSE_DUPLEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global DONT_SEND_EXTRA_PAGES_FOR_DUPLEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global RIGHT_THEN_DOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOWN_THEN_RIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global LEFT_THEN_DOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global DOWN_THEN_LEFT := 8

/**
 * @type {Integer (UInt32)}
 */
export global BOOKLET_EDGE_LEFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global BOOKLET_EDGE_RIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global QCP_DEVICEPROFILE := 0

/**
 * @type {Integer (UInt32)}
 */
export global QCP_SOURCEPROFILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global QCP_PROFILEMEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global QCP_PROFILEDISK := 2

/**
 * @type {String}
 */
export global SPLPRINTER_USER_MODE_PRINTER_DRIVER := "SPLUserModePrinterDriver"

/**
 * @type {Integer (UInt32)}
 */
export global EMF_PP_COLOR_OPTIMIZATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_STATUS_ENDPOINT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_STATUS_POLL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_STATUS_INFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global ROUTER_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global ROUTER_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ROUTER_STOP_ROUTING := 2

/**
 * @type {Integer (UInt32)}
 */
export global DOC_INFO_INTERNAL_LEVEL := 100

/**
 * @type {Integer (UInt32)}
 */
export global SPLCLIENT_INFO_INTERNAL_LEVEL := 100

/**
 * @type {Integer (UInt32)}
 */
export global FILL_WITH_DEFAULTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_INFO_DATA_COMPACT := 1

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE_EVENT_SET_PRINTER_DATAEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE_EVENT_DELETE_PRINTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE_EVENT_ADD_PRINTER_CONNECTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE_EVENT_DELETE_PRINTER_CONNECTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE_EVENT_FILES_CHANGED := 5

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE_FLAG_CLIENT_SPOOLER := 1

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE_FLAG_SERVER_SPOOLER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSPRINT_PUBLISH := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSPRINT_UPDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSPRINT_UNPUBLISH := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSPRINT_REPUBLISH := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSPRINT_PENDING := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CONTROL_PAUSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CONTROL_RESUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CONTROL_PURGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CONTROL_SET_STATUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PAUSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PENDING_DELETION := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PAPER_JAM := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PAPER_OUT := 16

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_MANUAL_FEED := 32

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PAPER_PROBLEM := 64

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_OFFLINE := 128

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_IO_ACTIVE := 256

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_BUSY := 512

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PRINTING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_OUTPUT_BIN_FULL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_NOT_AVAILABLE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_WAITING := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PROCESSING := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_INITIALIZING := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_WARMING_UP := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_TONER_LOW := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_NO_TONER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_PAGE_PUNT := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_USER_INTERVENTION := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_OUT_OF_MEMORY := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_DOOR_OPEN := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_SERVER_UNKNOWN := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_POWER_SAVE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_SERVER_OFFLINE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_STATUS_DRIVER_UPDATE_NEEDED := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_QUEUED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_DIRECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_DEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_SHARED := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_NETWORK := 16

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_HIDDEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_LOCAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_ENABLE_DEVQ := 128

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_KEEPPRINTEDJOBS := 256

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_DO_COMPLETE_FIRST := 512

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_WORK_OFFLINE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_ENABLE_BIDI := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_RAW_ONLY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_PUBLISHED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_FAX := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_TS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_PUSHED_USER := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_PUSHED_MACHINE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_MACHINE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_FRIENDLY_NAME := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_TS_GENERIC_DRIVER := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_PER_USER := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ATTRIBUTE_ENTERPRISE_CLOUD := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global NO_PRIORITY := 0

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PRIORITY := 99

/**
 * @type {Integer (UInt32)}
 */
export global MIN_PRIORITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEF_PRIORITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_PAUSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_RESUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_CANCEL := 3

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_RESTART := 4

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_DELETE := 5

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_SENT_TO_PRINTER := 6

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_LAST_PAGE_EJECTED := 7

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_RETAIN := 8

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_RELEASE := 9

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_SEND_TOAST := 10

/**
 * @type {Integer (UInt32)}
 */
export global JOB_CONTROL_PENDING_ON_DEVICE := 11

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_PAUSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_DELETING := 4

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_SPOOLING := 8

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_PRINTING := 16

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_OFFLINE := 32

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_PAPEROUT := 64

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_PRINTED := 128

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_DELETED := 256

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_BLOCKED_DEVQ := 512

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_USER_INTERVENTION := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_RESTART := 2048

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_COMPLETE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_RETAINED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global JOB_STATUS_RENDERING_LOCALLY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global JOB_POSITION_UNSPECIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_PACKAGE_AWARE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_XPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_SANDBOX_ENABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_CLASS := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_DERIVED := 16

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_NOT_SHAREABLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_CATEGORY_FAX := 64

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_CATEGORY_FILE := 128

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_CATEGORY_VIRTUAL := 256

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_CATEGORY_SERVICE := 512

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_SOFT_RESET_REQUIRED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_SANDBOX_DISABLED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_CATEGORY_3D := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_DRIVER_CATEGORY_CLOUD := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_KERNELMODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_USERMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DPD_DELETE_UNUSED_FILES := 1

/**
 * @type {Integer (UInt32)}
 */
export global DPD_DELETE_SPECIFIC_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global DPD_DELETE_ALL_FILES := 4

/**
 * @type {Integer (UInt32)}
 */
export global APD_STRICT_UPGRADE := 1

/**
 * @type {Integer (UInt32)}
 */
export global APD_STRICT_DOWNGRADE := 2

/**
 * @type {Integer (UInt32)}
 */
export global APD_COPY_ALL_FILES := 4

/**
 * @type {Integer (UInt32)}
 */
export global APD_COPY_NEW_FILES := 8

/**
 * @type {Integer (UInt32)}
 */
export global APD_COPY_FROM_DIRECTORY := 16

/**
 * @type {Integer (UInt32)}
 */
export global STRING_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global STRING_MUIDLL := 2

/**
 * @type {Integer (UInt32)}
 */
export global STRING_LANGPAIR := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAX_FORM_KEYWORD_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global DI_CHANNEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DI_READ_SPOOL_JOB := 3

/**
 * @type {Integer (UInt32)}
 */
export global DI_MEMORYMAP_WRITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FORM_USER := 0

/**
 * @type {Integer (UInt32)}
 */
export global FORM_BUILTIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global FORM_PRINTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_RIGHT_THEN_DOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_DOWN_THEN_RIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_LEFT_THEN_DOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_DOWN_THEN_LEFT := 8

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_BORDER_PRINT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_BOOKLET_EDGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_REVERSE_PAGES_FOR_REVERSE_DUPLEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_DONT_SEND_EXTRA_PAGES_FOR_DUPLEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPCAPS_SQUARE_SCALING := 1

/**
 * @type {Integer (UInt32)}
 */
export global PORT_TYPE_WRITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PORT_TYPE_READ := 2

/**
 * @type {Integer (UInt32)}
 */
export global PORT_TYPE_REDIRECTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PORT_TYPE_NET_ATTACHED := 8

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_TYPE_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_TYPE_WARNING := 2

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_TYPE_INFO := 3

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_OFFLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_PAPER_JAM := 2

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_PAPER_OUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_OUTPUT_BIN_FULL := 4

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_PAPER_PROBLEM := 5

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_NO_TONER := 6

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_DOOR_OPEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_USER_INTERVENTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_OUT_OF_MEMORY := 9

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_TONER_LOW := 10

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_WARMING_UP := 11

/**
 * @type {Integer (UInt32)}
 */
export global PORT_STATUS_POWER_SAVE := 12

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_LOCAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_CONNECTIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_FAVORITE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_NAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_REMOTE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_SHARED := 32

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_NETWORK := 64

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_EXPAND := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_CONTAINER := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICONMASK := 16711680

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON1 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON2 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON3 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON4 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON5 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON6 := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON7 := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_ICON8 := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_HIDE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_CATEGORY_ALL := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ENUM_CATEGORY_3D := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SPOOL_FILE_PERSISTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPOOL_FILE_TEMPORARY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVER_NOTIFY_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_SERVER_NAME := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_PRINTER_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_SHARE_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_PORT_NAME := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_DRIVER_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_COMMENT := 5

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_LOCATION := 6

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_DEVMODE := 7

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_SEPFILE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_PRINT_PROCESSOR := 9

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_PARAMETERS := 10

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_DATATYPE := 11

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_SECURITY_DESCRIPTOR := 12

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_ATTRIBUTES := 13

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_PRIORITY := 14

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_DEFAULT_PRIORITY := 15

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_START_TIME := 16

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_UNTIL_TIME := 17

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_STATUS := 18

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_STATUS_STRING := 19

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_CJOBS := 20

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_AVERAGE_PPM := 21

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_TOTAL_PAGES := 22

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_PAGES_PRINTED := 23

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_TOTAL_BYTES := 24

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_BYTES_PRINTED := 25

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_OBJECT_GUID := 26

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_FRIENDLY_NAME := 27

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_FIELD_BRANCH_OFFICE_PRINTING := 28

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_PRINTER_NAME := 0

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_MACHINE_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_PORT_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_USER_NAME := 3

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_NOTIFY_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_DATATYPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_PRINT_PROCESSOR := 6

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_PARAMETERS := 7

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_DRIVER_NAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_DEVMODE := 9

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_STATUS := 10

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_STATUS_STRING := 11

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_SECURITY_DESCRIPTOR := 12

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_DOCUMENT := 13

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_PRIORITY := 14

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_POSITION := 15

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_SUBMITTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_START_TIME := 17

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_UNTIL_TIME := 18

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_TIME := 19

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_TOTAL_PAGES := 20

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_PAGES_PRINTED := 21

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_TOTAL_BYTES := 22

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_BYTES_PRINTED := 23

/**
 * @type {Integer (UInt32)}
 */
export global JOB_NOTIFY_FIELD_REMOTE_JOB_ID := 24

/**
 * @type {Integer (UInt32)}
 */
export global SERVER_NOTIFY_FIELD_PRINT_DRIVER_ISOLATION_GROUP := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_CATEGORY_ALL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_CATEGORY_3D := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_OPTIONS_REFRESH := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_NOTIFY_INFO_DISCARDED := 1

/**
 * @type {String}
 */
export global BIDI_ACTION_ENUM_SCHEMA := "EnumSchema"

/**
 * @type {String}
 */
export global BIDI_ACTION_GET := "Get"

/**
 * @type {String}
 */
export global BIDI_ACTION_SET := "Set"

/**
 * @type {String}
 */
export global BIDI_ACTION_GET_ALL := "GetAll"

/**
 * @type {String}
 */
export global BIDI_ACTION_GET_WITH_ARGUMENT := "GetWithArgument"

/**
 * @type {Integer (UInt32)}
 */
export global BIDI_ACCESS_ADMINISTRATOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global BIDI_ACCESS_USER := 2

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_STATUS_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_ERROR_BASE := 13000

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_STATUS_WARNING := 13001

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SCHEMA_READ_ONLY := 13002

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SERVER_OFFLINE := 13003

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_DEVICE_OFFLINE := 13004

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SCHEMA_NOT_SUPPORTED := 13005

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SET_DIFFERENT_TYPE := 13006

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SET_MULTIPLE_SCHEMAPATH := 13007

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SET_INVALID_SCHEMAPATH := 13008

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SET_UNKNOWN_FAILURE := 13009

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_SCHEMA_WRITE_ONLY := 13010

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_GET_REQUIRES_ARGUMENT := 13011

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_GET_ARGUMENT_NOT_SUPPORTED := 13012

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_GET_MISSING_ARGUMENT := 13013

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_DEVICE_CONFIG_UNCHANGED := 13014

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_NO_LOCALIZED_RESOURCES := 13015

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_NO_BIDI_SCHEMA_EXTENSIONS := 13016

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_UNSUPPORTED_CLIENT_LANGUAGE := 13017

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_BIDI_UNSUPPORTED_RESOURCE_FORMAT := 13018

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_ADD_PRINTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_SET_PRINTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_DELETE_PRINTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_FAILED_CONNECTION_PRINTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_PRINTER := 255

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_ADD_JOB := 256

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_SET_JOB := 512

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_DELETE_JOB := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_WRITE_JOB := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_JOB := 65280

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_ADD_FORM := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_SET_FORM := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_DELETE_FORM := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_FORM := 458752

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_ADD_PORT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_CONFIGURE_PORT := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_DELETE_PORT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_PORT := 7340032

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_ADD_PRINT_PROCESSOR := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_DELETE_PRINT_PROCESSOR := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_PRINT_PROCESSOR := 117440512

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_SERVER := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_ADD_PRINTER_DRIVER := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_SET_PRINTER_DRIVER := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_DELETE_PRINTER_DRIVER := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_PRINTER_DRIVER := 1879048192

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_TIMEOUT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CHANGE_ALL := 2138570751

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ERROR_INFORMATION := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ERROR_WARNING := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ERROR_SEVERE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ERROR_OUTOFPAPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ERROR_JAM := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_ERROR_OUTOFTONER := 4

/**
 * @type {String}
 */
export global SPLREG_DEFAULT_SPOOL_DIRECTORY := "DefaultSpoolDirectory"

/**
 * @type {String}
 */
export global SPLREG_PORT_THREAD_PRIORITY_DEFAULT := "PortThreadPriorityDefault"

/**
 * @type {String}
 */
export global SPLREG_PORT_THREAD_PRIORITY := "PortThreadPriority"

/**
 * @type {String}
 */
export global SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT := "SchedulerThreadPriorityDefault"

/**
 * @type {String}
 */
export global SPLREG_SCHEDULER_THREAD_PRIORITY := "SchedulerThreadPriority"

/**
 * @type {String}
 */
export global SPLREG_BEEP_ENABLED := "BeepEnabled"

/**
 * @type {String}
 */
export global SPLREG_NET_POPUP := "NetPopup"

/**
 * @type {String}
 */
export global SPLREG_RETRY_POPUP := "RetryPopup"

/**
 * @type {String}
 */
export global SPLREG_NET_POPUP_TO_COMPUTER := "NetPopupToComputer"

/**
 * @type {String}
 */
export global SPLREG_EVENT_LOG := "EventLog"

/**
 * @type {String}
 */
export global SPLREG_MAJOR_VERSION := "MajorVersion"

/**
 * @type {String}
 */
export global SPLREG_MINOR_VERSION := "MinorVersion"

/**
 * @type {String}
 */
export global SPLREG_ARCHITECTURE := "Architecture"

/**
 * @type {String}
 */
export global SPLREG_OS_VERSION := "OSVersion"

/**
 * @type {String}
 */
export global SPLREG_OS_VERSIONEX := "OSVersionEx"

/**
 * @type {String}
 */
export global SPLREG_DS_PRESENT := "DsPresent"

/**
 * @type {String}
 */
export global SPLREG_DS_PRESENT_FOR_USER := "DsPresentForUser"

/**
 * @type {String}
 */
export global SPLREG_REMOTE_FAX := "RemoteFax"

/**
 * @type {String}
 */
export global SPLREG_RESTART_JOB_ON_POOL_ERROR := "RestartJobOnPoolError"

/**
 * @type {String}
 */
export global SPLREG_RESTART_JOB_ON_POOL_ENABLED := "RestartJobOnPoolEnabled"

/**
 * @type {String}
 */
export global SPLREG_DNS_MACHINE_NAME := "DNSMachineName"

/**
 * @type {String}
 */
export global SPLREG_ALLOW_USER_MANAGEFORMS := "AllowUserManageForms"

/**
 * @type {String}
 */
export global SPLREG_WEBSHAREMGMT := "WebShareMgmt"

/**
 * @type {String}
 */
export global SPLREG_PRINT_DRIVER_ISOLATION_GROUPS := "PrintDriverIsolationGroups"

/**
 * @type {String}
 */
export global SPLREG_PRINT_DRIVER_ISOLATION_TIME_BEFORE_RECYCLE := "PrintDriverIsolationTimeBeforeRecycle"

/**
 * @type {String}
 */
export global SPLREG_PRINT_DRIVER_ISOLATION_MAX_OBJECTS_BEFORE_RECYCLE := "PrintDriverIsolationMaxobjsBeforeRecycle"

/**
 * @type {String}
 */
export global SPLREG_PRINT_DRIVER_ISOLATION_IDLE_TIMEOUT := "PrintDriverIsolationIdleTimeout"

/**
 * @type {String}
 */
export global SPLREG_PRINT_DRIVER_ISOLATION_EXECUTION_POLICY := "PrintDriverIsolationExecutionPolicy"

/**
 * @type {String}
 */
export global SPLREG_PRINT_DRIVER_ISOLATION_OVERRIDE_POLICY := "PrintDriverIsolationOverrideCompat"

/**
 * @type {String}
 */
export global SPLREG_PRINT_QUEUE_V4_DRIVER_DIRECTORY := "PrintQueueV4DriverDirectory"

/**
 * @type {Integer (UInt32)}
 */
export global JOB_ACCESS_ADMINISTER := 16

/**
 * @type {Integer (UInt32)}
 */
export global JOB_ACCESS_READ := 32

/**
 * @type {String}
 */
export global SPLDS_SPOOLER_KEY := "DsSpooler"

/**
 * @type {String}
 */
export global SPLDS_DRIVER_KEY := "DsDriver"

/**
 * @type {String}
 */
export global SPLDS_USER_KEY := "DsUser"

/**
 * @type {String}
 */
export global SPLDS_ASSET_NUMBER := "assetNumber"

/**
 * @type {String}
 */
export global SPLDS_BYTES_PER_MINUTE := "bytesPerMinute"

/**
 * @type {String}
 */
export global SPLDS_DESCRIPTION := "description"

/**
 * @type {String}
 */
export global SPLDS_DRIVER_NAME := "driverName"

/**
 * @type {String}
 */
export global SPLDS_DRIVER_VERSION := "driverVersion"

/**
 * @type {String}
 */
export global SPLDS_LOCATION := "location"

/**
 * @type {String}
 */
export global SPLDS_PORT_NAME := "portName"

/**
 * @type {String}
 */
export global SPLDS_PRINT_ATTRIBUTES := "printAttributes"

/**
 * @type {String}
 */
export global SPLDS_PRINT_BIN_NAMES := "printBinNames"

/**
 * @type {String}
 */
export global SPLDS_PRINT_COLLATE := "printCollate"

/**
 * @type {String}
 */
export global SPLDS_PRINT_COLOR := "printColor"

/**
 * @type {String}
 */
export global SPLDS_PRINT_DUPLEX_SUPPORTED := "printDuplexSupported"

/**
 * @type {String}
 */
export global SPLDS_PRINT_END_TIME := "printEndTime"

/**
 * @type {String}
 */
export global SPLDS_PRINTER_CLASS := "printQueue"

/**
 * @type {String}
 */
export global SPLDS_PRINTER_NAME := "printerName"

/**
 * @type {String}
 */
export global SPLDS_PRINT_KEEP_PRINTED_JOBS := "printKeepPrintedJobs"

/**
 * @type {String}
 */
export global SPLDS_PRINT_LANGUAGE := "printLanguage"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MAC_ADDRESS := "printMACAddress"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MAX_X_EXTENT := "printMaxXExtent"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MAX_Y_EXTENT := "printMaxYExtent"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MAX_RESOLUTION_SUPPORTED := "printMaxResolutionSupported"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MEDIA_READY := "printMediaReady"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MEDIA_SUPPORTED := "printMediaSupported"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MEMORY := "printMemory"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MIN_X_EXTENT := "printMinXExtent"

/**
 * @type {String}
 */
export global SPLDS_PRINT_MIN_Y_EXTENT := "printMinYExtent"

/**
 * @type {String}
 */
export global SPLDS_PRINT_NETWORK_ADDRESS := "printNetworkAddress"

/**
 * @type {String}
 */
export global SPLDS_PRINT_NOTIFY := "printNotify"

/**
 * @type {String}
 */
export global SPLDS_PRINT_NUMBER_UP := "printNumberUp"

/**
 * @type {String}
 */
export global SPLDS_PRINT_ORIENTATIONS_SUPPORTED := "printOrientationsSupported"

/**
 * @type {String}
 */
export global SPLDS_PRINT_OWNER := "printOwner"

/**
 * @type {String}
 */
export global SPLDS_PRINT_PAGES_PER_MINUTE := "printPagesPerMinute"

/**
 * @type {String}
 */
export global SPLDS_PRINT_RATE := "printRate"

/**
 * @type {String}
 */
export global SPLDS_PRINT_RATE_UNIT := "printRateUnit"

/**
 * @type {String}
 */
export global SPLDS_PRINT_SEPARATOR_FILE := "printSeparatorFile"

/**
 * @type {String}
 */
export global SPLDS_PRINT_SHARE_NAME := "printShareName"

/**
 * @type {String}
 */
export global SPLDS_PRINT_SPOOLING := "printSpooling"

/**
 * @type {String}
 */
export global SPLDS_PRINT_STAPLING_SUPPORTED := "printStaplingSupported"

/**
 * @type {String}
 */
export global SPLDS_PRINT_START_TIME := "printStartTime"

/**
 * @type {String}
 */
export global SPLDS_PRINT_STATUS := "printStatus"

/**
 * @type {String}
 */
export global SPLDS_PRIORITY := "priority"

/**
 * @type {String}
 */
export global SPLDS_SERVER_NAME := "serverName"

/**
 * @type {String}
 */
export global SPLDS_SHORT_SERVER_NAME := "shortServerName"

/**
 * @type {String}
 */
export global SPLDS_UNC_NAME := "uNCName"

/**
 * @type {String}
 */
export global SPLDS_URL := "url"

/**
 * @type {String}
 */
export global SPLDS_FLAGS := "flags"

/**
 * @type {String}
 */
export global SPLDS_VERSION_NUMBER := "versionNumber"

/**
 * @type {String}
 */
export global SPLDS_PRINT_IPP_COMPRESSION_SUPPORTED := "ippCompressionSupported"

/**
 * @type {String}
 */
export global SPLDS_PRINTER_NAME_ALIASES := "printerNameAliases"

/**
 * @type {String}
 */
export global SPLDS_PRINTER_LOCATIONS := "printerLocations"

/**
 * @type {String}
 */
export global SPLDS_PRINTER_MODEL := "printerModel"

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CONNECTION_MISMATCH := 32

/**
 * @type {Integer (UInt32)}
 */
export global PRINTER_CONNECTION_NO_UI := 64

/**
 * @type {Integer (UInt32)}
 */
export global IPDFP_COPY_ALL_FILES := 1

/**
 * @type {Integer (UInt32)}
 */
export global UPDP_SILENT_UPLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global UPDP_UPLOAD_ALWAYS := 2

/**
 * @type {Integer (UInt32)}
 */
export global UPDP_CHECK_DRIVERSTORE := 4

/**
 * @type {String}
 */
export global MS_PRINT_JOB_OUTPUT_FILE := "MsPrintJobOutputFile"

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ELEMENT := 10000

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ELEMENT_XMLNODE := 10001

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ELEMENT_NAME := 10002

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ELEMENT_NAMESPACEURI := 10003

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT := 10100

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT_DISPLAYNAME := 10101

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_OPTION := 10200

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_OPTION_SELECTED := 10201

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_OPTION_CONSTRAINED := 10202

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_OPTION_GETPROPERTYVALUE := 10203

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION := 10300

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_WIDTH := 10301

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_HEIGHT := 10302

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_NUPOPTION := 10400

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_NUPOPTION_PAGESPERSHEET := 10401

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_OPTIONCOLLECTION := 10500

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_OPTIONCOLLECTION_COUNT := 10501

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_OPTIONCOLLECTION_GETAT := 10502

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_FEATURE := 10600

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_FEATURE_SELECTEDOPTION := 10601

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_FEATURE_SELECTIONTYPE := 10602

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_FEATURE_GETOPTION := 10603

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_FEATURE_DISPLAYUI := 10604

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE := 10700

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_WIDTH := 10701

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_HEIGHT := 10702

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_WIDTH := 10703

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_HEIGHT := 10704

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_WIDTH := 10705

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_HEIGHT := 10706

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES := 10800

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE_KEYNAME := 10801

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE := 10802

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_PAGEIMAGEABLESIZE := 10803

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMINVALUE := 10804

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMAXVALUE := 10805

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_GETSELECTEDOPTION := 10806

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_GETOPTIONS := 10807

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_CAPABILITIES_GETPARAMETERDEFINITION := 10808

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ASYNCOPERATION := 10900

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ASYNCOPERATION_START := 10901

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ASYNCOPERATION_CANCEL := 10902

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET := 11000

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_GETFEATURE_KEYNAME := 11001

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_GETFEATURE := 11002

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_VALIDATEASYNC := 11003

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_COMMITASYNC := 11004

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_NOTIFYXMLCHANGED := 11005

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_GETCAPABILITIES := 11006

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_JOBCOPIESALLDOCUMENTS := 11007

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_TICKET_GETPARAMETERINITIALIZER := 11008

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT := 11100

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT_COMPLETED := 11101

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM := 11200

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_READ := 11201

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_WRITE := 11202

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLESTREAM := 11300

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLESTREAM_COMMIT := 11301

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLESTREAM_SEEK := 11302

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLESTREAM_SETSIZE := 11303

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG := 11400

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_GETBOOL := 11401

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_SETBOOL := 11402

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_GETINT32 := 11403

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_SETINT32 := 11404

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_GETSTRING := 11405

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_SETSTRING := 11406

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_GETBYTES := 11407

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_SETBYTES := 11408

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_GETREADSTREAM := 11409

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERPROPERTYBAG_GETWRITESTREAM := 11410

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTREAMASXML := 11411

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG := 11500

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBOOL := 11501

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBOOL := 11502

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETINT32 := 11503

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETINT32 := 11504

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTRING := 11505

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETSTRING := 11506

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBYTES := 11507

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBYTES := 11508

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETREADSTREAM := 11509

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETWRITESTREAM := 11510

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUE := 11600

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUE_HANDLE := 11601

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUE_NAME := 11602

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUE_SENDBIDIQUERY := 11603

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUE_GETPROPERTIES := 11604

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUE_SENDBIDISETREQUESTASYNC := 11605

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUE_GETPRINTERQUEUEVIEW := 11606

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUEEVENT := 11700

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUEEVENT_ONBIDIRESPONSERECEIVED := 11701

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXT := 11800

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXT_PRINTERQUEUE := 11801

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXT_PRINTSCHEMATICKET := 11802

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXT_DRIVERPROPERTIES := 11803

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXT_USERPROPERTIES := 11804

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_REQUEST := 11900

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_REQUEST_CANCEL := 11901

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_REQUEST_COMPLETE := 11902

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS := 12000

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS_BIDINOTIFICATION := 12001

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS_REASONID := 12002

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS_REQUEST := 12003

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS_SOURCEAPPLICATION := 12004

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS_DETAILEDREASONID := 12005

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWMODAL := 12006

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWPARENT := 12007

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION := 12100

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_COUNT := 12101

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_GETAT := 12102

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENT := 12200

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENT_ONDRIVEREVENT := 12201

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTEREXTENSION_EVENT_ONPRINTERQUEUESENUMERATED := 12202

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTCONTEXT := 12300

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTCONTEXT_DRIVERPROPERTIES := 12301

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTCONTEXT_QUEUEPROPERTIES := 12302

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERSCRIPTCONTEXT_USERPROPERTIES := 12303

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERINITIALIZER := 12400

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERINITIALIZER_VALUE := 12401

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERDEFINITION := 12500

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERDEFINITION_USERINPUTREQUIRED := 12501

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERDEFINITION_UNITTYPE := 12502

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERDEFINITION_DATATYPE := 12503

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMIN := 12504

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMAX := 12505

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTJOBCOLLECTION := 12600

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTJOBCOLLECTION_COUNT := 12601

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTJOBCOLLECTION_GETAT := 12602

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUEVIEW := 12700

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUEVIEW_SETVIEWRANGE := 12701

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUEVIEW_EVENT := 12800

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PRINTERQUEUEVIEW_EVENT_ONCHANGED := 12801

/**
 * @type {Guid}
 */
export global NOTIFICATION_RELEASE := Guid("{ba9a5027-a70e-4ae7-9b7d-eb3e06ad4157}")

/**
 * @type {Guid}
 */
export global PRINT_APP_BIDI_NOTIFY_CHANNEL := Guid("{2abad223-b994-4aca-82fc-4571b1b585ac}")

/**
 * @type {Guid}
 */
export global PRINT_PORT_MONITOR_NOTIFY_CHANNEL := Guid("{25df3b0e-74a9-47f5-80ce-79b4b1eb5c58}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_USBPRINT := Guid("{28d78fad-5a12-11d1-ae5b-0000f803a8c2}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_IPPUSB_PRINT := Guid("{f2f40381-f46d-4e51-bce7-62de6cf2d098}")

/**
 * @type {Guid}
 */
export global CLSID_XPSRASTERIZER_FACTORY := Guid("{503e79bf-1d09-4764-9d72-1eb0c65967c6}")
;@endregion Constants
