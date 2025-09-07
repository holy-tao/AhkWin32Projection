#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_HANDLERS extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvDeinitService {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvInitAdapter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvDeinitAdapter {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvPerformPreAssociate {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvAdapterReset {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvPerformPostAssociate {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvStopPostAssociate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvValidateProfile {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvPerformCapabilityMatch {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvCreateDiscoveryProfiles {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvProcessSessionChange {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvReceiveIndication {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvReceivePacket {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvSendPacketCompletion {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvIsUIRequestPending {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvProcessUIResponse {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvQueryUIRequest {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvOnexIndicateResult {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Dot11ExtIhvControl {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
