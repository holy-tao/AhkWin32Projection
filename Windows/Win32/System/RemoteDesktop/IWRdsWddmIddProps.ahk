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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHardwareId", "OnDriverLoad", "OnDriverUnload", "EnableWddmIdd"]

    /**
     * 
     * @param {PWSTR} pDisplayDriverHardwareId 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-gethardwareid
     */
    GetHardwareId(pDisplayDriverHardwareId, Count) {
        pDisplayDriverHardwareId := pDisplayDriverHardwareId is String ? StrPtr(pDisplayDriverHardwareId) : pDisplayDriverHardwareId

        result := ComCall(3, this, "ptr", pDisplayDriverHardwareId, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @param {HANDLE_PTR} DriverHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-ondriverload
     */
    OnDriverLoad(SessionId, DriverHandle) {
        result := ComCall(4, this, "uint", SessionId, "ptr", DriverHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-ondriverunload
     */
    OnDriverUnload(SessionId) {
        result := ComCall(5, this, "uint", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-enablewddmidd
     */
    EnableWddmIdd(Enabled) {
        result := ComCall(6, this, "int", Enabled, "HRESULT")
        return result
    }
}
