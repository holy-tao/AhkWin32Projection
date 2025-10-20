#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Application-defined callback interface that receives notifications from the font download queue (IDWriteFontDownloadQueue interface).
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontdownloadlistener
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontDownloadListener extends IUnknown{
    /**
     * The interface identifier for IDWriteFontDownloadListener
     * @type {Guid}
     */
    static IID => Guid("{b06fe5b9-43ec-4393-881b-dbe4dc72fda7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDWriteFontDownloadQueue>} downloadQueue 
     * @param {Pointer<IUnknown>} context 
     * @param {HRESULT} downloadResult 
     * @returns {String} Nothing - always returns an empty string
     */
    DownloadCompleted(downloadQueue, context, downloadResult) {
        ComCall(3, this, "ptr", downloadQueue, "ptr", context, "int", downloadResult)
        return result
    }
}
