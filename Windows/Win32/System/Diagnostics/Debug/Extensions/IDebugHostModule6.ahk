#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include .\IDebugHostModule5.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugHostModule6 extends IDebugHostModule5 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostModule6
     * @type {Guid}
     */
    static IID => Guid("{10efc47e-68d4-4f87-810f-6729a805940a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetArchitectureByRVA"]

    /**
     * @param {Integer} rva 
     * @param {Pointer<Integer>} pMachineArchitecture 
     * @param {Pointer<Integer>} pRangeRvaStart 
     * @param {Pointer<Integer>} pRangeRvaEnd 
     * @returns {HRESULT} 
     */
    GetArchitectureByRVA(rva, pMachineArchitecture, pRangeRvaStart, pRangeRvaEnd) {
        pMachineArchitectureMarshal := pMachineArchitecture is VarRef ? "uint*" : "ptr"
        pRangeRvaStartMarshal := pRangeRvaStart is VarRef ? "uint*" : "ptr"
        pRangeRvaEndMarshal := pRangeRvaEnd is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", rva, pMachineArchitectureMarshal, pMachineArchitecture, pRangeRvaStartMarshal, pRangeRvaStart, pRangeRvaEndMarshal, pRangeRvaEnd, "HRESULT")
        return result
    }
}
