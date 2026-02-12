#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class PWLDP_QUERYSECURITYPOLICY_API extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<UNICODE_STRING>} providerName 
     * @param {Pointer<UNICODE_STRING>} keyName 
     * @param {Pointer<UNICODE_STRING>} valueName_ 
     * @param {Pointer} valueAddress 
     * @param {Pointer<Integer>} valueSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(providerName, keyName, valueName_, valueAddress, valueSize) {
        valueSizeMarshal := valueSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", providerName, "ptr", keyName, "ptr", valueName_, "int*", &valueType := 0, "ptr", valueAddress, valueSizeMarshal, valueSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return valueType
    }
}
