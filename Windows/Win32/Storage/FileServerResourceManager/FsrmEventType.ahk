#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the event types that an event logging action (see FsrmActionType) can log.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmeventtype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmEventType{

    /**
     * The event type is unknown. Do not use this flag.
     * @type {Integer (Int32)}
     */
    static FsrmEventType_Unknown => 0

    /**
     * The event is an information event.
     * @type {Integer (Int32)}
     */
    static FsrmEventType_Information => 1

    /**
     * The event is a warning event.
     * @type {Integer (Int32)}
     */
    static FsrmEventType_Warning => 2

    /**
     * The event is an error event.
     * @type {Integer (Int32)}
     */
    static FsrmEventType_Error => 3
}
