#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRT_DATA.ahk

/**
 * DRT_EVENT_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_event_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_EVENT_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_event_type">DRT_EVENT_TYPE</a> enumeration that specifies the event type.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The HRESULT of the operation for which the event was signaled that indicates if a result is the last result within a search.
     * @type {Integer}
     */
    hr {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Pointer to the context data passed to the API that generated the event.  For example, if data is passed into the <i>pvContext</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a>, that data is returned through this field.
     * @type {Pointer<Void>}
     */
    pvContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    change {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {DRT_DATA}
     */
    localKey{
        get {
            if(!this.HasProp("__localKey"))
                this.__localKey := DRT_DATA(this.ptr + 24)
            return this.__localKey
        }
    }

    /**
     * @type {DRT_DATA}
     */
    remoteKey{
        get {
            if(!this.HasProp("__remoteKey"))
                this.__remoteKey := DRT_DATA(this.ptr + 40)
            return this.__remoteKey
        }
    }

    /**
     * @type {Integer}
     */
    state {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    status {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cntAddress {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<SOCKADDR_STORAGE>}
     */
    pAddresses {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
