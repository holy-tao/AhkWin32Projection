#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes the implementation of an effect.
 * @see https://learn.microsoft.com/windows/win32/api//content/d2d1_1/nc-d2d1_1-pd2d1_effect_factory
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class PD2D1_EFFECT_FACTORY extends IUnknown {

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
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke() {
        result := ComCall(3, this, "ptr*", &effectImpl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(effectImpl)
    }
}
