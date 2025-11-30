#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CALL_STATE_EVENT_CAUSE enum is returned by the ITCallStateEvent::get_Cause method.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-call_state_event_cause
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALL_STATE_EVENT_CAUSE extends Win32Enum{

    /**
     * No call event has occurred.
     * @type {Integer (Int32)}
     */
    static CEC_NONE => 0

    /**
     * The call was disconnected as part of the normal life cycle of the call (that is, the call was over, so it was disconnected).
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_NORMAL => 1

    /**
     * An outgoing call failed to connect because the remote end was busy.
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_BUSY => 2

    /**
     * An outgoing call failed because the destination address was bad.
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_BADADDRESS => 3

    /**
     * An outgoing call failed because the remote end was not answered.
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_NOANSWER => 4

    /**
     * An outgoing call failed because the caller disconnected.
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_CANCELLED => 5

    /**
     * The outgoing call was rejected by the remote end.
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_REJECTED => 6

    /**
     * The call failed to connect for some other reason.
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_FAILED => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CEC_DISCONNECT_BLOCKED => 8
}
