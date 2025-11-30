#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PSHED_PLUGIN_CALLBACKS extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Pointer<PSHED_PI_GET_ALL_ERROR_SOURCES>}
     */
    GetAllErrorSources {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PSHED_PI_GET_ERROR_SOURCE_INFO>}
     */
    GetErrorSourceInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PSHED_PI_SET_ERROR_SOURCE_INFO>}
     */
    SetErrorSourceInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PSHED_PI_ENABLE_ERROR_SOURCE>}
     */
    EnableErrorSource {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PSHED_PI_DISABLE_ERROR_SOURCE>}
     */
    DisableErrorSource {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PSHED_PI_WRITE_ERROR_RECORD>}
     */
    WriteErrorRecord {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PSHED_PI_READ_ERROR_RECORD>}
     */
    ReadErrorRecord {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PSHED_PI_CLEAR_ERROR_RECORD>}
     */
    ClearErrorRecord {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PSHED_PI_RETRIEVE_ERROR_INFO>}
     */
    RetrieveErrorInfo {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PSHED_PI_FINALIZE_ERROR_RECORD>}
     */
    FinalizeErrorRecord {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PSHED_PI_CLEAR_ERROR_STATUS>}
     */
    ClearErrorStatus {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PSHED_PI_ATTEMPT_ERROR_RECOVERY>}
     */
    AttemptRecovery {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PSHED_PI_GET_INJECTION_CAPABILITIES>}
     */
    GetInjectionCapabilities {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PSHED_PI_INJECT_ERROR>}
     */
    InjectError {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
