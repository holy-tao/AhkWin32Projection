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
     * 
     * @param {Pointer<IMFAttributes>} pCallbackAttributes 
     * @param {Integer} pinId 
     * @returns {HRESULT} 
     */
    OnBufferSent(pCallbackAttributes, pinId) {
        result := ComCall(3, this, "ptr", pCallbackAttributes, "uint", pinId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
