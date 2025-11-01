#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDataModelScriptDebug.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebug2 extends IDataModelScriptDebug{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptDebug2
     * @type {Guid}
     */
    static IID => Guid("{cbb10ed3-839e-426c-9243-e23535c1ae1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBreakpointAtFunction"]

    /**
     * 
     * @param {PWSTR} functionName 
     * @param {Pointer<IDataModelScriptDebugBreakpoint>} breakpoint 
     * @returns {HRESULT} 
     */
    SetBreakpointAtFunction(functionName, breakpoint) {
        functionName := functionName is String ? StrPtr(functionName) : functionName

        result := ComCall(13, this, "ptr", functionName, "ptr*", breakpoint, "HRESULT")
        return result
    }
}
