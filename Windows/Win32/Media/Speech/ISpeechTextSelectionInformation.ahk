#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechTextSelectionInformation extends IDispatch {
    /**
     * The interface identifier for ISpeechTextSelectionInformation
     * @type {Guid}
     */
    static IID := Guid("{3b9c7e7a-6eee-4ded-9092-11657279adbe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechTextSelectionInformation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_ActiveOffset    : IntPtr
        get_ActiveOffset    : IntPtr
        put_ActiveLength    : IntPtr
        get_ActiveLength    : IntPtr
        put_SelectionOffset : IntPtr
        get_SelectionOffset : IntPtr
        put_SelectionLength : IntPtr
        get_SelectionLength : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechTextSelectionInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ActiveOffset {
        get => this.get_ActiveOffset()
        set => this.put_ActiveOffset(value)
    }

    /**
     * @type {Integer} 
     */
    ActiveLength {
        get => this.get_ActiveLength()
        set => this.put_ActiveLength(value)
    }

    /**
     * @type {Integer} 
     */
    SelectionOffset {
        get => this.get_SelectionOffset()
        set => this.put_SelectionOffset(value)
    }

    /**
     * @type {Integer} 
     */
    SelectionLength {
        get => this.get_SelectionLength()
        set => this.put_SelectionLength(value)
    }

    /**
     * 
     * @param {Integer} ActiveOffset 
     * @returns {HRESULT} 
     */
    put_ActiveOffset(ActiveOffset) {
        result := ComCall(7, this, "int", ActiveOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActiveOffset() {
        result := ComCall(8, this, "int*", &ActiveOffset := 0, "HRESULT")
        return ActiveOffset
    }

    /**
     * 
     * @param {Integer} ActiveLength 
     * @returns {HRESULT} 
     */
    put_ActiveLength(ActiveLength) {
        result := ComCall(9, this, "int", ActiveLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActiveLength() {
        result := ComCall(10, this, "int*", &ActiveLength := 0, "HRESULT")
        return ActiveLength
    }

    /**
     * 
     * @param {Integer} SelectionOffset 
     * @returns {HRESULT} 
     */
    put_SelectionOffset(SelectionOffset) {
        result := ComCall(11, this, "int", SelectionOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionOffset() {
        result := ComCall(12, this, "int*", &SelectionOffset := 0, "HRESULT")
        return SelectionOffset
    }

    /**
     * 
     * @param {Integer} SelectionLength 
     * @returns {HRESULT} 
     */
    put_SelectionLength(SelectionLength) {
        result := ComCall(13, this, "int", SelectionLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionLength() {
        result := ComCall(14, this, "int*", &SelectionLength := 0, "HRESULT")
        return SelectionLength
    }

    Query(iid) {
        if (ISpeechTextSelectionInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_ActiveOffset := CallbackCreate(GetMethod(implObj, "put_ActiveOffset"), flags, 2)
        this.vtbl.get_ActiveOffset := CallbackCreate(GetMethod(implObj, "get_ActiveOffset"), flags, 2)
        this.vtbl.put_ActiveLength := CallbackCreate(GetMethod(implObj, "put_ActiveLength"), flags, 2)
        this.vtbl.get_ActiveLength := CallbackCreate(GetMethod(implObj, "get_ActiveLength"), flags, 2)
        this.vtbl.put_SelectionOffset := CallbackCreate(GetMethod(implObj, "put_SelectionOffset"), flags, 2)
        this.vtbl.get_SelectionOffset := CallbackCreate(GetMethod(implObj, "get_SelectionOffset"), flags, 2)
        this.vtbl.put_SelectionLength := CallbackCreate(GetMethod(implObj, "put_SelectionLength"), flags, 2)
        this.vtbl.get_SelectionLength := CallbackCreate(GetMethod(implObj, "get_SelectionLength"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_ActiveOffset)
        CallbackFree(this.vtbl.get_ActiveOffset)
        CallbackFree(this.vtbl.put_ActiveLength)
        CallbackFree(this.vtbl.get_ActiveLength)
        CallbackFree(this.vtbl.put_SelectionOffset)
        CallbackFree(this.vtbl.get_SelectionOffset)
        CallbackFree(this.vtbl.put_SelectionLength)
        CallbackFree(this.vtbl.get_SelectionLength)
    }
}
