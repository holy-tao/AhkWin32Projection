#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Client-provided callback function, used by CreateFontPackage and MergeFontPackage to reallocate memory when the size of an allocated buffer needs to change.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-2010/xbebcx7d(v=vs.100)">realloc</a> conforms to this type; the application can either use <b>realloc</b> or a more specialized function for memory reallocation. Whatever function is chosen, there must also be appropriate functions for initial allocation and to free this memory.
 * @see https://learn.microsoft.com/windows/win32/api//content/fontsub/nc-fontsub-cfp_reallocproc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class CFP_REALLOCPROC extends IUnknown {

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
     * @param {Pointer<Void>} param0 
     * @param {Pointer} param1 
     * @returns {Pointer<Void>} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "ptr", param1, "ptr")
        return result
    }
}
