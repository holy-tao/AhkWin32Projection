#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the underlying object model implemented by a control or application. (IUIAutomationObjectModelPattern)
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationobjectmodelpattern
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
     * Retrieves an interface used to access the underlying object model of the provider. (IUIAutomationObjectModelPattern.GetUnderlyingObjectModel)
     * @remarks
     * Client applications can use the object model to directly access the content of the control or application.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an interface for accessing the underlying object model.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationobjectmodelpattern-getunderlyingobjectmodel
     */
    GetUnderlyingObjectModel() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(retVal)
    }
}
