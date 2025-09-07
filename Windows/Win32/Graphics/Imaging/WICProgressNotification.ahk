#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies when the progress notification callback should be called.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicprogressnotification
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICProgressNotification{

    /**
     * The callback should be called when codec operations begin.
     * @type {Integer (Int32)}
     */
    static WICProgressNotificationBegin => 65536

    /**
     * The callback should be called when codec operations end.
     * @type {Integer (Int32)}
     */
    static WICProgressNotificationEnd => 131072

    /**
     * The callback should be called frequently to report status.
     * @type {Integer (Int32)}
     */
    static WICProgressNotificationFrequent => 262144

    /**
     * The callback should be called on all available progress notifications.
     * @type {Integer (Int32)}
     */
    static WICProgressNotificationAll => -65536
}
