#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IComponentAuthenticate interface provides secure, encrypted communication between modules of Windows Media Device Manager.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-icomponentauthenticate
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IComponentAuthenticate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentAuthenticate
     * @type {Guid}
     */
    static IID => Guid("{a9889c00-6d2b-11d3-8496-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SACAuth", "SACGetProtocols"]

    /**
     * The SACAuth method establishes a secure authenticated channel between components.
     * @param {Integer} dwProtocolID <b>DWORD</b> containing the protocol identifier. For this version of Windows Media Device Manager, always set this parameter to SAC_PROTOCOL_V1.
     * @param {Integer} dwPass <b>DWORD</b> containing the number of the current communication pass. A pass consists of two messages, one in each direction. SAC_PROTOCOL_V1 is a two-pass protocol, and the passes are numbered 0 and 1.
     * @param {Pointer<Integer>} pbDataIn Pointer to the input data.
     * @param {Integer} dwDataInLen <b>DWORD</b> containing the length of the data to which <i>pbDataIn</i> points.
     * @param {Pointer<Pointer<Integer>>} ppbDataOut Pointer to a pointer to the output data.
     * @param {Pointer<Integer>} pdwDataOutLen Pointer to a <b>DWORD</b> containing the length of the data to which <i>ppbDataOut</i> points.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-icomponentauthenticate-sacauth
     */
    SACAuth(dwProtocolID, dwPass, pbDataIn, dwDataInLen, ppbDataOut, pdwDataOutLen) {
        pbDataInMarshal := pbDataIn is VarRef ? "char*" : "ptr"
        ppbDataOutMarshal := ppbDataOut is VarRef ? "ptr*" : "ptr"
        pdwDataOutLenMarshal := pdwDataOutLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwProtocolID, "uint", dwPass, pbDataInMarshal, pbDataIn, "uint", dwDataInLen, ppbDataOutMarshal, ppbDataOut, pdwDataOutLenMarshal, pdwDataOutLen, "HRESULT")
        return result
    }

    /**
     * The SACGetProtocols method is used by a component to discover the authentication protocols supported by another component.
     * @param {Pointer<Pointer<Integer>>} ppdwProtocols Pointer to an array of supported protocols. For this version of Windows Media Device Manager, it is a single-element <b>DWORD</b> array containing the value SAC_PROTOCOL_V1.
     * @param {Pointer<Integer>} pdwProtocolCount Pointer to a <b>DWORD</b> containing the number of protocols returned in <i>ppdwProtocols</i>. The number is always 1 for this version.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-icomponentauthenticate-sacgetprotocols
     */
    SACGetProtocols(ppdwProtocols, pdwProtocolCount) {
        ppdwProtocolsMarshal := ppdwProtocols is VarRef ? "ptr*" : "ptr"
        pdwProtocolCountMarshal := pdwProtocolCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ppdwProtocolsMarshal, ppdwProtocols, pdwProtocolCountMarshal, pdwProtocolCount, "HRESULT")
        return result
    }
}
