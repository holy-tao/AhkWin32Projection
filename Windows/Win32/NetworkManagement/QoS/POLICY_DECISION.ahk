#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The POLICY_DECISION structure contains RSVP policy decision information.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-policy_decision
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class POLICY_DECISION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Local policy value.
     * @type {Integer}
     */
    lpvResult {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * RSVP-defined error code.
     * @type {Integer}
     */
    wPolicyErrCode {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * RSVP-defined error value.
     * @type {Integer}
     */
    wPolicyErrValue {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
