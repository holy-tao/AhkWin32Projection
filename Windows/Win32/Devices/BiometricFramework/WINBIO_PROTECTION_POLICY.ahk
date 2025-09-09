#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PROTECTION_POLICY extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {WINBIO_IDENTITY}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := WINBIO_IDENTITY(this.ptr + 8)
            return this.__Identity
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    DatabaseId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    UserState {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    PolicySize {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Array<Byte>}
     */
    Policy{
        get {
            if(!this.HasProp("__PolicyProxyArray"))
                this.__PolicyProxyArray := Win32FixedArray(this.ptr + 40, 128, Primitive, "char")
            return this.__PolicyProxyArray
        }
    }
}
