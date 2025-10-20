#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for getting and setting the properties of an ID3D12StateObject.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12stateobjectproperties
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12StateObjectProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12StateObjectProperties
     * @type {Guid}
     */
    static IID => Guid("{de5fa827-9bf9-4f26-89ff-d7f56fde3860}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetShaderIdentifier", "GetShaderStackSize", "GetPipelineStackSize", "SetPipelineStackSize"]

    /**
     * 
     * @param {PWSTR} pExportName 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12stateobjectproperties-getshaderidentifier
     */
    GetShaderIdentifier(pExportName) {
        pExportName := pExportName is String ? StrPtr(pExportName) : pExportName

        result := ComCall(3, this, "ptr", pExportName, "ptr")
        return result
    }

    /**
     * 
     * @param {PWSTR} pExportName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12stateobjectproperties-getshaderstacksize
     */
    GetShaderStackSize(pExportName) {
        pExportName := pExportName is String ? StrPtr(pExportName) : pExportName

        result := ComCall(4, this, "ptr", pExportName, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12stateobjectproperties-getpipelinestacksize
     */
    GetPipelineStackSize() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} PipelineStackSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12stateobjectproperties-setpipelinestacksize
     */
    SetPipelineStackSize(PipelineStackSizeInBytes) {
        ComCall(6, this, "uint", PipelineStackSizeInBytes)
    }
}
