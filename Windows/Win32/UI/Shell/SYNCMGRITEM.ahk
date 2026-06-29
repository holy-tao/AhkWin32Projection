#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Provides information about items being enumerated by the ISyncMgrEnumItems interface.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgritem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRITEM {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgritemflags">SYNCMGRITEMFLAGS</a> enumeration.
     */
    dwFlags : UInt32

    /**
     * Type: <b>GUID</b>
     * 
     * The identifier for this item.
     */
    ItemID : Guid

    /**
     * Type: <b>DWORD</b>
     */
    dwItemState : UInt32

    /**
     * Type: <b>HICON</b>
     * 
     * The icon for this item.
     */
    hIcon : HICON

    /**
     * Type: <b>WCHAR[MAX_SYNCMGRITEMNAME]</b>
     * 
     * The name of this item.
     */
    wszItemName : WCHAR[128]

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time of the last synchronization for this item.
     */
    ftLastUpdate : FILETIME

}
