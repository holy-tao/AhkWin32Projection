#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcOptimizerPass extends IUnknown{
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
     * 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetOptionName(ppResult) {
        result := ComCall(3, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetDescription(ppResult) {
        result := ComCall(4, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetOptionArgCount(pCount) {
        result := ComCall(5, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetOptionArgName(argIndex, ppResult) {
        result := ComCall(6, this, "uint", argIndex, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @param {Pointer<PWSTR>} ppResult 
     * @returns {HRESULT} 
     */
    GetOptionArgDescription(argIndex, ppResult) {
        result := ComCall(7, this, "uint", argIndex, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
