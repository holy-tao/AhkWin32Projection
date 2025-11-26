#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITILSConfig interface allows configuration of the ILS directory.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itilsconfig
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITILSConfig extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITILSConfig
     * @type {Guid}
     */
    static IID => Guid("{34621d72-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Port", "put_Port"]

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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itilsconfig-get_port
     */
    get_Port() {
        result := ComCall(7, this, "int*", &pPort := 0, "HRESULT")
        return pPort
    }

    /**
     * The put_Port method sets the port number used to connect to the server of a specified ILS directory.
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itilsconfig-put_port
     */
    put_Port(Port) {
        result := ComCall(8, this, "int", Port, "HRESULT")
        return result
    }
}
