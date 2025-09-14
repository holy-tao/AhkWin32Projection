#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_TRANSPORTCLIENT_CALLBACKS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<PFN_WdsTransportClientSessionStart>}
     */
    SessionStart {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PFN_WdsTransportClientSessionStartEx>}
     */
    SessionStartEx {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFN_WdsTransportClientReceiveContents>}
     */
    ReceiveContents {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFN_WdsTransportClientReceiveMetadata>}
     */
    ReceiveMetadata {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFN_WdsTransportClientSessionComplete>}
     */
    SessionComplete {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFN_WdsTransportClientSessionNegotiate>}
     */
    SessionNegotiate {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
