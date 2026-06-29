#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies a counted array of UUID or GUID types used to receive an array of CLSIDs for the property pages that the object wants to display.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-cauuid
 * @namespace Windows.Win32.System.Ole
 */
export default struct CAUUID {
    #StructPack 8

    /**
     * The size of the array pointed to by <b>pElems</b>.
     */
    cElems : UInt32

    /**
     * A pointer to an array of values, each of which specifies a CLSID of a particular property page. This array is allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and is freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    pElems : Guid.Ptr

}
