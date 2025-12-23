#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ATM_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ATM_CALLING_PARTY_NUMBER_IE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {ATM_ADDRESS}
     */
    ATM_Number{
        get {
            if(!this.HasProp("__ATM_Number"))
                this.__ATM_Number := ATM_ADDRESS(0, this)
            return this.__ATM_Number
        }
    }

    /**
     * @type {Integer}
     */
    Presentation_Indication {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Screening_Indicator {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }
}
