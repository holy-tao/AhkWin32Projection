#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IMpeg2Stream interface represents a stream of MPEG-2 data. The IMpeg2Data::GetStreamOfSections method returns a pointer to this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2Stream)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nn-mpeg2data-impeg2stream
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMpeg2Stream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpeg2Stream
     * @type {Guid}
     */
    static IID => Guid("{400cc286-32a0-4ce4-9041-39571125a635}")

    /**
     * The class identifier for Mpeg2Stream
     * @type {Guid}
     */
    static CLSID => Guid("{f91d96c7-8509-4d0b-ab26-a0dd10904bb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SupplyDataBuffer"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} requestType 
     * @param {IMpeg2Data} pMpeg2Data 
     * @param {Pointer<MPEG_CONTEXT>} pContext 
     * @param {Integer} pid 
     * @param {Integer} tid 
     * @param {Pointer<MPEG2_FILTER>} pFilter 
     * @param {HANDLE} hDataReadyEvent 
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
    Initialize(requestType, pMpeg2Data, pContext, pid, tid, pFilter, hDataReadyEvent) {
        hDataReadyEvent := hDataReadyEvent is Win32Handle ? NumGet(hDataReadyEvent, "ptr") : hDataReadyEvent

        result := ComCall(3, this, "int", requestType, "ptr", pMpeg2Data, "ptr", pContext, "ushort", pid, "char", tid, "ptr", pFilter, "ptr", hDataReadyEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MPEG_STREAM_BUFFER>} pStreamBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2stream-supplydatabuffer
     */
    SupplyDataBuffer(pStreamBuffer) {
        result := ComCall(4, this, "ptr", pStreamBuffer, "HRESULT")
        return result
    }
}
