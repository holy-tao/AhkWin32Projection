#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Adds members to the InkWordList Class.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkwordlist2
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkWordList2 extends IDispatch {
    /**
     * The interface identifier for IInkWordList2
     * @type {Guid}
     */
    static IID := Guid("{14542586-11bf-4f5f-b6e7-49d0744aab6e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkWordList2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        AddWords : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkWordList2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds more than one word to an InkWordList in a single operation.
     * @remarks
     * To access this method, first create and instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkwordlist-class">InkWordList Class</a>, then call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkwordlist2">IInkWordList2 Interface</a>. Use this pointer to call the <b>AddWords Method</b>.
     * @param {BSTR} NewWords A <b>BSTR</b> of <b>NULL</b> separated words terminated by a double <b>NULL</b> containing the words to add to the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkwordlist-class">InkWordList</a>.
     * 
     * For more information about the <b>BSTR</b> data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one word already exists in the list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkwordlist2-addwords
     */
    AddWords(NewWords) {
        NewWords := NewWords is String ? BSTR.Alloc(NewWords).Value : NewWords

        result := ComCall(7, this, BSTR, NewWords, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkWordList2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddWords := CallbackCreate(GetMethod(implObj, "AddWords"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddWords)
    }
}
