#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellDispatch2.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch3 extends IShellDispatch2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddToRecent"]

    /**
     * 
     * @param {VARIANT} varFile 
     * @param {BSTR} bstrCategory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch3-addtorecent
     */
    AddToRecent(varFile, bstrCategory) {
        bstrCategory := bstrCategory is String ? BSTR.Alloc(bstrCategory).Value : bstrCategory

        result := ComCall(39, this, "ptr", varFile, "ptr", bstrCategory, "HRESULT")
        return result
    }
}
