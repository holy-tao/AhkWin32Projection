#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface for the IMFPMediaPlayer interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/nn-mfplay-imfpmediaplayercallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMediaPlayerCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMediaPlayerCallback
     * @type {Guid}
     */
    static IID => Guid("{766c8ffb-5fdb-4fea-a28d-b912996f51bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMediaPlayerEvent"]

    /**
     * 
     * @param {Pointer<MFP_EVENT_HEADER>} pEventHeader 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent
     */
    OnMediaPlayerEvent(pEventHeader) {
        ComCall(3, this, "ptr", pEventHeader)
    }
}
