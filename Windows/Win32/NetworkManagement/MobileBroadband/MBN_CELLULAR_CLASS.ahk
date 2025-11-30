#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_CELLULAR_CLASS enumerated type defines the type of cellular device.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_cellular_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_CELLULAR_CLASS extends Win32Enum{

    /**
     * No cellular class.
     * @type {Integer (Int32)}
     */
    static MBN_CELLULAR_CLASS_NONE => 0

    /**
     * GSM cellular class.
     * @type {Integer (Int32)}
     */
    static MBN_CELLULAR_CLASS_GSM => 1

    /**
     * CDMA cellular class.
     * @type {Integer (Int32)}
     */
    static MBN_CELLULAR_CLASS_CDMA => 2
}
