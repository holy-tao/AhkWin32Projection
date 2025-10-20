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
     * 
     * @param {BSTR} bstrData 
     * @param {Integer} lAttendeeId 
     * @param {Integer} ChannelSendFlags 
     * @returns {HRESULT} 
     */
    SendData(bstrData, lAttendeeId, ChannelSendFlags) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(7, this, "ptr", bstrData, "int", lAttendeeId, "uint", ChannelSendFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAttendeeId 
     * @param {Integer} AccessType 
     * @returns {HRESULT} 
     */
    SetAccess(lAttendeeId, AccessType) {
        result := ComCall(8, this, "int", lAttendeeId, "int", AccessType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(9, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFlags 
     * @returns {HRESULT} 
     */
    get_Flags(plFlags) {
        result := ComCall(10, this, "int*", plFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPriority 
     * @returns {HRESULT} 
     */
    get_Priority(pPriority) {
        result := ComCall(11, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
