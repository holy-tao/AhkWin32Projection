#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Authorization\UI\ISecurityInformation.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.DirectoryServices
 * @version v4.0.30319
 */
class PFNDSCREATEISECINFO extends IUnknown {

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
     * @param {PWSTR} param0 
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<PFNREADOBJECTSECURITY>} param4 
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} param5 
     * @param {LPARAM} param6 
     * @returns {ISecurityInformation} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param4, param5, param6) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param6 := param6 is Win32Handle ? NumGet(param6, "ptr") : param6

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr*", &param3 := 0, "ptr", param4, "ptr", param5, "ptr", param6, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISecurityInformation(param3)
    }
}
