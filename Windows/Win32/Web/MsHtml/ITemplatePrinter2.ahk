#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITemplatePrinter.ahk" { ITemplatePrinter }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ITemplatePrinter2 extends ITemplatePrinter {
    /**
     * The interface identifier for ITemplatePrinter2
     * @type {Guid}
     */
    static IID := Guid("{3050f83f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITemplatePrinter2 interfaces
    */
    struct Vtbl extends ITemplatePrinter.Vtbl {
        put_selectionEnabled      : IntPtr
        get_selectionEnabled      : IntPtr
        put_frameActiveEnabled    : IntPtr
        get_frameActiveEnabled    : IntPtr
        put_orientation           : IntPtr
        get_orientation           : IntPtr
        put_usePrinterCopyCollate : IntPtr
        get_usePrinterCopyCollate : IntPtr
        deviceSupports            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITemplatePrinter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    selectionEnabled {
        get => this.get_selectionEnabled()
        set => this.put_selectionEnabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    frameActiveEnabled {
        get => this.get_frameActiveEnabled()
        set => this.put_frameActiveEnabled(value)
    }

    /**
     * @type {BSTR} 
     */
    orientation {
        get => this.get_orientation()
        set => this.put_orientation(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    usePrinterCopyCollate {
        get => this.get_usePrinterCopyCollate()
        set => this.put_usePrinterCopyCollate(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selectionEnabled(v) {
        result := ComCall(62, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selectionEnabled() {
        result := ComCall(63, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frameActiveEnabled(v) {
        result := ComCall(64, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frameActiveEnabled() {
        result := ComCall(65, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_orientation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(66, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_orientation() {
        p := BSTR.Owned()
        result := ComCall(67, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_usePrinterCopyCollate(v) {
        result := ComCall(68, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_usePrinterCopyCollate() {
        result := ComCall(69, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrProperty 
     * @returns {VARIANT} 
     */
    deviceSupports(bstrProperty) {
        bstrProperty := bstrProperty is String ? BSTR.Alloc(bstrProperty).Value : bstrProperty

        pvar := VARIANT()
        result := ComCall(70, this, BSTR, bstrProperty, VARIANT.Ptr, pvar, "HRESULT")
        return pvar
    }

    Query(iid) {
        if (ITemplatePrinter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_selectionEnabled := CallbackCreate(GetMethod(implObj, "put_selectionEnabled"), flags, 2)
        this.vtbl.get_selectionEnabled := CallbackCreate(GetMethod(implObj, "get_selectionEnabled"), flags, 2)
        this.vtbl.put_frameActiveEnabled := CallbackCreate(GetMethod(implObj, "put_frameActiveEnabled"), flags, 2)
        this.vtbl.get_frameActiveEnabled := CallbackCreate(GetMethod(implObj, "get_frameActiveEnabled"), flags, 2)
        this.vtbl.put_orientation := CallbackCreate(GetMethod(implObj, "put_orientation"), flags, 2)
        this.vtbl.get_orientation := CallbackCreate(GetMethod(implObj, "get_orientation"), flags, 2)
        this.vtbl.put_usePrinterCopyCollate := CallbackCreate(GetMethod(implObj, "put_usePrinterCopyCollate"), flags, 2)
        this.vtbl.get_usePrinterCopyCollate := CallbackCreate(GetMethod(implObj, "get_usePrinterCopyCollate"), flags, 2)
        this.vtbl.deviceSupports := CallbackCreate(GetMethod(implObj, "deviceSupports"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_selectionEnabled)
        CallbackFree(this.vtbl.get_selectionEnabled)
        CallbackFree(this.vtbl.put_frameActiveEnabled)
        CallbackFree(this.vtbl.get_frameActiveEnabled)
        CallbackFree(this.vtbl.put_orientation)
        CallbackFree(this.vtbl.get_orientation)
        CallbackFree(this.vtbl.put_usePrinterCopyCollate)
        CallbackFree(this.vtbl.get_usePrinterCopyCollate)
        CallbackFree(this.vtbl.deviceSupports)
    }
}
