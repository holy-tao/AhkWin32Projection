#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcOptimizer extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetAvailablePassCount(pCount) {
        result := ComCall(3, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDxcOptimizerPass>} ppResult 
     * @returns {HRESULT} 
     */
    GetAvailablePass(index, ppResult) {
        result := ComCall(4, this, "uint", index, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Pointer<PWSTR>} ppOptions 
     * @param {Integer} optionCount 
     * @param {Pointer<IDxcBlob>} pOutputModule 
     * @param {Pointer<IDxcBlobEncoding>} ppOutputText 
     * @returns {HRESULT} 
     */
    RunOptimizer(pBlob, ppOptions, optionCount, pOutputModule, ppOutputText) {
        result := ComCall(5, this, "ptr", pBlob, "ptr", ppOptions, "uint", optionCount, "ptr", pOutputModule, "ptr", ppOutputText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
