#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsWinNTSystemInfo interface retrieves the WinNT system information about a computer. Such system information includes user account name, user domain, host name, and the primary domain controller of the host computer.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadswinntsysteminfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsWinNTSystemInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsWinNTSystemInfo
     * @type {Guid}
     */
    static IID => Guid("{6c6d65dc-afd1-11d2-9cb9-0000f87a369e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserName", "get_ComputerName", "get_DomainName", "get_PDC"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_UserName(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ComputerName(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_DomainName(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PDC(retval) {
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return result
    }
}
