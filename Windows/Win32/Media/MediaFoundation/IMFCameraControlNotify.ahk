#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraControlNotify
     * @type {Guid}
     */
    static IID => Guid("{e8f2540d-558a-4449-8b64-4863467a9fe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChange", "OnError"]

    /**
     * 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} id 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolnotify-onchange
     */
    OnChange(controlSet, id) {
        ComCall(3, this, "ptr", controlSet, "uint", id)
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolnotify-onerror
     */
    OnError(hrStatus) {
        ComCall(4, this, "int", hrStatus)
    }
}
