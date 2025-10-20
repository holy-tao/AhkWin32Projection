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
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(7, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IUnknown>} ppUnkDispatcher 
     * @returns {HRESULT} 
     */
    Item(lIndex, ppUnkDispatcher) {
        result := ComCall(8, this, "int", lIndex, "ptr", ppUnkDispatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
