#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the underlying object model implemented by a control or application.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationobjectmodelpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationObjectModelPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationObjectModelPattern
     * @type {Guid}
     */
    static IID => Guid("{71c284b3-c14d-4d14-981e-19751b0d756d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUnderlyingObjectModel"]

    /**
     * 
     * @param {Pointer<IUnknown>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationobjectmodelpattern-getunderlyingobjectmodel
     */
    GetUnderlyingObjectModel(retVal) {
        result := ComCall(3, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
