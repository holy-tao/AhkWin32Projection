#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISelectionServicesListener extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginSelectionUndo", "EndSelectionUndo", "OnSelectedElementExit", "OnChangeType", "GetTypeDetail"]

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginSelectionUndo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndSelectionUndo() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIElementStart 
     * @param {IMarkupPointer} pIElementEnd 
     * @param {IMarkupPointer} pIElementContentStart 
     * @param {IMarkupPointer} pIElementContentEnd 
     * @returns {HRESULT} 
     */
    OnSelectedElementExit(pIElementStart, pIElementEnd, pIElementContentStart, pIElementContentEnd) {
        result := ComCall(5, this, "ptr", pIElementStart, "ptr", pIElementEnd, "ptr", pIElementContentStart, "ptr", pIElementContentEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eType 
     * @param {ISelectionServicesListener} pIListener 
     * @returns {HRESULT} 
     */
    OnChangeType(eType, pIListener) {
        result := ComCall(6, this, "int", eType, "ptr", pIListener, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetTypeDetail() {
        pTypeDetail := BSTR()
        result := ComCall(7, this, "ptr", pTypeDetail, "HRESULT")
        return pTypeDetail
    }
}
