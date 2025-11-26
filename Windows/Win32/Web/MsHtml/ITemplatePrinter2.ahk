#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ITemplatePrinter.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ITemplatePrinter2 extends ITemplatePrinter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITemplatePrinter2
     * @type {Guid}
     */
    static IID => Guid("{3050f83f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 62

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_selectionEnabled", "get_selectionEnabled", "put_frameActiveEnabled", "get_frameActiveEnabled", "put_orientation", "get_orientation", "put_usePrinterCopyCollate", "get_usePrinterCopyCollate", "deviceSupports"]

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
        result := ComCall(62, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selectionEnabled() {
        result := ComCall(63, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frameActiveEnabled(v) {
        result := ComCall(64, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frameActiveEnabled() {
        result := ComCall(65, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_orientation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(66, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_orientation() {
        p := BSTR()
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_usePrinterCopyCollate(v) {
        result := ComCall(68, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_usePrinterCopyCollate() {
        result := ComCall(69, this, "short*", &p := 0, "HRESULT")
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
        result := ComCall(70, this, "ptr", bstrProperty, "ptr", pvar, "HRESULT")
        return pvar
    }
}
