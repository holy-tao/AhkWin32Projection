#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Security\PSID.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class FindPackageDependencyCriteria extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSID}
     */
    User{
        get {
            if(!this.HasProp("__User"))
                this.__User := PSID(this.ptr + 0)
            return this.__User
        }
    }

    /**
     * @type {BOOL}
     */
    ScopeIsSystem{
        get {
            if(!this.HasProp("__ScopeIsSystem"))
                this.__ScopeIsSystem := BOOL(this.ptr + 8)
            return this.__ScopeIsSystem
        }
    }

    /**
     * @type {PWSTR}
     */
    PackageFamilyName{
        get {
            if(!this.HasProp("__PackageFamilyName"))
                this.__PackageFamilyName := PWSTR(this.ptr + 16)
            return this.__PackageFamilyName
        }
    }
}
