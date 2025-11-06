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
     * @returns {PWSTR} 
     */
    GetOptionName() {
        result := ComCall(3, this, "ptr*", &ppResult := 0, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetDescription() {
        result := ComCall(4, this, "ptr*", &ppResult := 0, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOptionArgCount() {
        result := ComCall(5, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @returns {PWSTR} 
     */
    GetOptionArgName(argIndex) {
        result := ComCall(6, this, "uint", argIndex, "ptr*", &ppResult := 0, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @returns {PWSTR} 
     */
    GetOptionArgDescription(argIndex) {
        result := ComCall(7, this, "uint", argIndex, "ptr*", &ppResult := 0, "HRESULT")
        return ppResult
    }
}
