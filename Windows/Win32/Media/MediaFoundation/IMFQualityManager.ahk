#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Adjusts playback quality. This interface is exposed by the quality manager.
 * @remarks
 * 
  * Media Foundation provides a default quality manager that is tuned for playback. Applications can provide a custom quality manager to the Media Session by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-quality-manager-attribute">MF_SESSION_QUALITY_MANAGER</a> attribute when creating the Media Session.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfqualitymanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFQualityManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFQualityManager
     * @type {Guid}
     */
    static IID => Guid("{8d009d86-5b9f-4115-b1fc-9f80d52ab8ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyTopology", "NotifyPresentationClock", "NotifyProcessInput", "NotifyProcessOutput", "NotifyQualityEvent", "Shutdown"]

    /**
     * 
     * @param {IMFTopology} pTopology 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifytopology
     */
    NotifyTopology(pTopology) {
        result := ComCall(3, this, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFPresentationClock} pClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifypresentationclock
     */
    NotifyPresentationClock(pClock) {
        result := ComCall(4, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFTopologyNode} pNode 
     * @param {Integer} lInputIndex 
     * @param {IMFSample} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifyprocessinput
     */
    NotifyProcessInput(pNode, lInputIndex, pSample) {
        result := ComCall(5, this, "ptr", pNode, "int", lInputIndex, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFTopologyNode} pNode 
     * @param {Integer} lOutputIndex 
     * @param {IMFSample} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifyprocessoutput
     */
    NotifyProcessOutput(pNode, lOutputIndex, pSample) {
        result := ComCall(6, this, "ptr", pNode, "int", lOutputIndex, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pObject 
     * @param {IMFMediaEvent} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifyqualityevent
     */
    NotifyQualityEvent(pObject, pEvent) {
        result := ComCall(7, this, "ptr", pObject, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-shutdown
     */
    Shutdown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
