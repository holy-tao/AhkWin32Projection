#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12CommandQueue.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CommandQueue1 extends ID3D12CommandQueue{
    /**
     * The interface identifier for ID3D12CommandQueue1
     * @type {Guid}
     */
    static IID => Guid("{3a3c3165-0ee7-4b8e-a0af-6356b4c3bbb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    SetProcessPriority(Priority) {
        result := ComCall(19, this, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pOutValue 
     * @returns {HRESULT} 
     */
    GetProcessPriority(pOutValue) {
        result := ComCall(20, this, "int*", pOutValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    SetGlobalPriority(Priority) {
        result := ComCall(21, this, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pOutValue 
     * @returns {HRESULT} 
     */
    GetGlobalPriority(pOutValue) {
        result := ComCall(22, this, "int*", pOutValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
