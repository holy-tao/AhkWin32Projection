#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains policy information that is passed by the Remote Desktop Services service to the protocol.
 * @remarks
 * This structure is used by the following methods:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendpolicydata">SendPolicyData</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getuserdata">GetUserData</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_policy_data
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_POLICY_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies whether to disable encryption for communication between the client and server.
     * @type {BOOLEAN}
     */
    fDisableEncryption {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies whether to disable automatic reconnect of the client.
     * @type {BOOLEAN}
     */
    fDisableAutoReconnect {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * 
     * @type {Integer}
     */
    ColorDepth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the minimum permitted encryption level.
     * @type {Integer}
     */
    MinEncryptionLevel {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies whether to disable printer mapping.
     * @type {BOOLEAN}
     */
    fDisableCpm {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Specifies whether to disable drive mapping.
     * @type {BOOLEAN}
     */
    fDisableCdm {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Specifies whether to disable COM communication port mapping.
     * @type {BOOLEAN}
     */
    fDisableCcm {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Specifies whether to disable LPT (line print terminal) printer redirection.
     * @type {BOOLEAN}
     */
    fDisableLPT {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Specifies whether to disable clipboard redirection.
     * @type {BOOLEAN}
     */
    fDisableClip {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * Specifies whether to disable Plug and Play redirection.
     * @type {BOOLEAN}
     */
    fDisablePNPRedir {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }
}
