#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessMemoryUsageReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessMemoryUsageReport
     * @type {Guid}
     */
    static IID => Guid("{c2c77cba-1951-4685-8532-7e749ecf8eeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NonPagedPoolSizeInBytes", "get_PageFaultCount", "get_PageFileSizeInBytes", "get_PagedPoolSizeInBytes", "get_PeakNonPagedPoolSizeInBytes", "get_PeakPageFileSizeInBytes", "get_PeakPagedPoolSizeInBytes", "get_PeakVirtualMemorySizeInBytes", "get_PeakWorkingSetSizeInBytes", "get_PrivatePageCount", "get_VirtualMemorySizeInBytes", "get_WorkingSetSizeInBytes"]

    /**
     * @type {Integer} 
     */
    NonPagedPoolSizeInBytes {
        get => this.get_NonPagedPoolSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PageFaultCount {
        get => this.get_PageFaultCount()
    }

    /**
     * @type {Integer} 
     */
    PageFileSizeInBytes {
        get => this.get_PageFileSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PagedPoolSizeInBytes {
        get => this.get_PagedPoolSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PeakNonPagedPoolSizeInBytes {
        get => this.get_PeakNonPagedPoolSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PeakPageFileSizeInBytes {
        get => this.get_PeakPageFileSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PeakPagedPoolSizeInBytes {
        get => this.get_PeakPagedPoolSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PeakVirtualMemorySizeInBytes {
        get => this.get_PeakVirtualMemorySizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PeakWorkingSetSizeInBytes {
        get => this.get_PeakWorkingSetSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    PrivatePageCount {
        get => this.get_PrivatePageCount()
    }

    /**
     * @type {Integer} 
     */
    VirtualMemorySizeInBytes {
        get => this.get_VirtualMemorySizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    WorkingSetSizeInBytes {
        get => this.get_WorkingSetSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NonPagedPoolSizeInBytes() {
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
    get_PageFaultCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageFileSizeInBytes() {
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
    get_PagedPoolSizeInBytes() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakNonPagedPoolSizeInBytes() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakPageFileSizeInBytes() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakPagedPoolSizeInBytes() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakVirtualMemorySizeInBytes() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakWorkingSetSizeInBytes() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivatePageCount() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VirtualMemorySizeInBytes() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WorkingSetSizeInBytes() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
