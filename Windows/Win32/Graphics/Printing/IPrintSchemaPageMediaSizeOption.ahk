#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaOption.ahk" { IPrintSchemaOption }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaPageMediaSizeOption extends IPrintSchemaOption {
    /**
     * The interface identifier for IPrintSchemaPageMediaSizeOption
     * @type {Guid}
     */
    static IID := Guid("{68746729-f493-4830-a10f-69028774605d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaPageMediaSizeOption interfaces
    */
    struct Vtbl extends IPrintSchemaOption.Vtbl {
        get_WidthInMicrons  : IntPtr
        get_HeightInMicrons : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaPageMediaSizeOption.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    WidthInMicrons {
        get => this.get_WidthInMicrons()
    }

    /**
     * @type {Integer} 
     */
    HeightInMicrons {
        get => this.get_HeightInMicrons()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WidthInMicrons() {
        result := ComCall(14, this, "uint*", &pulWidth := 0, "HRESULT")
        return pulWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HeightInMicrons() {
        result := ComCall(15, this, "uint*", &pulHeight := 0, "HRESULT")
        return pulHeight
    }

    Query(iid) {
        if (IPrintSchemaPageMediaSizeOption.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WidthInMicrons := CallbackCreate(GetMethod(implObj, "get_WidthInMicrons"), flags, 2)
        this.vtbl.get_HeightInMicrons := CallbackCreate(GetMethod(implObj, "get_HeightInMicrons"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WidthInMicrons)
        CallbackFree(this.vtbl.get_HeightInMicrons)
    }
}
