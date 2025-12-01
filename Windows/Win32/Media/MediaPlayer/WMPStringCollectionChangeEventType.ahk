#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPStringCollectionChangeEventType enumeration type defines the types of changes that can occur in a string collection.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpstringcollectionchangeeventtype
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPStringCollectionChangeEventType extends Win32Enum{

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
