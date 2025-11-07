#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_PARAMETER_DESC.ahk

/**
 * A function-parameter-reflection interface accesses function-parameter info.
 * @remarks
 * 
  * To get a function-parameter-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionreflection-getfunctionparameter">ID3D11FunctionReflection::GetFunctionParameter</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
  * 
  * <div class="alert"><b>Note</b>  <b>ID3D11FunctionParameterReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL. </div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11functionparameterreflection
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11FunctionParameterReflection extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11FunctionParameterReflection
     * @type {Guid}
     */
    static IID => Guid("{42757488-334f-47fe-982e-1a65d08cc462}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @returns {D3D11_PARAMETER_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionparameterreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D11_PARAMETER_DESC()
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }
}
