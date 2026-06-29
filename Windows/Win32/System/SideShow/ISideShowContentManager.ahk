#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISideShowEvents.ahk" { ISideShowEvents }
#Import ".\ISideShowCapabilitiesCollection.ahk" { ISideShowCapabilitiesCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISideShowContent.ahk" { ISideShowContent }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowContentManager extends IUnknown {
    /**
     * The interface identifier for ISideShowContentManager
     * @type {Guid}
     */
    static IID := Guid("{a5d5b66b-eef9-41db-8d7e-e17c33ab10b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowContentManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add                   : IntPtr
        Remove                : IntPtr
        RemoveAll             : IntPtr
        SetEventSink          : IntPtr
        GetDeviceCapabilities : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowContentManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISideShowContent} in_pIContent 
     * @returns {HRESULT} 
     */
    Add(in_pIContent) {
        result := ComCall(3, this, "ptr", in_pIContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} in_contentId 
     * @returns {HRESULT} 
     */
    Remove(in_contentId) {
        result := ComCall(4, this, "uint", in_contentId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISideShowEvents} in_pIEvents 
     * @returns {HRESULT} 
     */
    SetEventSink(in_pIEvents) {
        result := ComCall(6, this, "ptr", in_pIEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISideShowCapabilitiesCollection} 
     */
    GetDeviceCapabilities() {
        result := ComCall(7, this, "ptr*", &out_ppCollection := 0, "HRESULT")
        return ISideShowCapabilitiesCollection(out_ppCollection)
    }

    Query(iid) {
        if (ISideShowContentManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.RemoveAll := CallbackCreate(GetMethod(implObj, "RemoveAll"), flags, 1)
        this.vtbl.SetEventSink := CallbackCreate(GetMethod(implObj, "SetEventSink"), flags, 2)
        this.vtbl.GetDeviceCapabilities := CallbackCreate(GetMethod(implObj, "GetDeviceCapabilities"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.RemoveAll)
        CallbackFree(this.vtbl.SetEventSink)
        CallbackFree(this.vtbl.GetDeviceCapabilities)
    }
}
