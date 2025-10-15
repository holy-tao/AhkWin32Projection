#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Contains policy information that is passed by the Remote Desktop Services service to the protocol.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_policy_data
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
    fDisableEncryption{
        get {
            if(!this.HasProp("__fDisableEncryption"))
                this.__fDisableEncryption := BOOLEAN(this.ptr + 0)
            return this.__fDisableEncryption
        }
    }

    /**
     * Specifies whether to disable automatic reconnect of the client.
     * @type {BOOLEAN}
     */
    fDisableAutoReconnect{
        get {
            if(!this.HasProp("__fDisableAutoReconnect"))
                this.__fDisableAutoReconnect := BOOLEAN(this.ptr + 1)
            return this.__fDisableAutoReconnect
        }
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
    fDisableCpm{
        get {
            if(!this.HasProp("__fDisableCpm"))
                this.__fDisableCpm := BOOLEAN(this.ptr + 9)
            return this.__fDisableCpm
        }
    }

    /**
     * Specifies whether to disable drive mapping.
     * @type {BOOLEAN}
     */
    fDisableCdm{
        get {
            if(!this.HasProp("__fDisableCdm"))
                this.__fDisableCdm := BOOLEAN(this.ptr + 10)
            return this.__fDisableCdm
        }
    }

    /**
     * Specifies whether to disable COM communication port mapping.
     * @type {BOOLEAN}
     */
    fDisableCcm{
        get {
            if(!this.HasProp("__fDisableCcm"))
                this.__fDisableCcm := BOOLEAN(this.ptr + 11)
            return this.__fDisableCcm
        }
    }

    /**
     * Specifies whether to disable LPT (line print terminal) printer redirection.
     * @type {BOOLEAN}
     */
    fDisableLPT{
        get {
            if(!this.HasProp("__fDisableLPT"))
                this.__fDisableLPT := BOOLEAN(this.ptr + 12)
            return this.__fDisableLPT
        }
    }

    /**
     * Specifies whether to disable clipboard redirection.
     * @type {BOOLEAN}
     */
    fDisableClip{
        get {
            if(!this.HasProp("__fDisableClip"))
                this.__fDisableClip := BOOLEAN(this.ptr + 13)
            return this.__fDisableClip
        }
    }

    /**
     * Specifies whether to disable Plug and Play redirection.
     * @type {BOOLEAN}
     */
    fDisablePNPRedir{
        get {
            if(!this.HasProp("__fDisablePNPRedir"))
                this.__fDisablePNPRedir := BOOLEAN(this.ptr + 14)
            return this.__fDisablePNPRedir
        }
    }
}
