#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives information used to retrieve a stock Shell icon. This structure is used in a call SHGetStockIconInfo.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shstockiconinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHSTOCKICONINFO extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HICON</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_ICON flag, this member receives a handle to the icon.
     * @type {Pointer<Void>}
     */
    hIcon {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_SYSICONINDEX flag, this member receives the index of the image in the system icon cache.
     * @type {Integer}
     */
    iSysImageIndex {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_ICONLOCATION flag, this member receives the index of the icon in the resource whose path is received in <b>szPath</b>.
     * @type {Integer}
     */
    iIcon {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetstockiconinfo">SHGetStockIconInfo</a> is called with the SHGSI_ICONLOCATION flag, this member receives the path of the resource that contains the icon. The index of the icon within the resource is received in <b>iIcon</b>.
     * @type {String}
     */
    szPath {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 544
    }
}
