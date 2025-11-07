#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_TRACE_STATS.ahk
#Include .\D3D11_TRACE_VALUE.ahk
#Include .\D3D11_TRACE_STEP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An ID3D11ShaderTrace interface implements methods for obtaining traces of shader executions.
 * @remarks
 * 
 * To retrieve an instance of <b>ID3D11ShaderTrace</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertracefactory-createshadertrace">ID3D11ShaderTraceFactory::CreateShaderTrace</a> method. To retrieve an instance of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertracefactory">ID3D11ShaderTraceFactory</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> that you created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_DEBUGGABLE</a>. Although shader tracing operates without setting <b>D3D11_CREATE_DEVICE_DEBUGGABLE</b>, we recommend that you create a shader debugging device because some devices (for example, <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-create-warp">WARP</a> devices) might make behind-the-scenes shader optimizations that will lead to slightly incorrect shader traces when <b>D3D11_CREATE_DEVICE_DEBUGGABLE</b> isn't set.
 * 
 * 
 * All <b>ID3D11ShaderTrace</b> methods are thread safe.
 * 
 * All <b>ID3D11ShaderTrace</b> methods immediately force the reference device to flush rendering commands. Therefore, the most current trace status is always available on the reference device. That is, if you expect a trace to be ready after a draw operation, it will be ready.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertrace
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ShaderTrace extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ShaderTrace
     * @type {Guid}
     */
    static IID => Guid("{36b013e6-2811-4845-baa7-d623fe0df104}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TraceReady", "ResetTrace", "GetTraceStats", "PSSelectStamp", "GetInitialRegisterContents", "GetStep", "GetWrittenRegister", "GetReadRegister"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-traceready
     */
    TraceReady() {
        result := ComCall(3, this, "uint*", &pTestCount := 0, "HRESULT")
        return pTestCount
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-resettrace
     */
    ResetTrace() {
        ComCall(4, this)
    }

    /**
     * 
     * @returns {D3D11_TRACE_STATS} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-gettracestats
     */
    GetTraceStats() {
        pTraceStats := D3D11_TRACE_STATS()
        result := ComCall(5, this, "ptr", pTraceStats, "HRESULT")
        return pTraceStats
    }

    /**
     * 
     * @param {Integer} stampIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-psselectstamp
     */
    PSSelectStamp(stampIndex) {
        result := ComCall(6, this, "uint", stampIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_TRACE_REGISTER>} pRegister 
     * @returns {D3D11_TRACE_VALUE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getinitialregistercontents
     */
    GetInitialRegisterContents(pRegister) {
        pValue := D3D11_TRACE_VALUE()
        result := ComCall(7, this, "ptr", pRegister, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} stepIndex 
     * @returns {D3D11_TRACE_STEP} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getstep
     */
    GetStep(stepIndex) {
        pTraceStep := D3D11_TRACE_STEP()
        result := ComCall(8, this, "uint", stepIndex, "ptr", pTraceStep, "HRESULT")
        return pTraceStep
    }

    /**
     * 
     * @param {Integer} stepIndex 
     * @param {Integer} writtenRegisterIndex 
     * @param {Pointer<D3D11_TRACE_REGISTER>} pRegister 
     * @param {Pointer<D3D11_TRACE_VALUE>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getwrittenregister
     */
    GetWrittenRegister(stepIndex, writtenRegisterIndex, pRegister, pValue) {
        result := ComCall(9, this, "uint", stepIndex, "uint", writtenRegisterIndex, "ptr", pRegister, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} stepIndex 
     * @param {Integer} readRegisterIndex 
     * @param {Pointer<D3D11_TRACE_REGISTER>} pRegister 
     * @param {Pointer<D3D11_TRACE_VALUE>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getreadregister
     */
    GetReadRegister(stepIndex, readRegisterIndex, pRegister, pValue) {
        result := ComCall(10, this, "uint", stepIndex, "uint", readRegisterIndex, "ptr", pRegister, "ptr", pValue, "HRESULT")
        return result
    }
}
