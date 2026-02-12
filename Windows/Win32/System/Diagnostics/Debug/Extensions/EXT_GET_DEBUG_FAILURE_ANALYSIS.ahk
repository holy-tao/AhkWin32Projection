#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugFailureAnalysis2.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_GET_DEBUG_FAILURE_ANALYSIS extends IUnknown {

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
     * @param {IDebugClient4} Client 
     * @param {Integer} Flags 
     * @param {Guid} ClassId 
     * @returns {IDebugFailureAnalysis2} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Client, Flags, ClassId) {
        result := ComCall(3, this, "ptr", Client, "uint", Flags, "ptr", ClassId, "ptr*", &ppAnalysis := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugFailureAnalysis2(ppAnalysis)
    }
}
