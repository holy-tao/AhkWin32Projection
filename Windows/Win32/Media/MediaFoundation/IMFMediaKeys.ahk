#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaKeySession.ahk
#Include .\IMFCdmSuspendNotify.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a media keys used for decrypting media data using a Digital Rights Management (DRM) key system.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediakeys
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeys extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeys
     * @type {Guid}
     */
    static IID => Guid("{5cb31c05-61ff-418f-afda-caaf41421a38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSession", "get_KeySystem", "Shutdown", "GetSuspendNotify"]

    /**
     * @type {BSTR} 
     */
    KeySystem {
        get => this.get_KeySystem()
    }

    /**
     * Creates a media key session object using the specified initialization data and custom data. .
     * @param {BSTR} mimeType The MIME type of the media container used for the content.
     * @param {Pointer} initData The initialization data for the key system.
     * @param {Integer} cb The count in bytes of <i>initData</i>.
     * @param {Pointer} customData Custom data sent to the key system.
     * @param {Integer} cbCustomData The count in bytes of <i>cbCustomData</i>.
     * @param {IMFMediaKeySessionNotify} notify notify
     * @returns {IMFMediaKeySession} The media key session.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeys-createsession
     */
    CreateSession(mimeType, initData, cb, customData, cbCustomData, notify) {
        mimeType := mimeType is String ? BSTR.Alloc(mimeType).Value : mimeType

        result := ComCall(3, this, "ptr", mimeType, "ptr", initData, "uint", cb, "ptr", customData, "uint", cbCustomData, "ptr", notify, "ptr*", &ppSession := 0, "HRESULT")
        return IMFMediaKeySession(ppSession)
    }

    /**
     * Gets the key system string the IMFMediaKeys object was created with.
     * @returns {BSTR} The string name of the key system.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeys-get_keysystem
     */
    get_KeySystem() {
        keySystem := BSTR()
        result := ComCall(4, this, "ptr", keySystem, "HRESULT")
        return keySystem
    }

    /**
     * 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeys-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets the suspend notify interface of the Content Decryption Module (CDM).
     * @returns {IMFCdmSuspendNotify} The suspend notify interface of the Content Decryption Module (CDM).
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeys-getsuspendnotify
     */
    GetSuspendNotify() {
        result := ComCall(6, this, "ptr*", &notify := 0, "HRESULT")
        return IMFCdmSuspendNotify(notify)
    }
}
