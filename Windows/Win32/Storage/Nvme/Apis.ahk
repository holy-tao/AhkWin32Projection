#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class Nvme {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NVME_IDENTIFY_CNS_DESCRIPTOR_NAMESPACE_SIZE => 4096

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_SMART_INFORMATIONGuid => "{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_SMART_INFORMATION => "{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}"

    /**
     * @type {String}
     */
    static GUID_WCS_DEVICE_SMART_ATTRIBUTESGuid => "{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}"

    /**
     * @type {String}
     */
    static GUID_WCS_DEVICE_SMART_ATTRIBUTES => "{2810afc5-bfea-a4f2-9c4f-6f7cc914d5af}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_ERROR_RECOVERYGuid => "{2131d944-30fe-ae34-ab4d-fd3dba83195a}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_ERROR_RECOVERY => "{2131d944-30fe-ae34-ab4d-fd3dba83195a}"

    /**
     * @type {String}
     */
    static GUID_WCS_DEVICE_ERROR_RECOVERYGuid => "{2131d944-30fe-ae34-ab4d-fd3dba83195a}"

    /**
     * @type {String}
     */
    static GUID_WCS_DEVICE_ERROR_RECOVERY => "{2131d944-30fe-ae34-ab4d-fd3dba83195a}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORYGuid => "{769a796d-dab4-a3f6-e24d-b28aacf31cd1}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY => "{769a796d-dab4-a3f6-e24d-b28aacf31cd1}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_LATENCY_MONITORGuid => "{8cc07a92-84d0-9c6c-7043-e6d4585ed485}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_LATENCY_MONITOR => "{8cc07a92-84d0-9c6c-7043-e6d4585ed485}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_DEVICE_CAPABILITIESGuid => "{0d054297-e1d1-98c9-5d49-584b913c05b7}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_DEVICE_CAPABILITIES => "{0d054297-e1d1-98c9-5d49-584b913c05b7}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_UNSUPPORTED_REQUIREMENTSGuid => "{0e9c722f-2399-bb2c-6348-32d0b798bbc7}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS => "{0e9c722f-2399-bb2c-6348-32d0b798bbc7}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_TCG_CONFIGURATIONGuid => "{bd244006-e07e-83e6-c047-54fa9d2ae054}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_TCG_CONFIGURATION => "{bd244006-e07e-83e6-c047-54fa9d2ae054}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_TCG_HISTORYGuid => "{704b513e-09c6-9490-274e-d0969690d788}"

    /**
     * @type {String}
     */
    static GUID_OCP_DEVICE_TCG_HISTORY => "{704b513e-09c6-9490-274e-d0969690d788}"

    /**
     * @type {String}
     */
    static GUID_MFND_CHILD_CONTROLLER_EVENT_LOG_PAGEGuid => "{98bcce18-a5f0-bf35-a544-d97f259d669c}"

    /**
     * @type {String}
     */
    static GUID_MFND_CHILD_CONTROLLER_EVENT_LOG_PAGE => "{98bcce18-a5f0-bf35-a544-d97f259d669c}"

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
    static NVME_TELEMETRY_DATA_BLOCK_SIZE => 512

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
    static NVME_NAMESPACE_ALL => 4294967295
;@endregion Constants

;@region Methods
;@endregion Methods
}
