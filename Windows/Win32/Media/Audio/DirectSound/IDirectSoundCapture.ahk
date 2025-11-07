#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectSoundCaptureBuffer.ahk
#Include .\DSCCAPS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCapture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundCapture
     * @type {Guid}
     */
    static IID => Guid("{b0210781-89cd-11d0-af08-00a0c925cd16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCaptureBuffer", "GetCaps", "Initialize"]

    /**
     * 
     * @param {Pointer<DSCBUFFERDESC>} pcDSCBufferDesc 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectSoundCaptureBuffer} 
     */
    CreateCaptureBuffer(pcDSCBufferDesc, pUnkOuter) {
        result := ComCall(3, this, "ptr", pcDSCBufferDesc, "ptr*", &ppDSCBuffer := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectSoundCaptureBuffer(ppDSCBuffer)
    }

    /**
     * 
     * @returns {DSCCAPS} 
     */
    GetCaps() {
        pDSCCaps := DSCCAPS()
        result := ComCall(4, this, "ptr", pDSCCaps, "HRESULT")
        return pDSCCaps
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Guid>} pcGuidDevice 
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
    Initialize(pcGuidDevice) {
        result := ComCall(5, this, "ptr", pcGuidDevice, "HRESULT")
        return result
    }
}
