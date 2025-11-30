#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SE_AUDIT_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AuditType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
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
     * @type {UNICODE_STRING}
     */
    SubsystemName{
        get {
            if(!this.HasProp("__SubsystemName"))
                this.__SubsystemName := UNICODE_STRING(16, this)
            return this.__SubsystemName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    ObjectTypeName{
        get {
            if(!this.HasProp("__ObjectTypeName"))
                this.__ObjectTypeName := UNICODE_STRING(32, this)
            return this.__ObjectTypeName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    ObjectName{
        get {
            if(!this.HasProp("__ObjectName"))
                this.__ObjectName := UNICODE_STRING(48, this)
            return this.__ObjectName
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    HandleId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TransactionId {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<LUID>}
     */
    OperationId {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {BOOLEAN}
     */
    ObjectCreation {
        get => NumGet(this, 88, "char")
        set => NumPut("char", value, this, 88)
    }

    /**
     * @type {BOOLEAN}
     */
    GenerateOnClose {
        get => NumGet(this, 89, "char")
        set => NumPut("char", value, this, 89)
    }
}
