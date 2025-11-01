#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawVideoPortNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawVideoPortNotify
     * @type {Guid}
     */
    static IID => Guid("{a655fb94-0589-4e57-b333-567a89468c88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireNotification", "ReleaseNotification"]

    /**
     * 
     * @param {Pointer<HANDLE>} param0 
     * @param {Pointer<DDVIDEOPORTNOTIFY>} param1 
     * @returns {HRESULT} 
     */
    AcquireNotification(param0, param1) {
        result := ComCall(3, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @returns {HRESULT} 
     */
    ReleaseNotification(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }
}
