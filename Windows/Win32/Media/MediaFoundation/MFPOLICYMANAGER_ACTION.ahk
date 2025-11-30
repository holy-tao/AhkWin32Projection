#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines actions that can be performed on a stream.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfpolicymanager_action
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFPOLICYMANAGER_ACTION extends Win32Enum{

    /**
     * No action.
     * @type {Integer (Int32)}
     */
    static PEACTION_NO => 0

    /**
     * Play the stream.
     * @type {Integer (Int32)}
     */
    static PEACTION_PLAY => 1

    /**
     * Copy the stream.
     * @type {Integer (Int32)}
     */
    static PEACTION_COPY => 2

    /**
     * Export the stream to another format.
     * @type {Integer (Int32)}
     */
    static PEACTION_EXPORT => 3

    /**
     * Extract the data from the stream and pass it to the application. For example, acoustic echo cancellation requires this action.
     * @type {Integer (Int32)}
     */
    static PEACTION_EXTRACT => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PEACTION_RESERVED1 => 5

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PEACTION_RESERVED2 => 6

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PEACTION_RESERVED3 => 7

    /**
     * Last member of the enumeration.
     * @type {Integer (Int32)}
     */
    static PEACTION_LAST => 7
}
