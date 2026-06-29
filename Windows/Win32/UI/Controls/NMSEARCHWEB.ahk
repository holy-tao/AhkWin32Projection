#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\EC_SEARCHWEB_ENTRYPOINT.ahk" { EC_SEARCHWEB_ENTRYPOINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information used to handle an [EN_SEARCHWEB](/windows/win32/controls/en-searchweb) notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmsearchweb
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMSEARCHWEB {
    #StructPack 8

    /**
     * Type: **[NMHDR](/windows/win32/api/winuser/ns-winuser-nmhdr)**
     * 
     * An NMHDR structure that contains additional information about this notification.
     */
    hdr : NMHDR

    /**
     * Type: **[EC_SEARCHWEB_ENTRYPOINT](ne-commctrl-ec_searchweb_entrypoint.md)**
     * 
     * An enum value that indicates the entry point of the search.
     */
    entrypoint : EC_SEARCHWEB_ENTRYPOINT

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * TRUE if there is query text; otherwise, FALSE.
     */
    hasQueryText : BOOL

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * TRUE if the invoke succeeded; otherwise, FALSE.
     */
    invokeSucceeded : BOOL

}
