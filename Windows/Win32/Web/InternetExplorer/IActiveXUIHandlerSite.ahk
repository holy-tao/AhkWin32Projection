#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IScrollableContextMenu.ahk" { IScrollableContextMenu }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IActiveXUIHandlerSite extends IUnknown {
    /**
     * The interface identifier for IActiveXUIHandlerSite
     * @type {Guid}
     */
    static IID := Guid("{30510853-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveXUIHandlerSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateScrollableContextMenu : IntPtr
        PickFileAndGetResult        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveXUIHandlerSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IScrollableContextMenu} 
     */
    CreateScrollableContextMenu() {
        result := ComCall(3, this, "ptr*", &scrollableContextMenu := 0, "HRESULT")
        return IScrollableContextMenu(scrollableContextMenu)
    }

    /**
     * 
     * @param {IUnknown} filePicker 
     * @param {BOOL} allowMultipleSelections 
     * @returns {IUnknown} 
     */
    PickFileAndGetResult(filePicker, allowMultipleSelections) {
        result := ComCall(4, this, "ptr", filePicker, BOOL, allowMultipleSelections, "ptr*", &result := 0, "HRESULT")
        return IUnknown(result)
    }

    Query(iid) {
        if (IActiveXUIHandlerSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateScrollableContextMenu := CallbackCreate(GetMethod(implObj, "CreateScrollableContextMenu"), flags, 2)
        this.vtbl.PickFileAndGetResult := CallbackCreate(GetMethod(implObj, "PickFileAndGetResult"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateScrollableContextMenu)
        CallbackFree(this.vtbl.PickFileAndGetResult)
    }
}
