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
     * The Initialize method is called when the MSP is loaded.
     * @param {Pointer<Integer>} hEvent TAPI 3's handle for this MSP.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itmspaddress-initialize
     */
    Initialize(hEvent) {
        hEventMarshal := hEvent is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hEventMarshal, hEvent, "HRESULT")
        return result
    }

    /**
     * The Shutdown method is called when the MSP is unloaded. Shutdown will be called once per address object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itmspaddress-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The CreateMSPCall method creates an MSP Call object. TAPI aggregates this onto the main Call object and exposes the ITStreamControl interface.
     * @param {Pointer<Integer>} hCall Handle for this MSP.
     * @param {Integer} dwReserved Reserved value – will be 0.
     * @param {Integer} dwMediaType Indicates 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> required for the call.
     * @param {IUnknown} pOuterUnknown The pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the TAPI 3 call object. Since the MSP Call object is aggregated in the TAPI 3 call object, it needs to know the outer <b>IUnknown</b>.
     * @returns {IUnknown} Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstreamcontrol">ITStreamControl</a> interface for newly created call.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itmspaddress-createmspcall
     */
    CreateMSPCall(hCall, dwReserved, dwMediaType, pOuterUnknown) {
        hCallMarshal := hCall is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, hCallMarshal, hCall, "uint", dwReserved, "uint", dwMediaType, "ptr", pOuterUnknown, "ptr*", &ppStreamControl := 0, "HRESULT")
        return IUnknown(ppStreamControl)
    }

    /**
     * The ShutdownMSPCall method is called when the call object is being destroyed.
     * @param {IUnknown} pStreamControl Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the call's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstreamcontrol">ITStreamControl</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pStreamControl</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pStreamControl</i> parameter does not point to a valid 
     * <a href="/windows/desktop/api/tapi3if/nn-tapi3if-itstreamcontrol">ITStreamControl</a> interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itmspaddress-shutdownmspcall
     */
    ShutdownMSPCall(pStreamControl) {
        result := ComCall(6, this, "ptr", pStreamControl, "HRESULT")
        return result
    }

    /**
     * The ReceiveTSPData method is called by TAPI 3 when the TSP sends asynchronous data to the MSP.
     * @param {IUnknown} pMSPCall Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the MSP Call object.
     * @param {Pointer<Integer>} pBuffer [in, size_is(<i>dwSize</i>)] Pointer to opaque buffer from the TSP.
     * @param {Integer} dwSize Size, in bytes, of <i>pBuffer</i>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pMSPCall</i> or <i>pBuffer</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pMSPCall</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pMSPCall</i> parameter does not point to a valid interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itmspaddress-receivetspdata
     */
    ReceiveTSPData(pMSPCall, pBuffer, dwSize) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pMSPCall, pBufferMarshal, pBuffer, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * Retrieves event information.
     * @param {Pointer<Integer>} pdwSize A pointer to a DWORD that contains the size, in bytes, of <i>pEventBuffer</i>.   On success, <i>pdwSize</i> returns the actual number of bytes in  <i>pEventBuffer</i>. If <i>pEventBuffer</i> is not large enough, the method returns <b>TAPI_E_NOTENOUGHMEMORY</b> and 
     *     this parameter returns the number, in bytes, required.
     * @param {Pointer<Integer>} pEventBuffer [in, out, size_is(*<i>pdwSize</i>)] A pointer to buffer that contains 
     * <a href="https://docs.microsoft.com/windows/win32/api/msp/ns-msp-msp_event_info">MSP event_info</a> information.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSize</i> or <i>pEventBuffer</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTENOUGHMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSize</i> parameter was not large enough for the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOEVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No event has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itmspaddress-getevent
     */
    GetEvent(pdwSize, pEventBuffer) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        pEventBufferMarshal := pEventBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pdwSizeMarshal, pdwSize, pEventBufferMarshal, pEventBuffer, "HRESULT")
        return result
    }
}
