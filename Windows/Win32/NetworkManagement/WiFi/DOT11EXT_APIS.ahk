#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_APIS extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {Pointer<DOT11EXT_ALLOCATE_BUFFER>}
     */
    Dot11ExtAllocateBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DOT11EXT_FREE_BUFFER>}
     */
    Dot11ExtFreeBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_PROFILE_CUSTOM_USER_DATA>}
     */
    Dot11ExtSetProfileCustomUserData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DOT11EXT_GET_PROFILE_CUSTOM_USER_DATA>}
     */
    Dot11ExtGetProfileCustomUserData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_CURRENT_PROFILE>}
     */
    Dot11ExtSetCurrentProfile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<DOT11EXT_SEND_UI_REQUEST>}
     */
    Dot11ExtSendUIRequest {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<DOT11EXT_PRE_ASSOCIATE_COMPLETION>}
     */
    Dot11ExtPreAssociateCompletion {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<DOT11EXT_POST_ASSOCIATE_COMPLETION>}
     */
    Dot11ExtPostAssociateCompletion {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<DOT11EXT_SEND_NOTIFICATION>}
     */
    Dot11ExtSendNotification {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<DOT11EXT_SEND_PACKET>}
     */
    Dot11ExtSendPacket {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_ETHERTYPE_HANDLING>}
     */
    Dot11ExtSetEtherTypeHandling {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_AUTH_ALGORITHM>}
     */
    Dot11ExtSetAuthAlgorithm {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_UNICAST_CIPHER_ALGORITHM>}
     */
    Dot11ExtSetUnicastCipherAlgorithm {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_MULTICAST_CIPHER_ALGORITHM>}
     */
    Dot11ExtSetMulticastCipherAlgorithm {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_DEFAULT_KEY>}
     */
    Dot11ExtSetDefaultKey {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_KEY_MAPPING_KEY>}
     */
    Dot11ExtSetKeyMappingKey {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_DEFAULT_KEY_ID>}
     */
    Dot11ExtSetDefaultKeyId {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<DOT11EXT_NIC_SPECIFIC_EXTENSION>}
     */
    Dot11ExtNicSpecificExtension {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<DOT11EXT_SET_EXCLUDE_UNENCRYPTED>}
     */
    Dot11ExtSetExcludeUnencrypted {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<DOT11EXT_ONEX_START>}
     */
    Dot11ExtStartOneX {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<DOT11EXT_ONEX_STOP>}
     */
    Dot11ExtStopOneX {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<DOT11EXT_PROCESS_ONEX_PACKET>}
     */
    Dot11ExtProcessSecurityPacket {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}
