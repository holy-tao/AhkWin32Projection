#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_PARAMETER_DESC.ahk

/**
 * A function-parameter-reflection interface accesses function-parameter info.
 * @remarks
 * 
 * To get a function-parameter-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getfunctionparameter">ID3D12FunctionReflection::GetFunctionParameter</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D12FunctionParameterReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12functionparameterreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12FunctionParameterReflection extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12FunctionParameterReflection
     * @type {Guid}
     */
    static IID => Guid("{ec25f42d-7006-4f2b-b33e-02cc3375733f}")

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
     * Fills the parameter descriptor structure for the function's parameter.
     * @returns {D3D12_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_parameter_desc">D3D12_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_parameter_desc">D3D12_PARAMETER_DESC</a> structure that receives a description of the function's parameter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionparameterreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D12_PARAMETER_DESC()
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }
}
