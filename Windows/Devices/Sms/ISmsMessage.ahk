#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface is implemented by all types of SMS messages that are supported.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsMessage
     * @type {Guid}
     */
    static IID => Guid("{ed3c5e28-6984-4b07-811d-8d5906ed3cea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_MessageClass"]

    /**
     * Retrieves an ID for the message, which can later be specified in calling message store methods in order to get or delete the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsmessage.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Returns the message class, as determined by the operator's message network. The two most common classes are None (normal message) or Class0 (special operator message, such as a roaming warning that must be shown immediately to the user). A typical client for end-user messages ignores Class0 messages.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsmessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageClass() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
