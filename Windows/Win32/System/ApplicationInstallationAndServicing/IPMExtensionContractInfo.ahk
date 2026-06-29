#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class IPMExtensionContractInfo extends IUnknown {

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InvocationInfo"]

    /**
     * 
     * @param {Pointer<BSTR>} pAUMID 
     * @param {Pointer<BSTR>} pArgs 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pAUMID, pArgs) {
        result := ComCall(3, this, "ptr", pAUMID, "ptr", pArgs, "HRESULT")
        return result
    }
}
