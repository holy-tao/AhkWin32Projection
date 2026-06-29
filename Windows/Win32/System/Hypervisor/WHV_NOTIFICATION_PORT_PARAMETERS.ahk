#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_DOORBELL_MATCH_DATA.ahk" { WHV_DOORBELL_MATCH_DATA }
#Import ".\WHV_NOTIFICATION_PORT_TYPE.ahk" { WHV_NOTIFICATION_PORT_TYPE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_NOTIFICATION_PORT_PARAMETERS {
    #StructPack 8


    struct _Event {
        ConnectionId : UInt32

    }

    NotificationPortType : WHV_NOTIFICATION_PORT_TYPE

    Reserved : UInt32

    Doorbell : WHV_DOORBELL_MATCH_DATA

    static __New() {
        DefineProp(this.Prototype, 'Event', { type: WHV_NOTIFICATION_PORT_PARAMETERS._Event, offset: 8 })
        this.DeleteProp("__New")
    }
}
