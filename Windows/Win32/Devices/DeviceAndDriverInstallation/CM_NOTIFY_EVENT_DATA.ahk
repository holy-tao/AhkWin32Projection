#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CM_NOTIFY_FILTER_TYPE.ahk" { CM_NOTIFY_FILTER_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * This is a device notification event data structure.
 * @remarks
 * The notification callback supplied to <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> receives a pointer to a structure of type <b>CM_NOTIFY_EVENT_DATA</b> in the callback's <i>EventData</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cm_notify_event_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_NOTIFY_EVENT_DATA {
    #StructPack 4


    struct _u {

        struct _DeviceInterface {
            ClassGuid : Guid

            SymbolicLink : WCHAR[1]

        }

        struct _DeviceHandle {
            EventGuid : Guid

            NameOffset : Int32

            DataSize : UInt32

            Data : Int8[1]

        }

        struct _DeviceInstance {
            InstanceId : WCHAR[1]

        }

        DeviceInterface : CM_NOTIFY_EVENT_DATA._u._DeviceInterface

        static __New() {
            DefineProp(this.Prototype, 'DeviceHandle', { type: CM_NOTIFY_EVENT_DATA._u._DeviceHandle, offset: 0 })
            DefineProp(this.Prototype, 'DeviceInstance', { type: CM_NOTIFY_EVENT_DATA._u._DeviceInstance, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The <b>CM_NOTIFY_FILTER_TYPE</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure that was used in the registration that generated this notification event data.
     */
    FilterType : CM_NOTIFY_FILTER_TYPE

    /**
     * Reserved.  Must be 0.
     */
    Reserved : UInt32

    /**
     * A union that contains information about the notification event data.    To determine which member of the union to examine, check the <b>FilterType</b> of the event data.
     */
    u : CM_NOTIFY_EVENT_DATA._u

}
