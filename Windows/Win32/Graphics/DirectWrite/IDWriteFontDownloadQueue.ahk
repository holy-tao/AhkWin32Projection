#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Interface that enqueues download requests for remote fonts, characters, glyphs, and font fragments.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontdownloadqueue
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontDownloadQueue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontDownloadQueue
     * @type {Guid}
     */
    static IID => Guid("{b71e6052-5aea-4fa3-832e-f60d431f7e91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddListener", "RemoveListener", "IsEmpty", "BeginDownload", "CancelDownload", "GetGenerationCount"]

    /**
     * Registers a client-defined listener object that receives download notifications. All registered listener's DownloadCompleted will be called after BeginDownloadcompletes.
     * @param {IDWriteFontDownloadListener} listener Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontdownloadlistener">IDWriteFontDownloadListener</a>*</b>
     * 
     * Listener object to add.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives a token value, which the caller must subsequently pass to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-removelistener">RemoveListener</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-addlistener
     */
    AddListener(listener) {
        result := ComCall(3, this, "ptr", listener, "uint*", &token := 0, "HRESULT")
        return token
    }

    /**
     * Unregisters a notification handler that was previously registered using AddListener.
     * @param {Integer} token Type: <b>UINT32</b>
     * 
     * Token value previously returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-addlistener">AddListener</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-removelistener
     */
    RemoveListener(token) {
        result := ComCall(4, this, "uint", token, "HRESULT")
        return result
    }

    /**
     * Determines whether the download queue is empty. Note that the queue does not include requests that are already being downloaded. Calling BeginDownloadclears the queue.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * TRUE if the queue is empty, FALSE if there are requests pending for <a href="/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-begindownload">BeginDownload</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-isempty
     */
    IsEmpty() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Begins an asynchronous download operation. The download operation executes in the background until it completes or is cancelled by a CancelDownload call.
     * @param {IUnknown} context Type: <b>IUnknown*</b>
     * 
     * Optional context object that is passed back to the     
     *           download notification handler's DownloadCompleted method. If the context object  
     *           implements IDWriteFontDownloadListener, its DownloadCompleted will be called    
     *           when done.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     *  Returns S_OK if a download was successfully begun, S_FALSE if the queue was 
     *           empty, or a standard HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-begindownload
     */
    BeginDownload(context) {
        result := ComCall(6, this, "ptr", context, "HRESULT")
        return result
    }

    /**
     * Removes all download requests from the queue and cancels any active download operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-canceldownload
     */
    CancelDownload() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Gets the current generation number of the download queue, which is incremented every time after a download completes, whether failed or successful. This cookie value can be compared against cached data to determine if it is stale.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * The current generation number of the download queue.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-getgenerationcount
     */
    GetGenerationCount() {
        result := ComCall(8, this, "uint")
        return result
    }
}
