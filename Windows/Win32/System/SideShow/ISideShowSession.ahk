#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISideShowContentManager.ahk
#Include .\ISideShowNotificationManager.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowSession
     * @type {Guid}
     */
    static IID => Guid("{e22331ee-9e7d-4922-9fc2-ab7aa41ce491}")

    /**
     * The class identifier for SideShowSession
     * @type {Guid}
     */
    static CLSID => Guid("{e20543b9-f785-4ea2-981e-c4ffa76bbc7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterContent", "RegisterNotifications"]

    /**
     * 
     * @param {Pointer<Guid>} in_applicationId 
     * @param {Pointer<Guid>} in_endpointId 
     * @returns {ISideShowContentManager} 
     */
    RegisterContent(in_applicationId, in_endpointId) {
        result := ComCall(3, this, "ptr", in_applicationId, "ptr", in_endpointId, "ptr*", &out_ppIContent := 0, "HRESULT")
        return ISideShowContentManager(out_ppIContent)
    }

    /**
     * 
     * @param {Pointer<Guid>} in_applicationId 
     * @returns {ISideShowNotificationManager} 
     */
    RegisterNotifications(in_applicationId) {
        result := ComCall(4, this, "ptr", in_applicationId, "ptr*", &out_ppINotification := 0, "HRESULT")
        return ISideShowNotificationManager(out_ppINotification)
    }
}
