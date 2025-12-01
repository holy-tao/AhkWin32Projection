#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ACDQUEUE_EVENT enumeration (tapi3cc.h) describes ACD queue events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/ne-tapi3cc-acdqueue_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ACDQUEUE_EVENT extends Win32Enum{

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
