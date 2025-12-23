#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADDRALIAS.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class NSID extends Win32Struct
{
    static sizeof => 168

    static packingSize => 4

    class _address_e__Union extends Win32Struct {
        static sizeof => 138
        static packingSize => 4

        /**
         * @type {ADDRALIAS}
         */
        alias{
            get {
                if(!this.HasProp("__alias"))
                    this.__alias := ADDRALIAS(0, this)
                return this.__alias
            }
        }
    
        /**
         * @type {String}
         */
        rgchInterNet {
            get => StrGet(this.ptr + 0, 0, "UTF-16")
            set => StrPut(value, this.ptr + 0, 0, "UTF-16")
        }
    
    }

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    uchType{
        get {
            if(!this.HasProp("__uchTypeProxyArray"))
                this.__uchTypeProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__uchTypeProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    xtype {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    lTime {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {_address_e__Union}
     */
    address{
        get {
            if(!this.HasProp("__address"))
                this.__address := %this.__Class%._address_e__Union(28, this)
            return this.__address
        }
    }
}
