#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferRecComp interface is used to create new content recordings by concatenating existing recordings. The new recording can be created from a mix of reference and content recordings.The Stream Buffer RecComp object exposes this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferRecComp)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferreccomp
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferRecComp extends IUnknown{
    /**
     * The interface identifier for IStreamBufferRecComp
     * @type {Guid}
     */
    static IID => Guid("{9e259a9b-8815-42ae-b09f-221970b154fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszTargetFilename 
     * @param {PWSTR} pszSBRecProfileRef 
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
    Initialize(pszTargetFilename, pszSBRecProfileRef) {
        pszTargetFilename := pszTargetFilename is String ? StrPtr(pszTargetFilename) : pszTargetFilename
        pszSBRecProfileRef := pszSBRecProfileRef is String ? StrPtr(pszSBRecProfileRef) : pszSBRecProfileRef

        result := ComCall(3, this, "ptr", pszTargetFilename, "ptr", pszSBRecProfileRef, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSBRecording 
     * @returns {HRESULT} 
     */
    Append(pszSBRecording) {
        pszSBRecording := pszSBRecording is String ? StrPtr(pszSBRecording) : pszSBRecording

        result := ComCall(4, this, "ptr", pszSBRecording, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSBRecording 
     * @param {Integer} rtStart 
     * @param {Integer} rtStop 
     * @returns {HRESULT} 
     */
    AppendEx(pszSBRecording, rtStart, rtStop) {
        pszSBRecording := pszSBRecording is String ? StrPtr(pszSBRecording) : pszSBRecording

        result := ComCall(5, this, "ptr", pszSBRecording, "int64", rtStart, "int64", rtStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcSeconds 
     * @returns {HRESULT} 
     */
    GetCurrentLength(pcSeconds) {
        result := ComCall(6, this, "uint*", pcSeconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
