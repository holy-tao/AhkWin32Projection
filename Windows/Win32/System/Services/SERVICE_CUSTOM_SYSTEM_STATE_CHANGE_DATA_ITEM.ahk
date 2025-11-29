#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERVICE_TRIGGER_CUSTOM_STATE_ID.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        class _s extends Win32Struct {
            static sizeof => 8
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            DataOffset {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Array<Byte>}
             */
            Data{
                get {
                    if(!this.HasProp("__DataProxyArray"))
                        this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
                    return this.__DataProxyArray
                }
            }
        
        }
    
        /**
         * @type {SERVICE_TRIGGER_CUSTOM_STATE_ID}
         */
        CustomStateId{
            get {
                if(!this.HasProp("__CustomStateId"))
                    this.__CustomStateId := SERVICE_TRIGGER_CUSTOM_STATE_ID(0, this)
                return this.__CustomStateId
            }
        }
    
        /**
         * @type {_s}
         */
        s{
            get {
                if(!this.HasProp("__s"))
                    this.__s := %this.__Class%._s(0, this)
                return this.__s
            }
        }
    
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(0, this)
            return this.__u
        }
    }
}
