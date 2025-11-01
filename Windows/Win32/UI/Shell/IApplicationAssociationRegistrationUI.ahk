#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that launches an advanced association dialog box through which the user can customize their associations.
 * @remarks
 * 
  * Because <b>IApplicationAssociationRegistrationUI</b> is only supported for Windows Vista and later, applications that support earlier operating systems must use their preexisting code when running under those operating systems. Those applications should include a check for the operating system version to account for this.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iapplicationassociationregistrationui
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IApplicationAssociationRegistrationUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationAssociationRegistrationUI
     * @type {Guid}
     */
    static IID => Guid("{1f76a169-f994-40ac-8fc8-0959e8874710}")

    /**
     * The class identifier for ApplicationAssociationRegistrationUI
     * @type {Guid}
     */
    static CLSID => Guid("{1968106d-f3b5-44cf-890e-116fcb9ecef1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchAdvancedAssociationUI"]

    /**
     * 
     * @param {PWSTR} pszAppRegistryName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iapplicationassociationregistrationui-launchadvancedassociationui
     */
    LaunchAdvancedAssociationUI(pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(3, this, "ptr", pszAppRegistryName, "HRESULT")
        return result
    }
}
