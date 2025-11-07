#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsgrp-item
     */
    Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppUnkDispatcher := 0, "HRESULT")
        return IUnknown(ppUnkDispatcher)
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
