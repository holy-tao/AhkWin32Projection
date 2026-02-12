#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a function pointer to the callback used by the WindowsInspectString function.
 * @remarks
 * Implement this callback when you use the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsinspectstring">WindowsInspectString</a> function. You can do a cross-process read, read from a dump file, or read from a remote debug debugging session.
 * @see https://learn.microsoft.com/windows/win32/api//content/winstring/nc-winstring-pinspect_hstring_callback
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class PINSPECT_HSTRING_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} context_ 
     * @param {Pointer} readAddress 
     * @param {Integer} length 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, readAddress, length) {
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, context_Marshal, context_, "ptr", readAddress, "uint", length, "char*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return buffer_
    }
}
