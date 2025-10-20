#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumNetSharingEveryConnection interface provides methods for enumerating all the connections in the Connections folder.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-ienumnetsharingeveryconnection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IEnumNetSharingEveryConnection extends IUnknown{
    /**
     * The interface identifier for IEnumNetSharingEveryConnection
     * @type {Guid}
     */
    static IID => Guid("{c08956b8-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<VARIANT>} rgVar 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgVar, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgVar, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetSharingEveryConnection>} ppenum 
     * @returns {HRESULT} 
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
