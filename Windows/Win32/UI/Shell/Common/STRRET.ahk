#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Contains strings returned from the IShellFolder interface methods.
 * @see https://docs.microsoft.com/windows/win32/api//shtypes/ns-shtypes-strret
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class STRRET extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    uType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pOleStr{
        get {
            if(!this.HasProp("__pOleStr"))
                this.__pOleStr := PWSTR(this.ptr + 8)
            return this.__pOleStr
        }
    }

    /**
     * @type {Integer}
     */
    uOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    cStr{
        get {
            if(!this.HasProp("__cStrProxyArray"))
                this.__cStrProxyArray := Win32FixedArray(this.ptr + 8, 260, Primitive, "char")
            return this.__cStrProxyArray
        }
    }
}
