#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowNotificationManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowNotificationManager
     * @type {Guid}
     */
    static IID => Guid("{63cea909-f2b9-4302-b5e1-c68e6d9ab833}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Show", "Revoke", "RevokeAll"]

    /**
     * 
     * @param {ISideShowNotification} in_pINotification 
     * @returns {HRESULT} 
     */
    Show(in_pINotification) {
        result := ComCall(3, this, "ptr", in_pINotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} in_notificationId 
     * @returns {HRESULT} 
     */
    Revoke(in_notificationId) {
        result := ComCall(4, this, "uint", in_notificationId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RevokeAll() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
