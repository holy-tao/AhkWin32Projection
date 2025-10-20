#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICorrelationVectorInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorrelationVectorInformation
     * @type {Guid}
     */
    static IID => Guid("{83c78b3c-d88b-4950-aa6e-22b8d22aabd3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LastCorrelationVectorForThread", "get_NextCorrelationVectorForThread", "put_NextCorrelationVectorForThread"]

    /**
     * 
     * @param {Pointer<HSTRING>} cv 
     * @returns {HRESULT} 
     */
    get_LastCorrelationVectorForThread(cv) {
        result := ComCall(6, this, "ptr", cv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HSTRING>} cv 
     * @returns {HRESULT} 
     */
    get_NextCorrelationVectorForThread(cv) {
        result := ComCall(7, this, "ptr", cv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HSTRING} cv 
     * @returns {HRESULT} 
     */
    put_NextCorrelationVectorForThread(cv) {
        cv := cv is Win32Handle ? NumGet(cv, "ptr") : cv

        result := ComCall(8, this, "ptr", cv, "HRESULT")
        return result
    }
}
