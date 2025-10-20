#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IExtendView interface provides information about the extended view.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iextendview
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IExtendView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtendView
     * @type {Guid}
     */
    static IID => Guid("{89995cee-d2ed-4c0e-ae5e-df7e76f3fa53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetViews"]

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @param {IViewExtensionCallback} pViewExtensionCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendview-getviews
     */
    GetViews(pDataObject, pViewExtensionCallback) {
        result := ComCall(3, this, "ptr", pDataObject, "ptr", pViewExtensionCallback, "HRESULT")
        return result
    }
}
