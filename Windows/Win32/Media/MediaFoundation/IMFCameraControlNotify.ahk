#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlNotify extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} id 
     * @returns {String} Nothing - always returns an empty string
     */
    OnChange(controlSet, id) {
        ComCall(3, this, "ptr", controlSet, "uint", id)
        return result
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    OnError(hrStatus) {
        ComCall(4, this, "int", hrStatus)
        return result
    }
}
