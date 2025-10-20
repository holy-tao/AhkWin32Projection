#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBannerNotificationHandler extends IUnknown{
    /**
     * The interface identifier for IBannerNotificationHandler
     * @type {Guid}
     */
    static IID => Guid("{8d7b2ba7-db05-46a8-823c-d2b6de08ee91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BANNER_NOTIFICATION>} notification 
     * @returns {HRESULT} 
     */
    OnBannerEvent(notification) {
        result := ComCall(3, this, "ptr", notification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
