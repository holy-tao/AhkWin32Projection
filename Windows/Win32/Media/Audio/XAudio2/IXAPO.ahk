#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The interface for an Audio Processing Object which be used in an XAudio2 effect chain.
 * @remarks
 * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xapo/nn-xapo-ixapo
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
     * 
     * @param {Pointer<Pointer<XAPO_REGISTRATION_PROPERTIES>>} ppRegistrationProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-getregistrationproperties
     */
    GetRegistrationProperties(ppRegistrationProperties) {
        ppRegistrationPropertiesMarshal := ppRegistrationProperties is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppRegistrationPropertiesMarshal, ppRegistrationProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pOutputFormat 
     * @param {Pointer<WAVEFORMATEX>} pRequestedInputFormat 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppSupportedInputFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-isinputformatsupported
     */
    IsInputFormatSupported(pOutputFormat, pRequestedInputFormat, ppSupportedInputFormat) {
        ppSupportedInputFormatMarshal := ppSupportedInputFormat is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pOutputFormat, "ptr", pRequestedInputFormat, ppSupportedInputFormatMarshal, ppSupportedInputFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pInputFormat 
     * @param {Pointer<WAVEFORMATEX>} pRequestedOutputFormat 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppSupportedOutputFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-isoutputformatsupported
     */
    IsOutputFormatSupported(pInputFormat, pRequestedOutputFormat, ppSupportedOutputFormat) {
        ppSupportedOutputFormatMarshal := ppSupportedOutputFormat is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pInputFormat, "ptr", pRequestedOutputFormat, ppSupportedOutputFormatMarshal, ppSupportedOutputFormat, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer} pData 
     * @param {Integer} DataByteSize 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pData, DataByteSize) {
        result := ComCall(6, this, "ptr", pData, "uint", DataByteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-reset
     */
    Reset() {
        ComCall(7, this)
    }

    /**
     * 
     * @param {Integer} InputLockedParameterCount 
     * @param {Pointer<XAPO_LOCKFORPROCESS_PARAMETERS>} pInputLockedParameters 
     * @param {Integer} OutputLockedParameterCount 
     * @param {Pointer<XAPO_LOCKFORPROCESS_PARAMETERS>} pOutputLockedParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-lockforprocess
     */
    LockForProcess(InputLockedParameterCount, pInputLockedParameters, OutputLockedParameterCount, pOutputLockedParameters) {
        result := ComCall(8, this, "uint", InputLockedParameterCount, "ptr", pInputLockedParameters, "uint", OutputLockedParameterCount, "ptr", pOutputLockedParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-unlockforprocess
     */
    UnlockForProcess() {
        ComCall(9, this)
    }

    /**
     * Performs ink recognition synchronously.
     * @param {Integer} InputProcessParameterCount 
     * @param {Pointer<XAPO_PROCESS_BUFFER_PARAMETERS>} pInputProcessParameters 
     * @param {Integer} OutputProcessParameterCount 
     * @param {Pointer<XAPO_PROCESS_BUFFER_PARAMETERS>} pOutputProcessParameters 
     * @param {BOOL} IsEnabled 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-process
     */
    Process(InputProcessParameterCount, pInputProcessParameters, OutputProcessParameterCount, pOutputProcessParameters, IsEnabled) {
        ComCall(10, this, "uint", InputProcessParameterCount, "ptr", pInputProcessParameters, "uint", OutputProcessParameterCount, "ptr", pOutputProcessParameters, "int", IsEnabled)
    }

    /**
     * 
     * @param {Integer} OutputFrameCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-calcinputframes
     */
    CalcInputFrames(OutputFrameCount) {
        result := ComCall(11, this, "uint", OutputFrameCount, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} InputFrameCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapo-calcoutputframes
     */
    CalcOutputFrames(InputFrameCount) {
        result := ComCall(12, this, "uint", InputFrameCount, "uint")
        return result
    }
}
