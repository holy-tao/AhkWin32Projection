#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns the device identifier supported by a video renderer component.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfvideodeviceid
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoDeviceID extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceID"]

    /**
     * Returns the identifier of the video device supported by an EVR mixer or presenter.
     * @remarks
     * If a mixer or presenter uses Direct3D 9, it must return the value IID_IDirect3DDevice9 in <i>pDeviceID</i>. The EVR's default mixer and presenter both return this value. If you write a custom mixer or presenter, it can return some other value. However, the mixer and presenter must use matching device identifiers.
     * @returns {Guid} Receives the device identifier. Generally, the value is IID_IDirect3DDevice9.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodeviceid-getdeviceid
     */
    GetDeviceID() {
        pDeviceID := Guid()
        result := ComCall(3, this, "ptr", pDeviceID, "HRESULT")
        return pDeviceID
    }
}
