#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Specifies an app-defined callback function that notifies the app when the app is entering or leaving a suspended state.
 * @see https://learn.microsoft.com/windows/win32/api//content/appnotify/nc-appnotify-pappstate_change_routine
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PAPPSTATE_CHANGE_ROUTINE extends IUnknown {

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
     * @param {BOOLEAN} Quiesced 
     * @param {Pointer<Void>} Context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Quiesced, Context_) {
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "char", Quiesced, Context_Marshal, Context_)
    }
}
