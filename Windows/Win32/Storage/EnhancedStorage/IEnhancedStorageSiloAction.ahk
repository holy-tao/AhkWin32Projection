#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface as a point of access for actions involving IEEE 1667 silos.
 * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nn-ehstorapi-ienhancedstoragesiloaction
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct IEnhancedStorageSiloAction extends IUnknown {
    /**
     * The interface identifier for IEnhancedStorageSiloAction
     * @type {Guid}
     */
    static IID := Guid("{b6f7f311-206f-4ff8-9c4b-27efee77a86f}")

    /**
     * The class identifier for EnhancedStorageSiloAction
     * @type {Guid}
     */
    static CLSID := Guid("{886d29dd-b506-466b-9fbf-b44ff383fb3f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnhancedStorageSiloAction interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName        : IntPtr
        GetDescription : IntPtr
        Invoke         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnhancedStorageSiloAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a string for the name of the action specified by the IEnhancedStorageSiloAction object.
     * @remarks
     * A name string is short, consisting of one or two words, and is suitable for display in a UI element such as a menu item or button label.
     * 
     * When the caller no longer requires access to the string, this buffer must be freed by passing this pointer to <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Pointer to a string that represents the silo action by name.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &ppwszActionName := 0, "HRESULT")
        return ppwszActionName
    }

    /**
     * Returns a descriptive string for the action specified by the IEnhancedStorageSiloAction object.
     * @remarks
     * The description string is brief, consisting of one or two short sentences, and is suitable for display in a UI element such as tooltip or small static text box.
     * 
     * When the caller no longer requires access to the string, this buffer must be freed by passing this pointer to <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Pointer to a string that describes the silo action.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-getdescription
     */
    GetDescription() {
        result := ComCall(4, this, PWSTR.Ptr, &ppwszActionDescription := 0, "HRESULT")
        return ppwszActionDescription
    }

    /**
     * Performs the action specified by an IEnhancedStorageSiloAction object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action was invoked successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-invoke
     */
    Invoke() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnhancedStorageSiloAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.Invoke)
    }
}
