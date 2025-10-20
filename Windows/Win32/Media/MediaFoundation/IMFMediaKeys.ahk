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
     * 
     * @param {BSTR} mimeType 
     * @param {Pointer} initData 
     * @param {Integer} cb 
     * @param {Pointer} customData 
     * @param {Integer} cbCustomData 
     * @param {Pointer<IMFMediaKeySessionNotify>} notify 
     * @param {Pointer<IMFMediaKeySession>} ppSession 
     * @returns {HRESULT} 
     */
    CreateSession(mimeType, initData, cb, customData, cbCustomData, notify, ppSession) {
        mimeType := mimeType is String ? BSTR.Alloc(mimeType).Value : mimeType

        result := ComCall(3, this, "ptr", mimeType, "ptr", initData, "uint", cb, "ptr", customData, "uint", cbCustomData, "ptr", notify, "ptr", ppSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} keySystem 
     * @returns {HRESULT} 
     */
    get_KeySystem(keySystem) {
        result := ComCall(4, this, "ptr", keySystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFCdmSuspendNotify>} notify 
     * @returns {HRESULT} 
     */
    GetSuspendNotify(notify) {
        result := ComCall(6, this, "ptr", notify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
