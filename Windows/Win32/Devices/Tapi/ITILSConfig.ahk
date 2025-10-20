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
     * 
     * @param {Pointer<Int32>} pPort 
     * @returns {HRESULT} 
     */
    get_Port(pPort) {
        result := ComCall(7, this, "int*", pPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Port 
     * @returns {HRESULT} 
     */
    put_Port(Port) {
        result := ComCall(8, this, "int", Port, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
