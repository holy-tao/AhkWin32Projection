#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a counted array of values that can be used to obtain the value corresponding to one of the predefined strings for a property.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-cadword
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class CADWORD extends Win32Struct
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
     * A pointer to an array of values, each of which can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue">IPerPropertyBrowsing::GetPredefinedValue</a> method to obtain the corresponding value for one of the property's predefined strings. This array is allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and is freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {Pointer<Integer>}
     */
    pElems {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
