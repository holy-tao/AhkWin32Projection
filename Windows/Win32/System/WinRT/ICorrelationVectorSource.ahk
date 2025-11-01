#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICorrelationVectorSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorrelationVectorSource
     * @type {Guid}
     */
    static IID => Guid("{152b8a3b-b9b9-4685-b56e-974847bc7545}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CorrelationVector"]

    /**
     * 
     * @param {Pointer<HSTRING>} cv 
     * @returns {HRESULT} 
     */
    get_CorrelationVector(cv) {
        result := ComCall(3, this, "ptr", cv, "HRESULT")
        return result
    }
}
