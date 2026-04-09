#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Security\AUDIT_EVENT_TYPE.ahk
#Include .\SE_AUDIT_OPERATION.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class SE_AUDIT_INFO extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {AUDIT_EVENT_TYPE}
     */
    AuditType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {SE_AUDIT_OPERATION}
     */
    AuditOperation {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AuditFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer}
     */
    SubsystemName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    ObjectTypeName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    ObjectName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    HandleId {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TransactionId {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<LUID>}
     */
    OperationId {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {BOOLEAN}
     */
    ObjectCreation {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * @type {BOOLEAN}
     */
    GenerateOnClose {
        get => NumGet(this, 65, "char")
        set => NumPut("char", value, this, 65)
    }
}
