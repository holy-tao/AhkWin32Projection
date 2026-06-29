#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxRecipient.ahk" { IFaxRecipient }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IFaxRecipients interface defines a FaxRecipients messaging collection is used by a fax client application to manage the fax recipient objects (FaxRecipient) that represent the recipients of a single fax document.
 * @remarks
 * A default implementation of <b>IFaxRecipients</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipients">FaxRecipients</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxrecipients
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxRecipients extends IDispatch {
    /**
     * The interface identifier for IFaxRecipients
     * @type {Guid}
     */
    static IID := Guid("{b9c9de5a-894e-4492-9fa3-08c627c11d5d}")

    /**
     * The class identifier for FaxRecipients
     * @type {Guid}
     */
    static CLSID := Guid("{ea9bdf53-10a9-4d4f-a067-63c8f84f01b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxRecipients interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxRecipients.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The IFaxRecipients::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the FaxRecipients collection.
     * @remarks
     * In Microsoft Visual Basic, you do not need to use the <b>_NewEnum</b> property because it is automatically used in the implementation of <b>For Each ... Next</b>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an indirect pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The Item method returns a FaxRecipient object from the FaxRecipients collection.
     * @param {Integer} lIndex Type: <b>LONG</b>
     * 
     * A <b>LONG</b> value that specifies the item to retrieve from the fax recipient collection. Valid values for this parameter are in the range from 1 to <i>n</i>, where <i>n</i> is the number of recipients returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipients-count-vb">IFaxRecipients::get_Count</a> method.
     * @returns {IFaxRecipient} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxrecipient">IFaxRecipient</a>**</b>
     * 
     * Address of a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxrecipient">IFaxRecipient</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * The IFaxRecipients::get_Count property represents the number of objects in the FaxRecipients collection. This is the total number of recipients associated with the fax server or fax document.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IFaxRecipients::Add method adds a new FaxRecipient object to the FaxRecipients collection.
     * @param {BSTR} bstrFaxNumber Type: <b>BSTR</b>
     * 
     * Specifies the fax number of the fax recipient.
     * @param {BSTR} bstrRecipientName Type: <b>BSTR</b>
     * 
     * Specifies the name of the fax recipient.
     * @returns {IFaxRecipient} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxrecipient">IFaxRecipient</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipient">FaxRecipient</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-add
     */
    Add(bstrFaxNumber, bstrRecipientName) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber
        bstrRecipientName := bstrRecipientName is String ? BSTR.Alloc(bstrRecipientName).Value : bstrRecipientName

        result := ComCall(10, this, BSTR, bstrFaxNumber, BSTR, bstrRecipientName, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * The IFaxRecipients::Remove method removes an item from the FaxRecipients collection.
     * @param {Integer} lIndex Type: <b>LONG</b>
     * 
     * A <b>LONG</b> that specifies the index of the item to remove from the collection. Valid values for this parameter are in the range from 1 to <i>n</i>, where <i>n</i> is the number of recipients returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxrecipients-count-vb">IFaxRecipients::get_Count</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxrecipients-remove
     */
    Remove(lIndex) {
        result := ComCall(11, this, "int", lIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxRecipients.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 4)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
    }
}
