#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_ERROR_INFOW.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class STI_DIAG extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwBasicDiagCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwVendorDiagCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwStatusMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {_ERROR_INFOW}
     */
    sErrorInfo{
        get {
            if(!this.HasProp("__sErrorInfo"))
                this.__sErrorInfo := _ERROR_INFOW(16, this)
            return this.__sErrorInfo
        }
    }
}
