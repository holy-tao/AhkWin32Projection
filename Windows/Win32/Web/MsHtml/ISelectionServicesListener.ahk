#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISelectionServicesListener extends IUnknown{
    /**
     * The interface identifier for ISelectionServicesListener
     * @type {Guid}
     */
    static IID => Guid("{3050f699-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginSelectionUndo() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndSelectionUndo() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pIElementStart 
     * @param {Pointer<IMarkupPointer>} pIElementEnd 
     * @param {Pointer<IMarkupPointer>} pIElementContentStart 
     * @param {Pointer<IMarkupPointer>} pIElementContentEnd 
     * @returns {HRESULT} 
     */
    OnSelectedElementExit(pIElementStart, pIElementEnd, pIElementContentStart, pIElementContentEnd) {
        result := ComCall(5, this, "ptr", pIElementStart, "ptr", pIElementEnd, "ptr", pIElementContentStart, "ptr", pIElementContentEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eType 
     * @param {Pointer<ISelectionServicesListener>} pIListener 
     * @returns {HRESULT} 
     */
    OnChangeType(eType, pIListener) {
        result := ComCall(6, this, "int", eType, "ptr", pIListener, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTypeDetail 
     * @returns {HRESULT} 
     */
    GetTypeDetail(pTypeDetail) {
        result := ComCall(7, this, "ptr", pTypeDetail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
