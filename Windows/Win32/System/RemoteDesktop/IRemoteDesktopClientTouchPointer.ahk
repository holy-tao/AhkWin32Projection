#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Provides the properties needed to control the touch pointer feature of the Remote Desktop Protocol (RDP) app container client control.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclienttouchpointer
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IRemoteDesktopClientTouchPointer extends IDispatch {
    /**
     * The interface identifier for IRemoteDesktopClientTouchPointer
     * @type {Guid}
     */
    static IID := Guid("{260ec22d-8cbc-44b5-9e88-2a37f6c93ae9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDesktopClientTouchPointer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_Enabled       : IntPtr
        get_Enabled       : IntPtr
        put_EventsEnabled : IntPtr
        get_EventsEnabled : IntPtr
        put_PointerSpeed  : IntPtr
        get_PointerSpeed  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDesktopClientTouchPointer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EventsEnabled {
        get => this.get_EventsEnabled()
        set => this.put_EventsEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    PointerSpeed {
        get => this.get_PointerSpeed()
        set => this.put_PointerSpeed(value)
    }

    /**
     * Whether the touch pointer feature is enabled on the RDP app container client control. (Put)
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(7, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Whether the touch pointer feature is enabled on the RDP app container client control. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_enabled
     */
    get_Enabled() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Whether touch pointer event notifications are enabled for the RDP app container client control. (Put)
     * @param {VARIANT_BOOL} eventsEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-put_eventsenabled
     */
    put_EventsEnabled(eventsEnabled) {
        result := ComCall(9, this, VARIANT_BOOL, eventsEnabled, "HRESULT")
        return result
    }

    /**
     * Whether touch pointer event notifications are enabled for the RDP app container client control. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_eventsenabled
     */
    get_EventsEnabled() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &eventsEnabled := 0, "HRESULT")
        return eventsEnabled
    }

    /**
     * 
     * @param {Integer} pointerSpeed 
     * @returns {HRESULT} 
     */
    put_PointerSpeed(pointerSpeed) {
        result := ComCall(11, this, "uint", pointerSpeed, "HRESULT")
        return result
    }

    /**
     * How fast the touch pointer cursor will move on the virtual desktop relative to the speed of the gesture on the client.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_pointerspeed
     */
    get_PointerSpeed() {
        result := ComCall(12, this, "uint*", &pointerSpeed := 0, "HRESULT")
        return pointerSpeed
    }

    Query(iid) {
        if (IRemoteDesktopClientTouchPointer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_EventsEnabled := CallbackCreate(GetMethod(implObj, "put_EventsEnabled"), flags, 2)
        this.vtbl.get_EventsEnabled := CallbackCreate(GetMethod(implObj, "get_EventsEnabled"), flags, 2)
        this.vtbl.put_PointerSpeed := CallbackCreate(GetMethod(implObj, "put_PointerSpeed"), flags, 2)
        this.vtbl.get_PointerSpeed := CallbackCreate(GetMethod(implObj, "get_PointerSpeed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_EventsEnabled)
        CallbackFree(this.vtbl.get_EventsEnabled)
        CallbackFree(this.vtbl.put_PointerSpeed)
        CallbackFree(this.vtbl.get_PointerSpeed)
    }
}
