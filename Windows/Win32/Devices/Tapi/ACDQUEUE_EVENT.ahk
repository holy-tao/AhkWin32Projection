#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ACDQUEUE_EVENT enumeration (tapi3cc.h) describes ACD queue events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/ne-tapi3cc-acdqueue_event
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ACDQUEUE_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new ACD queue has been added.
     * @type {Integer (Int32)}
     */
    static ACDQE_NEW_QUEUE => 0

    /**
     * An ACD queue has been removed.
     * @type {Integer (Int32)}
     */
    static ACDQE_QUEUE_REMOVED => 1
}
