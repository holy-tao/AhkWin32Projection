#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device8.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device9 extends ID3D12Device8{
    /**
     * The interface identifier for ID3D12Device9
     * @type {Guid}
     */
    static IID => Guid("{4c80e962-f032-4f60-bc9e-ebc2cfa1d83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 73

    /**
     * 
     * @param {Pointer<D3D12_SHADER_CACHE_SESSION_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvSession 
     * @returns {HRESULT} 
     */
    CreateShaderCacheSession(pDesc, riid, ppvSession) {
        result := ComCall(73, this, "ptr", pDesc, "ptr", riid, "ptr", ppvSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Kinds 
     * @param {Integer} Control 
     * @returns {HRESULT} 
     */
    ShaderCacheControl(Kinds, Control) {
        result := ComCall(74, this, "int", Kinds, "int", Control, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_QUEUE_DESC>} pDesc 
     * @param {Pointer<Guid>} CreatorID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCommandQueue 
     * @returns {HRESULT} 
     */
    CreateCommandQueue1(pDesc, CreatorID, riid, ppCommandQueue) {
        result := ComCall(75, this, "ptr", pDesc, "ptr", CreatorID, "ptr", riid, "ptr", ppCommandQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
