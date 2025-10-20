#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatemonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraOcclusionStateMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraOcclusionStateMonitor
     * @type {Guid}
     */
    static IID => Guid("{cc692f46-c697-47e2-a72d-7b064617749b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "GetSupportedStates"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-start
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-getsupportedstates
     */
    GetSupportedStates() {
        result := ComCall(5, this, "uint")
        return result
    }
}
