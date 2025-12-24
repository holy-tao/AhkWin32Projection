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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DownloadCompleted"]

    /**
     * The DownloadCompleted method is called back on an arbitrary thread when a download operation ends.
     * @param {IDWriteFontDownloadQueue} downloadQueue Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontdownloadqueue">IDWriteFontDownloadQueue</a>*</b>
     * 
     * Pointer to the download queue interface on which     
     *           the BeginDownload method was called.
     * @param {IUnknown} context Type: <b>IUnknown*</b>
     * 
     * Optional context object that was passed to BeginDownload.    
     *           AddRef is called on the context object by BeginDownload and Release is called  
     *           after the DownloadCompleted method returns.
     * @param {HRESULT} downloadResult Type: <b>HRESULT</b>
     * 
     * Result of the download operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontdownloadlistener-downloadcompleted
     */
    DownloadCompleted(downloadQueue, context, downloadResult) {
        ComCall(3, this, "ptr", downloadQueue, "ptr", context, "int", downloadResult)
    }
}
