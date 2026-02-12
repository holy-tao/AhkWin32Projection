#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_NOTIFICATION_CALLBACK extends IUnknown {

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
     * @param {Integer} notificationType 
     * @param {Pointer<Void>} context_ 
     * @param {HRESULT} notificationStatus 
     * @param {PWSTR} notificationData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(notificationType, context_, notificationStatus, notificationData) {
        notificationData := notificationData is String ? StrPtr(notificationData) : notificationData

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", notificationType, context_Marshal, context_, "int", notificationStatus, "ptr", notificationData)
    }
}
