#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The interface for an Audio Processing Object which be used in an XAudio2 effect chain.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapo/nn-xapo-ixapo
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAPO extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXAPO
     * @type {Guid}
     */
    static IID => Guid("{a410b984-9839-4819-a0be-2856ae6b3adb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRegistrationProperties", "IsInputFormatSupported", "IsOutputFormatSupported", "Initialize", "Reset", "LockForProcess", "UnlockForProcess", "Process", "CalcInputFrames", "CalcOutputFrames"]

    /**
     * Returns the registration properties of an XAPO.
     * @remarks
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {Pointer<XAPO_REGISTRATION_PROPERTIES>} Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/xapo/ns-xapo-xapo_registration_properties">XAPO_REGISTRATION_PROPERTIES</a> structure containing the registration properties the XAPO was created with; use <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-xapofree">XAPOFree</a> to free the structure.
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-getregistrationproperties
     */
    GetRegistrationProperties() {
        result := ComCall(3, this, "ptr*", &ppRegistrationProperties := 0, "HRESULT")
        return ppRegistrationProperties
    }

    /**
     * Queries if a specific input format is supported for a given output format.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-isoutputformatsupported">IXAPO::IsOutputFormatSupported</a> and <b>IsInputFormatSupported</b> methods allow an XAPO to indicate which audio formats it is capable of processing. If a requested format is not supported, the XAPO should return the closest format that it does support. The closest format should be determined based on frame rate, bit depth, and channel count, in that order of importance. The behavior of <b>IsInputFormatSupported</b> is allowed to change, based on the internal state of the XAPO, but its behavior should remain constant between calls to the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-lockforprocess">IXAPO::LockForProcess</a> and <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-unlockforprocess">IXAPO::UnlockForProcess</a> methods.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<WAVEFORMATEX>} pOutputFormat Output format.
     * @param {Pointer<WAVEFORMATEX>} pRequestedInputFormat Input format to check for being supported.
     * @returns {Pointer<WAVEFORMATEX>} If not NULL, and the input format is not supported for the given output format, <i>ppSupportedInputFormat</i> returns a pointer to the closest input format that is supported. Use <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-xapofree">XAPOFree</a> to free the returned structure.
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-isinputformatsupported
     */
    IsInputFormatSupported(pOutputFormat, pRequestedInputFormat) {
        result := ComCall(4, this, "ptr", pOutputFormat, "ptr", pRequestedInputFormat, "ptr*", &ppSupportedInputFormat := 0, "HRESULT")
        return ppSupportedInputFormat
    }

    /**
     * Queries if a specific output format is supported for a given input format.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-isinputformatsupported">IXAPO::IsInputFormatSupported</a> and <b>IsOutputFormatSupported</b> methods allow an XAPO to indicate which audio formats it is capable of processing. If a requested format is not supported, the XAPO should return the closest format that it does support. The closest format should be determined based on frame rate, bit depth, and channel count, in that order of importance. The behavior of <b>IsOutputFormatSupported</b> is allowed to change, based on the internal state of the XAPO, but its behavior should remain constant between calls to the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-lockforprocess">IXAPO::LockForProcess</a> and <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-unlockforprocess">IXAPO::UnlockForProcess</a> methods.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<WAVEFORMATEX>} pInputFormat Input format.
     * @param {Pointer<WAVEFORMATEX>} pRequestedOutputFormat Output format to check for being supported.
     * @returns {Pointer<WAVEFORMATEX>} If not NULL and the output format is not supported for the given input format, <i>ppSupportedOutputFormat</i> returns a pointer to the closest output format that is supported. Use <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-xapofree">XAPOFree</a> to free the returned structure.
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-isoutputformatsupported
     */
    IsOutputFormatSupported(pInputFormat, pRequestedOutputFormat) {
        result := ComCall(5, this, "ptr", pInputFormat, "ptr", pRequestedOutputFormat, "ptr*", &ppSupportedOutputFormat := 0, "HRESULT")
        return ppSupportedOutputFormat
    }

    /**
     * Performs any effect-specific initialization.
     * @remarks
     * The contents of <i>pData</i> are defined by a given XAPO. Immutable parameters (constant for the lifetime of the XAPO) should be set in this method. Once initialized, an XAPO cannot be initialized again. An XAPO should be initialized before passing it to XAudio2 as part of an effect chain.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  XAudio2 does not call this method, it should be called by the client before passing the XAPO to XAudio2.</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer} pData Effect-specific initialization parameters, may be NULL if <i>DataByteSize</i> is 0.
     * @param {Integer} DataByteSize Size of <i>pData</i> in bytes, may be 0 if <i>pData</i> is NULL.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-initialize
     */
    Initialize(pData, DataByteSize) {
        result := ComCall(6, this, "ptr", pData, "uint", DataByteSize, "HRESULT")
        return result
    }

    /**
     * Resets variables dependent on frame history.
     * @remarks
     * Constant and locked parameters such as the input and output formats remain unchanged. Variables set by <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapoparameters-setparameters">IXAPOParameters::SetParameters</a> remain unchanged.
     * 
     * 
     * 
     * For example, an effect with delay should zero out its delay line during this method, but should not reallocate anything as the XAPO remains locked with a constant input and output configuration.
     * 
     * 
     * 
     * XAudio2 only calls this method if the XAPO is locked.
     * 
     * 
     * 
     * This method is called from the realtime thread and should not block.
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-reset
     */
    Reset() {
        ComCall(7, this)
    }

    /**
     * Called by XAudio2 to lock the input and output configurations of an XAPO allowing it to do any final initialization before Process is called on the realtime thread.
     * @remarks
     * Once locked, the input and output configuration and any other locked parameters remain constant until <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-unlockforprocess">UnLockForProcess</a> is called. After an XAPO is locked, further calls to <b>LockForProcess</b> have no effect until the <b>UnLockForProcess</b> function is called.
     * 
     * 
     * 
     * An XAPO indicates what specific formats it supports through its implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-isinputformatsupported">IsInputFormatSupported</a> and <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-isoutputformatsupported">IsOutputFormatSupported</a> methods. An XAPO should assert the input and output configurations are supported and that any required effect-specific initialization is complete. The <b>IsInputFormatSupported</b>, <b>IsOutputFormatSupported</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-initialize">Initialize</a> methods should be used as necessary before calling this method.
     * 
     * 
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-process">Process</a> is a nonblocking method, all internal memory buffers required for <b>Process</b> should be allocated in <b>LockForProcess</b>.
     * 
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-process">Process</a> is never called before <b>LockForProcess</b> returns successfully.
     * 
     * 
     * 
     * <b>LockForProcess</b> is called directly by XAudio2 and should not be called by the client code.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} InputLockedParameterCount Number of elements in <i>ppInputLockedParameters</i>. Must be within the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/ns-xapo-xapo_registration_properties">XAPO_REGISTRATION_PROPERTIES</a>.MinInputBufferCount and <b>XAPO_REGISTRATION_PROPERTIES</b>.MaxInputBufferCount values passed to <a href="https://docs.microsoft.com/windows/desktop/api/xapobase/nf-xapobase-cxapobase-cxapobase">CXAPOBase::CXAPOBase</a>.
     * @param {Pointer<XAPO_LOCKFORPROCESS_PARAMETERS>} pInputLockedParameters Array of input <a href="https://docs.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_lockforprocess_parameters">XAPO_LOCKFORPROCESS_BUFFER_PARAMETERS</a> structures. <i>pInputLockedParameters</i> may be NULL if <i>InputLockedParameterCount</i> is 0, otherwise it must have <i>InputLockedParameterCount</i> elements.
     * @param {Integer} OutputLockedParameterCount Number of elements in ppOutputLockedParameters. Must be within the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/ns-xapo-xapo_registration_properties">XAPO_REGISTRATION_PROPERTIES</a>.MinOutputBufferCount and <b>XAPO_REGISTRATION_PROPERTIES</b>.MaxOutputBufferCount values passed to <a href="https://docs.microsoft.com/windows/desktop/api/xapobase/nf-xapobase-cxapobase-cxapobase">CXAPOBase::CXAPOBase</a>. If the XAPO_FLAG_BUFFERCOUNT_MUST_MATCH flag was specified in <b>XAPO_REGISTRATION_PROPERTIES</b>.Flags then <i>OutputLockedParameterCount</i> must equal <i>InputLockedParameterCount</i>.
     * @param {Pointer<XAPO_LOCKFORPROCESS_PARAMETERS>} pOutputLockedParameters Array of output <a href="https://docs.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_lockforprocess_parameters">XAPO_LOCKFORPROCESS_BUFFER_PARAMETERS</a> structures. <i>pOutputLockedParameters</i> may be NULL if <i>OutputLockedParameterCount</i> is 0, otherwise it must have <i>OutputLockedParameterCount</i> elements.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-lockforprocess
     */
    LockForProcess(InputLockedParameterCount, pInputLockedParameters, OutputLockedParameterCount, pOutputLockedParameters) {
        result := ComCall(8, this, "uint", InputLockedParameterCount, "ptr", pInputLockedParameters, "uint", OutputLockedParameterCount, "ptr", pOutputLockedParameters, "HRESULT")
        return result
    }

    /**
     * Deallocates variables that were allocated with the LockForProcess method.
     * @remarks
     * Unlocking an XAPO instance allows it to be reused with different input and output formats.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-unlockforprocess
     */
    UnlockForProcess() {
        ComCall(9, this)
    }

    /**
     * Runs the XAPO's digital signal processing (DSP) code on the given input and output buffers.
     * @remarks
     * Implementations of this function should not block, as the function is called from the realtime audio processing thread.
     * 
     * 
     * 
     * All code that could cause a delay, such as format validation and memory allocation, should be put in the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-lockforprocess">IXAPO::LockForProcess</a> method, which is not called from the realtime audio processing thread. 
     * 
     * 
     * 
     * For in-place processing, the <i>pInputProcessParameters</i> parameter will not necessarily be the same as <i>pOutputProcessParameters</i>. Rather, their <i>pBuffer</i> members will point to the same memory. 
     * 
     * 
     * 
     * Multiple input and output buffers may be used with in-place XAPOs, though the input buffer count must equal the output buffer count. For in-place processing when multiple input and output buffers are used, the XAPO may assume the number of input buffers equals the number of output buffers. 
     * 
     * 
     * 
     * In addition to writing to the output buffer, as appropriate, an XAPO is responsible for setting the output stream's buffer flags and valid frame count. 
     * 
     * 
     * 
     * When <i>IsEnabled</i> is FALSE, the XAPO should not apply its normal processing to the given input/output buffers during. It should instead pass data from input to output with as little modification possible. Effects that perform format conversion should continue to do so. Effects must ensure transitions between normal and thru processing do not introduce discontinuities into the signal. 
     * 
     * 
     * 
     * When writing a <b>Process</b> method, it is important to note XAudio2 audio data is interleaved, which means data from each channel is adjacent for a particular sample number. For example, if there was a 4-channel wave playing into an XAudio2 source voice, the audio data would be a sample of channel 0, a sample of channel 1, a sample of channel 2, a sample of channel 3, and then the next sample of channels 0, 1, 2, 3, and so on.
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} InputProcessParameterCount Number of elements in pInputProcessParameters. 
     * 
     * <div class="alert"><b>Note</b>  XAudio2 currently supports only one input stream and one output stream.</div>
     * <div> </div>
     * @param {Pointer<XAPO_PROCESS_BUFFER_PARAMETERS>} pInputProcessParameters Input array of <a href="https://docs.microsoft.com/windows/desktop/api/xapo/ns-xapo-xapo_process_buffer_parameters">XAPO_PROCESS_BUFFER_PARAMETERS</a> structures.
     * @param {Integer} OutputProcessParameterCount Number of elements in <i>pOutputProcessParameters</i>. 
     * 
     * <div class="alert"><b>Note</b>  XAudio2 currently supports only one input stream and one output stream.</div>
     * <div> </div>
     * @param {Pointer<XAPO_PROCESS_BUFFER_PARAMETERS>} pOutputProcessParameters Output array of <a href="https://docs.microsoft.com/windows/desktop/api/xapo/ns-xapo-xapo_process_buffer_parameters">XAPO_PROCESS_BUFFER_PARAMETERS</a> structures. On input, the value of <b>XAPO_PROCESS_BUFFER_PARAMETERS</b>. <b>ValidFrameCount</b> indicates the number of frames that the XAPO should write to the output buffer. On output, the value of <b>XAPO_PROCESS_BUFFER_PARAMETERS</b>. <b>ValidFrameCount</b> indicates the actual number of frames written.
     * @param {BOOL} IsEnabled TRUE to process normally; FALSE to process thru. See Remarks for additional information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-process
     */
    Process(InputProcessParameterCount, pInputProcessParameters, OutputProcessParameterCount, pOutputProcessParameters, IsEnabled) {
        ComCall(10, this, "uint", InputProcessParameterCount, "ptr", pInputProcessParameters, "uint", OutputProcessParameterCount, "ptr", pOutputProcessParameters, "int", IsEnabled)
    }

    /**
     * Returns the number of input frames required to generate the given number of output frames.
     * @remarks
     * XAudio2 calls this method to determine what size input buffer an XAPO requires to generate the given number of output frames. This method only needs to be called once while an XAPO is locked. <b>CalcInputFrames</b> is only called by XAudio2 if the XAPO is locked.
     * 
     * 
     * 
     * This function should not block, because it may be called from the realtime audio processing thread.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} OutputFrameCount The number of output frames desired.
     * @returns {Integer} Returns the number of input frames required.
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-calcinputframes
     */
    CalcInputFrames(OutputFrameCount) {
        result := ComCall(11, this, "uint", OutputFrameCount, "uint")
        return result
    }

    /**
     * Returns the number of output frames that will be generated from a given number of input frames.
     * @remarks
     * XAudio2 calls this method to determine how large of an output buffer an XAPO will require for a certain number of input frames. <b>CalcOutputFrames</b> is only called by XAudio2 if the XAPO is locked.
     * 
     * 
     * 
     * This function should not block, because it may be called from the realtime audio processing thread.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} InputFrameCount The number of input frames.
     * @returns {Integer} Returns the number of output frames that will be produced.
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-calcoutputframes
     */
    CalcOutputFrames(InputFrameCount) {
        result := ComCall(12, this, "uint", InputFrameCount, "uint")
        return result
    }
}
