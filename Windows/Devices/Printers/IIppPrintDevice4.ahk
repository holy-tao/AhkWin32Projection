#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\Printing\PrintTicket\WorkflowPrintTicket.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppPrintDevice4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppPrintDevice4
     * @type {Guid}
     */
    static IID => Guid("{8c48247e-e869-59fb-bc6d-daea0614f93e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceKind", "get_CanModifyUserDefaultPrintTicket", "get_UserDefaultPrintTicket", "put_UserDefaultPrintTicket", "RefreshPrintDeviceCapabilities", "GetMaxSupportedPdlVersion"]

    /**
     * @type {Integer} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
    }

    /**
     * @type {Boolean} 
     */
    CanModifyUserDefaultPrintTicket {
        get => this.get_CanModifyUserDefaultPrintTicket()
    }

    /**
     * @type {WorkflowPrintTicket} 
     */
    UserDefaultPrintTicket {
        get => this.get_UserDefaultPrintTicket()
        set => this.put_UserDefaultPrintTicket(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyUserDefaultPrintTicket() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_UserDefaultPrintTicket() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WorkflowPrintTicket(value)
    }

    /**
     * 
     * @param {WorkflowPrintTicket} value 
     * @returns {HRESULT} 
     */
    put_UserDefaultPrintTicket(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshPrintDeviceCapabilities() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} pdlContentType 
     * @returns {HSTRING} 
     */
    GetMaxSupportedPdlVersion(pdlContentType) {
        if(pdlContentType is String) {
            pin := HSTRING.Create(pdlContentType)
            pdlContentType := pin.Value
        }
        pdlContentType := pdlContentType is Win32Handle ? NumGet(pdlContentType, "ptr") : pdlContentType

        result_ := HSTRING()
        result := ComCall(11, this, "ptr", pdlContentType, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
