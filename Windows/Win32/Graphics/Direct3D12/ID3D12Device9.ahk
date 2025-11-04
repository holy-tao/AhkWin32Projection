#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device8.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device9
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device9 extends ID3D12Device8{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateShaderCacheSession", "ShaderCacheControl", "CreateCommandQueue1"]

    /**
     * 
     * @param {Pointer<D3D12_SHADER_CACHE_SESSION_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device9-createshadercachesession
     */
    CreateShaderCacheSession(pDesc, riid, ppvSession) {
        ppvSessionMarshal := ppvSession is VarRef ? "ptr*" : "ptr"

        result := ComCall(73, this, "ptr", pDesc, "ptr", riid, ppvSessionMarshal, ppvSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Kinds 
     * @param {Integer} Control 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device9-shadercachecontrol
     */
    ShaderCacheControl(Kinds, Control) {
        result := ComCall(74, this, "int", Kinds, "int", Control, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_QUEUE_DESC>} pDesc 
     * @param {Pointer<Guid>} CreatorID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppCommandQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device9-createcommandqueue1
     */
    CreateCommandQueue1(pDesc, CreatorID, riid, ppCommandQueue) {
        ppCommandQueueMarshal := ppCommandQueue is VarRef ? "ptr*" : "ptr"

        result := ComCall(75, this, "ptr", pDesc, "ptr", CreatorID, "ptr", riid, ppCommandQueueMarshal, ppCommandQueue, "HRESULT")
        return result
    }
}
