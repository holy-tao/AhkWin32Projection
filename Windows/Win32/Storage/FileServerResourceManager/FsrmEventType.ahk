#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the event types that an event logging action (see FsrmActionType) can log.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmeventtype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmEventType extends Win32Enum {

    /**
     * The event type is unknown. Do not use this flag.
     * Native name: FsrmEventType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The event is an information event.
     * Native name: FsrmEventType_Information
     * @type {Integer (Int32)}
     */
    static Information => 1

    /**
     * The event is a warning event.
     * Native name: FsrmEventType_Warning
     * @type {Integer (Int32)}
     */
    static Warning => 2

    /**
     * The event is an error event.
     * Native name: FsrmEventType_Error
     * @type {Integer (Int32)}
     */
    static Error => 3
}
