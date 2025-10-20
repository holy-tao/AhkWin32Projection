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
     * 
     * @param {Pointer<IMFTopology>} pTopology 
     * @returns {HRESULT} 
     */
    NotifyTopology(pTopology) {
        result := ComCall(3, this, "ptr", pTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationClock>} pClock 
     * @returns {HRESULT} 
     */
    NotifyPresentationClock(pClock) {
        result := ComCall(4, this, "ptr", pClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTopologyNode>} pNode 
     * @param {Integer} lInputIndex 
     * @param {Pointer<IMFSample>} pSample 
     * @returns {HRESULT} 
     */
    NotifyProcessInput(pNode, lInputIndex, pSample) {
        result := ComCall(5, this, "ptr", pNode, "int", lInputIndex, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTopologyNode>} pNode 
     * @param {Integer} lOutputIndex 
     * @param {Pointer<IMFSample>} pSample 
     * @returns {HRESULT} 
     */
    NotifyProcessOutput(pNode, lOutputIndex, pSample) {
        result := ComCall(6, this, "ptr", pNode, "int", lOutputIndex, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pObject 
     * @param {Pointer<IMFMediaEvent>} pEvent 
     * @returns {HRESULT} 
     */
    NotifyQualityEvent(pObject, pEvent) {
        result := ComCall(7, this, "ptr", pObject, "ptr", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
