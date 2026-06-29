#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRT_EVENT_TYPE.ahk" { DRT_EVENT_TYPE }
#Import ".\DRT_LEAFSET_KEY_CHANGE_TYPE.ahk" { DRT_LEAFSET_KEY_CHANGE_TYPE }
#Import ".\DRT_DATA.ahk" { DRT_DATA }
#Import "..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import ".\DRT_REGISTRATION_STATE.ahk" { DRT_REGISTRATION_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DRT_STATUS.ahk" { DRT_STATUS }

/**
 * DRT_EVENT_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_event_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_EVENT_DATA {
    #StructPack 8


    struct _leafsetKeyChange {
        change : DRT_LEAFSET_KEY_CHANGE_TYPE

        localKey : DRT_DATA

        remoteKey : DRT_DATA

    }

    struct _registrationStateChange {
        state : DRT_REGISTRATION_STATE

        localKey : DRT_DATA

    }

    struct _statusChange {

        struct _bootstrapAddresses {
            cntAddress : UInt32

            pAddresses : SOCKADDR_STORAGE.Ptr

        }

        status : DRT_STATUS

        bootstrapAddresses : DRT_EVENT_DATA._statusChange._bootstrapAddresses

    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_event_type">DRT_EVENT_TYPE</a> enumeration that specifies the event type.
     */
    type : DRT_EVENT_TYPE

    /**
     * The HRESULT of the operation for which the event was signaled that indicates if a result is the last result within a search.
     */
    hr : HRESULT

    /**
     * Pointer to the context data passed to the API that generated the event.  For example, if data is passed into the <i>pvContext</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a>, that data is returned through this field.
     */
    pvContext : IntPtr

    leafsetKeyChange : DRT_EVENT_DATA._leafsetKeyChange

    static __New() {
        DefineProp(this.Prototype, 'registrationStateChange', { type: DRT_EVENT_DATA._registrationStateChange, offset: 16 })
        DefineProp(this.Prototype, 'statusChange', { type: DRT_EVENT_DATA._statusChange, offset: 16 })
        this.DeleteProp("__New")
    }
}
