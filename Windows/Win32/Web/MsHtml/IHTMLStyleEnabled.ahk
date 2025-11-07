#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleEnabled extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleEnabled
     * @type {Guid}
     */
    static IID => Guid("{305104c2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["msGetPropertyEnabled", "msPutPropertyEnabled"]

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    msGetPropertyEnabled(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, "ptr", name, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT_BOOL} b 
     * @returns {HRESULT} 
     */
    msPutPropertyEnabled(name, b) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "short", b, "HRESULT")
        return result
    }
}
