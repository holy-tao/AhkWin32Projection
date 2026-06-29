#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUriBuilder.ahk" { IUriBuilder }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IUriBuilderFactory extends IUnknown {
    /**
     * The interface identifier for IUriBuilderFactory
     * @type {Guid}
     */
    static IID := Guid("{e982ce48-0b96-440c-bc37-0c869b27a29e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUriBuilderFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateIUriBuilder            : IntPtr
        CreateInitializedIUriBuilder : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUriBuilderFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @returns {IUriBuilder} 
     */
    CreateIUriBuilder(dwFlags, dwReserved) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", dwReserved, "ptr*", &ppIUriBuilder := 0, "HRESULT")
        return IUriBuilder(ppIUriBuilder)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @returns {IUriBuilder} 
     */
    CreateInitializedIUriBuilder(dwFlags, dwReserved) {
        result := ComCall(4, this, "uint", dwFlags, "ptr", dwReserved, "ptr*", &ppIUriBuilder := 0, "HRESULT")
        return IUriBuilder(ppIUriBuilder)
    }

    Query(iid) {
        if (IUriBuilderFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateIUriBuilder := CallbackCreate(GetMethod(implObj, "CreateIUriBuilder"), flags, 4)
        this.vtbl.CreateInitializedIUriBuilder := CallbackCreate(GetMethod(implObj, "CreateInitializedIUriBuilder"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateIUriBuilder)
        CallbackFree(this.vtbl.CreateInitializedIUriBuilder)
    }
}
