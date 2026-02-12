#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsHostMessengerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsHostMessengerStatics2
     * @type {Guid}
     */
    static IID => Guid("{55ef9ebc-0444-42ad-832d-1b89c089d1ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterHostMessageReceiver", "UnregisterHostMessageReceiver"]

    /**
     * 
     * @param {Guid} receiverId 
     * @param {HostMessageReceivedCallback} hostMessageReceivedCallback_ 
     * @returns {HRESULT} 
     */
    RegisterHostMessageReceiver(receiverId, hostMessageReceivedCallback_) {
        result := ComCall(6, this, "ptr", receiverId, "ptr", hostMessageReceivedCallback_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} receiverId 
     * @returns {HRESULT} 
     */
    UnregisterHostMessageReceiver(receiverId) {
        result := ComCall(7, this, "ptr", receiverId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
