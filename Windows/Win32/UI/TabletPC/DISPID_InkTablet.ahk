#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkTablet extends Win32Enum {

    /**
     * Native name: DISPID_ITName
     * @type {Integer (Int32)}
     */
    static ITName => 0

    /**
     * Native name: DISPID_ITPlugAndPlayId
     * @type {Integer (Int32)}
     */
    static ITPlugAndPlayId => 1

    /**
     * Native name: DISPID_ITPropertyMetrics
     * @type {Integer (Int32)}
     */
    static ITPropertyMetrics => 2

    /**
     * Native name: DISPID_ITIsPacketPropertySupported
     * @type {Integer (Int32)}
     */
    static ITIsPacketPropertySupported => 3

    /**
     * Native name: DISPID_ITMaximumInputRectangle
     * @type {Integer (Int32)}
     */
    static ITMaximumInputRectangle => 4

    /**
     * Native name: DISPID_ITHardwareCapabilities
     * @type {Integer (Int32)}
     */
    static ITHardwareCapabilities => 5
}
