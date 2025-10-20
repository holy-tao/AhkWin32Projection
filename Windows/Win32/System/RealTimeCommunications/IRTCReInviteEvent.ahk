#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCReInviteEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCReInviteEvent
     * @type {Guid}
     */
    static IID => Guid("{11558d84-204c-43e7-99b0-2034e9417f7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "Accept", "Reject", "get_State", "GetRemoteSessionDescription"]

    /**
     * 
     * @param {Pointer<IRTCSession2>} ppSession2 
     * @returns {HRESULT} 
     */
    get_Session(ppSession2) {
        result := ComCall(7, this, "ptr*", ppSession2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @returns {HRESULT} 
     */
    Accept(bstrContentType, bstrSessionDescription) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(8, this, "ptr", bstrContentType, "ptr", bstrSessionDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        result := ComCall(10, this, "int*", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContentType 
     * @param {Pointer<BSTR>} pbstrSessionDescription 
     * @returns {HRESULT} 
     */
    GetRemoteSessionDescription(pbstrContentType, pbstrSessionDescription) {
        result := ComCall(11, this, "ptr", pbstrContentType, "ptr", pbstrSessionDescription, "HRESULT")
        return result
    }
}
