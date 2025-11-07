#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11LinkingNode.ahk
#Include ..\Direct3D\ID3DBlob.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A function-linking-graph interface is used for constructing shaders that consist of a sequence of precompiled function calls that pass values to each other.
 * @remarks
 * 
 * To get a function-linking-graph interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dcreatefunctionlinkinggraph">D3DCreateFunctionLinkingGraph</a>. 
 * 
 * You can use the function-linking-graph (FLG) interface methods to construct shaders that consist of a sequence of precompiled function calls that pass values to each other. You don't need to write HLSL and then call the HLSL compiler. Instead, the shader structure is specified programmatically via a C++ API. FLG nodes represent input and output signatures and invocations of precompiled library functions. The order of registering the function-call nodes defines the sequence of invocations. You must specify the input signature node first and the output signature node last. FLG edges define how values are passed from one node to another. The data types of passed values must be the same; there is no implicit type conversion. Shape and swizzling rules follow the HLSL behavior. Values can only be passed forward in this sequence.
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11FunctionLinkingGraph</b> requires the D3dcompiler_47.dll or a later version of the DLL. </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11functionlinkinggraph
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11FunctionLinkingGraph extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11FunctionLinkingGraph
     * @type {Guid}
     */
    static IID => Guid("{54133220-1ce8-43d3-8236-9855c5ceecff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateModuleInstance", "SetInputSignature", "SetOutputSignature", "CallFunction", "PassValue", "PassValueWithSwizzle", "GetLastError", "GenerateHlsl"]

    /**
     * 
     * @param {Pointer<ID3D11ModuleInstance>} ppModuleInstance 
     * @param {Pointer<ID3DBlob>} ppErrorBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-createmoduleinstance
     */
    CreateModuleInstance(ppModuleInstance, ppErrorBuffer) {
        result := ComCall(3, this, "ptr*", ppModuleInstance, "ptr*", ppErrorBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_PARAMETER_DESC>} pInputParameters 
     * @param {Integer} cInputParameters 
     * @returns {ID3D11LinkingNode} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setinputsignature
     */
    SetInputSignature(pInputParameters, cInputParameters) {
        result := ComCall(4, this, "ptr", pInputParameters, "uint", cInputParameters, "ptr*", &ppInputNode := 0, "HRESULT")
        return ID3D11LinkingNode(ppInputNode)
    }

    /**
     * 
     * @param {Pointer<D3D11_PARAMETER_DESC>} pOutputParameters 
     * @param {Integer} cOutputParameters 
     * @returns {ID3D11LinkingNode} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setoutputsignature
     */
    SetOutputSignature(pOutputParameters, cOutputParameters) {
        result := ComCall(5, this, "ptr", pOutputParameters, "uint", cOutputParameters, "ptr*", &ppOutputNode := 0, "HRESULT")
        return ID3D11LinkingNode(ppOutputNode)
    }

    /**
     * 
     * @param {PSTR} pModuleInstanceNamespace 
     * @param {ID3D11Module} pModuleWithFunctionPrototype 
     * @param {PSTR} pFunctionName 
     * @returns {ID3D11LinkingNode} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-callfunction
     */
    CallFunction(pModuleInstanceNamespace, pModuleWithFunctionPrototype, pFunctionName) {
        pModuleInstanceNamespace := pModuleInstanceNamespace is String ? StrPtr(pModuleInstanceNamespace) : pModuleInstanceNamespace
        pFunctionName := pFunctionName is String ? StrPtr(pFunctionName) : pFunctionName

        result := ComCall(6, this, "ptr", pModuleInstanceNamespace, "ptr", pModuleWithFunctionPrototype, "ptr", pFunctionName, "ptr*", &ppCallNode := 0, "HRESULT")
        return ID3D11LinkingNode(ppCallNode)
    }

    /**
     * 
     * @param {ID3D11LinkingNode} pSrcNode 
     * @param {Integer} SrcParameterIndex 
     * @param {ID3D11LinkingNode} pDstNode 
     * @param {Integer} DstParameterIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-passvalue
     */
    PassValue(pSrcNode, SrcParameterIndex, pDstNode, DstParameterIndex) {
        result := ComCall(7, this, "ptr", pSrcNode, "int", SrcParameterIndex, "ptr", pDstNode, "int", DstParameterIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11LinkingNode} pSrcNode 
     * @param {Integer} SrcParameterIndex 
     * @param {PSTR} pSrcSwizzle 
     * @param {ID3D11LinkingNode} pDstNode 
     * @param {Integer} DstParameterIndex 
     * @param {PSTR} pDstSwizzle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-passvaluewithswizzle
     */
    PassValueWithSwizzle(pSrcNode, SrcParameterIndex, pSrcSwizzle, pDstNode, DstParameterIndex, pDstSwizzle) {
        pSrcSwizzle := pSrcSwizzle is String ? StrPtr(pSrcSwizzle) : pSrcSwizzle
        pDstSwizzle := pDstSwizzle is String ? StrPtr(pDstSwizzle) : pDstSwizzle

        result := ComCall(8, this, "ptr", pSrcNode, "int", SrcParameterIndex, "ptr", pSrcSwizzle, "ptr", pDstNode, "int", DstParameterIndex, "ptr", pDstSwizzle, "HRESULT")
        return result
    }

    /**
     * Retrieves the calling thread's last-error code value.
     * @returns {ID3DBlob} 
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError() {
        result := ComCall(9, this, "ptr*", &ppErrorBuffer := 0, "HRESULT")
        return ID3DBlob(ppErrorBuffer)
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @returns {ID3DBlob} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-generatehlsl
     */
    GenerateHlsl(uFlags) {
        result := ComCall(10, this, "uint", uFlags, "ptr*", &ppBuffer := 0, "HRESULT")
        return ID3DBlob(ppBuffer)
    }
}
