#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class PWLDP_GETAPPLICATIONSETTINGSTRINGSET_API extends IUnknown {

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
     * @param {PWSTR} id 
     * @param {PWSTR} setting 
     * @param {Pointer} dataCount 
     * @param {PWSTR} result_ 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(id, setting, dataCount, result_) {
        id := id is String ? StrPtr(id) : id
        setting := setting is String ? StrPtr(setting) : setting
        result_ := result_ is String ? StrPtr(result_) : result_

        result := ComCall(3, this, "ptr", id, "ptr", setting, "ptr", dataCount, "ptr*", &requiredCount := 0, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requiredCount
    }
}
