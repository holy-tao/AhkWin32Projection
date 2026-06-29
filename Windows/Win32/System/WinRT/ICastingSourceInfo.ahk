#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICastingController.ahk" { ICastingController }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\UI\Shell\PropertiesSystem\INamedPropertyStore.ahk" { INamedPropertyStore }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICastingSourceInfo extends IUnknown {
    /**
     * The interface identifier for ICastingSourceInfo
     * @type {Guid}
     */
    static IID := Guid("{45101ab7-7c3a-4bce-9500-12c09024b298}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICastingSourceInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetController : IntPtr
        GetProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICastingSourceInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ICastingController} 
     */
    GetController() {
        result := ComCall(3, this, "ptr*", &controller := 0, "HRESULT")
        return ICastingController(controller)
    }

    /**
     * 
     * @returns {INamedPropertyStore} 
     */
    GetProperties() {
        result := ComCall(4, this, "ptr*", &props := 0, "HRESULT")
        return INamedPropertyStore(props)
    }

    Query(iid) {
        if (ICastingSourceInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetController := CallbackCreate(GetMethod(implObj, "GetController"), flags, 2)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetController)
        CallbackFree(this.vtbl.GetProperties)
    }
}
