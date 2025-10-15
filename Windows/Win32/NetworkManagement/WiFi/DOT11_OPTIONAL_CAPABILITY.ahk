#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_OPTIONAL_CAPABILITY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    bDot11PCF{
        get {
            if(!this.HasProp("__bDot11PCF"))
                this.__bDot11PCF := BOOLEAN(this.ptr + 4)
            return this.__bDot11PCF
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bDot11PCFMPDUTransferToPC{
        get {
            if(!this.HasProp("__bDot11PCFMPDUTransferToPC"))
                this.__bDot11PCFMPDUTransferToPC := BOOLEAN(this.ptr + 5)
            return this.__bDot11PCFMPDUTransferToPC
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bStrictlyOrderedServiceClass{
        get {
            if(!this.HasProp("__bStrictlyOrderedServiceClass"))
                this.__bStrictlyOrderedServiceClass := BOOLEAN(this.ptr + 6)
            return this.__bStrictlyOrderedServiceClass
        }
    }
}
