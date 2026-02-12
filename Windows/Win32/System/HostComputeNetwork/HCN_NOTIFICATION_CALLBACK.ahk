#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * HCN_NOTIFICATION_CALLBACK
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_NOTIFICATION_CALLBACK
 * @namespace Windows.Win32.System.HostComputeNetwork
 * @version v4.0.30319
 */
class HCN_NOTIFICATION_CALLBACK extends IUnknown {

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
     * @param {Integer} NotificationType 
     * @param {Pointer<Void>} Context_ 
     * @param {HRESULT} NotificationStatus 
     * @param {PWSTR} NotificationData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(NotificationType, Context_, NotificationStatus, NotificationData) {
        NotificationData := NotificationData is String ? StrPtr(NotificationData) : NotificationData

        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", NotificationType, Context_Marshal, Context_, "int", NotificationStatus, "ptr", NotificationData)
    }
}
