#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class Nfc {

;@region Constants

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_NFCDTA => "{7fd3f30b-5e49-4be1-b3aa-af06260d236a}"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_CONFIG_RF_DISCOVERY => 2233344

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_GET_NEXT => 2233348

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_CONNECT => 2233352

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_DISCONNECT => 2233356

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_TRANSCEIVE => 2233360

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_RECV => 2233364

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_SEND => 2233368

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_CHECK_PRESENCE => 2233372

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_CONFIG_P2P_PARAM => 2233376

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SET_RF_CONFIG => 2233380

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_NDEF_WRITE => 2233408

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_NDEF_READ => 2233412

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_NDEF_CONVERT_READ_ONLY => 2233416

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_REMOTE_DEV_NDEF_CHECK => 2233420

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_CONFIG => 2233472

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_ACTIVATE => 2233476

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_DEACTIVATE => 2233480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_DISCOVER_SERVICES => 2233484

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_LINK_STATUS_CHECK => 2233488

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_GET_NEXT_LINK_STATUS => 2233492

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_CREATE => 2233496

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_CLOSE => 2233500

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_BIND => 2233504

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_LISTEN => 2233508

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_ACCEPT => 2233512

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_CONNECT => 2233516

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_DISCONNECT => 2233520

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_RECV => 2233524

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_RECV_FROM => 2233528

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_SEND => 2233532

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_SNED_TO => 2233536

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_LLCP_SOCKET_GET_NEXT_ERROR => 2233540

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_INIT_SERVER => 2233600

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_DEINIT_SERVER => 2233604

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_SERVER_GET_NEXT_CONNECTION => 2233608

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_SERVER_ACCEPT => 2233612

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_SERVER_GET_NEXT_REQUEST => 2233616

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_SERVER_SEND_RESPONSE => 2233620

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_INIT_CLIENT => 2233664

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_DEINIT_CLIENT => 2233668

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_CLIENT_PUT => 2233672

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SNEP_CLIENT_GET => 2233676

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SE_ENUMERATE => 2233728

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SE_SET_EMULATION_MODE => 2233732

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SE_SET_ROUTING_TABLE => 2233736

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCDTA_SE_GET_NEXT_EVENT => 2233740

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ATR_LENGTH => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_UID_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_LLCP_SERVICE_NAME_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SNEP_SERVER_NAME_SIZE => 256

    /**
     * @type {String}
     */
    static GUID_NFC_RADIO_MEDIA_DEVICE_INTERFACE => "{4d51e930-750d-4a36-a9f7-91dc540fcd30}"

    /**
     * @type {String}
     */
    static GUID_NFCSE_RADIO_MEDIA_DEVICE_INTERFACE => "{ef8ba08f-148d-4116-83ef-a2679dfc3fa5}"

    /**
     * @type {Integer (UInt32)}
     */
    static NFCRMDDI_IOCTL_BASE => 80

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCRM_SET_RADIO_STATE => 5308804

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCRM_QUERY_RADIO_STATE => 5308808

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSERM_SET_RADIO_STATE => 5308812

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSERM_QUERY_RADIO_STATE => 5308816

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_NFCSE => "{8dc7c854-f5e5-4bed-815d-0c85ad047725}"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_ENUM_ENDPOINTS => 2230272

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_SUBSCRIBE_FOR_EVENT => 2230276

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_GET_NEXT_EVENT => 2230280

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_SET_CARD_EMULATION_MODE => 2230284

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_GET_NFCC_CAPABILITIES => 2230288

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_GET_ROUTING_TABLE => 2230292

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_SET_ROUTING_TABLE => 2230296

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_HCE_REMOTE_RECV => 2230592

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_HCE_REMOTE_SEND => 2230596

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFCSE_SET_POWER_MODE => 2230600

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_TRANSACTION_TAG_AID => 129

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_TRANSACTION_TAG_PARAMETERS => 130

    /**
     * @type {Integer (UInt32)}
     */
    static EVT_TRANSACTION_PARAMETER_MAX_LEN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ISO_7816_MINIMUM_AID_LENGTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ISO_7816_MAXIMUM_AID_LENGTH => 16
;@endregion Constants

;@region Methods
;@endregion Methods
}
