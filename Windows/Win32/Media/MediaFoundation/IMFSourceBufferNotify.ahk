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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdateStart", "OnAbort", "OnError", "OnUpdate", "OnUpdateEnd"]

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onupdatestart
     */
    OnUpdateStart() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onabort
     */
    OnAbort() {
        ComCall(4, this)
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onerror
     */
    OnError(hr) {
        ComCall(5, this, "int", hr)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onupdate
     */
    OnUpdate() {
        ComCall(6, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffernotify-onupdateend
     */
    OnUpdateEnd() {
        ComCall(7, this)
    }
}
