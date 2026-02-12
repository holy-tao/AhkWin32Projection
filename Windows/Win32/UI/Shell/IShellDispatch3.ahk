#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellDispatch2.ahk

/**
 * Extends the IShellDispatch2 object.
 * @remarks
 * The **IShellDispatch3** object has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * For a discussion of Windows services, see the [Services](../services/services.md) documentation.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch3
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
     * IShellDispatch3.AddToRecent method - Adds a file to the most recently used (MRU) list.
     * @param {VARIANT} varFile Type: **Variant**
     * 
     * A **String** that contains the path of the file to add to the list of recently used documents.
     * 
     * **Windows Vista**: Set this parameter to **null** to clear the recent documents folder.
     * @param {BSTR} bstrCategory Type: **[**BSTR**](/previous-versions/windows/desktop/automat/bstr)**
     * 
     * A **String** that contains the name of the category in which to place the file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/ishelldispatch3-addtorecent
     */
    AddToRecent(varFile, bstrCategory) {
        if(bstrCategory is String) {
            pin := BSTR.Alloc(bstrCategory)
            bstrCategory := pin.Value
        }

        result := ComCall(39, this, "ptr", varFile, "ptr", bstrCategory, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
