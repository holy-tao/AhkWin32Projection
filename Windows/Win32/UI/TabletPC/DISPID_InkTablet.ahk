#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkTablet extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITName => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITPlugAndPlayId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITPropertyMetrics => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITIsPacketPropertySupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITMaximumInputRectangle => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITHardwareCapabilities => 5
}
