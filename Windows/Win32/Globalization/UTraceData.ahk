#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTraceData extends IUnknown {

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
     * @param {Integer} fnNumber 
     * @param {Integer} level 
     * @param {PSTR} fmt 
     * @param {Pointer<Integer>} args 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, fnNumber, level, fmt, args) {
        fmt := fmt is String ? StrPtr(fmt) : fmt

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"
        argsMarshal := args is VarRef ? "char*" : "ptr"

        ComCall(3, this, context_Marshal, context_, "int", fnNumber, "int", level, "ptr", fmt, argsMarshal, args)
    }
}
