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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Int32>} hEvent 
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
        result := ComCall(3, this, "int*", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} hCall 
     * @param {Integer} dwReserved 
     * @param {Integer} dwMediaType 
     * @param {Pointer<IUnknown>} pOuterUnknown 
     * @param {Pointer<IUnknown>} ppStreamControl 
     * @returns {HRESULT} 
     */
    CreateMSPCall(hCall, dwReserved, dwMediaType, pOuterUnknown, ppStreamControl) {
        result := ComCall(5, this, "int*", hCall, "uint", dwReserved, "uint", dwMediaType, "ptr", pOuterUnknown, "ptr", ppStreamControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pStreamControl 
     * @returns {HRESULT} 
     */
    ShutdownMSPCall(pStreamControl) {
        result := ComCall(6, this, "ptr", pStreamControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pMSPCall 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     */
    ReceiveTSPData(pMSPCall, pBuffer, dwSize) {
        result := ComCall(7, this, "ptr", pMSPCall, "char*", pBuffer, "uint", dwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} pEventBuffer 
     * @returns {HRESULT} 
     */
    GetEvent(pdwSize, pEventBuffer) {
        result := ComCall(8, this, "uint*", pdwSize, "char*", pEventBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
