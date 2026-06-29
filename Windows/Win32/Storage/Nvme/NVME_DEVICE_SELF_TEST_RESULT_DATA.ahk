#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains data about the results of a Device Self-Test operation.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_device_self_test_result_data
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DEVICE_SELF_TEST_RESULT_DATA {
    #StructPack 8


    struct _Status {
        /**
         * This bitfield backs the following members:
         * - Result
         * - CodeValue
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Result {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        CodeValue {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    }

    struct _ValidDiagnostics {
        /**
         * This bitfield backs the following members:
         * - NSIDValid
         * - FLBAValid
         * - SCTValid
         * - SCValid
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        NSIDValid {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        FLBAValid {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        SCTValid {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        SCValid {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    }

    struct _StatusCodeType {
        /**
         * This bitfield backs the following members:
         * - AdditionalInfo
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        AdditionalInfo {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    }

    /**
     * A **Status** structure containing fields that describe the status of a Device Self-Test operation.
     */
    Status : NVME_DEVICE_SELF_TEST_RESULT_DATA._Status

    /**
     * Indicates the first segment in which a failure occurred during the Device Self-Test operation.
     */
    SegmentNumber : Int8

    /**
     * A **ValidDiagnostics** structure containing fields that indicate the validity of certain parameters in a Device Self-Test operation.
     */
    ValidDiagnostics : NVME_DEVICE_SELF_TEST_RESULT_DATA._ValidDiagnostics

    /**
     * A reserved field in the **ValidDiagnostics**  structure.
     */
    Reserved : Int8

    /**
     * Indicates the number of Power On Hours (POH) when the test operation was completed or aborted.
     */
    POH : Int64

    /**
     * Contains the Namespace Identifier (NSID). This field is only valid if **NSIDValid** is set to `1`.
     */
    NSID : UInt32

    /**
     * The Logical Block Address (LBA) which caused the test to fail. This field is only valid if **FLBAValid** is set to `1`.
     */
    FailingLBA : Int64

    /**
     * A Status Code Type (**StatusCodeType**) structure containing fields that contain information about errors and conditions.
     */
    StatusCodeType : NVME_DEVICE_SELF_TEST_RESULT_DATA._StatusCodeType

    /**
     * A **StatusCodeType** field that contains additional information related to errors and conditions of the Device Self-Test operation based on the Status Code.
     * 
     * This field is only valid if **SCValid** is set to `1`.
     */
    StatusCode : Int8

    /**
     * A vendor specific field.
     */
    VendorSpecific : UInt16

}
