#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Holds custom folder settings. This structure is used with the SHGetSetFolderCustomSettings function.
 * @remarks
 * In Windows XP Service Pack 2 (SP2) and earlier versions, this structure supported both ANSI and Unicode strings. In Windows Vista and later versions, only Unicode strings are supported.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shfoldercustomsettings
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHFOLDERCUSTOMSETTINGS {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwMask : UInt32

    /**
     * Type: <b>SHELLVIEWID*</b>
     * 
     * The folder's GUID.
     */
    pvid : Guid.Ptr

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated string containing the path to the folder's <a href="https://docs.microsoft.com/windows/desktop/lwef/web-view">WebView template</a>.
     */
    pszWebViewTemplate : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszWebViewTemplate</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     */
    cchWebViewTemplate : UInt32

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the WebView template version.
     */
    pszWebViewTemplateVersion : PWSTR

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the text of the folder's infotip.
     */
    pszInfoTip : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszInfoTip</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     */
    cchInfoTip : UInt32

    /**
     * Type: <b>CLSID*</b>
     * 
     * A pointer to a CLSID used to identify the folder in the Windows registry. Further folder information is stored in the registry under that CLSID entry.
     */
    pclsid : Guid.Ptr

    /**
     * Type: <b>DWORD</b>
     * 
     * Not used.
     */
    dwFlags : UInt32

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the path to file containing the folder's icon.
     */
    pszIconFile : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszIconFile</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     */
    cchIconFile : UInt32

    /**
     * Type: <b>int</b>
     * 
     * The index of the icon within the file named in <b>pszIconFile</b>.
     */
    iIconIndex : Int32

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the path to the file containing the folder's logo image. This is the image used in thumbnail views.
     */
    pszLogo : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszLogo</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     */
    cchLogo : UInt32

}
