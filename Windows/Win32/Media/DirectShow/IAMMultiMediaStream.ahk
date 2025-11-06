#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include .\IMediaStreamFilter.ahk
#Include .\IMediaStream.ahk
#Include .\IMultiMediaStream.ahk

/**
 * Note  This interface is deprecated. New applications should not use it. The IAMMultiMediaStream interface is supported by the multimedia stream object. It contains methods for creating the underlying filter graph that the object manages.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammultimediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMultiMediaStream extends IMultiMediaStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMultiMediaStream
     * @type {Guid}
     */
    static IID => Guid("{bebe595c-9a6f-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetFilterGraph", "GetFilter", "AddMediaStream", "OpenFile", "OpenMoniker", "Render"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} StreamType 
     * @param {Integer} dwFlags 
     * @param {IGraphBuilder} pFilterGraph 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(StreamType, dwFlags, pFilterGraph) {
        result := ComCall(12, this, "int", StreamType, "uint", dwFlags, "ptr", pFilterGraph, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IGraphBuilder} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-getfiltergraph
     */
    GetFilterGraph() {
        result := ComCall(13, this, "ptr*", &ppGraphBuilder := 0, "HRESULT")
        return IGraphBuilder(ppGraphBuilder)
    }

    /**
     * 
     * @returns {IMediaStreamFilter} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-getfilter
     */
    GetFilter() {
        result := ComCall(14, this, "ptr*", &ppFilter := 0, "HRESULT")
        return IMediaStreamFilter(ppFilter)
    }

    /**
     * 
     * @param {IUnknown} pStreamObject 
     * @param {Pointer<Guid>} PurposeId 
     * @param {Integer} dwFlags 
     * @returns {IMediaStream} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-addmediastream
     */
    AddMediaStream(pStreamObject, PurposeId, dwFlags) {
        result := ComCall(15, this, "ptr", pStreamObject, "ptr", PurposeId, "uint", dwFlags, "ptr*", &ppNewStream := 0, "HRESULT")
        return IMediaStream(ppNewStream)
    }

    /**
     * Creates, opens, reopens, or deletes a file.
     * @param {PWSTR} pszFileName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} If the function succeeds, the return value specifies a file handle to use when performing file I/O. To close the file, call the <a href="/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function using this handle.
     * 
     * If the function fails, the return value is <b>HFILE_ERROR</b>. To get extended error 
     *        information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openfile
     */
    OpenFile(pszFileName, dwFlags) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(16, this, "ptr", pszFileName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBindCtx} pCtx 
     * @param {IMoniker} pMoniker 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-openmoniker
     */
    OpenMoniker(pCtx, pMoniker, dwFlags) {
        result := ComCall(17, this, "ptr", pCtx, "ptr", pMoniker, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-render
     */
    Render(dwFlags) {
        result := ComCall(18, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
