#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IViewExtensionCallback interface is used to add a view to the result pane.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iviewextensioncallback
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IViewExtensionCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewExtensionCallback
     * @type {Guid}
     */
    static IID => Guid("{34dd928a-7599-41e5-9f5e-d6bc3062c2da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddView"]

    /**
     * Adds a view to the result pane.
     * @param {Pointer<MMC_EXT_VIEW_DATA>} pExtViewData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_ext_view_data">MMC_EXT_VIEW_DATA</a> structure, which contains information about the view being added to the result pane. The bReplacesDefaultView member of the 
     * <b>MMC_EXT_VIEW_DATA</b> structure determines if the standard view is removed when adding the new view.
     * @returns {HRESULT} If successful, the return value is S_OK. Other return values indicate an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iviewextensioncallback-addview
     */
    AddView(pExtViewData) {
        result := ComCall(3, this, "ptr", pExtViewData, "HRESULT")
        return result
    }
}
