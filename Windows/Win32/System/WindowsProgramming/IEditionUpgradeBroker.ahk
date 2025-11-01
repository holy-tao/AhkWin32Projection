#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IEditionUpgradeBroker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEditionUpgradeBroker
     * @type {Guid}
     */
    static IID => Guid("{ff19cbcf-9455-4937-b872-6b7929a460af}")

    /**
     * The class identifier for EditionUpgradeBroker
     * @type {Guid}
     */
    static CLSID => Guid("{c4270827-4f39-45df-9288-12ff6b85a921}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeParentWindow", "UpdateOperatingSystem", "ShowProductKeyUI", "CanUpgrade"]

    /**
     * 
     * @param {OLE_HANDLE} parentHandle 
     * @returns {HRESULT} 
     */
    InitializeParentWindow(parentHandle) {
        parentHandle := parentHandle is Win32Handle ? NumGet(parentHandle, "ptr") : parentHandle

        result := ComCall(3, this, "ptr", parentHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} parameter 
     * @returns {HRESULT} 
     */
    UpdateOperatingSystem(parameter) {
        parameter := parameter is String ? BSTR.Alloc(parameter).Value : parameter

        result := ComCall(4, this, "ptr", parameter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowProductKeyUI() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CanUpgrade() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
