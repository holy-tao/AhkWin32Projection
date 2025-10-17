#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Devices.Properties
 * @version v4.0.30319
 */
class Properties {

;@region Constants

    /**
     * @type {Integer (Byte)}
     */
    static DEVPROP_TRUE => 0xFF

    /**
     * @type {Integer (Byte)}
     */
    static DEVPROP_FALSE => 0x00

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEVPROP_TYPE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEVPROP_TYPEMOD => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_MASK_TYPE => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_MASK_TYPEMOD => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROPID_FIRST_USABLE => 2
;@endregion Constants

;@region Methods
;@endregion Methods
}
