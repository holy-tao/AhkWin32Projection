#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a Microsoft UI Automation element to describe itself as an element that can receive a drop of a dragged element as part of a UI Automation drag-and-drop operation.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-idroptargetprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IDropTargetProvider extends IUnknown{
    /**
     * The interface identifier for IDropTargetProvider
     * @type {Guid}
     */
    static IID => Guid("{bae82bfd-358a-481c-85a0-d8b4d90a5d61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     */
    get_DropTargetEffect(pRetVal) {
        result := ComCall(3, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pRetVal 
     * @returns {HRESULT} 
     */
    get_DropTargetEffects(pRetVal) {
        result := ComCall(4, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
