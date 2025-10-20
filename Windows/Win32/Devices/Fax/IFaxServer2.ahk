#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxServer.ahk

/**
 * Inherits all the functionality of the IFaxServer interface and adds read-only properties for the server's configuration, account management, security objects, and the current account.
 * @remarks
 * 
  * In Windows Vista and later, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object provides a default implementation of the interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxserver2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxServer2 extends IFaxServer{
    /**
     * The interface identifier for IFaxServer2
     * @type {Guid}
     */
    static IID => Guid("{571ced0f-5609-4f40-9176-547e3a72ca7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * 
     * @param {Pointer<IFaxConfiguration>} ppFaxConfiguration 
     * @returns {HRESULT} 
     */
    get_Configuration(ppFaxConfiguration) {
        result := ComCall(33, this, "ptr", ppFaxConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccount>} ppCurrentAccount 
     * @returns {HRESULT} 
     */
    get_CurrentAccount(ppCurrentAccount) {
        result := ComCall(34, this, "ptr", ppCurrentAccount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccountSet>} ppFaxAccountSet 
     * @returns {HRESULT} 
     */
    get_FaxAccountSet(ppFaxAccountSet) {
        result := ComCall(35, this, "ptr", ppFaxAccountSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxSecurity2>} ppFaxSecurity2 
     * @returns {HRESULT} 
     */
    get_Security2(ppFaxSecurity2) {
        result := ComCall(36, this, "ptr", ppFaxSecurity2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
