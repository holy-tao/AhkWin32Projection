#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * Use this interface to combine several data streams into a single stream by alternately interspersing portions of each.
 * @remarks
 * 
  * To create the <b>MsftStreamInterleave</b> object in a script, use IMAPI2.MsftStreamInterleave as the program identifier when calling <b>CreateObject</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-istreaminterleave
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IStreamInterleave extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamInterleave
     * @type {Guid}
     */
    static IID => Guid("{27354147-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IStream>} streams 
     * @param {Pointer<Integer>} interleaveSizes 
     * @param {Integer} streamCount 
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
    Initialize(streams, interleaveSizes, streamCount) {
        result := ComCall(14, this, "ptr*", streams, "uint*", interleaveSizes, "uint", streamCount, "HRESULT")
        return result
    }
}
