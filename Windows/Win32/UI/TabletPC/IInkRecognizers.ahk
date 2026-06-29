#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IInkRecognizer.ahk" { IInkRecognizer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * . (IInkRecognizers)
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkrecognizers
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkRecognizers extends IDispatch {
    /**
     * The interface identifier for IInkRecognizers
     * @type {Guid}
     */
    static IID := Guid("{9ccc4f12-b0b7-4a8b-bf58-4aeca4e8cefd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkRecognizers interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count            : IntPtr
        get__NewEnum         : IntPtr
        GetDefaultRecognizer : IntPtr
        Item                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkRecognizers.Vtbl()
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
     * Gets the number of objects or collections contained in a collection. (IInkRecognizers.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-get_count
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
     * Retrieves the default recognizer for a known language, specified by a national language support (NLS) language code identifier (LCID).
     * @remarks
     * Each language can have a default recognizer. For example, a user can have a default recognizer for U.S. English and a default recognizer for French. If no locale is specified, this method returns the recognizer for the active input locale. To select the active input locale, in the Regional and Language Options in ControlPanel, on the Languages tab, users click Details, and then select the Default input language.
     * 
     * The default value of the <i>lcid</i> parameter is 0.
     * 
     * This method generates an error if the <i>lcid</i> parameter is not a known locale or if a recognizer is not installed for the requested locale.
     * 
     * <b>GetDefaultRecognizer</b> first checks if there is a matching recognizer for the user's input locale. If there is none, it checks if there is a matching recognizer for the current system locale.
     * 
     * For more information about NLS, see <a href="https://docs.microsoft.com/windows/desktop/Intl/nls-terminology">NLS Terminology</a>.
     * @param {Integer} lcid The LCID locale identifier of the language for which you are retrieving the default recognizer. If <i>lcid</i> is 0, the method uses the user's locale setting to determine which default recognizer to retrieve. If the user has not specified a locale in Regional Options, the method uses the locale that was specified for the computer. The default value is 0.
     * @returns {IInkRecognizer} When this method returns, contains a pointer to the requested recognizer.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-getdefaultrecognizer
     */
    GetDefaultRecognizer(lcid) {
        result := ComCall(9, this, "int", lcid, "ptr*", &DefaultRecognizer := 0, "HRESULT")
        return IInkRecognizer(DefaultRecognizer)
    }

    /**
     * Retrieves the IInkRecognizer object at the specified index within the InkRecognizers collection.
     * @remarks
     * An error occurs if the index doesn't match any existing member of the collection.
     * @param {Integer} Index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object to get.
     * @returns {IInkRecognizer} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object at the specified index within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms702438(v=vs.85)">InkRecognizers</a> collection.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizers-item
     */
    Item(Index) {
        result := ComCall(10, this, "int", Index, "ptr*", &InkRecognizer := 0, "HRESULT")
        return IInkRecognizer(InkRecognizer)
    }

    Query(iid) {
        if (IInkRecognizers.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.GetDefaultRecognizer := CallbackCreate(GetMethod(implObj, "GetDefaultRecognizer"), flags, 3)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.GetDefaultRecognizer)
        CallbackFree(this.vtbl.Item)
    }
}
