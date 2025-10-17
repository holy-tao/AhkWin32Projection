#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PS_TRUSTLET_TKSESSION_ID.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class TRUSTLET_BINDING_DATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TrustletIdentity {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PS_TRUSTLET_TKSESSION_ID}
     */
    TrustletSessionId{
        get {
            if(!this.HasProp("__TrustletSessionId"))
                this.__TrustletSessionId := PS_TRUSTLET_TKSESSION_ID(8, this)
            return this.__TrustletSessionId
        }
    }

    /**
     * @type {Integer}
     */
    TrustletSvn {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
