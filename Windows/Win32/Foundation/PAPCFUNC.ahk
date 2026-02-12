#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An application-defined completion routine. Specify this address when calling the QueueUserAPC function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winnt/nc-winnt-papcfunc
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class PAPCFUNC extends IUnknown {

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
     * @param {Pointer} Parameter 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Parameter) {
        ComCall(3, this, "ptr", Parameter)
    }
}
