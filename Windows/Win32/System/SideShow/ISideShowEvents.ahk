#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISideShowCapabilities.ahk" { ISideShowCapabilities }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISideShowContent.ahk" { ISideShowContent }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowEvents extends IUnknown {
    /**
     * The interface identifier for ISideShowEvents
     * @type {Guid}
     */
    static IID := Guid("{61feca4c-deb4-4a7e-8d75-51f1132d615b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ContentMissing   : IntPtr
        ApplicationEvent : IntPtr
        DeviceAdded      : IntPtr
        DeviceRemoved    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} in_contentId 
     * @returns {ISideShowContent} 
     */
    ContentMissing(in_contentId) {
        result := ComCall(3, this, "uint", in_contentId, "ptr*", &out_ppIContent := 0, "HRESULT")
        return ISideShowContent(out_ppIContent)
    }

    /**
     * 
     * @param {ISideShowCapabilities} in_pICapabilities 
     * @param {Integer} in_dwEventId 
     * @param {Integer} in_dwEventSize 
     * @param {Pointer<Integer>} in_pbEventData 
     * @returns {HRESULT} 
     */
    ApplicationEvent(in_pICapabilities, in_dwEventId, in_dwEventSize, in_pbEventData) {
        in_pbEventDataMarshal := in_pbEventData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", in_pICapabilities, "uint", in_dwEventId, "uint", in_dwEventSize, in_pbEventDataMarshal, in_pbEventData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISideShowCapabilities} in_pIDevice 
     * @returns {HRESULT} 
     */
    DeviceAdded(in_pIDevice) {
        result := ComCall(5, this, "ptr", in_pIDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISideShowCapabilities} in_pIDevice 
     * @returns {HRESULT} 
     */
    DeviceRemoved(in_pIDevice) {
        result := ComCall(6, this, "ptr", in_pIDevice, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISideShowEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ContentMissing := CallbackCreate(GetMethod(implObj, "ContentMissing"), flags, 3)
        this.vtbl.ApplicationEvent := CallbackCreate(GetMethod(implObj, "ApplicationEvent"), flags, 5)
        this.vtbl.DeviceAdded := CallbackCreate(GetMethod(implObj, "DeviceAdded"), flags, 2)
        this.vtbl.DeviceRemoved := CallbackCreate(GetMethod(implObj, "DeviceRemoved"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ContentMissing)
        CallbackFree(this.vtbl.ApplicationEvent)
        CallbackFree(this.vtbl.DeviceAdded)
        CallbackFree(this.vtbl.DeviceRemoved)
    }
}
