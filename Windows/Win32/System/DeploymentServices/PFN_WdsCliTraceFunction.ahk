#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines a callback function that can receive debugging messages from the WDS client.
 * @see https://learn.microsoft.com/windows/win32/api//content/wdsclientapi/nc-wdsclientapi-pfn_wdsclitracefunction
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PFN_WdsCliTraceFunction extends IUnknown {

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
     * @param {PWSTR} pwszFormat 
     * @param {Pointer<Integer>} Params 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pwszFormat, Params) {
        pwszFormat := pwszFormat is String ? StrPtr(pwszFormat) : pwszFormat

        ParamsMarshal := Params is VarRef ? "char*" : "ptr"

        ComCall(3, this, "ptr", pwszFormat, ParamsMarshal, Params)
    }
}
