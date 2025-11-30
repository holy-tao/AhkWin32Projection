#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_REGISTRATION extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<FLT_CONTEXT_REGISTRATION>}
     */
    ContextRegistration {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<FLT_OPERATION_REGISTRATION>}
     */
    OperationRegistration {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFLT_FILTER_UNLOAD_CALLBACK>}
     */
    FilterUnloadCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFLT_INSTANCE_SETUP_CALLBACK>}
     */
    InstanceSetupCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFLT_INSTANCE_QUERY_TEARDOWN_CALLBACK>}
     */
    InstanceQueryTeardownCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PFLT_INSTANCE_TEARDOWN_CALLBACK>}
     */
    InstanceTeardownStartCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PFLT_INSTANCE_TEARDOWN_CALLBACK>}
     */
    InstanceTeardownCompleteCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PFLT_GENERATE_FILE_NAME>}
     */
    GenerateFileNameCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PFLT_NORMALIZE_NAME_COMPONENT>}
     */
    NormalizeNameComponentCallback {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PFLT_NORMALIZE_CONTEXT_CLEANUP>}
     */
    NormalizeContextCleanupCallback {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PFLT_TRANSACTION_NOTIFICATION_CALLBACK>}
     */
    TransactionNotificationCallback {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PFLT_NORMALIZE_NAME_COMPONENT_EX>}
     */
    NormalizeNameComponentExCallback {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PFLT_SECTION_CONFLICT_NOTIFICATION_CALLBACK>}
     */
    SectionNotificationCallback {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
