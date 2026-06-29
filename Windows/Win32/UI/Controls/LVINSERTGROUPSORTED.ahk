#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LIST_VIEW_GROUP_STATE_FLAGS.ahk" { LIST_VIEW_GROUP_STATE_FLAGS }
#Import ".\LIST_VIEW_GROUP_ALIGN_FLAGS.ahk" { LIST_VIEW_GROUP_ALIGN_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LVGROUP.ahk" { LVGROUP }
#Import ".\LVGROUP_MASK.ahk" { LVGROUP_MASK }

/**
 * Used to sort groups. It is used with LVM_INSERTGROUPSORTED.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvinsertgroupsorted
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVINSERTGROUPSORTED {
    #StructPack 8

    /**
     * Type: <b>PFNLVGROUPCOMPARE</b>
     * 
     * Pointer to application-defined function <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nc-commctrl-pfnlvgroupcompare">LVGroupCompare</a> that is used to sort the groups.
     */
    pfnGroupCompare : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPVOID</a>*</b>
     * 
     * Data to sort; this is application-defined.
     */
    pvData : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvgroup">LVGROUP</a></b>
     * 
     * Group to sort; this is application-defined.
     */
    lvGroup : LVGROUP

}
