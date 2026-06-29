#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Receives information used to retrieve a stock Shell icon. This structure is used in a call SHGetStockIconInfo.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shstockiconinfo
 * @namespace Windows.Win32.UI.Shell
 * @architecture X64, Arm64
 */
export default struct SHSTOCKICONINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HICON</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_ICON flag, this member receives a handle to the icon.
     */
    hIcon : HICON

    /**
     * Type: <b>int</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_SYSICONINDEX flag, this member receives the index of the image in the system icon cache.
     */
    iSysImageIndex : Int32

    /**
     * Type: <b>int</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_ICONLOCATION flag, this member receives the index of the icon in the resource whose path is received in <b>szPath</b>.
     */
    iIcon : Int32

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_ICONLOCATION flag, this member receives the path of the resource that contains the icon. The index of the icon within the resource is received in <b>iIcon</b>.
     */
    szPath : WCHAR[260]

}
