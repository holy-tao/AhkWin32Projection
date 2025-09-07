#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_EVENT_WATCHLIST_CHANGED_DATA.ahk
#Include .\PEER_EVENT_PRESENCE_CHANGED_DATA.ahk
#Include .\PEER_EVENT_APPLICATION_CHANGED_DATA.ahk
#Include .\PEER_EVENT_OBJECT_CHANGED_DATA.ahk
#Include .\PEER_EVENT_ENDPOINT_CHANGED_DATA.ahk
#Include .\PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA.ahk
#Include .\PEER_EVENT_REQUEST_STATUS_CHANGED_DATA.ahk

/**
 * The PEER_COLLAB_EVENT_DATA structure (p2p.h) contains variant data for each possible peer collaboration network event raised on a peer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_collab_event_data~r1
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_COLLAB_EVENT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_collab_event_type">PEER_COLLAB_EVENT_TYPE</a> enumeration value that contains the type of the event whose corresponding data structure appears in the subsequent union arm.
     * @deprecated
     * @type {Integer}
     */
    eventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_WATCHLIST_CHANGED_DATA}
     */
    watchListChangedData{
        get {
            if(!this.HasProp("__watchListChangedData"))
                this.__watchListChangedData := PEER_EVENT_WATCHLIST_CHANGED_DATA(this.ptr + 8)
            return this.__watchListChangedData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_PRESENCE_CHANGED_DATA}
     */
    presenceChangedData{
        get {
            if(!this.HasProp("__presenceChangedData"))
                this.__presenceChangedData := PEER_EVENT_PRESENCE_CHANGED_DATA(this.ptr + 8)
            return this.__presenceChangedData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_APPLICATION_CHANGED_DATA}
     */
    applicationChangedData{
        get {
            if(!this.HasProp("__applicationChangedData"))
                this.__applicationChangedData := PEER_EVENT_APPLICATION_CHANGED_DATA(this.ptr + 8)
            return this.__applicationChangedData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_OBJECT_CHANGED_DATA}
     */
    objectChangedData{
        get {
            if(!this.HasProp("__objectChangedData"))
                this.__objectChangedData := PEER_EVENT_OBJECT_CHANGED_DATA(this.ptr + 8)
            return this.__objectChangedData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_ENDPOINT_CHANGED_DATA}
     */
    endpointChangedData{
        get {
            if(!this.HasProp("__endpointChangedData"))
                this.__endpointChangedData := PEER_EVENT_ENDPOINT_CHANGED_DATA(this.ptr + 8)
            return this.__endpointChangedData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA}
     */
    peopleNearMeChangedData{
        get {
            if(!this.HasProp("__peopleNearMeChangedData"))
                this.__peopleNearMeChangedData := PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA(this.ptr + 8)
            return this.__peopleNearMeChangedData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_REQUEST_STATUS_CHANGED_DATA}
     */
    requestStatusChangedData{
        get {
            if(!this.HasProp("__requestStatusChangedData"))
                this.__requestStatusChangedData := PEER_EVENT_REQUEST_STATUS_CHANGED_DATA(this.ptr + 8)
            return this.__requestStatusChangedData
        }
    }
}
