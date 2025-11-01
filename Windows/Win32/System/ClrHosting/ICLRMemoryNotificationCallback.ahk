#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRMemoryNotificationCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRMemoryNotificationCallback
     * @type {Guid}
     */
    static IID => Guid("{47eb8e57-0846-4546-af76-6f42fcfc2649}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMemoryNotification"]

    /**
     * 
     * @param {Integer} eMemoryAvailable 
     * @returns {HRESULT} 
     */
    OnMemoryNotification(eMemoryAvailable) {
        result := ComCall(3, this, "int", eMemoryAvailable, "HRESULT")
        return result
    }
}
