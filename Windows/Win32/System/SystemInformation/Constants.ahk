#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN2K := 83886080

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WINXP := 83951616

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WINXPSP2 := 83952128

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS03SP1 := 84017408

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_VISTA := 100663296

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_VISTASP1 := 100663552

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN7 := 100728832

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN8 := 100794368

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WINBLUE := 100859904

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WINTHRESHOLD := 167772160

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_CPU_SET_INFORMATION_PARKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_CPU_SET_INFORMATION_ALLOCATED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_CPU_SET_INFORMATION_ALLOCATED_TO_TARGET_PROCESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_CPU_SET_INFORMATION_REALTIME := 8

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_NT4 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WIN2K := 1280

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WINXP := 1281

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WS03 := 1282

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WIN6 := 1536

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_VISTA := 1536

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WS08 := 1536

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_LONGHORN := 1536

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WIN7 := 1537

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WIN8 := 1538

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WINBLUE := 1539

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WINTHRESHOLD := 2560

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_WINNT_WIN10 := 2560

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE20 := 512

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE30 := 768

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE302 := 770

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE40 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE401 := 1025

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE50 := 1280

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE501 := 1281

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE55 := 1360

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE60 := 1536

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE60SP1 := 1537

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE60SP2 := 1539

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE70 := 1792

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE80 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE90 := 2304

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE100 := 2560

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_IE110 := 2560

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_NT4 := 512

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_NT4SP1 := 512

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_NT4SP2 := 512

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_NT4SP3 := 770

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_NT4SP4 := 1025

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_NT4SP5 := 1025

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_NT4SP6 := 1280

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN98 := 1025

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN98SE := 1280

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WINME := 1360

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN2K := 1281

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN2KSP1 := 1281

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN2KSP2 := 1281

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN2KSP3 := 1281

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN2KSP4 := 1281

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_XP := 1536

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_XPSP1 := 1537

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_XPSP2 := 1539

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WS03 := 1538

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WS03SP1 := 1539

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN6 := 1792

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_LONGHORN := 1792

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN7 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN8 := 2560

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WINBLUE := 2560

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WINTHRESHOLD := 2560

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_IE_WIN10 := 2560

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN4 := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN2KSP1 := 83886336

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN2KSP2 := 83886592

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN2KSP3 := 83886848

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN2KSP4 := 83887104

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WINXPSP1 := 83951872

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WINXPSP3 := 83952384

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WINXPSP4 := 83952640

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS03 := 84017152

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS03SP2 := 84017664

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS03SP3 := 84017920

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS03SP4 := 84018176

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN6 := 100663296

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN6SP1 := 100663552

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN6SP2 := 100663808

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN6SP3 := 100664064

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN6SP4 := 100664320

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_VISTASP2 := 100663808

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_VISTASP3 := 100664064

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_VISTASP4 := 100664320

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_LONGHORN := 100663296

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS08 := 100663552

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS08SP2 := 100663808

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS08SP3 := 100664064

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WS08SP4 := 100664320

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10 := 167772160

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_TH2 := 167772161

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_RS1 := 167772162

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_RS2 := 167772163

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_RS3 := 167772164

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_RS4 := 167772165

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_RS5 := 167772166

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_19H1 := 167772167

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_VB := 167772168

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_MN := 167772169

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_FE := 167772170

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_CO := 167772171

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_NI := 167772172

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN10_CU := 167772173

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN11_ZN := 167772174

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN11_GA := 167772175

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_WIN11_GE := 167772176

/**
 * @type {Integer (UInt32)}
 */
export global WDK_NTDDI_VERSION := 167772176

/**
 * @type {Integer (UInt32)}
 */
export global OSVERSION_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global SPVERSION_MASK := 65280

/**
 * @type {Integer (UInt32)}
 */
export global SUBVERSION_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global NTDDI_VERSION := 167772176

/**
 * @type {Integer (UInt32)}
 */
export global SCEX2_ALT_NETBIOS_NAME := 1
;@endregion Constants
