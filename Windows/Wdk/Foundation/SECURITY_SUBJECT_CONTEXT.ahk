#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Security\SECURITY_IMPERSONATION_LEVEL.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class SECURITY_SUBJECT_CONTEXT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    ClientToken {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {SECURITY_IMPERSONATION_LEVEL}
     */
    ImpersonationLevel {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    PrimaryToken {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    ProcessAuditId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
