#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a mechanism for notifying the app about information regarding the media key session.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediakeysessionnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeySessionNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeySessionNotify
     * @type {Guid}
     */
    static IID => Guid("{6a0083f9-8947-4c1d-9ce0-cdee22b23135}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KeyMessage", "KeyAdded", "KeyError"]

    /**
     * 
     * @param {BSTR} destinationURL 
     * @param {Pointer} message 
     * @param {Integer} cb 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysessionnotify-keymessage
     */
    KeyMessage(destinationURL, message, cb) {
        destinationURL := destinationURL is String ? BSTR.Alloc(destinationURL).Value : destinationURL

        ComCall(3, this, "ptr", destinationURL, "ptr", message, "uint", cb)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysessionnotify-keyadded
     */
    KeyAdded() {
        ComCall(4, this)
    }

    /**
     * 
     * @param {Integer} code 
     * @param {Integer} systemCode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysessionnotify-keyerror
     */
    KeyError(code, systemCode) {
        ComCall(5, this, "ushort", code, "uint", systemCode)
    }
}
