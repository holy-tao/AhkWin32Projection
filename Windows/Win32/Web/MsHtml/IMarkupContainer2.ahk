#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMarkupContainer.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupContainer2 extends IMarkupContainer{
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
     * 
     * @param {Pointer<IHTMLChangeSink>} pChangeSink 
     * @param {Pointer<IHTMLChangeLog>} ppChangeLog 
     * @param {BOOL} fForward 
     * @param {BOOL} fBackward 
     * @returns {HRESULT} 
     */
    CreateChangeLog(pChangeSink, ppChangeLog, fForward, fBackward) {
        result := ComCall(4, this, "ptr", pChangeSink, "ptr", ppChangeLog, "int", fForward, "int", fBackward, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLChangeSink>} pChangeSink 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    RegisterForDirtyRange(pChangeSink, pdwCookie) {
        result := ComCall(5, this, "ptr", pChangeSink, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnRegisterForDirtyRange(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {Pointer<IMarkupPointer>} pIPointerBegin 
     * @param {Pointer<IMarkupPointer>} pIPointerEnd 
     * @returns {HRESULT} 
     */
    GetAndClearDirtyRange(dwCookie, pIPointerBegin, pIPointerEnd) {
        result := ComCall(7, this, "uint", dwCookie, "ptr", pIPointerBegin, "ptr", pIPointerEnd, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(9, this, "ptr", ppElementMaster, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
