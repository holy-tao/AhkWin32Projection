#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SmsDevice.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsDeviceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsDeviceStatics2
     * @type {Guid}
     */
    static IID => Guid("{2ca11c87-0873-4caf-8a7d-bd471e8586d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromNetworkAccountIdAsync"]

    /**
     * 
     * @param {HSTRING} networkAccountId 
     * @returns {IAsyncOperation<SmsDevice>} 
     */
    FromNetworkAccountIdAsync(networkAccountId) {
        if(networkAccountId is String) {
            pin := HSTRING.Create(networkAccountId)
            networkAccountId := pin.Value
        }
        networkAccountId := networkAccountId is Win32Handle ? NumGet(networkAccountId, "ptr") : networkAccountId

        result := ComCall(6, this, "ptr", networkAccountId, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmsDevice, asyncInfo)
    }
}
