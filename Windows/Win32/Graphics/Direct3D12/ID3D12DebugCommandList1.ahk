#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface enables modification of additional command list debug layer settings.
 * @remarks
 * 
  * This interface is currently in Preview mode.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandlist1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugCommandList1 extends IUnknown{
    /**
     * The interface identifier for ID3D12DebugCommandList1
     * @type {Guid}
     */
    static IID => Guid("{102ca951-311b-4b01-b11f-ecb83e061b37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Integer} Subresource 
     * @param {Integer} State 
     * @returns {BOOL} 
     */
    AssertResourceState(pResource, Subresource, State) {
        result := ComCall(3, this, "ptr", pResource, "uint", Subresource, "uint", State, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(4, this, "int", Type, "ptr", pData, "uint", DataSize, "int")
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
        result := ComCall(5, this, "int", Type, "ptr", pData, "uint", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
