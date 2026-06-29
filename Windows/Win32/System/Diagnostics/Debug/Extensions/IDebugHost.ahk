#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHost extends IUnknown {
    /**
     * The interface identifier for IDebugHost
     * @type {Guid}
     */
    static IID := Guid("{b8c74943-6b2c-4eeb-b5c5-35d378a6d99d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHostDefinedInterface : IntPtr
        GetCurrentContext       : IntPtr
        GetDefaultMetadata      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetHostDefinedInterface() {
        result := ComCall(3, this, "ptr*", &hostUnk := 0, "HRESULT")
        return IUnknown(hostUnk)
    }

    /**
     * 
     * @returns {IDebugHostContext} 
     */
    GetCurrentContext() {
        result := ComCall(4, this, "ptr*", &_context := 0, "HRESULT")
        return IDebugHostContext(_context)
    }

    /**
     * 
     * @returns {IKeyStore} 
     */
    GetDefaultMetadata() {
        result := ComCall(5, this, "ptr*", &defaultMetadataStore := 0, "HRESULT")
        return IKeyStore(defaultMetadataStore)
    }

    Query(iid) {
        if (IDebugHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHostDefinedInterface := CallbackCreate(GetMethod(implObj, "GetHostDefinedInterface"), flags, 2)
        this.vtbl.GetCurrentContext := CallbackCreate(GetMethod(implObj, "GetCurrentContext"), flags, 2)
        this.vtbl.GetDefaultMetadata := CallbackCreate(GetMethod(implObj, "GetDefaultMetadata"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHostDefinedInterface)
        CallbackFree(this.vtbl.GetCurrentContext)
        CallbackFree(this.vtbl.GetDefaultMetadata)
    }
}
