#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IContinue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContinue
     * @type {Guid}
     */
    static IID => Guid("{0000012a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FContinue"]

    /**
     * 
     * @returns {HRESULT} 
     */
    FContinue() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
