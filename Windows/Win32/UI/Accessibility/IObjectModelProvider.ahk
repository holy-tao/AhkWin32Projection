#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the underlying object model implemented by a control or application.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iobjectmodelprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IObjectModelProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectModelProvider
     * @type {Guid}
     */
    static IID => Guid("{3ad86ebd-f5ef-483d-bb18-b1042a475d64}")

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
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iobjectmodelprovider-getunderlyingobjectmodel
     */
    GetUnderlyingObjectModel() {
        result := ComCall(3, this, "ptr*", &ppUnknown := 0, "HRESULT")
        return IUnknown(ppUnknown)
    }
}
