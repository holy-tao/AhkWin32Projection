#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nn-mfvirtualcamera-imfcamerasyncobject
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraSyncObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraSyncObject
     * @type {Guid}
     */
    static IID => Guid("{6338b23a-3042-49d2-a3ea-ec0fed815407}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WaitOnSignal", "Shutdown"]

    /**
     * 
     * @param {Integer} timeOutInMs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfcamerasyncobject-waitonsignal
     */
    WaitOnSignal(timeOutInMs) {
        result := ComCall(3, this, "uint", timeOutInMs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfcamerasyncobject-shutdown
     */
    Shutdown() {
        ComCall(4, this)
    }
}
