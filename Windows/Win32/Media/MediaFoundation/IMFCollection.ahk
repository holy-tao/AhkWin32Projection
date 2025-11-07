#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a generic collection of IUnknown pointers.
 * @remarks
 * 
 * To create an empty collection object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatecollection">MFCreateCollection</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfcollection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCollection
     * @type {Guid}
     */
    static IID => Guid("{5bc8a76b-869a-46a3-9b03-fa218a66aebe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetElementCount", "GetElement", "AddElement", "RemoveElement", "InsertElementAt", "RemoveAllElements"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-getelementcount
     */
    GetElementCount() {
        result := ComCall(3, this, "uint*", &pcElements := 0, "HRESULT")
        return pcElements
    }

    /**
     * 
     * @param {Integer} dwElementIndex 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-getelement
     */
    GetElement(dwElementIndex) {
        result := ComCall(4, this, "uint", dwElementIndex, "ptr*", &ppUnkElement := 0, "HRESULT")
        return IUnknown(ppUnkElement)
    }

    /**
     * 
     * @param {IUnknown} pUnkElement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-addelement
     */
    AddElement(pUnkElement) {
        result := ComCall(5, this, "ptr", pUnkElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwElementIndex 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-removeelement
     */
    RemoveElement(dwElementIndex) {
        result := ComCall(6, this, "uint", dwElementIndex, "ptr*", &ppUnkElement := 0, "HRESULT")
        return IUnknown(ppUnkElement)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {IUnknown} pUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-insertelementat
     */
    InsertElementAt(dwIndex, pUnknown) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-removeallelements
     */
    RemoveAllElements() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
