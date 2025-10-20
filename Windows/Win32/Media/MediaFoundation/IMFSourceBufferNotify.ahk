#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality for raising events associated with IMFSourceBuffer.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfsourcebuffernotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceBufferNotify extends IUnknown{
    /**
     * The interface identifier for IMFSourceBufferNotify
     * @type {Guid}
     */
    static IID => Guid("{87e47623-2ceb-45d6-9b88-d8520c4dcbbc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnUpdateStart() {
        ComCall(3, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnAbort() {
        ComCall(4, this)
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     */
    OnError(hr) {
        ComCall(5, this, "int", hr)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnUpdate() {
        ComCall(6, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnUpdateEnd() {
        ComCall(7, this)
        return result
    }
}
