#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement this callback to receive notifications when system-allocated frame buffers are sent to the device driver.
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/nn-mftransform-imfdevicetransformcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDeviceTransformCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDeviceTransformCallback
     * @type {Guid}
     */
    static IID => Guid("{6d5cb646-29ec-41fb-8179-8c4c6d750811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnBufferSent"]

    /**
     * Called when system-allocated frame buffers are sent to the device driver.
     * @param {IMFAttributes} pCallbackAttributes The attributes containing the callback data. The System-allocated frame buffer information is stored in the attribute with the MF_DMFT_FRAME_BUFFER_INFO key.
     * @param {Integer} pinId The identifier of the device pin to which the frame buffers are sent.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransformcallback-onbuffersent
     */
    OnBufferSent(pCallbackAttributes, pinId) {
        result := ComCall(3, this, "ptr", pCallbackAttributes, "uint", pinId, "HRESULT")
        return result
    }
}
