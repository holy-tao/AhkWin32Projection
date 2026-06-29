#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IComponentAuthenticate interface provides secure, encrypted communication between modules of Windows Media Device Manager.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-icomponentauthenticate
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IComponentAuthenticate extends IUnknown {
    /**
     * The interface identifier for IComponentAuthenticate
     * @type {Guid}
     */
    static IID := Guid("{a9889c00-6d2b-11d3-8496-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComponentAuthenticate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SACAuth         : IntPtr
        SACGetProtocols : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComponentAuthenticate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SACAuth method establishes a secure authenticated channel between components.
     * @remarks
     * This method is called only by service providers. It is called one or more times as dictated by the protocol identifier.
     * 
     * The structure of the data in <i>pbDataIn</i> and <i>ppbDataOut</i> is determined by the values of <i>dwProtocolID</i> and <i>dwPass</i>.
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-icomponentauthenticate-sacauth
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
     * @remarks
     * This method is implemented by a service provider, and never called by an application.
     * @param {Pointer<Pointer<Integer>>} ppdwProtocols Pointer to an array of supported protocols. For this version of Windows Media Device Manager, it is a single-element <b>DWORD</b> array containing the value SAC_PROTOCOL_V1.
     * @param {Pointer<Integer>} pdwProtocolCount Pointer to a <b>DWORD</b> containing the number of protocols returned in <i>ppdwProtocols</i>. The number is always 1 for this version.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-icomponentauthenticate-sacgetprotocols
     */
    SACGetProtocols(ppdwProtocols, pdwProtocolCount) {
        ppdwProtocolsMarshal := ppdwProtocols is VarRef ? "ptr*" : "ptr"
        pdwProtocolCountMarshal := pdwProtocolCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ppdwProtocolsMarshal, ppdwProtocols, pdwProtocolCountMarshal, pdwProtocolCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComponentAuthenticate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SACAuth := CallbackCreate(GetMethod(implObj, "SACAuth"), flags, 7)
        this.vtbl.SACGetProtocols := CallbackCreate(GetMethod(implObj, "SACGetProtocols"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SACAuth)
        CallbackFree(this.vtbl.SACGetProtocols)
    }
}
