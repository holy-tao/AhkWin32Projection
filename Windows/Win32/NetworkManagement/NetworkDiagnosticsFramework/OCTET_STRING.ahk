#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The OCTET_STRING structure contains a pointer to a string of byte data.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-octet_string
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class OCTET_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The length of the data.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>[size_is(dwLength)]BYTE*</b>
     * 
     * A pointer to the byte array containing the data.
     * @type {Pointer<Integer>}
     */
    lpValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
