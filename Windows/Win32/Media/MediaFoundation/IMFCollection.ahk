#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a generic collection of IUnknown pointers.
 * @remarks
 * To create an empty collection object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatecollection">MFCreateCollection</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfcollection
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCollection extends IUnknown {
    /**
     * The interface identifier for IMFCollection
     * @type {Guid}
     */
    static IID := Guid("{5bc8a76b-869a-46a3-9b03-fa218a66aebe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetElementCount   : IntPtr
        GetElement        : IntPtr
        AddElement        : IntPtr
        RemoveElement     : IntPtr
        InsertElementAt   : IntPtr
        RemoveAllElements : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of objects in the collection. (IMFCollection.GetElementCount)
     * @returns {Integer} Receives the number of objects in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-getelementcount
     */
    GetElementCount() {
        result := ComCall(3, this, "uint*", &pcElements := 0, "HRESULT")
        return pcElements
    }

    /**
     * Retrieves an object in the collection.
     * @remarks
     * This method does not remove the object from the collection. To remove an object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfcollection-removeelement">IMFCollection::RemoveElement</a>.
     * @param {Integer} dwElementIndex Zero-based index of the object to retrieve. Objects are indexed in the order in which they were added to the collection.
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. The caller must release the interface. The retrieved pointer value might be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-getelement
     */
    GetElement(dwElementIndex) {
        result := ComCall(4, this, "uint", dwElementIndex, "ptr*", &ppUnkElement := 0, "HRESULT")
        return IUnknown(ppUnkElement)
    }

    /**
     * Adds an object to the collection. (IMFCollection.AddElement)
     * @remarks
     * If <i>pUnkElement</i> is <b>NULL</b>, a <b>NULL</b> pointer is added to the collection.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-addelement
     */
    AddElement(pUnkElement) {
        result := ComCall(5, this, "ptr", pUnkElement, "HRESULT")
        return result
    }

    /**
     * Removes an object from the collection.
     * @param {Integer} dwElementIndex Zero-based index of the object to remove. Objects are indexed in the order in which they were added to the collection.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface of the object. The caller must release the interface. This parameter cannot be <b>NULL</b>, but the retrieved pointer value might be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-removeelement
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-insertelementat
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfcollection-removeallelements
     */
    RemoveAllElements() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetElementCount := CallbackCreate(GetMethod(implObj, "GetElementCount"), flags, 2)
        this.vtbl.GetElement := CallbackCreate(GetMethod(implObj, "GetElement"), flags, 3)
        this.vtbl.AddElement := CallbackCreate(GetMethod(implObj, "AddElement"), flags, 2)
        this.vtbl.RemoveElement := CallbackCreate(GetMethod(implObj, "RemoveElement"), flags, 3)
        this.vtbl.InsertElementAt := CallbackCreate(GetMethod(implObj, "InsertElementAt"), flags, 3)
        this.vtbl.RemoveAllElements := CallbackCreate(GetMethod(implObj, "RemoveAllElements"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetElementCount)
        CallbackFree(this.vtbl.GetElement)
        CallbackFree(this.vtbl.AddElement)
        CallbackFree(this.vtbl.RemoveElement)
        CallbackFree(this.vtbl.InsertElementAt)
        CallbackFree(this.vtbl.RemoveAllElements)
    }
}
