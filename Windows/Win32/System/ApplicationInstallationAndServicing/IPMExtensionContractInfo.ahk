#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionContractInfo extends IUnknown{
    /**
     * The interface identifier for IPMExtensionContractInfo
     * @type {Guid}
     */
    static IID => Guid("{e5666373-7ba1-467c-b819-b175db1c295b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pAUMID 
     * @param {Pointer<BSTR>} pArgs 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pAUMID, pArgs) {
        result := ComCall(3, this, "ptr", pAUMID, "ptr", pArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
