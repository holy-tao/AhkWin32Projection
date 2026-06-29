#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines actions that can be performed on a stream.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfpolicymanager_action
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFPOLICYMANAGER_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
