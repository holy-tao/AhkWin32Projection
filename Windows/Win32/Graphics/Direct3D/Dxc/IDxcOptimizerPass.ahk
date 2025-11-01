#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcOptimizerPass extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcOptimizerPass
     * @type {Guid}
     */
    static IID => Guid("{ae2cd79f-cc22-453f-9b6b-b124e7a5204c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOptionName", "GetDescription", "GetOptionArgCount", "GetOptionArgName", "GetOptionArgDescription"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetOptionName(ppResult) {
        result := ComCall(3, this, "ptr", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetDescription(ppResult) {
        result := ComCall(4, this, "ptr", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetOptionArgCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetOptionArgName(argIndex, ppResult) {
        result := ComCall(6, this, "uint", argIndex, "ptr", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetOptionArgDescription(argIndex, ppResult) {
        result := ComCall(7, this, "uint", argIndex, "ptr", ppResult, "HRESULT")
        return result
    }
}
