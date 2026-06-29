#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IShellDispatch2.ahk" { IShellDispatch2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Extends the IShellDispatch2 object.
 * @remarks
 * The **IShellDispatch3** object has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * For a discussion of Windows services, see the [Services](../services/services.md) documentation.
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch3
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellDispatch3 extends IShellDispatch2 {
    /**
     * The interface identifier for IShellDispatch3
     * @type {Guid}
     */
    static IID := Guid("{177160ca-bb5a-411c-841d-bd38facdeaa0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellDispatch3 interfaces
    */
    struct Vtbl extends IShellDispatch2.Vtbl {
        AddToRecent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellDispatch3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch3-addtorecent
     */
    AddToRecent(varFile, bstrCategory) {
        bstrCategory := bstrCategory is String ? BSTR.Alloc(bstrCategory).Value : bstrCategory

        result := ComCall(39, this, VARIANT, varFile, BSTR, bstrCategory, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellDispatch3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddToRecent := CallbackCreate(GetMethod(implObj, "AddToRecent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddToRecent)
    }
}
