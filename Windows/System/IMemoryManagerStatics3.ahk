#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IMemoryManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemoryManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{149b59ce-92ad-4e35-89eb-50dfb4c0d91c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TrySetAppMemoryUsageLimit"]

    /**
     * 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    TrySetAppMemoryUsageLimit(value) {
        result := ComCall(6, this, "uint", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
