#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraSyncObject extends IUnknown{
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
     * 
     * @param {Integer} timeOutInMs 
     * @returns {HRESULT} 
     */
    WaitOnSignal(timeOutInMs) {
        result := ComCall(3, this, "uint", timeOutInMs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Shutdown() {
        ComCall(4, this)
        return result
    }
}
