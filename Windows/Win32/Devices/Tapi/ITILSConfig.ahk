#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITILSConfig interface allows configuration of the ILS directory.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-itilsconfig
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITILSConfig extends IDispatch {
    /**
     * The interface identifier for ITILSConfig
     * @type {Guid}
     */
    static IID := Guid("{34621d72-6cff-11d1-aff7-00c04fc31fee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITILSConfig interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Port : IntPtr
        put_Port : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITILSConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Port {
        get => this.get_Port()
        set => this.put_Port(value)
    }

    /**
     * The get_Port method gets the port number used to connect to the server of a given ILS directory.
     * @returns {Integer} Pointer to receive the port number used in the connection.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itilsconfig-get_port
     */
    get_Port() {
        result := ComCall(7, this, "int*", &pPort := 0, "HRESULT")
        return pPort
    }

    /**
     * The put_Port method sets the port number used to connect to the server of a specified ILS directory.
     * @remarks
     * Applications use this method only if they need to connect to custom-configured ILS servers listening on strange ports that are not listed in the Active Directory. By default, the Rendezvous control automatically tries to use ports 1002 and 389, the usual ILS ports, for connecting to application-specified ILS servers. Also, the Rendezvous control automatically uses whatever port is published in the Active Directory for ILS servers retrieved from there.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {Integer} Port The port number that will be used to connect to the server. This can be any port number in the range of 16-bit unsigned integers.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Port</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RND_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A successful connection has been made. Port cannot be reset.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itilsconfig-put_port
     */
    put_Port(Port) {
        result := ComCall(8, this, "int", Port, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITILSConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Port := CallbackCreate(GetMethod(implObj, "get_Port"), flags, 2)
        this.vtbl.put_Port := CallbackCreate(GetMethod(implObj, "put_Port"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Port)
        CallbackFree(this.vtbl.put_Port)
    }
}
