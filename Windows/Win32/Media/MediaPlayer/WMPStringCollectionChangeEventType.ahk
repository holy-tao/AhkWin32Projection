#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMPStringCollectionChangeEventType enumeration type defines the types of changes that can occur in a string collection.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpstringcollectionchangeeventtype
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPStringCollectionChangeEventType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not a valid event type.
     * @type {Integer (Int32)}
     */
    static wmpsccetUnknown => 0

    /**
     * An item was inserted.
     * @type {Integer (Int32)}
     */
    static wmpsccetInsert => 1

    /**
     * The string collection changed.
     * @type {Integer (Int32)}
     */
    static wmpsccetChange => 2

    /**
     * An item was deleted.
     * @type {Integer (Int32)}
     */
    static wmpsccetDelete => 3

    /**
     * The string collection was cleared.
     * @type {Integer (Int32)}
     */
    static wmpsccetClear => 4

    /**
     * Bulk updates are beginning.
     * @type {Integer (Int32)}
     */
    static wmpsccetBeginUpdates => 5

    /**
     * Bulk updates have ended.
     * @type {Integer (Int32)}
     */
    static wmpsccetEndUpdates => 6
}
