#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Function class for effective power mode callback.
 * @remarks
 * Immediately after registration, this callback will be invoked with the current value of the power setting. If the registration occurs while the power setting is changing, you may receive multiple callbacks; the last callback is the most recent update.
 * @see https://learn.microsoft.com/windows/win32/api//content/powersetting/nf-powersetting-effective_power_mode_callback
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EFFECTIVE_POWER_MODE_CALLBACK extends IUnknown {

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
     * @param {Integer} Mode_ 
     * @param {Pointer<Void>} Context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Mode_, Context_) {
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "int", Mode_, Context_Marshal, Context_)
    }
}
