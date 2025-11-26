#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaKeys.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the media engine to add encrypted media extensions methods.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineeme
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineEME extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineEME
     * @type {Guid}
     */
    static IID => Guid("{50dc93e4-ba4f-4275-ae66-83e836e57469}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Keys", "SetMediaKeys"]

    /**
     * @type {IMFMediaKeys} 
     */
    Keys {
        get => this.get_Keys()
    }

    /**
     * Gets the media keys object associated with the media engine or null if there is not a media keys object.
     * @returns {IMFMediaKeys} The media keys object associated with the media engine or <b>null</b> if there is not a media keys object.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineeme-get_keys
     */
    get_Keys() {
        result := ComCall(3, this, "ptr*", &keys := 0, "HRESULT")
        return IMFMediaKeys(keys)
    }

    /**
     * Sets the media keys object to use with the media engine.
     * @param {IMFMediaKeys} keys The media keys.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineeme-setmediakeys
     */
    SetMediaKeys(keys) {
        result := ComCall(4, this, "ptr", keys, "HRESULT")
        return result
    }
}
