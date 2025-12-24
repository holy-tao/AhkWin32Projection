#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Security\SECURITY_QUALITY_OF_SERVICE.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk
#Include ..\..\..\Win32\Security\TOKEN_SOURCE.ahk
#Include ..\..\..\Win32\Security\TOKEN_CONTROL.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SECURITY_CLIENT_CONTEXT extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {SECURITY_QUALITY_OF_SERVICE}
     */
    SecurityQos{
        get {
            if(!this.HasProp("__SecurityQos"))
                this.__SecurityQos := SECURITY_QUALITY_OF_SERVICE(0, this)
            return this.__SecurityQos
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    ClientToken {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {BOOLEAN}
     */
    DirectlyAccessClientToken {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    DirectAccessEffectiveOnly {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {BOOLEAN}
     */
    ServerIsRemote {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {TOKEN_CONTROL}
     */
    ClientTokenControl{
        get {
            if(!this.HasProp("__ClientTokenControl"))
                this.__ClientTokenControl := TOKEN_CONTROL(32, this)
            return this.__ClientTokenControl
        }
    }
}
