#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\TYPEDESC.ahk
#Include ..\Com\SAFEARRAYBOUND.ahk

/**
 * Describes an array, its element type, and its dimension.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ns-oaidl-arraydesc
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ARRAYDESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The element type.
     * @type {TYPEDESC}
     */
    tdescElem{
        get {
            if(!this.HasProp("__tdescElem"))
                this.__tdescElem := TYPEDESC(0, this)
            return this.__tdescElem
        }
    }

    /**
     * The dimension count.
     * @type {Integer}
     */
    cDims {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * A variable-length array containing one element for each dimension.
     * @type {Array<SAFEARRAYBOUND>}
     */
    rgbounds{
        get {
            if(!this.HasProp("__rgboundsProxyArray"))
                this.__rgboundsProxyArray := Win32FixedArray(this.ptr + 24, 1, SAFEARRAYBOUND, "")
            return this.__rgboundsProxyArray
        }
    }
}
