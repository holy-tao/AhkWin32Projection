#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLEditServices.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEditServices2 extends IHTMLEditServices{
    /**
     * The interface identifier for IHTMLEditServices2
     * @type {Guid}
     */
    static IID => Guid("{3050f812-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pIStartAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionAnchorEx(pIStartAnchor) {
        result := ComCall(9, this, "ptr", pIStartAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDisplayPointer>} pIEndAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionEndEx(pIEndAnchor) {
        result := ComCall(10, this, "ptr", pIEndAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fReCompute 
     * @returns {HRESULT} 
     */
    FreezeVirtualCaretPos(fReCompute) {
        result := ComCall(11, this, "int", fReCompute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fReset 
     * @returns {HRESULT} 
     */
    UnFreezeVirtualCaretPos(fReset) {
        result := ComCall(12, this, "int", fReset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
