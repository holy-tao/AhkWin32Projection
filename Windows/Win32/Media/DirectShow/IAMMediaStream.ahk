#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaStream extends IMediaStream{
    /**
     * The interface identifier for IAMMediaStream
     * @type {Guid}
     */
    static IID => Guid("{bebe595d-9a6f-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IUnknown>} pSourceObject 
     * @param {Integer} dwFlags 
     * @param {Pointer<Guid>} PurposeId 
     * @param {Integer} StreamType 
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
    Initialize(pSourceObject, dwFlags, PurposeId, StreamType) {
        result := ComCall(9, this, "ptr", pSourceObject, "uint", dwFlags, "ptr", PurposeId, "int", StreamType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    SetState(State) {
        result := ComCall(10, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAMMultiMediaStream>} pAMMultiMediaStream 
     * @returns {HRESULT} 
     */
    JoinAMMultiMediaStream(pAMMultiMediaStream) {
        result := ComCall(11, this, "ptr", pAMMultiMediaStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaStreamFilter>} pMediaStreamFilter 
     * @returns {HRESULT} 
     */
    JoinFilter(pMediaStreamFilter) {
        result := ComCall(12, this, "ptr", pMediaStreamFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFilterGraph>} pFilterGraph 
     * @returns {HRESULT} 
     */
    JoinFilterGraph(pFilterGraph) {
        result := ComCall(13, this, "ptr", pFilterGraph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
