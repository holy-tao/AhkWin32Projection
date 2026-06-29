#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_PARAMETER_DESC.ahk" { D3D11_PARAMETER_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * A function-parameter-reflection interface accesses function-parameter info. (ID3D11FunctionParameterReflection)
 * @remarks
 * To get a function-parameter-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionreflection-getfunctionparameter">ID3D11FunctionReflection::GetFunctionParameter</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11FunctionParameterReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL. </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11functionparameterreflection
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11FunctionParameterReflection extends Win32ComInterface {
    /**
     * The interface identifier for ID3D11FunctionParameterReflection
     * @type {Guid}
     */
    static IID := Guid("{42757488-334f-47fe-982e-1a65d08cc462}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11FunctionParameterReflection interfaces
    */
    struct Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11FunctionParameterReflection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Fills the parameter descriptor structure for the function's parameter. (ID3D11FunctionParameterReflection.GetDesc)
     * @returns {D3D11_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc">D3D11_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc">D3D11_PARAMETER_DESC</a> structure that receives a description of the function's parameter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11functionparameterreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D11_PARAMETER_DESC()
        result := ComCall(0, this, D3D11_PARAMETER_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    Query(iid) {
        if (ID3D11FunctionParameterReflection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
