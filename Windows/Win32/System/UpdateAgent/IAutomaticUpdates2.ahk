#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutomaticUpdates.ahk

/**
 * Contains the functionality of Automatic Updates.
 * @remarks
 * 
  * You can create a new instance of this interface by using the AutomaticUpdates coclass. Use the 
  *     Microsoft.Update.AutoUpdate program identifier to create the object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdates2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdates2 extends IAutomaticUpdates{
    /**
     * The interface identifier for IAutomaticUpdates2
     * @type {Guid}
     */
    static IID => Guid("{4a2f5c31-cfd9-410e-b7fb-29a653973a0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<IAutomaticUpdatesResults>} retval 
     * @returns {HRESULT} 
     */
    get_Results(retval) {
        result := ComCall(14, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
