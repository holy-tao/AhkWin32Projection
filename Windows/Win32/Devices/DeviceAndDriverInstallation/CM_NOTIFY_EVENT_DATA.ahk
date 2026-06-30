#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CM_NOTIFY_FILTER_TYPE.ahk

/**
 * This is a device notification event data structure.
 * @remarks
 * The notification callback supplied to <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> receives a pointer to a structure of type <b>CM_NOTIFY_EVENT_DATA</b> in the callback's <i>EventData</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cm_notify_event_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_NOTIFY_EVENT_DATA extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    class _u extends Win32Struct {
        static sizeof => 28
        static packingSize => 4

        class _DeviceInterface extends Win32Struct {
            static sizeof => 20
            static packingSize => 4

            /**
             * @type {Guid}
             */
            ClassGuid {
                get {
                    if(!this.HasProp("__ClassGuid"))
                        this.__ClassGuid := Guid(0, this)
                    return this.__ClassGuid
                }
            }

            /**
             * @type {String}
             */
            SymbolicLink {
                get => StrGet(this.ptr + 16, 0, "UTF-16")
                set => StrPut(value, this.ptr + 16, 0, "UTF-16")
            }
        }

        class _DeviceHandle extends Win32Struct {
            static sizeof => 28
            static packingSize => 4

            /**
             * @type {Guid}
             */
            EventGuid {
                get {
                    if(!this.HasProp("__EventGuid"))
                        this.__EventGuid := Guid(0, this)
                    return this.__EventGuid
                }
            }

            /**
             * @type {Integer}
             */
            NameOffset {
                get => NumGet(this, 16, "int")
                set => NumPut("int", value, this, 16)
            }

            /**
             * @type {Integer}
             */
            DataSize {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }

            /**
             * @type {Array<Integer>}
             */
            Data {
                get {
                    if(!this.HasProp("__DataProxyArray"))
                        this.__DataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
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
        DeviceInterface {
            get {
                if(!this.HasProp("__DeviceInterface"))
                    this.__DeviceInterface := CM_NOTIFY_EVENT_DATA._u._DeviceInterface(0, this)
                return this.__DeviceInterface
            }
        }

        /**
         * @type {_DeviceHandle}
         */
        DeviceHandle {
            get {
                if(!this.HasProp("__DeviceHandle"))
                    this.__DeviceHandle := CM_NOTIFY_EVENT_DATA._u._DeviceHandle(0, this)
                return this.__DeviceHandle
            }
        }

        /**
         * @type {_DeviceInstance}
         */
        DeviceInstance {
            get {
                if(!this.HasProp("__DeviceInstance"))
                    this.__DeviceInstance := CM_NOTIFY_EVENT_DATA._u._DeviceInstance(0, this)
                return this.__DeviceInstance
            }
        }
    }

    /**
     * The <b>CM_NOTIFY_FILTER_TYPE</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure that was used in the registration that generated this notification event data.
     * @type {CM_NOTIFY_FILTER_TYPE}
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
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := CM_NOTIFY_EVENT_DATA._u(8, this)
            return this.__u
        }
    }
}
