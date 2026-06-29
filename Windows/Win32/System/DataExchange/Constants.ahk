#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.DataExchange
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_FIRST := 992

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_INITIATE := 992

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_TERMINATE := 993

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_ADVISE := 994

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_UNADVISE := 995

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_ACK := 996

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_DATA := 997

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_REQUEST := 998

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_POKE := 999

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_EXECUTE := 1000

/**
 * @type {Integer (UInt32)}
 */
export global WM_DDE_LAST := 1000

/**
 * @type {Integer (UInt32)}
 */
export global CADV_LATEACK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FACK := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FBUSY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FDEFERUPD := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FACKREQ := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FRELEASE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FREQUESTED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FAPPSTATUS := 255

/**
 * @type {Integer (UInt32)}
 */
export global DDE_FNOTPROCESSED := 0

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_DDEMGR := 32769

/**
 * @type {Integer (Int32)}
 */
export global CP_WINANSI := 1004

/**
 * @type {Integer (Int32)}
 */
export global CP_WINUNICODE := 1200

/**
 * @type {Integer (Int32)}
 */
export global CP_WINNEUTRAL := 1200

/**
 * @type {Integer (UInt32)}
 */
export global XTYPF_NOBLOCK := 2

/**
 * @type {Integer (UInt32)}
 */
export global XTYPF_NODATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global XTYPF_ACKREQ := 8

/**
 * @type {Integer (UInt32)}
 */
export global XCLASS_MASK := 64512

/**
 * @type {Integer (UInt32)}
 */
export global XCLASS_BOOL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global XCLASS_DATA := 8192

/**
 * @type {Integer (UInt32)}
 */
export global XCLASS_FLAGS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global XCLASS_NOTIFICATION := 32768

/**
 * @type {Integer (UInt32)}
 */
export global XTYP_MASK := 240

/**
 * @type {Integer (UInt32)}
 */
export global XTYP_SHIFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TIMEOUT_ASYNC := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global QID_SYNC := 4294967295

/**
 * @type {String}
 */
export global SZDDESYS_TOPIC := "System"

/**
 * @type {String}
 */
export global SZDDESYS_ITEM_TOPICS := "Topics"

/**
 * @type {String}
 */
export global SZDDESYS_ITEM_SYSITEMS := "SysItems"

/**
 * @type {String}
 */
export global SZDDESYS_ITEM_RTNMSG := "ReturnMessage"

/**
 * @type {String}
 */
export global SZDDESYS_ITEM_STATUS := "Status"

/**
 * @type {String}
 */
export global SZDDESYS_ITEM_FORMATS := "Formats"

/**
 * @type {String}
 */
export global SZDDESYS_ITEM_HELP := "Help"

/**
 * @type {String}
 */
export global SZDDE_ITEM_ITEMLIST := "TopicItemList"

/**
 * @type {Integer (Int32)}
 */
export global APPCMD_MASK := 4080

/**
 * @type {Integer (Int32)}
 */
export global APPCLASS_MASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global HDATA_APPOWNED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_NO_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_FIRST := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_ADVACKTIMEOUT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_BUSY := 16385

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_DATAACKTIMEOUT := 16386

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_DLL_NOT_INITIALIZED := 16387

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_DLL_USAGE := 16388

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_EXECACKTIMEOUT := 16389

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_INVALIDPARAMETER := 16390

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_LOW_MEMORY := 16391

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_MEMORY_ERROR := 16392

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_NOTPROCESSED := 16393

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_NO_CONV_ESTABLISHED := 16394

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_POKEACKTIMEOUT := 16395

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_POSTMSG_FAILED := 16396

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_REENTRANCY := 16397

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_SERVER_DIED := 16398

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_SYS_ERROR := 16399

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_UNADVACKTIMEOUT := 16400

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_UNFOUND_QUEUE_ID := 16401

/**
 * @type {Integer (UInt32)}
 */
export global DMLERR_LAST := 16401

/**
 * @type {Integer (UInt32)}
 */
export global MH_CREATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MH_KEEP := 2

/**
 * @type {Integer (UInt32)}
 */
export global MH_DELETE := 3

/**
 * @type {Integer (UInt32)}
 */
export global MH_CLEANUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MONITORS := 4

/**
 * @type {Integer (UInt32)}
 */
export global MF_MASK := 4278190080
;@endregion Constants
