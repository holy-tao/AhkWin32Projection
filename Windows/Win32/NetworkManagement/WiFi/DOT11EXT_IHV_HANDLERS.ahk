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
     * @type {Pointer<DOT11EXTIHV_DEINIT_SERVICE>}
     */
    Dot11ExtIhvDeinitService {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_INIT_ADAPTER>}
     */
    Dot11ExtIhvInitAdapter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_DEINIT_ADAPTER>}
     */
    Dot11ExtIhvDeinitAdapter {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_PERFORM_PRE_ASSOCIATE>}
     */
    Dot11ExtIhvPerformPreAssociate {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_ADAPTER_RESET>}
     */
    Dot11ExtIhvAdapterReset {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_PERFORM_POST_ASSOCIATE>}
     */
    Dot11ExtIhvPerformPostAssociate {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_STOP_POST_ASSOCIATE>}
     */
    Dot11ExtIhvStopPostAssociate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_VALIDATE_PROFILE>}
     */
    Dot11ExtIhvValidateProfile {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_PERFORM_CAPABILITY_MATCH>}
     */
    Dot11ExtIhvPerformCapabilityMatch {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_CREATE_DISCOVERY_PROFILES>}
     */
    Dot11ExtIhvCreateDiscoveryProfiles {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_PROCESS_SESSION_CHANGE>}
     */
    Dot11ExtIhvProcessSessionChange {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_RECEIVE_INDICATION>}
     */
    Dot11ExtIhvReceiveIndication {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_RECEIVE_PACKET>}
     */
    Dot11ExtIhvReceivePacket {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_SEND_PACKET_COMPLETION>}
     */
    Dot11ExtIhvSendPacketCompletion {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_IS_UI_REQUEST_PENDING>}
     */
    Dot11ExtIhvIsUIRequestPending {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_PROCESS_UI_RESPONSE>}
     */
    Dot11ExtIhvProcessUIResponse {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_QUERY_UI_REQUEST>}
     */
    Dot11ExtIhvQueryUIRequest {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_ONEX_INDICATE_RESULT>}
     */
    Dot11ExtIhvOnexIndicateResult {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<DOT11EXTIHV_CONTROL>}
     */
    Dot11ExtIhvControl {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
