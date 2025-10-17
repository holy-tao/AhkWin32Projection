#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to set and retrieve groups.
 * @remarks
 * 
  * All strings returned in this structure should be treated as read-only.
  * 	
  * 
  * The creation of subsets is not currently supported, and <b>pszSubsetTitle</b> cannot be set by applications.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lvgroup
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVGROUP extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the header text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the header text.
     * @type {PWSTR}
     */
    pszHeader {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszHeader</b> member. If the structure is not receiving information about a group, this member is ignored.
     * @type {Integer}
     */
    cchHeader {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the footer text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the footer text.
     * @type {PWSTR}
     */
    pszFooter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszFooter</b> member. If the structure is not receiving information about a group, this member is ignored.
     * @type {Integer}
     */
    cchFooter {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * ID of the group.
     * @type {Integer}
     */
    iGroupId {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Mask used with <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getgroupinfo">LVM_GETGROUPINFO</a>  and <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-setgroupinfo">LVM_SETGROUPINFO</a> to specify which flags in the <b>state</b> value are being retrieved or set.
     * @type {Integer}
     */
    stateMask {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    state {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    uAlign {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the subtitle text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the subtitle text. This element is drawn under the header text.
     * @type {PWSTR}
     */
    pszSubtitle {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size, in <b>TCHAR</b>s, of the buffer pointed to by the <b>pszSubtitle</b> member. If the structure is not receiving information about a group, this member is ignored.
     * @type {Integer}
     */
    cchSubtitle {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the text for a task link when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the task text. This item is drawn right-aligned opposite the header text. When clicked by the user, the task link generates an <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-linkclick">LVN_LINKCLICK</a> notification.
     * @type {PWSTR}
     */
    pszTask {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszTask</b> member. If the structure is not receiving information about a group, this member is ignored.
     * @type {Integer}
     */
    cchTask {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the top description text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the top description text. This item is drawn opposite the title image when there is a title image, no extended image, and <b>uAlign</b>==<b>LVGA_HEADER_CENTER</b>.
     * @type {PWSTR}
     */
    pszDescriptionTop {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszDescriptionTop</b> member. If the structure is not receiving information about a group, this member is ignored.
     * @type {Integer}
     */
    cchDescriptionTop {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the bottom description text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the bottom description text. This item is drawn under the top description text when there is a title image, no extended image, and <b>uAlign</b>==<b>LVGA_HEADER_CENTER</b>.
     * @type {PWSTR}
     */
    pszDescriptionBottom {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszDescriptionBottom</b> member. If the structure is not receiving information about a group, this member is ignored.
     * @type {Integer}
     */
    cchDescriptionBottom {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b>int</b>
     * 
     * Index of the title image in the control imagelist.
     * @type {Integer}
     */
    iTitleImage {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * Type: <b>int</b>
     * 
     * Index of the extended image in the control imagelist.
     * @type {Integer}
     */
    iExtendedImage {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * Type: <b>int</b>
     * 
     * Read-only.
     * @type {Integer}
     */
    iFirstItem {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Read-only in non-owner data mode.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * <b>NULL</b> if group is not a subset. Pointer to a null-terminated string that contains the subset title text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the subset title text.
     * @type {PWSTR}
     */
    pszSubsetTitle {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszSubsetTitle</b> member. If the structure is not receiving information about a group, this member is ignored.
     * @type {Integer}
     */
    cchSubsetTitle {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 152
    }
}
