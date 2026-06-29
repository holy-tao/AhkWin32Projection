#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumManagerFrames.ahk" { IEnumManagerFrames }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IInternetExplorerManager2 extends IUnknown {
    /**
     * The interface identifier for IInternetExplorerManager2
     * @type {Guid}
     */
    static IID := Guid("{dfbb5136-9259-4895-b4a7-c1934429919a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetExplorerManager2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumFrameWindows : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetExplorerManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IEnumManagerFrames} 
     */
    EnumFrameWindows() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumManagerFrames(ppEnum)
    }

    Query(iid) {
        if (IInternetExplorerManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumFrameWindows := CallbackCreate(GetMethod(implObj, "EnumFrameWindows"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumFrameWindows)
    }
}
