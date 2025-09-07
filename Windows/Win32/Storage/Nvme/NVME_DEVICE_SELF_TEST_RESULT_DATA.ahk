#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data about the results of a Device Self-Test operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_device_self_test_result_data
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DEVICE_SELF_TEST_RESULT_DATA extends Win32Struct
{
    static sizeof => 28

    static packingSize => 1

    /**
     * A **Status** structure containing fields that describe the status of a Device Self-Test operation.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Indicates the first segment in which a failure occurred during the Device Self-Test operation.
     * @type {Integer}
     */
    SegmentNumber {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * A **ValidDiagnostics** structure containing fields that indicate the validity of certain parameters in a Device Self-Test operation.
     * @type {Integer}
     */
    ValidDiagnostics {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * A reserved field in the **ValidDiagnostics**  structure.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Indicates the number of Power On Hours (POH) when the test operation was completed or aborted.
     * @type {Integer}
     */
    POH {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the Namespace Identifier (NSID). This field is only valid if **NSIDValid** is set to `1`.
     * @type {Integer}
     */
    NSID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The Logical Block Address (LBA) which caused the test to fail. This field is only valid if **FLBAValid** is set to `1`.
     * @type {Integer}
     */
    FailingLBA {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A Status Code Type (**StatusCodeType**) structure containing fields that contain information about errors and conditions.
     * @type {Integer}
     */
    StatusCodeType {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * A **StatusCodeType** field that contains additional information related to errors and conditions of the Device Self-Test operation based on the Status Code.
     * 
     * This field is only valid if **SCValid** is set to `1`.
     * @type {Integer}
     */
    StatusCode {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * A vendor specific field.
     * @type {Integer}
     */
    VendorSpecific {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }
}
