#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Holds custom folder settings. This structure is used with the SHGetSetFolderCustomSettings function.
 * @remarks
 * In Windows XP Service Pack 2 (SP2) and earlier versions, this structure supported both ANSI and Unicode strings. In Windows Vista and later versions, only Unicode strings are supported.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shfoldercustomsettings
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHFOLDERCUSTOMSETTINGS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>SHELLVIEWID*</b>
     * 
     * The folder's GUID.
     * @type {Pointer<Guid>}
     */
    pvid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated string containing the path to the folder's <a href="https://docs.microsoft.com/windows/desktop/lwef/web-view">WebView template</a>.
     * @type {Pointer<Ptr>}
     */
    pszWebViewTemplate {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszWebViewTemplate</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     * @type {Integer}
     */
    cchWebViewTemplate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the WebView template version.
     * @type {Pointer<Ptr>}
     */
    pszWebViewTemplateVersion {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the text of the folder's infotip.
     * @type {Pointer<Ptr>}
     */
    pszInfoTip {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszInfoTip</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     * @type {Integer}
     */
    cchInfoTip {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>CLSID*</b>
     * 
     * A pointer to a CLSID used to identify the folder in the Windows registry. Further folder information is stored in the registry under that CLSID entry.
     * @type {Pointer<Guid>}
     */
    pclsid {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Not used.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the path to file containing the folder's icon.
     * @type {Pointer<Ptr>}
     */
    pszIconFile {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszIconFile</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     * @type {Integer}
     */
    cchIconFile {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>int</b>
     * 
     * The index of the icon within the file named in <b>pszIconFile</b>.
     * @type {Integer}
     */
    iIconIndex {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a null-terminated buffer containing the path to the file containing the folder's logo image. This is the image used in thumbnail views.
     * @type {Pointer<Ptr>}
     */
    pszLogo {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings">SHGetSetFolderCustomSettings</a> parameter <i>dwReadWrite</i> is <b>FCS_READ</b>, this is the size of the <b>pszLogo</b> buffer, in characters. If not, this is the number of characters to write from that buffer. Set this parameter to 0 to write the entire string.
     * @type {Integer}
     */
    cchLogo {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
