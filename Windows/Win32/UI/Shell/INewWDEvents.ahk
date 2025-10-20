#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWebWizardHost.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INewWDEvents extends IWebWizardHost{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INewWDEvents
     * @type {Guid}
     */
    static IID => Guid("{0751c551-7568-41c9-8e5b-e22e38919236}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PassportAuthenticate"]

    /**
     * 
     * @param {BSTR} bstrSignInUrl 
     * @param {Pointer<VARIANT_BOOL>} pvfAuthenitcated 
     * @returns {HRESULT} 
     */
    PassportAuthenticate(bstrSignInUrl, pvfAuthenitcated) {
        bstrSignInUrl := bstrSignInUrl is String ? BSTR.Alloc(bstrSignInUrl).Value : bstrSignInUrl

        result := ComCall(16, this, "ptr", bstrSignInUrl, "ptr", pvfAuthenitcated, "HRESULT")
        return result
    }
}
