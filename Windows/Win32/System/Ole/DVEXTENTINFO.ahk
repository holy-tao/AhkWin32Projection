#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * Represents the sizing data used in IViewObjectEx::GetNaturalExtent.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvextentinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class DVEXTENTINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates whether the sizing mode is content or integral sizing. See the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ne-ocidl-dvextentmode">DVEXTENTMODE</a> enumeration for possible values.
     * @type {Integer}
     */
    dwExtentMode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The proposed size in content sizing or the preferred size in integral sizing.
     * @type {SIZE}
     */
    sizelProposed{
        get {
            if(!this.HasProp("__sizelProposed"))
                this.__sizelProposed := SIZE(8, this)
            return this.__sizelProposed
        }
    }
}
