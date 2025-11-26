#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {BSTR} 
     */
    ComputerName {
        get => this.get_ComputerName()
    }

    /**
     * @type {BSTR} 
     */
    DomainName {
        get => this.get_DomainName()
    }

    /**
     * @type {BSTR} 
     */
    PDC {
        get => this.get_PDC()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserName() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ComputerName() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainName() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PDC() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return retval
    }
}
