#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_DEVICE_SELF_TEST_RESULT_DATA.ahk" { NVME_DEVICE_SELF_TEST_RESULT_DATA }

/**
 * Contains fields that specify the information in a Device Self Test log page that describes the status, completion percentage, and results of a device self-test.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_device_self_test_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DEVICE_SELF_TEST_LOG {
    #StructPack 8


    struct _CurrentOperation {
        /**
         * This bitfield backs the following members:
         * - Status
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Status {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    }

    struct _CurrentCompletion {
        /**
         * This bitfield backs the following members:
         * - CompletePercent
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        CompletePercent {
            get => (this._bitfield >> 0) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
        }
    }

    /**
     * A **CurrentOperation** structure containing fields that describe the current Device Self-Test operation.
     */
    CurrentOperation : NVME_DEVICE_SELF_TEST_LOG._CurrentOperation

    /**
     * A **CurrentCompletion** structure containing fields that describe the completion of a Device Self-Test operation.
     */
    CurrentCompletion : NVME_DEVICE_SELF_TEST_LOG._CurrentCompletion

    /**
     * A reserved field in the **CurrentOperation** structure.
     */
    Reserved : Int8[2]

    /**
     * An array of 20 [NVME_DEVICE_SELF_TEST_RESULT_DATA](ns-nvme-nvme_device_self_test_result_data.md) structures that contain result data for the last 20 Device Self-Test operations, sorted in order from the most recent to the oldest available.
     */
    ResultData : NVME_DEVICE_SELF_TEST_RESULT_DATA[20]

}
