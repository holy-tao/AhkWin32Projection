#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a counted array of values that can be used to obtain the value corresponding to one of the predefined strings for a property.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-cadword
 * @namespace Windows.Win32.System.Ole
 */
export default struct CADWORD {
    #StructPack 8

    /**
     * The size of the array pointed to by <b>pElems</b>.
     */
    cElems : UInt32

    /**
     * A pointer to an array of values, each of which can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue">IPerPropertyBrowsing::GetPredefinedValue</a> method to obtain the corresponding value for one of the property's predefined strings. This array is allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and is freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    pElems : IntPtr

}
