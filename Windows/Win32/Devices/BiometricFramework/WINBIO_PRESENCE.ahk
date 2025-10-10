#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\WINBIO_PRESENCE_PROPERTIES.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PRESENCE extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    class _Authorization extends Win32Struct {
        static sizeof => 552
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Size {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        Data{
            get {
                if(!this.HasProp("__DataProxyArray"))
                    this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "char")
                return this.__DataProxyArray
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SubFactor {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {HRESULT}
     */
    Status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
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
    TrackingId {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    Ticket {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {WINBIO_PRESENCE_PROPERTIES}
     */
    Properties{
        get {
            if(!this.HasProp("__Properties"))
                this.__Properties := WINBIO_PRESENCE_PROPERTIES(this.ptr + 112)
            return this.__Properties
        }
    }

    /**
     * @type {_Authorization}
     */
    Authorization{
        get {
            if(!this.HasProp("__Authorization"))
                this.__Authorization := %this.__Class%._Authorization(this.ptr + 512)
            return this.__Authorization
        }
    }
}
