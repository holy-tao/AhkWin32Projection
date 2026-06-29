#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Receives DLL-specific version information.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-dllversioninfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DLLVERSIONINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. This member must be filled in before calling the function.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * The major version of the DLL. For instance, if the DLL's version is 4.0.950, this value will be 4.
     */
    dwMajorVersion : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minor version of the DLL. For instance, if the DLL's version is 4.0.950, this value will be 0.
     */
    dwMinorVersion : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The build number of the DLL. For instance, if the DLL's version is 4.0.950, this value will be 950.
     */
    dwBuildNumber : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwPlatformID : UInt32

}
