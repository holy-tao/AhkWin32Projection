#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the nature of the change to an event object.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/ne-eventsys-eoc_changetype
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct EOC_ChangeType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new object was added.
     * @type {Integer (Int32)}
     */
    static EOC_NewObject => 0

    /**
     * An existing object was modified.
     * @type {Integer (Int32)}
     */
    static EOC_ModifiedObject => 1

    /**
     * An existing object was deleted.
     * @type {Integer (Int32)}
     */
    static EOC_DeletedObject => 2
}
