#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class AssemblyBindInfo extends Win32Struct
{
    static sizeof => 32

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
    lpReferencedIdentity{
        get {
            if(!this.HasProp("__lpReferencedIdentity"))
                this.__lpReferencedIdentity := PWSTR(this.ptr + 8)
            return this.__lpReferencedIdentity
        }
    }

    /**
     * @type {PWSTR}
     */
    lpPostPolicyIdentity{
        get {
            if(!this.HasProp("__lpPostPolicyIdentity"))
                this.__lpPostPolicyIdentity := PWSTR(this.ptr + 16)
            return this.__lpPostPolicyIdentity
        }
    }

    /**
     * @type {Integer}
     */
    ePolicyLevel {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
