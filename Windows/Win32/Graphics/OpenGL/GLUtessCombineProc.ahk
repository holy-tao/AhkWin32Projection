#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class GLUtessCombineProc extends IUnknown {

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
     * @param {Pointer<Float>} param0 
     * @param {Pointer<Pointer<Void>>} param1 
     * @param {Pointer<Float>} param2 
     * @param {Pointer<Pointer<Void>>} param3 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0Marshal := param0 is VarRef ? "double*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"
        param2Marshal := param2 is VarRef ? "float*" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr*" : "ptr"

        ComCall(3, this, param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, param3Marshal, param3)
    }
}
