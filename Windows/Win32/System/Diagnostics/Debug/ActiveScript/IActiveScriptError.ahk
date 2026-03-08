#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\EXCEPINFO.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptError
     * @type {Guid}
     */
    static IID => Guid("{eae1ba61-a4ed-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExceptionInfo", "GetSourcePosition", "GetSourceLineText"]

    /**
     * Retrieves a computer-independent description of an exception, and information about the computer state that exists for the thread when the exception occurs. This function can be called only from within the filter expression of an exception handler.
     * @remarks
     * The filter expression (from which the function is called) is evaluated if an exception occurs during execution of the **\_\_try** block, and it determines whether or not the **\_\_except** block is executed.
     * 
     * The filter expression can invoke a filter function. The filter function cannot call **GetExceptionInformation**. However, the return value of **GetExceptionInformation** can be passed as a parameter to a filter function.
     * 
     * To pass the [**EXCEPTION\_POINTERS**](/windows/desktop/api/WinNT/ns-winnt-exception_pointers) information to the exception-handler block, the filter expression or filter function must copy the pointer or the data to safe storage that the handler can later access.
     * 
     * In the case of nested handlers, each filter expression is evaluated until one is evaluated as **EXCEPTION\_EXECUTE\_HANDLER** or **EXCEPTION\_CONTINUE\_EXECUTION**. Each filter expression can invoke **GetExceptionInformation** to get exception information.
     * @returns {EXCEPINFO} 
     * @see https://learn.microsoft.com/windows/win32/Debug/getexceptioninformation
     */
    GetExceptionInfo() {
        pexcepinfo := EXCEPINFO()
        result := ComCall(3, this, "ptr", pexcepinfo, "HRESULT")
        return pexcepinfo
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSourceContext 
     * @param {Pointer<Integer>} pulLineNumber 
     * @param {Pointer<Integer>} plCharacterPosition 
     * @returns {HRESULT} 
     */
    GetSourcePosition(pdwSourceContext, pulLineNumber, plCharacterPosition) {
        pdwSourceContextMarshal := pdwSourceContext is VarRef ? "uint*" : "ptr"
        pulLineNumberMarshal := pulLineNumber is VarRef ? "uint*" : "ptr"
        plCharacterPositionMarshal := plCharacterPosition is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pdwSourceContextMarshal, pdwSourceContext, pulLineNumberMarshal, pulLineNumber, plCharacterPositionMarshal, plCharacterPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSourceLineText() {
        pbstrSourceLine := BSTR()
        result := ComCall(5, this, "ptr", pbstrSourceLine, "HRESULT")
        return pbstrSourceLine
    }
}
