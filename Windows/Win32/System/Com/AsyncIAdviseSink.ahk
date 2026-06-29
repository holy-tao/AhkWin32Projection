#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMoniker.ahk" { IMoniker }
#Import ".\STGMEDIUM.ahk" { STGMEDIUM }
#Import ".\FORMATETC.ahk" { FORMATETC }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct AsyncIAdviseSink extends IUnknown {
    /**
     * The interface identifier for AsyncIAdviseSink
     * @type {Guid}
     */
    static IID := Guid("{00000150-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIAdviseSink
     * @type {Guid}
     */
    static CLSID := Guid("{00000150-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIAdviseSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_OnDataChange  : IntPtr
        Finish_OnDataChange : IntPtr
        Begin_OnViewChange  : IntPtr
        Finish_OnViewChange : IntPtr
        Begin_OnRename      : IntPtr
        Finish_OnRename     : IntPtr
        Begin_OnSave        : IntPtr
        Finish_OnSave       : IntPtr
        Begin_OnClose       : IntPtr
        Finish_OnClose      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIAdviseSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<FORMATETC>} pFormatetc 
     * @param {Pointer<STGMEDIUM>} pStgmed 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnDataChange(pFormatetc, pStgmed) {
        ComCall(3, this, FORMATETC.Ptr, pFormatetc, STGMEDIUM.Ptr, pStgmed)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnDataChange() {
        ComCall(4, this)
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Integer} lindex 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnViewChange(dwAspect, lindex) {
        ComCall(5, this, "uint", dwAspect, "int", lindex)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnViewChange() {
        ComCall(6, this)
    }

    /**
     * 
     * @param {IMoniker} pmk 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnRename(pmk) {
        ComCall(7, this, "ptr", pmk)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnRename() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnSave() {
        ComCall(9, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnSave() {
        ComCall(10, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnClose() {
        ComCall(11, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnClose() {
        ComCall(12, this)
    }

    Query(iid) {
        if (AsyncIAdviseSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_OnDataChange := CallbackCreate(GetMethod(implObj, "Begin_OnDataChange"), flags, 3)
        this.vtbl.Finish_OnDataChange := CallbackCreate(GetMethod(implObj, "Finish_OnDataChange"), flags, 1)
        this.vtbl.Begin_OnViewChange := CallbackCreate(GetMethod(implObj, "Begin_OnViewChange"), flags, 3)
        this.vtbl.Finish_OnViewChange := CallbackCreate(GetMethod(implObj, "Finish_OnViewChange"), flags, 1)
        this.vtbl.Begin_OnRename := CallbackCreate(GetMethod(implObj, "Begin_OnRename"), flags, 2)
        this.vtbl.Finish_OnRename := CallbackCreate(GetMethod(implObj, "Finish_OnRename"), flags, 1)
        this.vtbl.Begin_OnSave := CallbackCreate(GetMethod(implObj, "Begin_OnSave"), flags, 1)
        this.vtbl.Finish_OnSave := CallbackCreate(GetMethod(implObj, "Finish_OnSave"), flags, 1)
        this.vtbl.Begin_OnClose := CallbackCreate(GetMethod(implObj, "Begin_OnClose"), flags, 1)
        this.vtbl.Finish_OnClose := CallbackCreate(GetMethod(implObj, "Finish_OnClose"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_OnDataChange)
        CallbackFree(this.vtbl.Finish_OnDataChange)
        CallbackFree(this.vtbl.Begin_OnViewChange)
        CallbackFree(this.vtbl.Finish_OnViewChange)
        CallbackFree(this.vtbl.Begin_OnRename)
        CallbackFree(this.vtbl.Finish_OnRename)
        CallbackFree(this.vtbl.Begin_OnSave)
        CallbackFree(this.vtbl.Finish_OnSave)
        CallbackFree(this.vtbl.Begin_OnClose)
        CallbackFree(this.vtbl.Finish_OnClose)
    }
}
