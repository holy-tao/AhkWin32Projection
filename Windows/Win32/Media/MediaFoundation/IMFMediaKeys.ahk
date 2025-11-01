#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} mimeType 
     * @param {Pointer} initData 
     * @param {Integer} cb 
     * @param {Pointer} customData 
     * @param {Integer} cbCustomData 
     * @param {IMFMediaKeySessionNotify} notify 
     * @param {Pointer<IMFMediaKeySession>} ppSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-createsession
     */
    CreateSession(mimeType, initData, cb, customData, cbCustomData, notify, ppSession) {
        mimeType := mimeType is String ? BSTR.Alloc(mimeType).Value : mimeType

        result := ComCall(3, this, "ptr", mimeType, "ptr", initData, "uint", cb, "ptr", customData, "uint", cbCustomData, "ptr", notify, "ptr*", ppSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} keySystem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-get_keysystem
     */
    get_KeySystem(keySystem) {
        result := ComCall(4, this, "ptr", keySystem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFCdmSuspendNotify>} notify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-getsuspendnotify
     */
    GetSuspendNotify(notify) {
        result := ComCall(6, this, "ptr*", notify, "HRESULT")
        return result
    }
}
