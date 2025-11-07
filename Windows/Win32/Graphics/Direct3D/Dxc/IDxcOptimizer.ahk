#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcOptimizerPass.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcOptimizer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcOptimizer
     * @type {Guid}
     */
    static IID => Guid("{25740e2e-9cba-401b-9119-4fb42f39f270}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailablePassCount", "GetAvailablePass", "RunOptimizer"]

    /**
     * 
     * @returns {Integer} 
     */
    GetAvailablePassCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDxcOptimizerPass} 
     */
    GetAvailablePass(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOptimizerPass(ppResult)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Pointer<PWSTR>} ppOptions 
     * @param {Integer} optionCount 
     * @param {Pointer<IDxcBlob>} pOutputModule 
     * @param {Pointer<IDxcBlobEncoding>} ppOutputText 
     * @returns {HRESULT} 
     */
    RunOptimizer(pBlob, ppOptions, optionCount, pOutputModule, ppOutputText) {
        ppOptionsMarshal := ppOptions is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pBlob, ppOptionsMarshal, ppOptions, "uint", optionCount, "ptr*", pOutputModule, "ptr*", ppOutputText, "HRESULT")
        return result
    }
}
