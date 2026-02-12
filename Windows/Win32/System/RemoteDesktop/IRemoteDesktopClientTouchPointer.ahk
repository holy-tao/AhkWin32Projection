#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the properties needed to control the touch pointer feature of the Remote Desktop Protocol (RDP) app container client control.
 * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclienttouchpointer
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IRemoteDesktopClientTouchPointer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopClientTouchPointer
     * @type {Guid}
     */
    static IID => Guid("{260ec22d-8cbc-44b5-9e88-2a37f6c93ae9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Enabled", "get_Enabled", "put_EventsEnabled", "get_EventsEnabled", "put_PointerSpeed", "get_PointerSpeed"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(7, this, "short", enabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Whether the touch pointer feature is enabled on the RDP app container client control. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_enabled
     */
    get_Enabled() {
        result := ComCall(8, this, "short*", &enabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return enabled
    }

    /**
     * Whether touch pointer event notifications are enabled for the RDP app container client control. (Put)
     * @param {VARIANT_BOOL} eventsEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-put_eventsenabled
     */
    put_EventsEnabled(eventsEnabled) {
        result := ComCall(9, this, "short", eventsEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Whether touch pointer event notifications are enabled for the RDP app container client control. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_eventsenabled
     */
    get_EventsEnabled() {
        result := ComCall(10, this, "short*", &eventsEnabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventsEnabled
    }

    /**
     * 
     * @param {Integer} pointerSpeed 
     * @returns {HRESULT} 
     */
    put_PointerSpeed(pointerSpeed) {
        result := ComCall(11, this, "uint", pointerSpeed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * How fast the touch pointer cursor will move on the virtual desktop relative to the speed of the gesture on the client.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_pointerspeed
     */
    get_PointerSpeed() {
        result := ComCall(12, this, "uint*", &pointerSpeed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pointerSpeed
    }
}
