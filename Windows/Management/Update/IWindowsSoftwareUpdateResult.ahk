#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateResult
     * @type {Guid}
     */
    static IID => Guid("{a6d7ed98-6212-5ad3-aa9d-15e83bb85ee4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Succeeded", "get_CancelRequested", "get_ResultCode", "get_ExtendedError"]

    /**
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * @type {Boolean} 
     */
    CancelRequested {
        get => this.get_CancelRequested()
    }

    /**
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * @type {Integer} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
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
    get_CancelRequested() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResultCode() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedError() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
