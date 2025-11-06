#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotifyServerReferral extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetServerReferral", "AsyncGetServerReferral", "SetServerReferral"]

    /**
     * 
     * @returns {PWSTR} 
     */
    GetServerReferral() {
        result := ComCall(3, this, "ptr*", &param0 := 0, "HRESULT")
        return param0
    }

    /**
     * 
     * @param {IAsyncGetSrvReferralCookie} param0 
     * @returns {HRESULT} 
     */
    AsyncGetServerReferral(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pRmtServerReferral 
     * @returns {HRESULT} 
     */
    SetServerReferral(pRmtServerReferral) {
        pRmtServerReferral := pRmtServerReferral is String ? StrPtr(pRmtServerReferral) : pRmtServerReferral

        result := ComCall(5, this, "ptr", pRmtServerReferral, "HRESULT")
        return result
    }
}
