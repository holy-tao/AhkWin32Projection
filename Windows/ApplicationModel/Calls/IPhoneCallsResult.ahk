#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PhoneCall.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallsResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallsResult
     * @type {Guid}
     */
    static IID => Guid("{1bfad365-57cf-57dd-986d-b057c91eac33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OperationStatus", "get_AllActivePhoneCalls"]

    /**
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * @type {IVectorView<PhoneCall>} 
     */
    AllActivePhoneCalls {
        get => this.get_AllActivePhoneCalls()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<PhoneCall>} 
     */
    get_AllActivePhoneCalls() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PhoneCall, value)
    }
}
