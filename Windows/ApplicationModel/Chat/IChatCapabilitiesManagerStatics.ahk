#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ChatCapabilities.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatCapabilitiesManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatCapabilitiesManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{b57a2f30-7041-458e-b0cf-7c0d9fea333a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCachedCapabilitiesAsync", "GetCapabilitiesFromNetworkAsync"]

    /**
     * 
     * @param {HSTRING} address_ 
     * @returns {IAsyncOperation<ChatCapabilities>} 
     */
    GetCachedCapabilitiesAsync(address_) {
        if(address_ is String) {
            pin := HSTRING.Create(address_)
            address_ := pin.Value
        }
        address_ := address_ is Win32Handle ? NumGet(address_, "ptr") : address_

        result := ComCall(6, this, "ptr", address_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatCapabilities, result_)
    }

    /**
     * 
     * @param {HSTRING} address_ 
     * @returns {IAsyncOperation<ChatCapabilities>} 
     */
    GetCapabilitiesFromNetworkAsync(address_) {
        if(address_ is String) {
            pin := HSTRING.Create(address_)
            address_ := pin.Value
        }
        address_ := address_ is Win32Handle ? NumGet(address_, "ptr") : address_

        result := ComCall(7, this, "ptr", address_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatCapabilities, result_)
    }
}
