#Requires AutoHotkey v2.0.0 64-bit

/**
 * Controls binding operations to a link source.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/ne-oleidl-olelinkbind
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLELINKBIND{

    /**
     * The binding operation should proceed even if the current class of the link source is different from the last time the link was bound. For example, the link source could be a Lotus spreadsheet that was converted to an Excel spreadsheet.
     * @type {Integer (Int32)}
     */
    static OLELINKBIND_EVENIFCLASSDIFF => 1
}
