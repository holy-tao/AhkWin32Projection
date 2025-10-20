#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This interface allows a custom IDD driver to be loaded in a remote session.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdswddmiddprops
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsWddmIddProps extends IUnknown{
    /**
     * The interface identifier for IWRdsWddmIddProps
     * @type {Guid}
     */
    static IID => Guid("{1382df4d-a289-43d1-a184-144726f9af90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pDisplayDriverHardwareId 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetHardwareId(pDisplayDriverHardwareId, Count) {
        pDisplayDriverHardwareId := pDisplayDriverHardwareId is String ? StrPtr(pDisplayDriverHardwareId) : pDisplayDriverHardwareId

        result := ComCall(3, this, "ptr", pDisplayDriverHardwareId, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @param {HANDLE_PTR} DriverHandle 
     * @returns {HRESULT} 
     */
    OnDriverLoad(SessionId, DriverHandle) {
        result := ComCall(4, this, "uint", SessionId, "ptr", DriverHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     */
    OnDriverUnload(SessionId) {
        result := ComCall(5, this, "uint", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Enabled 
     * @returns {HRESULT} 
     */
    EnableWddmIdd(Enabled) {
        result := ComCall(6, this, "int", Enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
