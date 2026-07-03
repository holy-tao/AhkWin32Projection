#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITsSbPropertySet.ahk" { ITsSbPropertySet }

/**
 * Filter Plugin Store
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbfilterpluginstore
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbFilterPluginStore extends IUnknown {
    /**
     * The interface identifier for ITsSbFilterPluginStore
     * @type {Guid}
     */
    static IID := Guid("{85b44b0f-ed78-413f-9702-fa6d3b5ee755}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbFilterPluginStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SaveProperties      : IntPtr
        EnumerateProperties : IntPtr
        DeleteProperties    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbFilterPluginStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Saves a property set.
     * @param {ITsSbPropertySet} pPropertySet 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbfilterpluginstore-saveproperties
     */
    SaveProperties(pPropertySet) {
        result := ComCall(3, this, "ptr", pPropertySet, "HRESULT")
        return result
    }

    /**
     * Enumerates a property set.
     * @returns {ITsSbPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbfilterpluginstore-enumerateproperties
     */
    EnumerateProperties() {
        result := ComCall(4, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbPropertySet(ppPropertySet)
    }

    /**
     * Deletes a property.
     * @param {BSTR} propertyName 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbfilterpluginstore-deleteproperties
     */
    DeleteProperties(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(5, this, BSTR, propertyName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbFilterPluginStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SaveProperties := CallbackCreate(GetMethod(implObj, "SaveProperties"), flags, 2)
        this.vtbl.EnumerateProperties := CallbackCreate(GetMethod(implObj, "EnumerateProperties"), flags, 2)
        this.vtbl.DeleteProperties := CallbackCreate(GetMethod(implObj, "DeleteProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SaveProperties)
        CallbackFree(this.vtbl.EnumerateProperties)
        CallbackFree(this.vtbl.DeleteProperties)
    }
}
