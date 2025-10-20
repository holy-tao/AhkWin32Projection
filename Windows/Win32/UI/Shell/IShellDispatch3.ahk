#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellDispatch2.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch3 extends IShellDispatch2{
    /**
     * The interface identifier for IShellDispatch3
     * @type {Guid}
     */
    static IID => Guid("{177160ca-bb5a-411c-841d-bd38facdeaa0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 39

    /**
     * 
     * @param {VARIANT} varFile 
     * @param {BSTR} bstrCategory 
     * @returns {HRESULT} 
     */
    AddToRecent(varFile, bstrCategory) {
        bstrCategory := bstrCategory is String ? BSTR.Alloc(bstrCategory).Value : bstrCategory

        result := ComCall(39, this, "ptr", varFile, "ptr", bstrCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
