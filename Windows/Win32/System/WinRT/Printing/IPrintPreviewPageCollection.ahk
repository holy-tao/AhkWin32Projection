#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintPreviewPageCollection extends IUnknown {
    /**
     * The interface identifier for IPrintPreviewPageCollection
     * @type {Guid}
     */
    static IID := Guid("{0b31cc62-d7ec-4747-9d6e-f2537d870f2b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintPreviewPageCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Paginate : IntPtr
        MakePage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintPreviewPageCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} currentJobPage 
     * @param {IInspectable} printTaskOptions 
     * @returns {HRESULT} 
     */
    Paginate(currentJobPage, printTaskOptions) {
        result := ComCall(3, this, UInt32, currentJobPage, "ptr", printTaskOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} desiredJobPage 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {HRESULT} 
     */
    MakePage(desiredJobPage, width, height) {
        result := ComCall(4, this, UInt32, desiredJobPage, Float32, width, Float32, height, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IPrintPreviewPageCollection.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Paginate := CallbackCreate(GetMethod(implObj, "Paginate"), flags, 3)
        this.vtbl.MakePage := CallbackCreate(GetMethod(implObj, "MakePage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Paginate)
        CallbackFree(this.vtbl.MakePage)
    }
}
