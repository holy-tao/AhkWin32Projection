#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MD_CHANGE_OBJECT_W.ahk" { MD_CHANGE_OBJECT_W }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct AsyncIMSAdminBaseSinkW extends IUnknown {
    /**
     * The interface identifier for AsyncIMSAdminBaseSinkW
     * @type {Guid}
     */
    static IID := Guid("{a9e69613-b80d-11d0-b9b9-00a0c922e750}")

    /**
     * The class identifier for AsyncIMSAdminBaseSinkW
     * @type {Guid}
     */
    static CLSID := Guid("{a9e69613-b80d-11d0-b9b9-00a0c922e750}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIMSAdminBaseSinkW interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_SinkNotify      : IntPtr
        Finish_SinkNotify     : IntPtr
        Begin_ShutdownNotify  : IntPtr
        Finish_ShutdownNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIMSAdminBaseSinkW.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwMDNumElements 
     * @param {Pointer<MD_CHANGE_OBJECT_W>} pcoChangeList 
     * @returns {HRESULT} 
     */
    Begin_SinkNotify(dwMDNumElements, pcoChangeList) {
        result := ComCall(3, this, "uint", dwMDNumElements, MD_CHANGE_OBJECT_W.Ptr, pcoChangeList, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_SinkNotify() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_ShutdownNotify() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_ShutdownNotify() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIMSAdminBaseSinkW.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_SinkNotify := CallbackCreate(GetMethod(implObj, "Begin_SinkNotify"), flags, 3)
        this.vtbl.Finish_SinkNotify := CallbackCreate(GetMethod(implObj, "Finish_SinkNotify"), flags, 1)
        this.vtbl.Begin_ShutdownNotify := CallbackCreate(GetMethod(implObj, "Begin_ShutdownNotify"), flags, 1)
        this.vtbl.Finish_ShutdownNotify := CallbackCreate(GetMethod(implObj, "Finish_ShutdownNotify"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_SinkNotify)
        CallbackFree(this.vtbl.Finish_SinkNotify)
        CallbackFree(this.vtbl.Begin_ShutdownNotify)
        CallbackFree(this.vtbl.Finish_ShutdownNotify)
    }
}
