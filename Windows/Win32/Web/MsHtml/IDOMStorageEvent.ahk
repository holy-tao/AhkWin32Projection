#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStorage.ahk" { IHTMLStorage }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMStorageEvent extends IDispatch {
    /**
     * The interface identifier for IDOMStorageEvent
     * @type {Guid}
     */
    static IID := Guid("{30510722-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMStorageEvent
     * @type {Guid}
     */
    static CLSID := Guid("{30510723-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMStorageEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_key          : IntPtr
        get_oldValue     : IntPtr
        get_newValue     : IntPtr
        get_url          : IntPtr
        get_storageArea  : IntPtr
        initStorageEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMStorageEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    key {
        get => this.get_key()
    }

    /**
     * @type {BSTR} 
     */
    oldValue {
        get => this.get_oldValue()
    }

    /**
     * @type {BSTR} 
     */
    newValue {
        get => this.get_newValue()
    }

    /**
     * @type {BSTR} 
     */
    url {
        get => this.get_url()
    }

    /**
     * @type {IHTMLStorage} 
     */
    storageArea {
        get => this.get_storageArea()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_key() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_oldValue() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_newValue() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStorage} 
     */
    get_storageArea() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStorage(p)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {BSTR} keyArg 
     * @param {BSTR} oldValueArg 
     * @param {BSTR} newValueArg 
     * @param {BSTR} urlArg 
     * @param {IHTMLStorage} storageAreaArg 
     * @returns {HRESULT} 
     */
    initStorageEvent(eventType, canBubble, cancelable, keyArg, oldValueArg, newValueArg, urlArg, storageAreaArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType
        keyArg := keyArg is String ? BSTR.Alloc(keyArg).Value : keyArg
        oldValueArg := oldValueArg is String ? BSTR.Alloc(oldValueArg).Value : oldValueArg
        newValueArg := newValueArg is String ? BSTR.Alloc(newValueArg).Value : newValueArg
        urlArg := urlArg is String ? BSTR.Alloc(urlArg).Value : urlArg

        result := ComCall(12, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, BSTR, keyArg, BSTR, oldValueArg, BSTR, newValueArg, BSTR, urlArg, "ptr", storageAreaArg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMStorageEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_key := CallbackCreate(GetMethod(implObj, "get_key"), flags, 2)
        this.vtbl.get_oldValue := CallbackCreate(GetMethod(implObj, "get_oldValue"), flags, 2)
        this.vtbl.get_newValue := CallbackCreate(GetMethod(implObj, "get_newValue"), flags, 2)
        this.vtbl.get_url := CallbackCreate(GetMethod(implObj, "get_url"), flags, 2)
        this.vtbl.get_storageArea := CallbackCreate(GetMethod(implObj, "get_storageArea"), flags, 2)
        this.vtbl.initStorageEvent := CallbackCreate(GetMethod(implObj, "initStorageEvent"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_key)
        CallbackFree(this.vtbl.get_oldValue)
        CallbackFree(this.vtbl.get_newValue)
        CallbackFree(this.vtbl.get_url)
        CallbackFree(this.vtbl.get_storageArea)
        CallbackFree(this.vtbl.initStorageEvent)
    }
}
