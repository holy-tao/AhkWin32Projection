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
     * Retrieves the unique identifier for a shader that can be used in a shader record.
     * @param {PWSTR} pExportName Entrypoint in the state object for which to retrieve an identifier.
     * @returns {Pointer<Void>} A pointer to the shader identifier.
     * 
     * The data referenced by this pointer is valid as long as the state object it came from is valid.  The size of the data returned is <a href="/windows/desktop/direct3d12/constants">D3D12_SHADER_IDENTIFIER_SIZE_IN_BYTES</a>.  Applications should copy and cache this data to avoid the cost of searching for it in the state object if it will need to be retrieved many times.  The identifier is used in shader records within shader tables in GPU memory, which the app must populate. 
     * 
     * The data itself globally identifies the shader, so even if the shader appears in a different state object with same associations, like any root signatures, it will have the same identifier.
     * 
     * If the shader isn’t fully resolved in the state object, the return value is <b>nullptr</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12stateobjectproperties-getshaderidentifier
     */
    GetShaderIdentifier(pExportName) {
        pExportName := pExportName is String ? StrPtr(pExportName) : pExportName

        result := ComCall(3, this, "ptr", pExportName, "ptr")
        return result
    }

    /**
     * Gets the amount of stack memory required to invoke a raytracing shader in HLSL.
     * @param {PWSTR} pExportName The shader entrypoint in the state object for which to retrieve stack size.  For hit groups, an individual shader within the hit group must be specified using the syntax:
     * 
     * hitGroupName::shaderType
     * 
     * Where <i>hitGroupName</i> is the entrypoint name for the hit group and <i>shaderType</i> is one of: 
     * 
     * <ul>
     * <li>intersection</li>
     * <li>anyhit</li>
     * <li>closesthit</li>
     * </ul>
     * These values are all case-sensitive.
     * 
     * An example value is: "myTreeLeafHitGroup::anyhit".
     * @returns {Integer} Amount of stack memory, in bytes, required to invoke the shader.  If the shader isn’t fully resolved in the state object, or the shader is unknown or of a type for which a stack size isn’t relevant, such as a hit group, the return value is 0xffffffff.  The 32-bit 0xffffffff value is used  for the UINT64 return value to ensure that bad return values don’t get lost when summed up with other values as part of calculating an overall pipeline stack size.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12stateobjectproperties-getshaderstacksize
     */
    GetShaderStackSize(pExportName) {
        pExportName := pExportName is String ? StrPtr(pExportName) : pExportName

        result := ComCall(4, this, "ptr", pExportName, "uint")
        return result
    }

    /**
     * Gets the current pipeline stack size.
     * @returns {Integer} The current pipeline stack size in bytes. When called on non-executable state objects, such as collections, the return value is 0.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12stateobjectproperties-getpipelinestacksize
     */
    GetPipelineStackSize() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Set the current pipeline stack size.
     * @remarks
     * 
     * This method and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12stateobjectproperties-getpipelinestacksize">GetPipelineStackSize</a> are not re-entrant.  This means if calling either or both from separate threads, the app must synchronize on its own.
     * 
     * The runtime drops calls to state objects other than raytracing pipelines, such as collections.
     * 
     * 
     * @param {Integer} PipelineStackSizeInBytes Stack size in bytes to use during pipeline execution for each shader thread. There can be many thousands of threads in flight at once on the GPU.
     * 
     * If the value is greater than 0xffffffff (the maximum value of a 32-bit UINT) the runtime will drop the call, and the debug layer will print an error, as this is likely the result of summing up invalid stack sizes returned from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12stateobjectproperties-getshaderstacksize">GetShaderStackSize</a> called with invalid parameters, which return 0xffffffff.  In this case, the previously set stack size, or the default, remains.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12stateobjectproperties-setpipelinestacksize
     */
    SetPipelineStackSize(PipelineStackSizeInBytes) {
        ComCall(6, this, "uint", PipelineStackSizeInBytes)
    }
}
