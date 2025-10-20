#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorTensor extends IUnknown{
    /**
     * The interface identifier for IMLOperatorTensor
     * @type {Guid}
     */
    static IID => Guid("{7fe41f41-f430-440e-aece-54416dc8b9db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetDimensionCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dimensionCount 
     * @param {Pointer<UInt32>} dimensions 
     * @returns {HRESULT} 
     */
    GetShape(dimensionCount, dimensions) {
        result := ComCall(4, this, "uint", dimensionCount, "uint*", dimensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTensorDataType() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsCpuData() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsDataInterface() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetData() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} dataInterface 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDataInterface(dataInterface) {
        ComCall(9, this, "ptr", dataInterface)
        return result
    }
}
