#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CHANNEL_PRIORITY.ahk" { CHANNEL_PRIORITY }
#Import ".\CHANNEL_ACCESS_ENUM.ahk" { CHANNEL_ACCESS_ENUM }

/**
 * Manages the virtual channel.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapivirtualchannel
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIVirtualChannel extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIVirtualChannel
     * @type {Guid}
     */
    static IID := Guid("{05e12f95-28b3-4c9a-8780-d0248574a1e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIVirtualChannel interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SendData     : IntPtr
        SetAccess    : IntPtr
        get_Name     : IntPtr
        get_Flags    : IntPtr
        get_Priority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIVirtualChannel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * @type {CHANNEL_PRIORITY} 
     */
    Priority {
        get => this.get_Priority()
    }

    /**
     * Sends data on the channel.
     * @param {BSTR} bstrData Type: <b>BSTR</b>
     * 
     * The buffer to be sent in a packet on the channel. The maximum size  of the data is CONST_MAX_MESSAGE_SIZE bytes.
     * @param {Integer} lAttendeeId Type: <b>long</b>
     * 
     * The attendee that should receive the data. To send the data to all attendees, use CONST_ATTENDEE_ID_EVERYONE.
     * @param {Integer} ChannelSendFlags Type: <b>unsigned long</b>
     * 
     * The channel flags. This parameter can be 0 or the following value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-senddata
     */
    SendData(bstrData, lAttendeeId, ChannelSendFlags) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(7, this, BSTR, bstrData, "int", lAttendeeId, "uint", ChannelSendFlags, "HRESULT")
        return result
    }

    /**
     * Enables the channel for an attendee.
     * @remarks
     * This method must be called for each attendee that will receive data over the channel.
     * @param {Integer} lAttendeeId Type: <b>long</b>
     * 
     * The identifier of the attendee.
     * @param {CHANNEL_ACCESS_ENUM} AccessType Type: <b>CHANNEL_ACCESS_ENUM</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-setaccess
     */
    SetAccess(lAttendeeId, AccessType) {
        result := ComCall(8, this, "int", lAttendeeId, CHANNEL_ACCESS_ENUM, AccessType, "HRESULT")
        return result
    }

    /**
     * The channel name.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The channel flags. This property is reserved for future use.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_flags
     */
    get_Flags() {
        result := ComCall(10, this, "int*", &plFlags := 0, "HRESULT")
        return plFlags
    }

    /**
     * The channel priority.
     * @returns {CHANNEL_PRIORITY} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_priority
     */
    get_Priority() {
        result := ComCall(11, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    Query(iid) {
        if (IRDPSRAPIVirtualChannel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendData := CallbackCreate(GetMethod(implObj, "SendData"), flags, 4)
        this.vtbl.SetAccess := CallbackCreate(GetMethod(implObj, "SetAccess"), flags, 3)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendData)
        CallbackFree(this.vtbl.SetAccess)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.get_Priority)
    }
}
