#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppResourceGroupMemoryReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppResourceGroupMemoryReport
     * @type {Guid}
     */
    static IID => Guid("{2c8c06b1-7db1-4c51-a225-7fae2d49e431}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommitUsageLimit", "get_CommitUsageLevel", "get_PrivateCommitUsage", "get_TotalCommitUsage"]

    /**
     * @type {Integer} 
     */
    CommitUsageLimit {
        get => this.get_CommitUsageLimit()
    }

    /**
     * @type {Integer} 
     */
    CommitUsageLevel {
        get => this.get_CommitUsageLevel()
    }

    /**
     * @type {Integer} 
     */
    PrivateCommitUsage {
        get => this.get_PrivateCommitUsage()
    }

    /**
     * @type {Integer} 
     */
    TotalCommitUsage {
        get => this.get_TotalCommitUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CommitUsageLimit() {
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
    get_CommitUsageLevel() {
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
    get_PrivateCommitUsage() {
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
    get_TotalCommitUsage() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
