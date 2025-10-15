#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ModuleBindInfo extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwAppDomainId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    lpAssemblyIdentity{
        get {
            if(!this.HasProp("__lpAssemblyIdentity"))
                this.__lpAssemblyIdentity := PWSTR(this.ptr + 8)
            return this.__lpAssemblyIdentity
        }
    }

    /**
     * @type {PWSTR}
     */
    lpModuleName{
        get {
            if(!this.HasProp("__lpModuleName"))
                this.__lpModuleName := PWSTR(this.ptr + 16)
            return this.__lpModuleName
        }
    }
}
