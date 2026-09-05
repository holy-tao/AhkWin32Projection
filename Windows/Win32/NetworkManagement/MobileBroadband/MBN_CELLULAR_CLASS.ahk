#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_CELLULAR_CLASS enumerated type defines the type of cellular device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_cellular_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_CELLULAR_CLASS extends Win32Enum {

    /**
     * No cellular class.
     * Native name: MBN_CELLULAR_CLASS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * GSM cellular class.
     * Native name: MBN_CELLULAR_CLASS_GSM
     * @type {Integer (Int32)}
     */
    static GSM => 1

    /**
     * CDMA cellular class.
     * Native name: MBN_CELLULAR_CLASS_CDMA
     * @type {Integer (Int32)}
     */
    static CDMA => 2
}
