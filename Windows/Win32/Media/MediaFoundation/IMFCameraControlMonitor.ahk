#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolmonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraControlMonitor
     * @type {Guid}
     */
    static IID => Guid("{4d46f2c9-28ba-4970-8c7b-1f0c9d80af69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "AddControlSubscription", "RemoveControlSubscription", "Shutdown"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-start
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} controlSet 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-addcontrolsubscription
     */
    AddControlSubscription(controlSet, id) {
        result := ComCall(5, this, "ptr", controlSet, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} controlSet 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-removecontrolsubscription
     */
    RemoveControlSubscription(controlSet, id) {
        result := ComCall(6, this, "ptr", controlSet, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-shutdown
     */
    Shutdown() {
        ComCall(7, this)
    }
}
