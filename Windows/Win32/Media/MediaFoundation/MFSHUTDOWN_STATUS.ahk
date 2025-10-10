#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the current status of a call to the IMFShutdown::Shutdown method.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfshutdown_status
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSHUTDOWN_STATUS{

    /**
     * The shutdown operation has started but is not yet complete.
     * @type {Integer (Int32)}
     */
    static MFSHUTDOWN_INITIATED => 0

    /**
     * Shutdown is complete.
     * @type {Integer (Int32)}
     */
    static MFSHUTDOWN_COMPLETED => 1
}
