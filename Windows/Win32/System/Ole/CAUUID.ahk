#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a counted array of UUID or GUID types used to receive an array of CLSIDs for the property pages that the object wants to display.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-cauuid
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class CAUUID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the array pointed to by <b>pElems</b>.
     * @type {Integer}
     */
    cElems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of values, each of which specifies a CLSID of a particular property page. This array is allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and is freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {Pointer<Guid>}
     */
    pElems {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
