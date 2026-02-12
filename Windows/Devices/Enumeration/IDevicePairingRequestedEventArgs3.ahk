#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDevicePairingRequestedEventArgs3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePairingRequestedEventArgs3
     * @type {Guid}
     */
    static IID => Guid("{195e5a38-43dc-562f-babe-efc8b110088b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcceptWithAddress"]

    /**
     * 
     * @param {HSTRING} address_ 
     * @returns {HRESULT} 
     */
    AcceptWithAddress(address_) {
        if(address_ is String) {
            pin := HSTRING.Create(address_)
            address_ := pin.Value
        }
        address_ := address_ is Win32Handle ? NumGet(address_, "ptr") : address_

        result := ComCall(6, this, "ptr", address_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
