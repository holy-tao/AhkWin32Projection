#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the properties needed to control the touch pointer feature of the Remote Desktop Protocol (RDP) app container client control.
 * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclienttouchpointer
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
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(7, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_enabled
     */
    get_Enabled(enabled) {
        result := ComCall(8, this, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} eventsEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-put_eventsenabled
     */
    put_EventsEnabled(eventsEnabled) {
        result := ComCall(9, this, "short", eventsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} eventsEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_eventsenabled
     */
    get_EventsEnabled(eventsEnabled) {
        result := ComCall(10, this, "ptr", eventsEnabled, "HRESULT")
        return result
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
     * 
     * @param {Pointer<Integer>} pointerSpeed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclienttouchpointer-get_pointerspeed
     */
    get_PointerSpeed(pointerSpeed) {
        pointerSpeedMarshal := pointerSpeed is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pointerSpeedMarshal, pointerSpeed, "HRESULT")
        return result
    }
}
