#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a menu event in a console INPUT\_RECORD structure. These events are used internally and should be ignored.
 * @see https://learn.microsoft.com/windows/console/menu-event-record-str
 * @namespace Windows.Win32.System.Console
 */
export default struct MENU_EVENT_RECORD {
    #StructPack 4

    /**
     * Reserved.
     */
    dwCommandId : UInt32

}
