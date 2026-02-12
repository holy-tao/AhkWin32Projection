#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * This handler is called when the status on the SMS device changes. Callers should implement this when they want to be notified when a significant state change occurs on the device. For example, the caller might want to know when the device is ready to send and receive messages.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicestatuschangedeventhandler
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsDeviceStatusChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SmsDeviceStatusChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{982b1162-3dd7-4618-af89-0c272d5d06d8}")

    /**
     * The class identifier for SmsDeviceStatusChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{982b1162-3dd7-4618-af89-0c272d5d06d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {SmsDevice} sender 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
