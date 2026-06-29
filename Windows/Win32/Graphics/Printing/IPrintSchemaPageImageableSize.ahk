#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaElement.ahk" { IPrintSchemaElement }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaPageImageableSize extends IPrintSchemaElement {
    /**
     * The interface identifier for IPrintSchemaPageImageableSize
     * @type {Guid}
     */
    static IID := Guid("{7c85bf5e-dc7c-4f61-839b-4107e1c9b68e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaPageImageableSize interfaces
    */
    struct Vtbl extends IPrintSchemaElement.Vtbl {
        get_ImageableSizeWidthInMicrons  : IntPtr
        get_ImageableSizeHeightInMicrons : IntPtr
        get_OriginWidthInMicrons         : IntPtr
        get_OriginHeightInMicrons        : IntPtr
        get_ExtentWidthInMicrons         : IntPtr
        get_ExtentHeightInMicrons        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaPageImageableSize.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ImageableSizeWidthInMicrons {
        get => this.get_ImageableSizeWidthInMicrons()
    }

    /**
     * @type {Integer} 
     */
    ImageableSizeHeightInMicrons {
        get => this.get_ImageableSizeHeightInMicrons()
    }

    /**
     * @type {Integer} 
     */
    OriginWidthInMicrons {
        get => this.get_OriginWidthInMicrons()
    }

    /**
     * @type {Integer} 
     */
    OriginHeightInMicrons {
        get => this.get_OriginHeightInMicrons()
    }

    /**
     * @type {Integer} 
     */
    ExtentWidthInMicrons {
        get => this.get_ExtentWidthInMicrons()
    }

    /**
     * @type {Integer} 
     */
    ExtentHeightInMicrons {
        get => this.get_ExtentHeightInMicrons()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageableSizeWidthInMicrons() {
        result := ComCall(10, this, "uint*", &pulImageableSizeWidth := 0, "HRESULT")
        return pulImageableSizeWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageableSizeHeightInMicrons() {
        result := ComCall(11, this, "uint*", &pulImageableSizeHeight := 0, "HRESULT")
        return pulImageableSizeHeight
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginWidthInMicrons() {
        result := ComCall(12, this, "uint*", &pulOriginWidth := 0, "HRESULT")
        return pulOriginWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginHeightInMicrons() {
        result := ComCall(13, this, "uint*", &pulOriginHeight := 0, "HRESULT")
        return pulOriginHeight
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtentWidthInMicrons() {
        result := ComCall(14, this, "uint*", &pulExtentWidth := 0, "HRESULT")
        return pulExtentWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtentHeightInMicrons() {
        result := ComCall(15, this, "uint*", &pulExtentHeight := 0, "HRESULT")
        return pulExtentHeight
    }

    Query(iid) {
        if (IPrintSchemaPageImageableSize.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ImageableSizeWidthInMicrons := CallbackCreate(GetMethod(implObj, "get_ImageableSizeWidthInMicrons"), flags, 2)
        this.vtbl.get_ImageableSizeHeightInMicrons := CallbackCreate(GetMethod(implObj, "get_ImageableSizeHeightInMicrons"), flags, 2)
        this.vtbl.get_OriginWidthInMicrons := CallbackCreate(GetMethod(implObj, "get_OriginWidthInMicrons"), flags, 2)
        this.vtbl.get_OriginHeightInMicrons := CallbackCreate(GetMethod(implObj, "get_OriginHeightInMicrons"), flags, 2)
        this.vtbl.get_ExtentWidthInMicrons := CallbackCreate(GetMethod(implObj, "get_ExtentWidthInMicrons"), flags, 2)
        this.vtbl.get_ExtentHeightInMicrons := CallbackCreate(GetMethod(implObj, "get_ExtentHeightInMicrons"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ImageableSizeWidthInMicrons)
        CallbackFree(this.vtbl.get_ImageableSizeHeightInMicrons)
        CallbackFree(this.vtbl.get_OriginWidthInMicrons)
        CallbackFree(this.vtbl.get_OriginHeightInMicrons)
        CallbackFree(this.vtbl.get_ExtentWidthInMicrons)
        CallbackFree(this.vtbl.get_ExtentHeightInMicrons)
    }
}
