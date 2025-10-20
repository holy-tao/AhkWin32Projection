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
     * 
     * @param {Pointer<MMC_EXT_VIEW_DATA>} pExtViewData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iviewextensioncallback-addview
     */
    AddView(pExtViewData) {
        result := ComCall(3, this, "ptr", pExtViewData, "HRESULT")
        return result
    }
}
