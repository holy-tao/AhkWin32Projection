#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DLLVERSIONINFO.ahk" { DLLVERSIONINFO }

/**
 * Receives DLL-specific version information. It is used with the DllGetVersion function.
 * @remarks
 * Your application must set the <b>cbSize</b> member of the structure pointed to by <b>info1</b> to <b>sizeof(</b><b>DLLVERSIONINFO2</b><b>)</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nc-shlwapi-dllgetversionproc">DllGetVersion</a>. Otherwise, no value will be assigned to the <b>dwFlags</b> or <b>ullVersion</b> member of the <b>DLLVERSIONINFO2</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-dllversioninfo2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DLLVERSIONINFO2 {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ns-shlwapi-dllversioninfo">DLLVERSIONINFO</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ns-shlwapi-dllversioninfo">DLLVERSIONINFO</a> structure. This member is included to provide backward compatibility with applications that are not expecting a <b>DLLVERSIONINFO2</b> structure.
     */
    info1 : DLLVERSIONINFO

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    dwFlags : UInt32

    /**
     * Type: <b>ULONGLONG</b>
     * 
     * A value that contains the version information. It is divided into four 16-bitfields containing the major and minor version numbers, the build number, and the hotfix version, in that order. Use the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-makedllverull">MAKEDLLVERULL</a> macro to construct this value.
     */
    ullVersion : Int64

}
