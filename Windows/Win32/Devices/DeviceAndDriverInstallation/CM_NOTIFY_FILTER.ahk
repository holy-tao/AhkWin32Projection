#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\CM_NOTIFY_FILTER_TYPE.ahk

/**
 * Device notification filter structure.
 * @remarks
 * When the driver calls the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> function, it supplies a pointer to a <b>CM_NOTIFY_FILTER</b> structure in the <i>pFilter</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_NOTIFY_FILTER extends Win32Struct {
    static sizeof => 416

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 400
        static packingSize => 8

        class _DeviceInterface extends Win32Struct {
            static sizeof => 16
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
        }

        class _DeviceHandle extends Win32Struct {
            static sizeof => 8
            static packingSize => 8

            /**
             * @type {HANDLE}
             */
            hTarget {
                get {
                    if(!this.HasProp("__hTarget"))
                        this.__hTarget := HANDLE(0, this)
                    return this.__hTarget
                }
            }
        }

        class _DeviceInstance extends Win32Struct {
            static sizeof => 400
            static packingSize => 2

            /**
             * @type {String}
             */
            InstanceId {
                get => StrGet(this.ptr + 0, 199, "UTF-16")
                set => StrPut(value, this.ptr + 0, 199, "UTF-16")
            }
        }

        /**
         * @type {_DeviceInterface}
         */
        DeviceInterface {
            get {
                if(!this.HasProp("__DeviceInterface"))
                    this.__DeviceInterface := CM_NOTIFY_FILTER._u._DeviceInterface(0, this)
                return this.__DeviceInterface
            }
        }

        /**
         * @type {_DeviceHandle}
         */
        DeviceHandle {
            get {
                if(!this.HasProp("__DeviceHandle"))
                    this.__DeviceHandle := CM_NOTIFY_FILTER._u._DeviceHandle(0, this)
                return this.__DeviceHandle
            }
        }

        /**
         * @type {_DeviceInstance}
         */
        DeviceInstance {
            get {
                if(!this.HasProp("__DeviceInstance"))
                    this.__DeviceInstance := CM_NOTIFY_FILTER._u._DeviceInstance(0, this)
                return this.__DeviceInstance
            }
        }
    }

    /**
     * The size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A combination of zero or more of the following flags:
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CM_NOTIFY_FILTER_TYPE}
     */
    FilterType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Set to 0.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A union that contains information about the device to receive notifications for.
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := CM_NOTIFY_FILTER._u(16, this)
            return this.__u
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 416
    }
}
