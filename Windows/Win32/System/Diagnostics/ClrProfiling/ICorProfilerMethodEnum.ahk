#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerMethodEnum.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerMethodEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerMethodEnum
     * @type {Guid}
     */
    static IID => Guid("{fccee788-0088-454b-a811-c99f298d1942}")

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
     * @returns {ICorProfilerMethodEnum} 
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerMethodEnum(ppEnum)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(6, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<COR_PRF_METHOD>} elements 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, elements, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", celt, "ptr", elements, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }
}
