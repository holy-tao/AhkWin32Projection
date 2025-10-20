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
     * 
     * @param {Pointer<IDataObject>} pDataObject 
     * @param {Pointer<IViewExtensionCallback>} pViewExtensionCallback 
     * @returns {HRESULT} 
     */
    GetViews(pDataObject, pViewExtensionCallback) {
        result := ComCall(3, this, "ptr", pDataObject, "ptr", pViewExtensionCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
