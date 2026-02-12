#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class FN_PROGRESS extends IUnknown {

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
     * @param {PWSTR} pObjectName 
     * @param {Integer} Status_ 
     * @param {Pointer<Integer>} pInvokeSetting 
     * @param {Pointer<Void>} Args 
     * @param {BOOL} SecuritySet 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pObjectName, Status_, pInvokeSetting, Args, SecuritySet) {
        pObjectName := pObjectName is String ? StrPtr(pObjectName) : pObjectName

        pInvokeSettingMarshal := pInvokeSetting is VarRef ? "int*" : "ptr"
        ArgsMarshal := Args is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", pObjectName, "uint", Status_, pInvokeSettingMarshal, pInvokeSetting, ArgsMarshal, Args, "int", SecuritySet)
    }
}
