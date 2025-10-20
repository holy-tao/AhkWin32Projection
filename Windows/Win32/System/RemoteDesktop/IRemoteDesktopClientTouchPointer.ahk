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
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_Enabled(enabled) {
        result := ComCall(7, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    get_Enabled(enabled) {
        result := ComCall(8, this, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} eventsEnabled 
     * @returns {HRESULT} 
     */
    put_EventsEnabled(eventsEnabled) {
        result := ComCall(9, this, "short", eventsEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} eventsEnabled 
     * @returns {HRESULT} 
     */
    get_EventsEnabled(eventsEnabled) {
        result := ComCall(10, this, "ptr", eventsEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pointerSpeed 
     * @returns {HRESULT} 
     */
    put_PointerSpeed(pointerSpeed) {
        result := ComCall(11, this, "uint", pointerSpeed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pointerSpeed 
     * @returns {HRESULT} 
     */
    get_PointerSpeed(pointerSpeed) {
        result := ComCall(12, this, "uint*", pointerSpeed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
