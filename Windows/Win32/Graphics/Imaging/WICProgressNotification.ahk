#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies when the progress notification callback should be called.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicprogressnotification
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICProgressNotification extends Win32Enum {

    /**
     * The callback should be called when codec operations begin.
     * Native name: WICProgressNotificationBegin
     * @type {Integer (Int32)}
     */
    static Begin => 65536

    /**
     * The callback should be called when codec operations end.
     * Native name: WICProgressNotificationEnd
     * @type {Integer (Int32)}
     */
    static End => 131072

    /**
     * The callback should be called frequently to report status.
     * Native name: WICProgressNotificationFrequent
     * @type {Integer (Int32)}
     */
    static Frequent => 262144

    /**
     * The callback should be called on all available progress notifications.
     * Native name: WICProgressNotificationAll
     * @type {Integer (Int32)}
     */
    static All => -65536
}
