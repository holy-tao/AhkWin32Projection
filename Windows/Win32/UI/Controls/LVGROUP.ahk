#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LIST_VIEW_GROUP_STATE_FLAGS.ahk" { LIST_VIEW_GROUP_STATE_FLAGS }
#Import ".\LIST_VIEW_GROUP_ALIGN_FLAGS.ahk" { LIST_VIEW_GROUP_ALIGN_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LVGROUP_MASK.ahk" { LVGROUP_MASK }

/**
 * Used to set and retrieve groups.
 * @remarks
 * All strings returned in this structure should be treated as read-only.
 * 	
 * 
 * The creation of subsets is not currently supported, and <b>pszSubsetTitle</b> cannot be set by applications.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvgroup
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVGROUP {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    mask : LVGROUP_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the header text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the header text.
     */
    pszHeader : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszHeader</b> member. If the structure is not receiving information about a group, this member is ignored.
     */
    cchHeader : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the footer text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the footer text.
     */
    pszFooter : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszFooter</b> member. If the structure is not receiving information about a group, this member is ignored.
     */
    cchFooter : Int32

    /**
     * Type: <b>int</b>
     * 
     * ID of the group.
     */
    iGroupId : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Mask used with <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getgroupinfo">LVM_GETGROUPINFO</a>  and <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-setgroupinfo">LVM_SETGROUPINFO</a> to specify which flags in the <b>state</b> value are being retrieved or set.
     */
    stateMask : LIST_VIEW_GROUP_STATE_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    state : LIST_VIEW_GROUP_STATE_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    uAlign : LIST_VIEW_GROUP_ALIGN_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the subtitle text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the subtitle text. This element is drawn under the header text.
     */
    pszSubtitle : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size, in <b>TCHAR</b>s, of the buffer pointed to by the <b>pszSubtitle</b> member. If the structure is not receiving information about a group, this member is ignored.
     */
    cchSubtitle : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the text for a task link when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the task text. This item is drawn right-aligned opposite the header text. When clicked by the user, the task link generates an <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-linkclick">LVN_LINKCLICK</a> notification.
     */
    pszTask : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszTask</b> member. If the structure is not receiving information about a group, this member is ignored.
     */
    cchTask : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the top description text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the top description text. This item is drawn opposite the title image when there is a title image, no extended image, and <b>uAlign</b>==<b>LVGA_HEADER_CENTER</b>.
     */
    pszDescriptionTop : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszDescriptionTop</b> member. If the structure is not receiving information about a group, this member is ignored.
     */
    cchDescriptionTop : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a null-terminated string that contains the bottom description text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the bottom description text. This item is drawn under the top description text when there is a title image, no extended image, and <b>uAlign</b>==<b>LVGA_HEADER_CENTER</b>.
     */
    pszDescriptionBottom : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszDescriptionBottom</b> member. If the structure is not receiving information about a group, this member is ignored.
     */
    cchDescriptionBottom : UInt32

    /**
     * Type: <b>int</b>
     * 
     * Index of the title image in the control imagelist.
     */
    iTitleImage : Int32

    /**
     * Type: <b>int</b>
     * 
     * Index of the extended image in the control imagelist.
     */
    iExtendedImage : Int32

    /**
     * Type: <b>int</b>
     * 
     * Read-only.
     */
    iFirstItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Read-only in non-owner data mode.
     */
    cItems : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * <b>NULL</b> if group is not a subset. Pointer to a null-terminated string that contains the subset title text when item information is being set. If group information is being retrieved, this member specifies the address of the buffer that receives the subset title text.
     */
    pszSubsetTitle : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in <b>TCHAR</b>s of the buffer pointed to by the <b>pszSubsetTitle</b> member. If the structure is not receiving information about a group, this member is ignored.
     */
    cchSubsetTitle : UInt32

}
