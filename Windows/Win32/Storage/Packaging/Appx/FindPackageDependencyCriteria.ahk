#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Security\PSID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class FindPackageDependencyCriteria extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSID}
     */
    User {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    ScopeIsSystem {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    PackageFamilyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
