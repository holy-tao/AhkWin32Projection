#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITMSPAddress interface is implemented by the MSP and represents a media service provider to the TAPI DLL. It is not exposed to end-user or server applications. TAPI 3 will call CoCreateInstance on this interface to create the MSP object.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3/nn-tapi3-itmspaddress
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITMSPAddress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITMSPAddress
     * @type {Guid}
     */
    static IID => Guid("{ee3bd600-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Shutdown", "CreateMSPCall", "ShutdownMSPCall", "ReceiveTSPData", "GetEvent"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Integer>} hEvent 
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
    Initialize(hEvent) {
        hEventMarshal := hEvent is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hEventMarshal, hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itmspaddress-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hCall 
     * @param {Integer} dwReserved 
     * @param {Integer} dwMediaType 
     * @param {IUnknown} pOuterUnknown 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itmspaddress-createmspcall
     */
    CreateMSPCall(hCall, dwReserved, dwMediaType, pOuterUnknown) {
        hCallMarshal := hCall is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, hCallMarshal, hCall, "uint", dwReserved, "uint", dwMediaType, "ptr", pOuterUnknown, "ptr*", &ppStreamControl := 0, "HRESULT")
        return IUnknown(ppStreamControl)
    }

    /**
     * 
     * @param {IUnknown} pStreamControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itmspaddress-shutdownmspcall
     */
    ShutdownMSPCall(pStreamControl) {
        result := ComCall(6, this, "ptr", pStreamControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pMSPCall 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itmspaddress-receivetspdata
     */
    ReceiveTSPData(pMSPCall, pBuffer, dwSize) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pMSPCall, pBufferMarshal, pBuffer, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Integer>} pEventBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itmspaddress-getevent
     */
    GetEvent(pdwSize, pEventBuffer) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        pEventBufferMarshal := pEventBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pdwSizeMarshal, pdwSize, pEventBufferMarshal, pEventBuffer, "HRESULT")
        return result
    }
}
