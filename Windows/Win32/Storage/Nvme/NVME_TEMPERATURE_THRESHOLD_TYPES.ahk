#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate the type of threshold for the temperature of the overall device (controller and NVM included).
 * @remarks
 * Values from this enumeration are used in the **THSEL** field of the [NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD](ns-nvme-nvme_cdw11_feature_temperature_threshold.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_temperature_threshold_types
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_TEMPERATURE_THRESHOLD_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Over Temperature Threshold
     * @type {Integer (Int32)}
     */
    static NVME_TEMPERATURE_OVER_THRESHOLD => 0

    /**
     * Under Temperature Threshold
     * @type {Integer (Int32)}
     */
    static NVME_TEMPERATURE_UNDER_THRESHOLD => 1
}
