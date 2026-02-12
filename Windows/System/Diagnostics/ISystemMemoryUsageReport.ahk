#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ISystemMemoryUsageReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemMemoryUsageReport
     * @type {Guid}
     */
    static IID => Guid("{38663c87-2a9f-403a-bd19-2cf3e8169500}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TotalPhysicalSizeInBytes", "get_AvailableSizeInBytes", "get_CommittedSizeInBytes"]

    /**
     * @type {Integer} 
     */
    TotalPhysicalSizeInBytes {
        get => this.get_TotalPhysicalSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    AvailableSizeInBytes {
        get => this.get_AvailableSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    CommittedSizeInBytes {
        get => this.get_CommittedSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalPhysicalSizeInBytes() {
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
    get_AvailableSizeInBytes() {
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
    get_CommittedSizeInBytes() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
