#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NetworkOperatorTetheringManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{3ebcbacc-f8c3-405c-9964-70a1eeabe194}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTetheringCapability", "CreateFromNetworkAccountId"]

    /**
     * 
     * @param {HSTRING} networkAccountId 
     * @returns {Integer} 
     */
    GetTetheringCapability(networkAccountId) {
        if(networkAccountId is String) {
            pin := HSTRING.Create(networkAccountId)
            networkAccountId := pin.Value
        }
        networkAccountId := networkAccountId is Win32Handle ? NumGet(networkAccountId, "ptr") : networkAccountId

        result := ComCall(6, this, "ptr", networkAccountId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} networkAccountId 
     * @returns {NetworkOperatorTetheringManager} 
     */
    CreateFromNetworkAccountId(networkAccountId) {
        if(networkAccountId is String) {
            pin := HSTRING.Create(networkAccountId)
            networkAccountId := pin.Value
        }
        networkAccountId := networkAccountId is Win32Handle ? NumGet(networkAccountId, "ptr") : networkAccountId

        result := ComCall(7, this, "ptr", networkAccountId, "ptr*", &ppManager := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkOperatorTetheringManager(ppManager)
    }
}
