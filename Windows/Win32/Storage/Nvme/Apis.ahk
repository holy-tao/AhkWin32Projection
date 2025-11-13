#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class Nvme {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_ADMINQ_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_NQN_MAX_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_NQN_NAME_MAX_LEN => 223

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CONTROLLER_ID_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CONTROLLER_ID_MAX => 65519

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CONTROLLER_ID_STAT_PERSIST => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CONTROLLER_ID_DYN => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static NVM_SUBSYSTEM_SHUTDOWN_NORMAL => 1316121964

    /**
     * @type {Integer (UInt32)}
     */
    static NVM_SUBSYSTEM_SHUTDOWN_ABRUPT => 1096970356

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_IDENTIFY_CNS_DESCRIPTOR_NAMESPACE_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_UUID_ASSOCIATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_UUID_ASSOCIATION_PCI_VID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_UUID_ASSOCIATION_PCI_SUBSYSTEM_VID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_UUID_ASSOCIATION_RESERVED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_NUM_UUID_LIST_ENTRIES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_MAX_UUID_INDEX => 127

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_LOG_PAGE_MIN_IDENTIFIER => 192

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_LOG_PAGE_MAX_IDENTIFIER => 255

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_SMART_INFORMATIONGuid => Guid("{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_SMART_INFORMATION => Guid("{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}")

    /**
     * @type {Guid}
     */
    static GUID_WCS_DEVICE_SMART_ATTRIBUTESGuid => Guid("{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}")

    /**
     * @type {Guid}
     */
    static GUID_WCS_DEVICE_SMART_ATTRIBUTES => Guid("{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_ERROR_RECOVERYGuid => Guid("{2131d944-30fe-ae34-ab4d-fd3dba83195a}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_ERROR_RECOVERY => Guid("{2131d944-30fe-ae34-ab4d-fd3dba83195a}")

    /**
     * @type {Guid}
     */
    static GUID_WCS_DEVICE_ERROR_RECOVERYGuid => Guid("{2131d944-30fe-ae34-ab4d-fd3dba83195a}")

    /**
     * @type {Guid}
     */
    static GUID_WCS_DEVICE_ERROR_RECOVERY => Guid("{2131d944-30fe-ae34-ab4d-fd3dba83195a}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORYGuid => Guid("{769a796d-dab4-a3f6-e24d-b28aacf31cd1}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY => Guid("{769a796d-dab4-a3f6-e24d-b28aacf31cd1}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_LATENCY_MONITORGuid => Guid("{8cc07a92-84d0-9c6c-7043-e6d4585ed485}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_LATENCY_MONITOR => Guid("{8cc07a92-84d0-9c6c-7043-e6d4585ed485}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_DEVICE_CAPABILITIESGuid => Guid("{0d054297-e1d1-98c9-5d49-584b913c05b7}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_DEVICE_CAPABILITIES => Guid("{0d054297-e1d1-98c9-5d49-584b913c05b7}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_UNSUPPORTED_REQUIREMENTSGuid => Guid("{0e9c722f-2399-bb2c-6348-32d0b798bbc7}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS => Guid("{0e9c722f-2399-bb2c-6348-32d0b798bbc7}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_TCG_CONFIGURATIONGuid => Guid("{bd244006-e07e-83e6-c047-54fa9d2ae054}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_TCG_CONFIGURATION => Guid("{bd244006-e07e-83e6-c047-54fa9d2ae054}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_TCG_HISTORYGuid => Guid("{704b513e-09c6-9490-274e-d0969690d788}")

    /**
     * @type {Guid}
     */
    static GUID_OCP_DEVICE_TCG_HISTORY => Guid("{704b513e-09c6-9490-274e-d0969690d788}")

    /**
     * @type {Guid}
     */
    static GUID_MFND_CHILD_CONTROLLER_EVENT_LOG_PAGEGuid => Guid("{98bcce18-a5f0-bf35-a544-d97f259d669c}")

    /**
     * @type {Guid}
     */
    static GUID_MFND_CHILD_CONTROLLER_EVENT_LOG_PAGE => Guid("{98bcce18-a5f0-bf35-a544-d97f259d669c}")

    /**
     * @type {Guid}
     */
    static GUID_MFND_CHILD_CONTROLLER_QOS_STAT_LOG_PAGEGuid => Guid("{9cb5fa26-0652-4644-873e-400084575f0f}")

    /**
     * @type {Guid}
     */
    static GUID_MFND_CHILD_CONTROLLER_QOS_STAT_LOG_PAGE => Guid("{9cb5fa26-0652-4644-873e-400084575f0f}")

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_SMART_INFORMATION_LOG_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_DSSD_SPEC_MAJOR_VERSION_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_DSSD_SPEC_MAJOR_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_WCS_DEVICE_ERROR_RECOVERY_LOG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_ERROR_RECOVERY_LOG_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_ACTIVATION_HISTORY_ENTRY_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY_LOG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_LATENCY_MONITOR_LOG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_CAPABILITIES_LOG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS_LOG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_TCG_CONFIGURATION_LOG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TCG_HISTORY_ENTRY_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_OCP_DEVICE_TCG_HISTORY_LOG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_MAX_HOST_IDENTIFIER_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_HOST_IDENTIFIER_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_EXTENDED_HOST_IDENTIFIER_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_MAX_LOG_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CDW10_LSP_ACTION_READ_LOG_DATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CDW10_LSP_ACTION_ESTABLISH_CONTEXT_AND_READ_LOG_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CDW10_LSP_ACTION_RELEASE_CONTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_CDW10_LSP_ACTION_ESTABLISH_CONTEXT_AND_READ_512_BYTES_OF_HEADER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_NUM_LOG_PAGE_IDENTIFIERS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_MAX_LOG_PAGE_IDENTIFIER => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_TELEMETRY_DATA_BLOCK_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_ADMIN_COMMAND_MIN_OPCODE => 192

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_ADMIN_COMMAND_MAX_OPCODE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_NVM_COMMAND_MIN_OPCODE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_NVM_COMMAND_MAX_OPCODE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_NUM_FID_SUPPORTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_FEATURE_MIN_IDENTIFIER => 192

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_VENDOR_SPECIFIC_FEATURE_MAX_IDENTIFIER => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_NUM_NVME_MI_COMMANDS_SUPPORTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_STREAMS_ID_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_STREAMS_ID_MAX => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_STREAMS_GET_STATUS_MAX_IDS => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static ZDES_SIZE_MULTIPLIER_IN_BYTES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_PSDT_XFER_PRP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_PSDT_XFER_SGL_BYTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_PSDT_XFER_SGL_QWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_PSDT_XFER_RESERVED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_NAMESPACE_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_TRANSPORT_ADDR_MAX_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_TRANSPORT_SERVID_MAX_LEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_TRANSPORT_SAS_MAX_LEN => 256

    /**
     * @type {String}
     */
    static NVMEOF_DISCOVERY_NQN => "nqn.2014-08.org.nvmexpress.discovery"

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_DISCOVERY_LOG_VERSION_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_ADMINQ_MIN_DEPTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_ADMINQ_MAX_DEPTH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_IOQ_MIN_DEPTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_IOQ_MAX_DEPTH => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_PROPERTY_SIZE_4Bytes => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_PROPERTY_SIZE_8Bytes => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_DISCOVERY_INFO_MGMT_EKTYPE_PORTID => 63

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_DISCOVERY_INFO_MGMT_EKTYPE_TRADDR => 95

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_DHCHAP_PROTOCOL_ID => 1

    /**
     * @type {String}
     */
    static NVMEOF_DHCHAP_PREFIX_V1 => "DHHC-1:"

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_DHCHAP_REPLY_CVAL_NOTVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_DHCHAP_REPLY_CVAL_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_DHCHAP_SUCCESS1_RVAL_NOTVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NVMEOF_DHCHAP_SUCCESS1_RVAL_VALID => 1
;@endregion Constants

;@region Methods
;@endregion Methods
}
