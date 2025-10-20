#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerThreadEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerThreadEnum
     * @type {Guid}
     */
    static IID => Guid("{571194f7-25ed-419f-aa8b-7016b3159701}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Skip", "Reset", "Clone", "GetCount", "Next"]

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(3, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICorProfilerThreadEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @returns {HRESULT} 
     */
    GetCount(pcelt) {
        result := ComCall(6, this, "uint*", pcelt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer>} ids 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ids, pceltFetched) {
        result := ComCall(7, this, "uint", celt, "ptr*", ids, "uint*", pceltFetched, "HRESULT")
        return result
    }
}
