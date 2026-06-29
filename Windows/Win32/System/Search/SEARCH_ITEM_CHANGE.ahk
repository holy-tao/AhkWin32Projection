#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\BLOB.ahk" { BLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SEARCH_NOTIFICATION_PRIORITY.ahk" { SEARCH_NOTIFICATION_PRIORITY }
#Import ".\SEARCH_KIND_OF_CHANGE.ahk" { SEARCH_KIND_OF_CHANGE }

/**
 * Specifies the changes to an indexed item.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-search_item_change
 * @namespace Windows.Win32.System.Search
 */
export default struct SEARCH_ITEM_CHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_kind_of_change">SEARCH_KIND_OF_CHANGE</a></b>
     * 
     * Flag that specifies the kind of change as a value from the 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_kind_of_change">SEARCH_KIND_OF_CHANGE</a> enumerated type.
     */
    Change : SEARCH_KIND_OF_CHANGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_notification_priority">SEARCH_NOTIFICATION_PRIORITY</a></b>
     * 
     * Flag that specifies the priority of processing this change as a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_notification_priority">SEARCH_NOTIFICATION_PRIORITY</a> enumerated type.
     */
    Priority : SEARCH_NOTIFICATION_PRIORITY

    /**
     * Type: <b>BLOB*</b>
     * 
     * Pointer to user information.
     */
    pUserData : BLOB.Ptr

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the URL of the item in a SEARCH_CHANGE_MOVE_RENAME, SEARCH_CHANGE_ADD, or SEARCH_CHANGE_MODIFY notification. In the case of a move, this member contains the new URL of the item.
     */
    lpwszURL : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the old URL of the item in a SEARCH_CHANGE_MOVE_RENAME or SEARCH_CHANGE_DELETE notification.
     */
    lpwszOldURL : PWSTR

}
