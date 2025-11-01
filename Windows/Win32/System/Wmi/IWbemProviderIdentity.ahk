#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemProviderIdentity interface is implemented by an event provider if the provider registers itself using more than one Name (multiple instances of __Win32Provider) with the same CLSID value.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemprovideridentity
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemProviderIdentity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemProviderIdentity
     * @type {Guid}
     */
    static IID => Guid("{631f7d97-d993-11d2-b339-00105a1f4aaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRegistrationObject"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWbemClassObject} pProvReg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemprovideridentity-setregistrationobject
     */
    SetRegistrationObject(lFlags, pProvReg) {
        result := ComCall(3, this, "int", lFlags, "ptr", pProvReg, "HRESULT")
        return result
    }
}
