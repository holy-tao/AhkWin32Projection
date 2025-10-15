#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_TRIAGE_FOLLOWUP_INFO_2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OwnerNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PSTR}
     */
    OwnerName{
        get {
            if(!this.HasProp("__OwnerName"))
                this.__OwnerName := PSTR(this.ptr + 8)
            return this.__OwnerName
        }
    }

    /**
     * @type {Integer}
     */
    FeaturePathSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PSTR}
     */
    FeaturePath{
        get {
            if(!this.HasProp("__FeaturePath"))
                this.__FeaturePath := PSTR(this.ptr + 24)
            return this.__FeaturePath
        }
    }
}
