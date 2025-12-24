#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality for raising events associated with IMFMediaSourceExtension.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediasourceextensionnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourceExtensionNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSourceExtensionNotify
     * @type {Guid}
     */
    static IID => Guid("{a7901327-05dd-4469-a7b7-0e01979e361d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSourceOpen", "OnSourceEnded", "OnSourceClose"]

    /**
     * Used to indicate that the media source has opened.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextensionnotify-onsourceopen
     */
    OnSourceOpen() {
        ComCall(3, this)
    }

    /**
     * Used to indicate that the media source has ended.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextensionnotify-onsourceended
     */
    OnSourceEnded() {
        ComCall(4, this)
    }

    /**
     * Used to indicate that the media source has closed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextensionnotify-onsourceclose
     */
    OnSourceClose() {
        ComCall(5, this)
    }
}
