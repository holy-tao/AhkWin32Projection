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
     * Initializes a shader module from the function-linking-graph object.
     * @param {Pointer<ID3D11ModuleInstance>} ppModuleInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a> interface for the shader module to initialize.
     * @param {Pointer<ID3DBlob>} ppErrorBuffer Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * An optional pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access compiler error messages, or <b>NULL</b> if there are no errors.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-createmoduleinstance
     */
    CreateModuleInstance(ppModuleInstance, ppErrorBuffer) {
        result := ComCall(3, this, "ptr*", ppModuleInstance, "ptr*", ppErrorBuffer, "HRESULT")
        return result
    }

    /**
     * Sets the input signature of the function-linking-graph.
     * @param {Pointer<D3D11_PARAMETER_DESC>} pInputParameters Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc">D3D11_PARAMETER_DESC</a>*</b>
     * 
     * An array of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc">D3D11_PARAMETER_DESC</a> structures for the parameters of the input signature.
     * @param {Integer} cInputParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of input parameters in the <i>pInputParameters</i> array.
     * @returns {ID3D11LinkingNode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a> interface that represents the input signature of the function-linking-graph.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setinputsignature
     */
    SetInputSignature(pInputParameters, cInputParameters) {
        result := ComCall(4, this, "ptr", pInputParameters, "uint", cInputParameters, "ptr*", &ppInputNode := 0, "HRESULT")
        return ID3D11LinkingNode(ppInputNode)
    }

    /**
     * Sets the output signature of the function-linking-graph.
     * @param {Pointer<D3D11_PARAMETER_DESC>} pOutputParameters Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc">D3D11_PARAMETER_DESC</a>*</b>
     * 
     * An array of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc">D3D11_PARAMETER_DESC</a> structures for the parameters of the output signature.
     * @param {Integer} cOutputParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of output parameters in the <i>pOutputParameters</i> array.
     * @returns {ID3D11LinkingNode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a> interface that represents the output signature of the function-linking-graph.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setoutputsignature
     */
    SetOutputSignature(pOutputParameters, cOutputParameters) {
        result := ComCall(5, this, "ptr", pOutputParameters, "uint", cOutputParameters, "ptr*", &ppOutputNode := 0, "HRESULT")
        return ID3D11LinkingNode(ppOutputNode)
    }

    /**
     * Creates a call-function linking node to use in the function-linking-graph.
     * @param {PSTR} pModuleInstanceNamespace Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The optional namespace for the function, or <b>NULL</b> if no namespace is needed.
     * @param {ID3D11Module} pModuleWithFunctionPrototype Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11module">ID3D11Module</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a> interface for the library module that contains the function prototype.
     * @param {PSTR} pFunctionName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the function.
     * @returns {ID3D11LinkingNode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a> interface that represents the function in the function-linking-graph.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-callfunction
     */
    CallFunction(pModuleInstanceNamespace, pModuleWithFunctionPrototype, pFunctionName) {
        pModuleInstanceNamespace := pModuleInstanceNamespace is String ? StrPtr(pModuleInstanceNamespace) : pModuleInstanceNamespace
        pFunctionName := pFunctionName is String ? StrPtr(pFunctionName) : pFunctionName

        result := ComCall(6, this, "ptr", pModuleInstanceNamespace, "ptr", pModuleWithFunctionPrototype, "ptr", pFunctionName, "ptr*", &ppCallNode := 0, "HRESULT")
        return ID3D11LinkingNode(ppCallNode)
    }

    /**
     * Passes a value from a source linking node to a destination linking node.
     * @param {ID3D11LinkingNode} pSrcNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a> interface for the source linking node.
     * @param {Integer} SrcParameterIndex Type: <b>INT</b>
     * 
     * The zero-based index of the source parameter.
     * @param {ID3D11LinkingNode} pDstNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a> interface for the destination linking node.
     * @param {Integer} DstParameterIndex Type: <b>INT</b>
     * 
     * The zero-based index of the destination parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-passvalue
     */
    PassValue(pSrcNode, SrcParameterIndex, pDstNode, DstParameterIndex) {
        result := ComCall(7, this, "ptr", pSrcNode, "int", SrcParameterIndex, "ptr", pDstNode, "int", DstParameterIndex, "HRESULT")
        return result
    }

    /**
     * Passes a value with swizzle from a source linking node to a destination linking node.
     * @param {ID3D11LinkingNode} pSrcNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a> interface for the source linking node.
     * @param {Integer} SrcParameterIndex Type: <b>INT</b>
     * 
     * The zero-based index of the source parameter.
     * @param {PSTR} pSrcSwizzle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the source swizzle.
     * @param {ID3D11LinkingNode} pDstNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linkingnode">ID3D11LinkingNode</a> interface for the destination linking node.
     * @param {Integer} DstParameterIndex Type: <b>INT</b>
     * 
     * The zero-based index of the destination parameter.
     * @param {PSTR} pDstSwizzle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the destination swizzle.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-passvaluewithswizzle
     */
    PassValueWithSwizzle(pSrcNode, SrcParameterIndex, pSrcSwizzle, pDstNode, DstParameterIndex, pDstSwizzle) {
        pSrcSwizzle := pSrcSwizzle is String ? StrPtr(pSrcSwizzle) : pSrcSwizzle
        pDstSwizzle := pDstSwizzle is String ? StrPtr(pDstSwizzle) : pDstSwizzle

        result := ComCall(8, this, "ptr", pSrcNode, "int", SrcParameterIndex, "ptr", pSrcSwizzle, "ptr", pDstNode, "int", DstParameterIndex, "ptr", pDstSwizzle, "HRESULT")
        return result
    }

    /**
     * Gets the error from the last function call of the function-linking-graph.
     * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * An pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the error.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-getlasterror
     */
    GetLastError() {
        result := ComCall(9, this, "ptr*", &ppErrorBuffer := 0, "HRESULT")
        return ID3DBlob(ppErrorBuffer)
    }

    /**
     * Generates Microsoft High Level Shader Language (HLSL) shader code that represents the function-linking-graph.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved
     * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * An pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the HLSL shader source code that represents the function-linking-graph. You can compile this HLSL code, but first you must  add code or include statements for the functions called in the function-linking-graph.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-generatehlsl
     */
    GenerateHlsl(uFlags) {
        result := ComCall(10, this, "uint", uFlags, "ptr*", &ppBuffer := 0, "HRESULT")
        return ID3DBlob(ppBuffer)
    }
}
