#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This is a device notification event data structure.
 * @remarks
 * 
 * The notification callback supplied to <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> receives a pointer to a structure of type <b>CM_NOTIFY_EVENT_DATA</b> in the callback's <i>EventData</i> parameter.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfgmgr32/ns-cfgmgr32-cm_notify_event_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_NOTIFY_EVENT_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 30
        static packingSize => 8

        class _DeviceInterface extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Pointer<Guid>}
             */
            ClassGuid {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {String}
             */
            SymbolicLink {
                get => StrGet(this.ptr + 8, 0, "UTF-16")
                set => StrPut(value, this.ptr + 8, 0, "UTF-16")
            }
        
        }
    
        class _DeviceHandle extends Win32Struct {
            static sizeof => 24
            static packingSize => 8
    
            /**
             * @type {Pointer<Guid>}
             */
            EventGuid {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            NameOffset {
                get => NumGet(this, 8, "int")
                set => NumPut("int", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            DataSize {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Array<Byte>}
             */
            Data{
                get {
                    if(!this.HasProp("__DataProxyArray"))
                        this.__DataProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
                    return this.__DataProxyArray
                }
            }
        
        }
    
        class _DeviceInstance extends Win32Struct {
            static sizeof => 2
            static packingSize => 2
    
            /**
             * @type {String}
             */
            InstanceId {
                get => StrGet(this.ptr + 0, 0, "UTF-16")
                set => StrPut(value, this.ptr + 0, 0, "UTF-16")
            }
        
        }
    
        /**
         * @type {_DeviceInterface}
         */
        DeviceInterface{
            get {
                if(!this.HasProp("__DeviceInterface"))
                    this.__DeviceInterface := %this.__Class%._DeviceInterface(0, this)
                return this.__DeviceInterface
            }
        }
    
        /**
         * @type {_DeviceHandle}
         */
        DeviceHandle{
            get {
                if(!this.HasProp("__DeviceHandle"))
                    this.__DeviceHandle := %this.__Class%._DeviceHandle(0, this)
                return this.__DeviceHandle
            }
        }
    
        /**
         * @type {_DeviceInstance}
         */
        DeviceInstance{
            get {
                if(!this.HasProp("__DeviceInstance"))
                    this.__DeviceInstance := %this.__Class%._DeviceInstance(0, this)
                return this.__DeviceInstance
            }
        }
    
    }

    /**
     * The <b>CM_NOTIFY_FILTER_TYPE</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure that was used in the registration that generated this notification event data.
     * @type {Integer}
     */
    FilterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved.  Must be 0.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A union that contains information about the notification event data.    To determine which member of the union to examine, check the <b>FilterType</b> of the event data.
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(8, this)
            return this.__u
        }
    }
}
