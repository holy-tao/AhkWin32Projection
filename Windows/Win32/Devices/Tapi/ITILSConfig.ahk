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
     * 
     * @param {Pointer<Integer>} pPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itilsconfig-get_port
     */
    get_Port(pPort) {
        pPortMarshal := pPort is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pPortMarshal, pPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Port 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itilsconfig-put_port
     */
    put_Port(Port) {
        result := ComCall(8, this, "int", Port, "HRESULT")
        return result
    }
}
