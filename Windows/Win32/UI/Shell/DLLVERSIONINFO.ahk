#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives DLL-specific version information.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-dllversioninfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DLLVERSIONINFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. This member must be filled in before calling the function.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The major version of the DLL. For instance, if the DLL's version is 4.0.950, this value will be 4.
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minor version of the DLL. For instance, if the DLL's version is 4.0.950, this value will be 0.
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The build number of the DLL. For instance, if the DLL's version is 4.0.950, this value will be 950.
     * @type {Integer}
     */
    dwBuildNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwPlatformID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 20
    }
}
