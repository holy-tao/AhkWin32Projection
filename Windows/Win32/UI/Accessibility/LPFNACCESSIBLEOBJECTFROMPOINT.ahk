#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAccessible.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class LPFNACCESSIBLEOBJECTFROMPOINT extends IUnknown {

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
     * @param {POINT} ptScreen 
     * @param {Pointer<VARIANT>} pvarChild 
     * @returns {IAccessible} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ptScreen, pvarChild) {
        result := ComCall(3, this, "ptr", ptScreen, "ptr*", &ppacc := 0, "ptr", pvarChild, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAccessible(ppacc)
    }
}
