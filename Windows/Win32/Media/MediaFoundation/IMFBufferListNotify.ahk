#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables IMFSourceBufferList object to notify its clients of important state changes.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfbufferlistnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFBufferListNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFBufferListNotify
     * @type {Guid}
     */
    static IID => Guid("{24cd47f7-81d8-4785-adb2-af697a963cd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnAddSourceBuffer", "OnRemoveSourceBuffer"]

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfbufferlistnotify-onaddsourcebuffer
     */
    OnAddSourceBuffer() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfbufferlistnotify-onremovesourcebuffer
     */
    OnRemoveSourceBuffer() {
        ComCall(4, this)
    }
}
