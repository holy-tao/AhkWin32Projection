#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Locates and chooses ADAM principals in Authorization Manager.
 * @remarks
 * 
  * An <b>IAzPrincipalLocator</b> object can contain a name resolver and an object picker. A name resolver translates <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs) into display names. An object picker displays a dialog box that enables a user to select from a list of ADAM principals. The dialog box can appear when a user modifies application groups or roles through the Authorization Manager user interface.
  * 
  * The <b>IAzPrincipalLocator</b> interface must be registered under the following key. <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>AzMan</b>&#92;<b>ObjectPicker</b></p>Under this registry key, create a subkey with a value of the COM class ID of the <b>IAzPrincipalLocator</b> interface. Authorization Manager supports only one registered principal locator.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazprincipallocator
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzPrincipalLocator extends IDispatch{
    /**
     * The interface identifier for IAzPrincipalLocator
     * @type {Guid}
     */
    static IID => Guid("{e5c3507d-ad6a-4992-9c7f-74ab480b44cc}")

    /**
     * The class identifier for AzPrincipalLocator
     * @type {Guid}
     */
    static CLSID => Guid("{483afb5d-70df-4e16-abdc-a1de4d015a3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IAzNameResolver>} ppNameResolver 
     * @returns {HRESULT} 
     */
    get_NameResolver(ppNameResolver) {
        result := ComCall(7, this, "ptr", ppNameResolver, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzObjectPicker>} ppObjectPicker 
     * @returns {HRESULT} 
     */
    get_ObjectPicker(ppObjectPicker) {
        result := ComCall(8, this, "ptr", ppObjectPicker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
