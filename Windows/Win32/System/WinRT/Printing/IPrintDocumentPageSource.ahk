#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Storage\Xps\Printing\IPrintDocumentPackageTarget.ahk" { IPrintDocumentPackageTarget }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintPreviewPageCollection.ahk" { IPrintPreviewPageCollection }
#Import "..\IInspectable.ahk" { IInspectable }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintDocumentPageSource extends IUnknown {
    /**
     * The interface identifier for IPrintDocumentPageSource
     * @type {Guid}
     */
    static IID := Guid("{a96bb1db-172e-4667-82b5-ad97a252318f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintDocumentPageSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPreviewPageCollection : IntPtr
        MakeDocument             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintDocumentPageSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IPrintDocumentPackageTarget} docPackageTarget 
     * @returns {IPrintPreviewPageCollection} 
     */
    GetPreviewPageCollection(docPackageTarget) {
        result := ComCall(3, this, "ptr", docPackageTarget, "ptr*", &docPageCollection := 0, "HRESULT")
        return IPrintPreviewPageCollection(docPageCollection)
    }

    /**
     * 
     * @param {IInspectable} printTaskOptions 
     * @param {IPrintDocumentPackageTarget} docPackageTarget 
     * @returns {HRESULT} 
     */
    MakeDocument(printTaskOptions, docPackageTarget) {
        result := ComCall(4, this, "ptr", printTaskOptions, "ptr", docPackageTarget, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintDocumentPageSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPreviewPageCollection := CallbackCreate(GetMethod(implObj, "GetPreviewPageCollection"), flags, 3)
        this.vtbl.MakeDocument := CallbackCreate(GetMethod(implObj, "MakeDocument"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPreviewPageCollection)
        CallbackFree(this.vtbl.MakeDocument)
    }
}
