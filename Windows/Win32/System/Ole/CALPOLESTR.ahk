#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a counted array of strings used to specify the predefined strings that a property can accept.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ns-ocidl-calpolestr
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class CALPOLESTR extends Win32Struct
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
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/nf-wtypesbase-olestr">LPOLESTR</a> values, each of which corresponds to an allowable value that a particular property can accept. The caller can use these string values in user interface elements, such as drop-down list boxes. This array, as well as the strings in the array, are allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and is freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {Pointer<PWSTR>}
     */
    pElems {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
