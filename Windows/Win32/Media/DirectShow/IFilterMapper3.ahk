#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFilterMapper2.ahk" { IFilterMapper2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICreateDevEnum.ahk" { ICreateDevEnum }

/**
 * The IFilterMapper3 interface extends the IFilterMapper2 interface. The Filter Mapper object implements this interface.Note  This interface is deprecated. .
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifiltermapper3
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFilterMapper3 extends IFilterMapper2 {
    /**
     * The interface identifier for IFilterMapper3
     * @type {Guid}
     */
    static IID := Guid("{b79bb0b1-33c1-11d1-abe1-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterMapper3 interfaces
    */
    struct Vtbl extends IFilterMapper2.Vtbl {
        GetICreateDevEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterMapper3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetICreateDevEnum method returns a pointer to the ICreateDevEnum interface. You can use the ICreateDevEnum interface to create an enumerator for a category of filters, such as video capture devices or audio capture devices.
     * @returns {ICreateDevEnum} Receives a pointer to the <b>ICreateDevEnum</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper3-geticreatedevenum
     */
    GetICreateDevEnum() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICreateDevEnum(ppEnum)
    }

    Query(iid) {
        if (IFilterMapper3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetICreateDevEnum := CallbackCreate(GetMethod(implObj, "GetICreateDevEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetICreateDevEnum)
    }
}
