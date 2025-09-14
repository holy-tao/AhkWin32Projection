#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class VBS_BASIC_ENCLAVE_SYSCALL_PAGE extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE>}
     */
    ReturnFromEnclave {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION>}
     */
    ReturnFromException {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD>}
     */
    TerminateThread {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD>}
     */
    InterruptThread {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES>}
     */
    CommitPages {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES>}
     */
    DecommitPages {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES>}
     */
    ProtectPages {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD>}
     */
    CreateThread {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION>}
     */
    GetEnclaveInformation {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY>}
     */
    GenerateKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT>}
     */
    GenerateReport {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT>}
     */
    VerifyReport {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA>}
     */
    GenerateRandomData {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
