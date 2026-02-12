#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined function. If the FLS slot is in use, FlsCallback is called on fiber deletion, thread exit, and when an FLS index is freed.
 * @remarks
 * Each FLS index has an associated 
 * <b>FlsCallback</b> function. The callback function can be used for any purpose, but it is intended to be used primarily to free memory.
 * @see https://learn.microsoft.com/windows/win32/api//content/winnt/nc-winnt-pfls_callback_function
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PFLS_CALLBACK_FUNCTION extends IUnknown {

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
     * @param {Pointer<Void>} lpFlsData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpFlsData) {
        lpFlsDataMarshal := lpFlsData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, lpFlsDataMarshal, lpFlsData)
    }
}
