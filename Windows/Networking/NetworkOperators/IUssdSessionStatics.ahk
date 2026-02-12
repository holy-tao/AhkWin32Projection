#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UssdSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IUssdSessionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUssdSessionStatics
     * @type {Guid}
     */
    static IID => Guid("{2f9acf82-1001-4d5d-bf81-2aba1b4be4a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromNetworkAccountId", "CreateFromNetworkInterfaceId"]

    /**
     * 
     * @param {HSTRING} networkAccountId 
     * @returns {UssdSession} 
     */
    CreateFromNetworkAccountId(networkAccountId) {
        if(networkAccountId is String) {
            pin := HSTRING.Create(networkAccountId)
            networkAccountId := pin.Value
        }
        networkAccountId := networkAccountId is Win32Handle ? NumGet(networkAccountId, "ptr") : networkAccountId

        result := ComCall(6, this, "ptr", networkAccountId, "ptr*", &ussdSession_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UssdSession(ussdSession_)
    }

    /**
     * 
     * @param {HSTRING} networkInterfaceId 
     * @returns {UssdSession} 
     */
    CreateFromNetworkInterfaceId(networkInterfaceId) {
        if(networkInterfaceId is String) {
            pin := HSTRING.Create(networkInterfaceId)
            networkInterfaceId := pin.Value
        }
        networkInterfaceId := networkInterfaceId is Win32Handle ? NumGet(networkInterfaceId, "ptr") : networkInterfaceId

        result := ComCall(7, this, "ptr", networkInterfaceId, "ptr*", &ussdSession_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UssdSession(ussdSession_)
    }
}
