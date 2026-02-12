#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications.Preview
 * @version WindowsRuntime 1.4
 */
class IToastOcclusionManagerPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastOcclusionManagerPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{507e5c83-50f9-5412-8953-b65c18cfab12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetToastWindowMargin"]

    /**
     * 
     * @param {WindowId} appWindowId 
     * @param {Float} margin 
     * @returns {HRESULT} 
     */
    SetToastWindowMargin(appWindowId, margin) {
        appWindowId := appWindowId is Win32Handle ? NumGet(appWindowId, "ptr") : appWindowId

        result := ComCall(6, this, "ptr", appWindowId, "double", margin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
