#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_selectionEnabled(p) {
        result := ComCall(63, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_frameActiveEnabled(p) {
        result := ComCall(65, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_orientation(p) {
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_usePrinterCopyCollate(p) {
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProperty 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    deviceSupports(bstrProperty, pvar) {
        bstrProperty := bstrProperty is String ? BSTR.Alloc(bstrProperty).Value : bstrProperty

        result := ComCall(70, this, "ptr", bstrProperty, "ptr", pvar, "HRESULT")
        return result
    }
}
