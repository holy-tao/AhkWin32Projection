#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }

/**
 * Stores position information for an item. Used with message SFVM_SETITEMPOS.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-sfv_setitempos
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SFV_SETITEMPOS {
    #StructPack 8

    /**
     * Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> for the item.
     */
    pidl : ITEMIDLIST.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure indicating the position of the item.
     */
    pt : POINT

}
