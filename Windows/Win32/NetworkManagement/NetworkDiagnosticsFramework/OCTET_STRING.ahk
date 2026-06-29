#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The OCTET_STRING structure contains a pointer to a string of byte data.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-octet_string
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct OCTET_STRING {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The length of the data.
     */
    dwLength : UInt32

    /**
     * Type: <b>[size_is(dwLength)]BYTE*</b>
     * 
     * A pointer to the byte array containing the data.
     */
    lpValue : IntPtr

}
