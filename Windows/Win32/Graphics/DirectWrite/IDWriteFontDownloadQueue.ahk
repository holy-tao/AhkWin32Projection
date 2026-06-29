#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontDownloadListener.ahk" { IDWriteFontDownloadListener }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Interface that enqueues download requests for remote fonts, characters, glyphs, and font fragments.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontdownloadqueue
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontDownloadQueue extends IUnknown {
    /**
     * The interface identifier for IDWriteFontDownloadQueue
     * @type {Guid}
     */
    static IID := Guid("{b71e6052-5aea-4fa3-832e-f60d431f7e91}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontDownloadQueue interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddListener        : IntPtr
        RemoveListener     : IntPtr
        IsEmpty            : IntPtr
        BeginDownload      : IntPtr
        CancelDownload     : IntPtr
        GetGenerationCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontDownloadQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a client-defined listener object that receives download notifications. All registered listener's DownloadCompleted will be called after BeginDownloadcompletes.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontdownloadlistener">IDWriteFontDownloadListener</a> can also be passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-begindownload">BeginDownload</a> 
     *       using the context parameter, rather than globally registered to the queue.
     * @param {IDWriteFontDownloadListener} listener Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontdownloadlistener">IDWriteFontDownloadListener</a>*</b>
     * 
     * Listener object to add.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Receives a token value, which the caller must subsequently pass to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-removelistener">RemoveListener</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-addlistener
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-removelistener
     */
    RemoveListener(token) {
        result := ComCall(4, this, "uint", token, "HRESULT")
        return result
    }

    /**
     * Determines whether the download queue is empty. Note that the queue does not include requests that are already being downloaded. Calling BeginDownloadclears the queue.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * TRUE if the queue is empty, FALSE if there are requests pending for <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-begindownload">BeginDownload</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-isempty
     */
    IsEmpty() {
        result := ComCall(5, this, BOOL)
        return result
    }

    /**
     * Begins an asynchronous download operation. The download operation executes in the background until it completes or is cancelled by a CancelDownload call.
     * @remarks
     * BeginDownload removes all download requests from the queue, transferring them   
     *       to a background download operation. If any previous downloads are still ongoing     
     *       when BeginDownload is called again, the new download does not complete until     
     *       the previous downloads have finished.
     * @param {IUnknown} _context Type: <b>IUnknown*</b>
     * 
     * Optional context object that is passed back to the     
     *           download notification handler's DownloadCompleted method. If the context object  
     *           implements IDWriteFontDownloadListener, its DownloadCompleted will be called    
     *           when done.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     *  Returns S_OK if a download was successfully begun, S_FALSE if the queue was 
     *           empty, or a standard HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-begindownload
     */
    BeginDownload(_context) {
        result := ComCall(6, this, "ptr", _context, "HRESULT")
        return result
    }

    /**
     * Removes all download requests from the queue and cancels any active download operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-canceldownload
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-getgenerationcount
     */
    GetGenerationCount() {
        result := ComCall(8, this, Int64)
        return result
    }

    Query(iid) {
        if (IDWriteFontDownloadQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddListener := CallbackCreate(GetMethod(implObj, "AddListener"), flags, 3)
        this.vtbl.RemoveListener := CallbackCreate(GetMethod(implObj, "RemoveListener"), flags, 2)
        this.vtbl.IsEmpty := CallbackCreate(GetMethod(implObj, "IsEmpty"), flags, 1)
        this.vtbl.BeginDownload := CallbackCreate(GetMethod(implObj, "BeginDownload"), flags, 2)
        this.vtbl.CancelDownload := CallbackCreate(GetMethod(implObj, "CancelDownload"), flags, 1)
        this.vtbl.GetGenerationCount := CallbackCreate(GetMethod(implObj, "GetGenerationCount"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddListener)
        CallbackFree(this.vtbl.RemoveListener)
        CallbackFree(this.vtbl.IsEmpty)
        CallbackFree(this.vtbl.BeginDownload)
        CallbackFree(this.vtbl.CancelDownload)
        CallbackFree(this.vtbl.GetGenerationCount)
    }
}
