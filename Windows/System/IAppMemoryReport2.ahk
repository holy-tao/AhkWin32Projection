#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppMemoryReport2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppMemoryReport2
     * @type {Guid}
     */
    static IID => Guid("{5f7f3738-51b7-42dc-b7ed-79ba46d28857}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExpectedTotalCommitLimit"]

    /**
     * @type {Integer} 
     */
    ExpectedTotalCommitLimit {
        get => this.get_ExpectedTotalCommitLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpectedTotalCommitLimit() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
