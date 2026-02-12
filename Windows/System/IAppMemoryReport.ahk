#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppMemoryReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppMemoryReport
     * @type {Guid}
     */
    static IID => Guid("{6d65339b-4d6f-45bc-9c5e-e49b3ff2758d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrivateCommitUsage", "get_PeakPrivateCommitUsage", "get_TotalCommitUsage", "get_TotalCommitLimit"]

    /**
     * @type {Integer} 
     */
    PrivateCommitUsage {
        get => this.get_PrivateCommitUsage()
    }

    /**
     * @type {Integer} 
     */
    PeakPrivateCommitUsage {
        get => this.get_PeakPrivateCommitUsage()
    }

    /**
     * @type {Integer} 
     */
    TotalCommitUsage {
        get => this.get_TotalCommitUsage()
    }

    /**
     * @type {Integer} 
     */
    TotalCommitLimit {
        get => this.get_TotalCommitLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivateCommitUsage() {
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
    get_PeakPrivateCommitUsage() {
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
    get_TotalCommitUsage() {
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
    get_TotalCommitLimit() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
