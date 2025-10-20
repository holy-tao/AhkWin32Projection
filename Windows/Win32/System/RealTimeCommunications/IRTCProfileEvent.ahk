#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCProfileEvent extends IDispatch{
    /**
     * The interface identifier for IRTCProfileEvent
     * @type {Guid}
     */
    static IID => Guid("{d6d5ab3b-770e-43e8-800a-79b062395fca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IRTCProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(7, this, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} plCookie 
     * @returns {HRESULT} 
     */
    get_Cookie(plCookie) {
        result := ComCall(8, this, "ptr*", plCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        result := ComCall(9, this, "int*", plStatusCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
