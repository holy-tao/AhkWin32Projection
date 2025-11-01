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
     * 
     * @param {BSTR} bstrData 
     * @param {Integer} lAttendeeId 
     * @param {Integer} ChannelSendFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-senddata
     */
    SendData(bstrData, lAttendeeId, ChannelSendFlags) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(7, this, "ptr", bstrData, "int", lAttendeeId, "uint", ChannelSendFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lAttendeeId 
     * @param {Integer} AccessType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-setaccess
     */
    SetAccess(lAttendeeId, AccessType) {
        result := ComCall(8, this, "int", lAttendeeId, "int", AccessType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_name
     */
    get_Name(pbstrName) {
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_flags
     */
    get_Flags(plFlags) {
        plFlagsMarshal := plFlags is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plFlagsMarshal, plFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapivirtualchannel-get_priority
     */
    get_Priority(pPriority) {
        pPriorityMarshal := pPriority is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pPriorityMarshal, pPriority, "HRESULT")
        return result
    }
}
