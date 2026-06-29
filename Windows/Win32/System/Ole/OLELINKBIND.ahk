#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Controls binding operations to a link source.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olelinkbind
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLELINKBIND {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The binding operation should proceed even if the current class of the link source is different from the last time the link was bound. For example, the link source could be a Lotus spreadsheet that was converted to an Excel spreadsheet.
     * @type {Integer (Int32)}
     */
    static OLELINKBIND_EVENIFCLASSDIFF => 1
}
