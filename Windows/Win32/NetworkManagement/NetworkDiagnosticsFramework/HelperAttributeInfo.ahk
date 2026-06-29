#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ATTRIBUTE_TYPE.ahk" { ATTRIBUTE_TYPE }

/**
 * The HelperAttributeInfo structure contains the name of the helper attribute and its type.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-helperattributeinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct HelperAttributeInfo {
    #StructPack 8

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * Pointer to a null-terminated string that contains the name of the helper attribute.
     */
    pwszName : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ne-ndattrib-attribute_type">ATTRIBUTE_TYPE</a></b>
     * 
     * The type of helper attribute.
     */
    type : ATTRIBUTE_TYPE

}
