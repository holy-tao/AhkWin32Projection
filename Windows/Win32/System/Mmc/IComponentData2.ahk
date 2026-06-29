#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DATA_OBJECT_TYPES.ahk" { DATA_OBJECT_TYPES }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IComponentData.ahk" { IComponentData }

/**
 * The IComponentData2 interface supersedes the IComponentData interface.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-icomponentdata2
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IComponentData2 extends IComponentData {
    /**
     * The interface identifier for IComponentData2
     * @type {Guid}
     */
    static IID := Guid("{cca0f2d2-82de-41b5-bf47-3b2076273d5c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComponentData2 interfaces
    */
    struct Vtbl extends IComponentData.Vtbl {
        QueryDispatch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComponentData2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The QueryDispatch method returns the snap-in's IDispatch interface for a specified item.
     * @param {Pointer} cookie A value that specifies the context item (or items) for which the <b>IDispatch</b> interface is requested. The <i>cookie</i> value is previously provided by the snap-in, and MMC uses it in this method call.
     * @param {DATA_OBJECT_TYPES} type A value that specifies the data object as one of the following constant values, which are members of the 
     * <b>DATA_OBJECT_TYPES</b> enumeration.
     * @returns {IDispatch} Dispatch interface pointer. The snap-in sets *<i>ppDispatch</i> to the <b>IDispatch</b> interface corresponding to the <i>cookie</i> value.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata2-querydispatch
     */
    QueryDispatch(cookie, type) {
        result := ComCall(10, this, "ptr", cookie, DATA_OBJECT_TYPES, type, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    Query(iid) {
        if (IComponentData2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryDispatch := CallbackCreate(GetMethod(implObj, "QueryDispatch"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryDispatch)
    }
}
