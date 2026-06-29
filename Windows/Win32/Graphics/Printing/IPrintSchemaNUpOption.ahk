#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaOption.ahk" { IPrintSchemaOption }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaNUpOption extends IPrintSchemaOption {
    /**
     * The interface identifier for IPrintSchemaNUpOption
     * @type {Guid}
     */
    static IID := Guid("{1f6342f2-d848-42e3-8995-c10a9ef9a3ba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaNUpOption interfaces
    */
    struct Vtbl extends IPrintSchemaOption.Vtbl {
        get_PagesPerSheet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaNUpOption.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    PagesPerSheet {
        get => this.get_PagesPerSheet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PagesPerSheet() {
        result := ComCall(14, this, "uint*", &pulPagesPerSheet := 0, "HRESULT")
        return pulPagesPerSheet
    }

    Query(iid) {
        if (IPrintSchemaNUpOption.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PagesPerSheet := CallbackCreate(GetMethod(implObj, "get_PagesPerSheet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PagesPerSheet)
    }
}
