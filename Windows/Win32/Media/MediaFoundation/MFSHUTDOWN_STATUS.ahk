#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the current status of a call to the IMFShutdown::Shutdown method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfshutdown_status
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFSHUTDOWN_STATUS extends Win32Enum {

    /**
     * The shutdown operation has started but is not yet complete.
     * Native name: MFSHUTDOWN_INITIATED
     * @type {Integer (Int32)}
     */
    static INITIATED => 0

    /**
     * Shutdown is complete.
     * Native name: MFSHUTDOWN_COMPLETED
     * @type {Integer (Int32)}
     */
    static COMPLETED => 1
}
