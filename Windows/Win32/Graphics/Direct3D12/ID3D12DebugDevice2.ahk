#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DebugDevice.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugDevice2 extends ID3D12DebugDevice{
    /**
     * The interface identifier for ID3D12DebugDevice2
     * @type {Guid}
     */
    static IID => Guid("{60eccbc1-378d-4df1-894c-f8ac5ce4d7dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(6, this, "int", Type, "ptr", pData, "uint", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    GetDebugParameter(Type, pData, DataSize) {
        result := ComCall(7, this, "int", Type, "ptr", pData, "uint", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
