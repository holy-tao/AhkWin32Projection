#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ACDQUEUE_EVENT enum describes ACD queue events. The ITQueueEvent::get_Event method returns a member of this enum to indicate the type of ACD queue event that occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/ne-tapi3cc-acdqueue_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ACDQUEUE_EVENT{

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
