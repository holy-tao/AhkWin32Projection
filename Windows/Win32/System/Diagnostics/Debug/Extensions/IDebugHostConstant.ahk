#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostConstant extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostConstant
     * @type {Guid}
     */
    static IID => Guid("{62787edc-fa76-4690-bd71-5e8c3e2937ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue"]

    /**
     * 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    GetValue(value) {
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }
}
