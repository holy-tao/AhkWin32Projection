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
     * Retrieves the number of objects in the collection.
     * @returns {Integer} Receives the number of objects in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfcollection-getelementcount
     */
    GetElementCount() {
        result := ComCall(3, this, "uint*", &pcElements := 0, "HRESULT")
        return pcElements
    }

    /**
     * Retrieves an object in the collection.
     * @param {Integer} dwElementIndex Zero-based index of the object to retrieve. Objects are indexed in the order in which they were added to the collection.
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. The caller must release the interface. The retrieved pointer value might be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfcollection-getelement
     */
    GetElement(dwElementIndex) {
        result := ComCall(4, this, "uint", dwElementIndex, "ptr*", &ppUnkElement := 0, "HRESULT")
        return IUnknown(ppUnkElement)
    }

    /**
     * Adds an object to the collection.
     * @param {IUnknown} pUnkElement Pointer to the object's <b>IUnknown</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfcollection-addelement
     */
    AddElement(pUnkElement) {
        result := ComCall(5, this, "ptr", pUnkElement, "HRESULT")
        return result
    }

    /**
     * Removes an object from the collection.
     * @param {Integer} dwElementIndex Zero-based index of the object to remove. Objects are indexed in the order in which they were added to the collection.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface of the object. The caller must release the interface. This parameter cannot be <b>NULL</b>, but the retrieved pointer value might be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfcollection-removeelement
     */
    RemoveElement(dwElementIndex) {
        result := ComCall(6, this, "uint", dwElementIndex, "ptr*", &ppUnkElement := 0, "HRESULT")
        return IUnknown(ppUnkElement)
    }

    /**
     * Adds an object at the specified index in the collection.
     * @param {Integer} dwIndex The zero-based index where the object will be added to the collection.
     * @param {IUnknown} pUnknown The object to insert.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfcollection-insertelementat
     */
    InsertElementAt(dwIndex, pUnknown) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfcollection-removeallelements
     */
    RemoveAllElements() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
