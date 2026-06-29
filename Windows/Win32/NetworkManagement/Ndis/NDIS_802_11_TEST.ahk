#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_AUTHENTICATION_REQUEST.ahk" { NDIS_802_11_AUTHENTICATION_REQUEST }
#Import ".\NDIS_802_11_STATUS_TYPE.ahk" { NDIS_802_11_STATUS_TYPE }
#Import ".\NDIS_802_11_STATUS_INDICATION.ahk" { NDIS_802_11_STATUS_INDICATION }
#Import ".\NDIS_802_11_AUTHENTICATION_EVENT.ahk" { NDIS_802_11_AUTHENTICATION_EVENT }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_TEST {
    #StructPack 4

    Length : UInt32

    Type : UInt32

    AuthenticationEvent : NDIS_802_11_AUTHENTICATION_EVENT

    static __New() {
        DefineProp(this.Prototype, 'RssiTrigger', { type: Int32, offset: 8 })
        this.DeleteProp("__New")
    }
}
