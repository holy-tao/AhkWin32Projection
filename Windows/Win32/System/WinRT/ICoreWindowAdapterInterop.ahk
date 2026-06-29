#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICoreWindowAdapterInterop extends IInspectable {
    /**
     * The interface identifier for ICoreWindowAdapterInterop
     * @type {Guid}
     */
    static IID := Guid("{7a5b6fd1-cd73-4b6c-9cf4-2e869eaf470a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreWindowAdapterInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        get_AppActivationClientAdapter       : IntPtr
        get_ApplicationViewClientAdapter     : IntPtr
        get_CoreApplicationViewClientAdapter : IntPtr
        get_HoloViewClientAdapter            : IntPtr
        get_PositionerClientAdapter          : IntPtr
        get_SystemNavigationClientAdapter    : IntPtr
        get_TitleBarClientAdapter            : IntPtr
        SetWindowClientAdapter               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreWindowAdapterInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    AppActivationClientAdapter {
        get => this.get_AppActivationClientAdapter()
    }

    /**
     * @type {IUnknown} 
     */
    ApplicationViewClientAdapter {
        get => this.get_ApplicationViewClientAdapter()
    }

    /**
     * @type {IUnknown} 
     */
    CoreApplicationViewClientAdapter {
        get => this.get_CoreApplicationViewClientAdapter()
    }

    /**
     * @type {IUnknown} 
     */
    HoloViewClientAdapter {
        get => this.get_HoloViewClientAdapter()
    }

    /**
     * @type {IUnknown} 
     */
    PositionerClientAdapter {
        get => this.get_PositionerClientAdapter()
    }

    /**
     * @type {IUnknown} 
     */
    SystemNavigationClientAdapter {
        get => this.get_SystemNavigationClientAdapter()
    }

    /**
     * @type {IUnknown} 
     */
    TitleBarClientAdapter {
        get => this.get_TitleBarClientAdapter()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_AppActivationClientAdapter() {
        result := ComCall(6, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_ApplicationViewClientAdapter() {
        result := ComCall(7, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_CoreApplicationViewClientAdapter() {
        result := ComCall(8, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_HoloViewClientAdapter() {
        result := ComCall(9, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_PositionerClientAdapter() {
        result := ComCall(10, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_SystemNavigationClientAdapter() {
        result := ComCall(11, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_TitleBarClientAdapter() {
        result := ComCall(12, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     */
    SetWindowClientAdapter(value) {
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICoreWindowAdapterInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AppActivationClientAdapter := CallbackCreate(GetMethod(implObj, "get_AppActivationClientAdapter"), flags, 2)
        this.vtbl.get_ApplicationViewClientAdapter := CallbackCreate(GetMethod(implObj, "get_ApplicationViewClientAdapter"), flags, 2)
        this.vtbl.get_CoreApplicationViewClientAdapter := CallbackCreate(GetMethod(implObj, "get_CoreApplicationViewClientAdapter"), flags, 2)
        this.vtbl.get_HoloViewClientAdapter := CallbackCreate(GetMethod(implObj, "get_HoloViewClientAdapter"), flags, 2)
        this.vtbl.get_PositionerClientAdapter := CallbackCreate(GetMethod(implObj, "get_PositionerClientAdapter"), flags, 2)
        this.vtbl.get_SystemNavigationClientAdapter := CallbackCreate(GetMethod(implObj, "get_SystemNavigationClientAdapter"), flags, 2)
        this.vtbl.get_TitleBarClientAdapter := CallbackCreate(GetMethod(implObj, "get_TitleBarClientAdapter"), flags, 2)
        this.vtbl.SetWindowClientAdapter := CallbackCreate(GetMethod(implObj, "SetWindowClientAdapter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AppActivationClientAdapter)
        CallbackFree(this.vtbl.get_ApplicationViewClientAdapter)
        CallbackFree(this.vtbl.get_CoreApplicationViewClientAdapter)
        CallbackFree(this.vtbl.get_HoloViewClientAdapter)
        CallbackFree(this.vtbl.get_PositionerClientAdapter)
        CallbackFree(this.vtbl.get_SystemNavigationClientAdapter)
        CallbackFree(this.vtbl.get_TitleBarClientAdapter)
        CallbackFree(this.vtbl.SetWindowClientAdapter)
    }
}
