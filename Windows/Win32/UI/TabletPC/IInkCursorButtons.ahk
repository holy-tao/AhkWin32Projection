#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IInkCursorButton.ahk" { IInkCursorButton }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a collection of IInkCursorButton objects for an IInkCursor interface.
 * @remarks
 * You can use this collection to enumerate over the available <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursorbutton">IInkCursorButton</a> objects on a known <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object.
 * 
 * For more information about collections in COM, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC APIs.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkcursorbuttons
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkCursorButtons extends IDispatch {
    /**
     * The interface identifier for IInkCursorButtons
     * @type {Guid}
     */
    static IID := Guid("{3671cc40-b624-4671-9fa0-db119d952d54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkCursorButtons interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        Item         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkCursorButtons.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Gets the number of objects or collections contained in a collection. (IInkCursorButtons.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbuttons-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * Retrieves the IInkCursorButton object at the specified index or string identifier within the IInkCursorButtons collection.
     * @remarks
     * An error occurs if the index doesn't match any existing member of the collection.
     * 
     * The <b>Item</b> method takes an input argument of type VARIANT. However, the subtype of this variable must be integer or string (BSTR). This means that when you are using late binding, such as when you use a scripting language, you must pass in the argument as a STRING literal and not use a variable.
     * @param {VARIANT} Identifier The zero-based index or BSTR identifier of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursorbutton">IInkCursorButton</a> object to get.
     * 
     * For more information about the VARIANT and BSTR data types, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkCursorButton} Upon return, contains the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursorbutton">IInkCursorButton</a> object at the specified index within the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursorbuttons">IInkCursorButtons</a> collection.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcursorbuttons-item
     */
    Item(Identifier) {
        result := ComCall(9, this, VARIANT, Identifier, "ptr*", &Button := 0, "HRESULT")
        return IInkCursorButton(Button)
    }

    Query(iid) {
        if (IInkCursorButtons.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Item)
    }
}
