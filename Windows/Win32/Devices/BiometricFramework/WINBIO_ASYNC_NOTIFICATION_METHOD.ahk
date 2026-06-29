#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify how completion notifications for asynchronous operations are to be delivered to the client application.
 * @remarks
 * This enumeration was introduced in Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/winbio/ne-winbio-winbio_async_notification_method
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_ASYNC_NOTIFICATION_METHOD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The operation is synchronous.
     * @type {Integer (Int32)}
     */
    static WINBIO_ASYNC_NOTIFY_NONE => 0

    /**
     * The client-implemented <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nc-winbio-pwinbio_async_completion_callback">PWINBIO_ASYNC_COMPLETION_CALLBACK</a> function is called by the framework.
     * @type {Integer (Int32)}
     */
    static WINBIO_ASYNC_NOTIFY_CALLBACK => 1

    /**
     * The framework sends completion notices to the client application window message queue.
     * @type {Integer (Int32)}
     */
    static WINBIO_ASYNC_NOTIFY_MESSAGE => 2

    /**
     * The maximum enumeration value. This constant is not directly used by the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a>.
     * @type {Integer (Int32)}
     */
    static WINBIO_ASYNC_NOTIFY_MAXIMUM_VALUE => 3
}
