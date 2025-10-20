#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IExecAction.ahk

/**
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IExecAction2 extends IExecAction{
    /**
     * The interface identifier for IExecAction2
     * @type {Guid}
     */
    static IID => Guid("{f2a82542-bda5-4e6b-9143-e2bf4f8987b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pHideAppWindow 
     * @returns {HRESULT} 
     */
    get_HideAppWindow(pHideAppWindow) {
        result := ComCall(16, this, "ptr", pHideAppWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} hideAppWindow 
     * @returns {HRESULT} 
     */
    put_HideAppWindow(hideAppWindow) {
        result := ComCall(17, this, "short", hideAppWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
