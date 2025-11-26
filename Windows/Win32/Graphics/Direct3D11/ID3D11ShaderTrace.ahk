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
     * Specifies that the shader trace recorded and is ready to use.
     * @returns {Integer} An optional pointer to a variable that receives the number of times that a matching invocation for the trace occurred. If not used, set to NULL.
     * For more information about this number, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-traceready
     */
    TraceReady() {
        result := ComCall(3, this, "uint*", &pTestCount := 0, "HRESULT")
        return pTestCount
    }

    /**
     * Resets the shader-trace object.
     * @remarks
     * 
     * After you call <b>ResetTrace</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertrace">ID3D11ShaderTrace</a> object behaves as if it had just been created. Thereafter, shader invocations for the trace start from 0 again; calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-traceready">ID3D11ShaderTrace::TraceReady</a> return <b>S_FALSE</b> until the selected shader invocation number is reached, and <b>TraceReady</b> records a new trace.
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-resettrace
     */
    ResetTrace() {
        ComCall(4, this)
    }

    /**
     * Returns statistics about the trace.
     * @returns {D3D11_TRACE_STATS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_stats">D3D11_TRACE_STATS</a> structure. <b>GetTraceStats</b> fills the members of this structure with statistics about the trace.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-gettracestats
     */
    GetTraceStats() {
        pTraceStats := D3D11_TRACE_STATS()
        result := ComCall(5, this, "ptr", pTraceStats, "HRESULT")
        return pTraceStats
    }

    /**
     * Sets the specified pixel-shader stamp.
     * @param {Integer} stampIndex The index of the stamp to select.
     * @returns {HRESULT} <b>PSSelectStamp</b> returns:
     *         <ul>
     * <li><b>S_OK</b> if the method set the pixel-shader stamp, and if the primitive covers the pixel and sample for the stamp.</li>
     * <li><b>S_FALSE</b> if the method set the pixel-shader stamp, and if the invocation for the selected stamp falls off the primitive.</li>
     * <li><b>E_FAIL</b> if you called the method for a vertex shader or geometry shader;   <b>PSSelectStamp</b> is meaningful only for pixel shaders.</li>
     * <li><b>E_INVALIDARG</b> if <i>stampIndex</i> is out of range [0..3].</li>
     * <li>Possibly other error codes that are described in <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-psselectstamp
     */
    PSSelectStamp(stampIndex) {
        result := ComCall(6, this, "uint", stampIndex, "HRESULT")
        return result
    }

    /**
     * Retrieves the initial contents of the specified input register.
     * @param {Pointer<D3D11_TRACE_REGISTER>} pRegister 
     * @returns {D3D11_TRACE_VALUE} A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value">D3D11_TRACE_VALUE</a> structure. <b>GetInitialRegisterContents</b> fills the members of this structure with information about the initial contents.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getinitialregistercontents
     */
    GetInitialRegisterContents(pRegister) {
        pValue := D3D11_TRACE_VALUE()
        result := ComCall(7, this, "ptr", pRegister, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves information about the specified step in the trace.
     * @param {Integer} stepIndex The index of the step within the trace. The range of the index is [0...NumTraceSteps-1], where <b>NumTraceSteps</b> is a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_stats">D3D11_TRACE_STATS</a> structure. You can retrieve information about a step in any step order.
     * @returns {D3D11_TRACE_STEP} A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_step">D3D11_TRACE_STEP</a> structure. <b>GetStep</b> fills the members of this structure with information about the trace step that is specified by the <i>stepIndex</i>  parameter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getstep
     */
    GetStep(stepIndex) {
        pTraceStep := D3D11_TRACE_STEP()
        result := ComCall(8, this, "uint", stepIndex, "ptr", pTraceStep, "HRESULT")
        return pTraceStep
    }

    /**
     * Retrieves information about a register that was written by a step in the trace.
     * @param {Integer} stepIndex The index of the step within the trace. The range of the index is [0...NumTraceSteps-1], where <b>NumTraceSteps</b> is a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_stats">D3D11_TRACE_STATS</a> structure. You can retrieve information in any step order.
     * @param {Integer} writtenRegisterIndex The index of the register within  the trace step. The range of the index is [0...NumRegistersWritten-1], where <b>NumRegistersWritten</b> is a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_step">D3D11_TRACE_STEP</a> structure.
     * @param {Pointer<D3D11_TRACE_REGISTER>} pRegister A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_register">D3D11_TRACE_REGISTER</a> structure. <b>GetWrittenRegister</b> fills the members of this structure with information about the register that was written by the step in the trace.
     * @param {Pointer<D3D11_TRACE_VALUE>} pValue A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value">D3D11_TRACE_VALUE</a> structure. <b>GetWrittenRegister</b> fills the members of this structure with information about the value that was written to the register.
     * @returns {HRESULT} <b>GetWrittenRegister</b> returns:
     *         <ul>
     * <li><b>S_OK</b> if the method retrieves the register information.</li>
     * <li><b>E_FAIL</b> if a trace is not available or if the trace was not created with the D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_WRITES flag.</li>
     * <li><b>E_INVALIDARG</b> if <i>stepIndex</i> or <i>writtenRegisterIndex</i> is out of range or if <i>pRegister</i> or <i>pValue</i> is NULL.</li>
     * <li>Possibly other error codes that are described in <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getwrittenregister
     */
    GetWrittenRegister(stepIndex, writtenRegisterIndex, pRegister, pValue) {
        result := ComCall(9, this, "uint", stepIndex, "uint", writtenRegisterIndex, "ptr", pRegister, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves information about a register that was read by a step in the trace.
     * @param {Integer} stepIndex The index of the step within the trace. The range of the index is [0...NumTraceSteps-1], where <b>NumTraceSteps</b> is a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_stats">D3D11_TRACE_STATS</a> structure. You can retrieve information in any step order.
     * @param {Integer} readRegisterIndex The index of the register within  the trace step. The range of the index is [0...NumRegistersRead-1], where <b>NumRegistersRead</b> is a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_step">D3D11_TRACE_STEP</a> structure.
     * @param {Pointer<D3D11_TRACE_REGISTER>} pRegister A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_register">D3D11_TRACE_REGISTER</a> structure. <b>GetReadRegister</b> fills the members of this structure with information about the register that was read by the step in the trace.
     * @param {Pointer<D3D11_TRACE_VALUE>} pValue A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value">D3D11_TRACE_VALUE</a> structure. <b>GetReadRegister</b> fills the members of this structure with information about the value that was read from the register.
     * @returns {HRESULT} <b>GetReadRegister</b> returns:
     *         <ul>
     * <li><b>S_OK</b> if the method retrieves the register information.</li>
     * <li><b>E_FAIL</b> if a trace is not available or if the trace was not created with the D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_READS flag.</li>
     * <li><b>E_INVALIDARG</b> if <i>stepIndex</i> or <i>readRegisterIndex</i> is out of range or if <i>pRegister</i> or <i>pValue</i> is NULL.</li>
     * <li>Possibly other error codes that are described in <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getreadregister
     */
    GetReadRegister(stepIndex, readRegisterIndex, pRegister, pValue) {
        result := ComCall(10, this, "uint", stepIndex, "uint", readRegisterIndex, "ptr", pRegister, "ptr", pValue, "HRESULT")
        return result
    }
}
