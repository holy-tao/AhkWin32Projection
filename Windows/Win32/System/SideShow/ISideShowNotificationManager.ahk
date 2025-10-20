#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowNotificationManager extends IUnknown{
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
     * 
     * @param {Pointer<ISideShowNotification>} in_pINotification 
     * @returns {HRESULT} 
     */
    Show(in_pINotification) {
        result := ComCall(3, this, "ptr", in_pINotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} in_notificationId 
     * @returns {HRESULT} 
     */
    Revoke(in_notificationId) {
        result := ComCall(4, this, "uint", in_notificationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RevokeAll() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
