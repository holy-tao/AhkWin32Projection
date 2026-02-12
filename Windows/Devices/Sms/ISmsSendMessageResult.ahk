#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsSendMessageResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsSendMessageResult
     * @type {Guid}
     */
    static IID => Guid("{db139af2-78c9-4feb-9622-452328088d62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSuccessful", "get_MessageReferenceNumbers", "get_CellularClass", "get_ModemErrorCode", "get_IsErrorTransient", "get_NetworkCauseCode", "get_TransportFailureCause"]

    /**
     * @type {Boolean} 
     */
    IsSuccessful {
        get => this.get_IsSuccessful()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    MessageReferenceNumbers {
        get => this.get_MessageReferenceNumbers()
    }

    /**
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * @type {Integer} 
     */
    ModemErrorCode {
        get => this.get_ModemErrorCode()
    }

    /**
     * @type {Boolean} 
     */
    IsErrorTransient {
        get => this.get_IsErrorTransient()
    }

    /**
     * @type {Integer} 
     */
    NetworkCauseCode {
        get => this.get_NetworkCauseCode()
    }

    /**
     * @type {Integer} 
     */
    TransportFailureCause {
        get => this.get_TransportFailureCause()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccessful() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_MessageReferenceNumbers() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ModemErrorCode() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsErrorTransient() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkCauseCode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportFailureCause() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
