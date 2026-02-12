#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface provides access to the raw binary format of an SMS message. The message is stored in the industry standard protocol description unit (PDU) format (see the SMS specification GSM 03.40).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsbinarymessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsBinaryMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsBinaryMessage
     * @type {Guid}
     */
    static IID => Guid("{5bf4e813-3b53-4c6e-b61a-d86a63755650}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "put_Format", "GetData", "SetData"]

    /**
     * Retrieves the detected protocol description unit (PDU) format of this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsbinarymessage.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Format(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the raw buffer of the message in binary protocol description unit (PDU) format as a byte array.
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} A byte array representing message data. If there is no message data, the returned array is empty.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsbinarymessage.getdata
     */
    GetData(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the raw binary payload of the SMS message. It should be formatted according to the protocol description unit (PDU) standard.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value A byte array representing message data, formatted according to the protocol description unit (PDU) standard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsbinarymessage.setdata
     */
    SetData(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
