#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_IDENTITY extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _AccountSid extends Win32Struct {
        static sizeof => 72
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
                    this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 68, Primitive, "char")
                return this.__DataProxyArray
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Null {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Wildcard {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TemplateGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_AccountSid}
     */
    AccountSid{
        get {
            if(!this.HasProp("__AccountSid"))
                this.__AccountSid := %this.__Class%._AccountSid(this.ptr + 8)
            return this.__AccountSid
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SecureId{
        get {
            if(!this.HasProp("__SecureIdProxyArray"))
                this.__SecureIdProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__SecureIdProxyArray
        }
    }
}
