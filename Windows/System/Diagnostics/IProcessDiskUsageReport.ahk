#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessDiskUsageReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessDiskUsageReport
     * @type {Guid}
     */
    static IID => Guid("{401627fd-535d-4c1f-81b8-da54e1be635e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReadOperationCount", "get_WriteOperationCount", "get_OtherOperationCount", "get_BytesReadCount", "get_BytesWrittenCount", "get_OtherBytesCount"]

    /**
     * @type {Integer} 
     */
    ReadOperationCount {
        get => this.get_ReadOperationCount()
    }

    /**
     * @type {Integer} 
     */
    WriteOperationCount {
        get => this.get_WriteOperationCount()
    }

    /**
     * @type {Integer} 
     */
    OtherOperationCount {
        get => this.get_OtherOperationCount()
    }

    /**
     * @type {Integer} 
     */
    BytesReadCount {
        get => this.get_BytesReadCount()
    }

    /**
     * @type {Integer} 
     */
    BytesWrittenCount {
        get => this.get_BytesWrittenCount()
    }

    /**
     * @type {Integer} 
     */
    OtherBytesCount {
        get => this.get_OtherBytesCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadOperationCount() {
        result := ComCall(6, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteOperationCount() {
        result := ComCall(7, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherOperationCount() {
        result := ComCall(8, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReadCount() {
        result := ComCall(9, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesWrittenCount() {
        result := ComCall(10, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherBytesCount() {
        result := ComCall(11, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
