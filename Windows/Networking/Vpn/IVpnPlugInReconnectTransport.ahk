#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPlugInReconnectTransport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPlugInReconnectTransport
     * @type {Guid}
     */
    static IID => Guid("{9d5a1092-bb46-4d34-9d88-f217893076f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReconnectTransport"]

    /**
     * 
     * @param {VpnChannel} channel 
     * @param {IInspectable} context_ 
     * @returns {HRESULT} 
     */
    ReconnectTransport(channel, context_) {
        result := ComCall(6, this, "ptr", channel, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
