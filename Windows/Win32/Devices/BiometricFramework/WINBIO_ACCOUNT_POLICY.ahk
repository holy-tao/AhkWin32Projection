#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_ACCOUNT_POLICY extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {WINBIO_IDENTITY}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := WINBIO_IDENTITY(0, this)
            return this.__Identity
        }
    }

    /**
     * @type {Integer}
     */
    AntiSpoofBehavior {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}
