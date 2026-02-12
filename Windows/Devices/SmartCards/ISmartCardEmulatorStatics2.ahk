#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\SmartCardAppletIdGroupRegistration.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardEmulatorStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardEmulatorStatics2
     * @type {Guid}
     */
    static IID => Guid("{69ae9f8a-b775-488b-8436-6c1e28ed731f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppletIdGroupRegistrationsAsync", "RegisterAppletIdGroupAsync", "UnregisterAppletIdGroupAsync", "get_MaxAppletIdGroupRegistrations"]

    /**
     * @type {Integer} 
     */
    MaxAppletIdGroupRegistrations {
        get => this.get_MaxAppletIdGroupRegistrations()
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<SmartCardAppletIdGroupRegistration>>} 
     */
    GetAppletIdGroupRegistrationsAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, SmartCardAppletIdGroupRegistration), result_)
    }

    /**
     * 
     * @param {SmartCardAppletIdGroup} appletIdGroup 
     * @returns {IAsyncOperation<SmartCardAppletIdGroupRegistration>} 
     */
    RegisterAppletIdGroupAsync(appletIdGroup) {
        result := ComCall(7, this, "ptr", appletIdGroup, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardAppletIdGroupRegistration, result_)
    }

    /**
     * 
     * @param {SmartCardAppletIdGroupRegistration} registration 
     * @returns {IAsyncAction} 
     */
    UnregisterAppletIdGroupAsync(registration) {
        result := ComCall(8, this, "ptr", registration, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAppletIdGroupRegistrations() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
