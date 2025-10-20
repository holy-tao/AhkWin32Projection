#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * Use this interface to combine several data streams into a single stream.
 * @remarks
 * 
  * To create the  MsftStreamConcatenate object in a script, use IMAPI2.MsftStreamConcatenate as the program identifier when calling CreateObject.
  * 
  * When using this interface, the following  scenarios will result in undefined behaviors, and should be avoided:
  * 
  * <ul>
  * <li>Each partial stream composing the MsftStreamConcatenate object is actually the same stream.</li>
  * <li>Any of the concatenated streams are modified (read from, written to, or seeked on) outside of IMAPI.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-istreamconcatenate
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IStreamConcatenate extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamConcatenate
     * @type {Guid}
     */
    static IID => Guid("{27354146-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Initialize2", "Append", "Append2"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IStream} stream1 
     * @param {IStream} stream2 
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
    Initialize(stream1, stream2) {
        result := ComCall(14, this, "ptr", stream1, "ptr", stream2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} streams 
     * @param {Integer} streamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreamconcatenate-initialize2
     */
    Initialize2(streams, streamCount) {
        result := ComCall(15, this, "ptr*", streams, "uint", streamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreamconcatenate-append
     */
    Append(stream) {
        result := ComCall(16, this, "ptr", stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} streams 
     * @param {Integer} streamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreamconcatenate-append2
     */
    Append2(streams, streamCount) {
        result := ComCall(17, this, "ptr*", streams, "uint", streamCount, "HRESULT")
        return result
    }
}
