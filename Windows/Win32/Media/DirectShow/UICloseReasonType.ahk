#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The UICloseReasonType enumeration type specifies the reason that a user-interface dialog for a smart card was closed.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/ne-bdaiface-uiclosereasontype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct UICloseReasonType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not ready.
     * @type {Integer (Int32)}
     */
    static NotReady => 0

    /**
     * User.
     * @type {Integer (Int32)}
     */
    static UserClosed => 1

    /**
     * System.
     * @type {Integer (Int32)}
     */
    static SystemClosed => 2

    /**
     * Device.
     * @type {Integer (Int32)}
     */
    static DeviceClosed => 3

    /**
     * Error.
     * @type {Integer (Int32)}
     */
    static ErrorClosed => 4
}
