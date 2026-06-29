#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CM_NOTIFY_FILTER_TYPE.ahk" { CM_NOTIFY_FILTER_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Device notification filter structure.
 * @remarks
 * When the driver calls the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> function, it supplies a pointer to a <b>CM_NOTIFY_FILTER</b> structure in the <i>pFilter</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_NOTIFY_FILTER {
    #StructPack 8


    struct _u {

        struct _DeviceInterface {
            ClassGuid : Guid

        }

        struct _DeviceHandle {
            hTarget : HANDLE

        }

        struct _DeviceInstance {
            InstanceId : WCHAR[200]

        }

        DeviceInterface : CM_NOTIFY_FILTER._u._DeviceInterface

        static __New() {
            DefineProp(this.Prototype, 'DeviceHandle', { type: CM_NOTIFY_FILTER._u._DeviceHandle, offset: 0 })
            DefineProp(this.Prototype, 'DeviceInstance', { type: CM_NOTIFY_FILTER._u._DeviceInstance, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The size of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A combination of zero or more of the following flags:
     */
    Flags : UInt32

    FilterType : CM_NOTIFY_FILTER_TYPE

    /**
     * Set to 0.
     */
    Reserved : UInt32

    /**
     * A union that contains information about the device to receive notifications for.
     */
    u : CM_NOTIFY_FILTER._u

}
