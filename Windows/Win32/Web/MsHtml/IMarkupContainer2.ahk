#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMarkupContainer.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupContainer2 extends IMarkupContainer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupContainer2
     * @type {Guid}
     */
    static IID => Guid("{3050f648-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateChangeLog", "RegisterForDirtyRange", "UnRegisterForDirtyRange", "GetAndClearDirtyRange", "GetVersionNumber", "GetMasterElement"]

    /**
     * 
     * @param {IHTMLChangeSink} pChangeSink 
     * @param {Pointer<IHTMLChangeLog>} ppChangeLog 
     * @param {BOOL} fForward 
     * @param {BOOL} fBackward 
     * @returns {HRESULT} 
     */
    CreateChangeLog(pChangeSink, ppChangeLog, fForward, fBackward) {
        result := ComCall(4, this, "ptr", pChangeSink, "ptr*", ppChangeLog, "int", fForward, "int", fBackward, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLChangeSink} pChangeSink 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     */
    RegisterForDirtyRange(pChangeSink, pdwCookie) {
        result := ComCall(5, this, "ptr", pChangeSink, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnRegisterForDirtyRange(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {IMarkupPointer} pIPointerBegin 
     * @param {IMarkupPointer} pIPointerEnd 
     * @returns {HRESULT} 
     */
    GetAndClearDirtyRange(dwCookie, pIPointerBegin, pIPointerEnd) {
        result := ComCall(7, this, "uint", dwCookie, "ptr", pIPointerBegin, "ptr", pIPointerEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVersionNumber() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} ppElementMaster 
     * @returns {HRESULT} 
     */
    GetMasterElement(ppElementMaster) {
        result := ComCall(9, this, "ptr*", ppElementMaster, "HRESULT")
        return result
    }
}
