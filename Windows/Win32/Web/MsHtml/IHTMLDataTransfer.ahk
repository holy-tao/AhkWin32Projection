#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDataTransfer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDataTransfer
     * @type {Guid}
     */
    static IID => Guid("{3050f4b3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setData", "getData", "clearData", "put_dropEffect", "get_dropEffect", "put_effectAllowed", "get_effectAllowed"]

    /**
     * @type {BSTR} 
     */
    dropEffect {
        get => this.get_dropEffect()
        set => this.put_dropEffect(value)
    }

    /**
     * @type {BSTR} 
     */
    effectAllowed {
        get => this.get_effectAllowed()
        set => this.put_effectAllowed(value)
    }

    /**
     * 
     * @param {BSTR} format 
     * @param {Pointer<VARIANT>} data 
     * @returns {VARIANT_BOOL} 
     */
    setData(format, data) {
        format := format is String ? BSTR.Alloc(format).Value : format

        result := ComCall(7, this, "ptr", format, "ptr", data, "short*", &pret := 0, "HRESULT")
        return pret
    }

    /**
     * 
     * @param {BSTR} format 
     * @returns {VARIANT} 
     */
    getData(format) {
        format := format is String ? BSTR.Alloc(format).Value : format

        pvarRet := VARIANT()
        result := ComCall(8, this, "ptr", format, "ptr", pvarRet, "HRESULT")
        return pvarRet
    }

    /**
     * 
     * @param {BSTR} format 
     * @returns {VARIANT_BOOL} 
     */
    clearData(format) {
        format := format is String ? BSTR.Alloc(format).Value : format

        result := ComCall(9, this, "ptr", format, "short*", &pret := 0, "HRESULT")
        return pret
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dropEffect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dropEffect() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_effectAllowed(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_effectAllowed() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }
}
