#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocument extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocument
     * @type {Guid}
     */
    static IID => Guid("{626fc520-a41e-11cf-a731-00a0c9082637}")

    /**
     * The class identifier for HTMLDocument
     * @type {Guid}
     */
    static CLSID => Guid("{25336920-03f9-11cf-8fd0-00aa00686f13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Script"]

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Script(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }
}
