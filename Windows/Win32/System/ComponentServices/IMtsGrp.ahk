#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods for enumerating through running packages.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtsgrp
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMtsGrp extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMtsGrp
     * @type {Guid}
     */
    static IID => Guid("{4b2e958c-0393-11d1-b1ab-00aa00ba3258}")

    /**
     * The class identifier for MtsGrp
     * @type {Guid}
     */
    static CLSID => Guid("{4b2e958d-0393-11d1-b1ab-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Item", "Refresh"]

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-get_count
     */
    get_Count(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IUnknown>} ppUnkDispatcher 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-item
     */
    Item(lIndex, ppUnkDispatcher) {
        result := ComCall(8, this, "int", lIndex, "ptr*", ppUnkDispatcher, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
