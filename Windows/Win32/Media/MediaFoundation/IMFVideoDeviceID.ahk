#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns the device identifier supported by a video renderer component.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideodeviceid
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoDeviceID extends IUnknown{
    /**
     * The interface identifier for IMFVideoDeviceID
     * @type {Guid}
     */
    static IID => Guid("{a38d9567-5a9c-4f3c-b293-8eb415b279ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pDeviceID 
     * @returns {HRESULT} 
     */
    GetDeviceID(pDeviceID) {
        result := ComCall(3, this, "ptr", pDeviceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
