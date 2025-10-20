#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class IMethodMalloc extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMethodMalloc
     * @type {Guid}
     */
    static IID => Guid("{a0efb28b-6ee2-4d7b-b983-a75ef7beedb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Alloc"]

    /**
     * 
     * @param {Integer} cb 
     * @returns {Pointer<Void>} 
     */
    Alloc(cb) {
        result := ComCall(3, this, "uint", cb, "ptr")
        return result
    }
}
