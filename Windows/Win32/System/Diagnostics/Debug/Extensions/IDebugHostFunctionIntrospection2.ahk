#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostFunctionIntrospection.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionIntrospection2 extends IDebugHostFunctionIntrospection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostFunctionIntrospection2
     * @type {Guid}
     */
    static IID => Guid("{8e1cb118-aa83-409a-aae9-c7ff78911a5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateLocalsDetailsEx"]

    /**
     * 
     * @param {Integer} enumerateInlinedLocals 
     * @param {Pointer<IDebugHostFunctionLocalDetailsEnumerator>} localsEnum 
     * @returns {HRESULT} 
     */
    EnumerateLocalsDetailsEx(enumerateInlinedLocals, localsEnum) {
        result := ComCall(7, this, "char", enumerateInlinedLocals, "ptr*", localsEnum, "HRESULT")
        return result
    }
}
