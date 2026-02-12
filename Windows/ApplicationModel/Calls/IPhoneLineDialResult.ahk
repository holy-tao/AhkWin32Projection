#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PhoneCall.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLineDialResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLineDialResult
     * @type {Guid}
     */
    static IID => Guid("{e825a30a-5c7f-546f-b918-3ad2fe70fb34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DialCallStatus", "get_DialedCall"]

    /**
     * @type {Integer} 
     */
    DialCallStatus {
        get => this.get_DialCallStatus()
    }

    /**
     * @type {PhoneCall} 
     */
    DialedCall {
        get => this.get_DialedCall()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DialCallStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhoneCall} 
     */
    get_DialedCall() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCall(value)
    }
}
