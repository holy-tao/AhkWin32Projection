#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11ShaderTrace.ahk" { ID3D11ShaderTrace }
#Import ".\D3D11_SHADER_TRACE_DESC.ahk" { D3D11_SHADER_TRACE_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An ID3D11ShaderTraceFactory interface implements a method for generating shader trace information objects.
 * @remarks
 * These APIs require the Windows Software Development Kit (SDK) for Windows 8.
 * 
 * To retrieve an instance of <b>ID3D11ShaderTraceFactory</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> that you created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_DEBUGGABLE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertracefactory
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11ShaderTraceFactory extends IUnknown {
    /**
     * The interface identifier for ID3D11ShaderTraceFactory
     * @type {Guid}
     */
    static IID := Guid("{1fbad429-66ab-41cc-9617-667ac10e4459}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11ShaderTraceFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateShaderTrace : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11ShaderTraceFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a shader-trace interface for a shader-trace information object.
     * @remarks
     * This API requires the Windows Software Development Kit (SDK) for Windows 8.
     * @param {IUnknown} pShader A pointer to the interface of the shader to create the shader-trace interface for. For example, <i>pShader</i> can be an instance of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11vertexshader">ID3D11VertexShader</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11pixelshader">ID3D11PixelShader</a>, and so on.
     * @param {Pointer<D3D11_SHADER_TRACE_DESC>} pTraceDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_shader_trace_desc">D3D11_SHADER_TRACE_DESC</a> structure that describes the shader-trace object to create. This parameter cannot be <b>NULL</b>.
     * @returns {ID3D11ShaderTrace} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertrace">ID3D11ShaderTrace</a> interface for the shader-trace object that <b>CreateShaderTrace</b> creates.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertracefactory-createshadertrace
     */
    CreateShaderTrace(pShader, pTraceDesc) {
        result := ComCall(3, this, "ptr", pShader, D3D11_SHADER_TRACE_DESC.Ptr, pTraceDesc, "ptr*", &ppShaderTrace := 0, "HRESULT")
        return ID3D11ShaderTrace(ppShaderTrace)
    }

    Query(iid) {
        if (ID3D11ShaderTraceFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateShaderTrace := CallbackCreate(GetMethod(implObj, "CreateShaderTrace"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateShaderTrace)
    }
}
