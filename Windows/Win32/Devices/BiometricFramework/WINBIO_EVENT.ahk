#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk

/**
 * Specify the types of service provider event notifications to monitor.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-event-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_EVENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RejectDetail {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {WINBIO_IDENTITY}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := WINBIO_IDENTITY(this.ptr + 16)
            return this.__Identity
        }
    }

    /**
     * @type {Integer}
     */
    SubFactor {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RejectDetail1 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {HRESULT}
     */
    Error {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
