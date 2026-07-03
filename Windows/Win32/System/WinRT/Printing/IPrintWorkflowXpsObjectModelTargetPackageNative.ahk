#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Storage\Xps\IXpsDocumentPackageTarget.ahk" { IXpsDocumentPackageTarget }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintWorkflowXpsObjectModelTargetPackageNative extends IUnknown {
    /**
     * The interface identifier for IPrintWorkflowXpsObjectModelTargetPackageNative
     * @type {Guid}
     */
    static IID := Guid("{7d96bc74-9b54-4ca1-ad3a-979c3d44ddac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintWorkflowXpsObjectModelTargetPackageNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_DocumentPackageTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintWorkflowXpsObjectModelTargetPackageNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXpsDocumentPackageTarget} 
     */
    DocumentPackageTarget {
        get => this.get_DocumentPackageTarget()
    }

    /**
     * 
     * @returns {IXpsDocumentPackageTarget} 
     */
    get_DocumentPackageTarget() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IXpsDocumentPackageTarget(value)
    }

    Query(iid) {
        if (IPrintWorkflowXpsObjectModelTargetPackageNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DocumentPackageTarget := CallbackCreate(GetMethod(implObj, "get_DocumentPackageTarget"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DocumentPackageTarget)
    }
}
