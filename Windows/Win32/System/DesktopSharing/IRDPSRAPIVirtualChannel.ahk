#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the virtual channel.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapivirtualchannel
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIVirtualChannel extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIVirtualChannel
     * @type {Guid}
     */
    static IID => Guid("{05e12f95-28b3-4c9a-8780-d0248574a1e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendData", "SetAccess", "get_Name", "get_Flags", "get_Priority"]

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
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-senddata
     */
    SendData(bstrData, lAttendeeId, ChannelSendFlags) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(7, this, "ptr", bstrData, "int", lAttendeeId, "uint", ChannelSendFlags, "HRESULT")
        return result
    }

    /**
     * Enables the channel for an attendee.
     * @param {Integer} lAttendeeId Type: <b>long</b>
     * 
     * The identifier of the attendee.
     * @param {Integer} AccessType Type: <b>CHANNEL_ACCESS_ENUM</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-setaccess
     */
    SetAccess(lAttendeeId, AccessType) {
        result := ComCall(8, this, "int", lAttendeeId, "int", AccessType, "HRESULT")
        return result
    }

    /**
     * The channel name.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The channel flags. This property is reserved for future use.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_flags
     */
    get_Flags() {
        result := ComCall(10, this, "int*", &plFlags := 0, "HRESULT")
        return plFlags
    }

    /**
     * The channel priority.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_priority
     */
    get_Priority() {
        result := ComCall(11, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }
}
