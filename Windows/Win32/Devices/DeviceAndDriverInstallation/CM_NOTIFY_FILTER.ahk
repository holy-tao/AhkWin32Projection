#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Device notification filter structure.
 * @remarks
 * When the driver calls the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> function, it supplies a pointer to a <b>CM_NOTIFY_FILTER</b> structure in the <i>pFilter</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_NOTIFY_FILTER extends Win32Struct
{
    static sizeof => 416

    static packingSize => 8

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
     * 
     * @type {Integer}
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

    class _DeviceInterface extends Win32Struct {
        static sizeof => 400
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        ClassGuid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    class _DeviceInstance extends Win32Struct {
        static sizeof => 400
        static packingSize => 8

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
    DeviceInterface{
        get {
            if(!this.HasProp("__DeviceInterface"))
                this.__DeviceInterface := %this.__Class%._DeviceInterface(this.ptr + 16)
            return this.__DeviceInterface
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceHandle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {_DeviceInstance}
     */
    DeviceInstance{
        get {
            if(!this.HasProp("__DeviceInstance"))
                this.__DeviceInstance := %this.__Class%._DeviceInstance(this.ptr + 16)
            return this.__DeviceInstance
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 416
    }
}
