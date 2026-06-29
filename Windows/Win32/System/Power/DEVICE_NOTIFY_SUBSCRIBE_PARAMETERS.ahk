#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters used when registering for a power notification.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-device_notify_subscribe_parameters
 * @namespace Windows.Win32.System.Power
 */
export default struct DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS {
    #StructPack 8

    /**
     * Indicates the callback function that will be called when the application receives the notification.
     */
    Callback : IntPtr

    /**
     * The context of the application registering for the notification.
     */
    Context : IntPtr

}
