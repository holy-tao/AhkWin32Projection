#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Learn more about: JET_INDEXID structure
 * @remarks
 * The Pack attribute is necessary because the C++ version is defined as a byte array. If the C\# compiler inserts the usual padding between the uint cbStruct and the IntPtr, then the structure ends up too large.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/jet-indexid-structure2
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_INDEXID extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbIndexId{
        get {
            if(!this.HasProp("__rgbIndexIdProxyArray"))
                this.__rgbIndexIdProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__rgbIndexIdProxyArray
        }
    }
}
