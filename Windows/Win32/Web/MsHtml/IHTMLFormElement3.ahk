#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLFormElement3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLFormElement3
     * @type {Guid}
     */
    static IID => Guid("{3050f836-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["namedItem"]

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    namedItem(name, pdisp) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, "ptr", name, "ptr*", pdisp, "HRESULT")
        return result
    }
}
