#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class ITaskbarManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskbarManager
     * @type {Guid}
     */
    static IID => Guid("{87490a19-1ad9-49f4-b2e8-86738dc5ac40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSupported", "get_IsPinningAllowed", "IsCurrentAppPinnedAsync", "IsAppListEntryPinnedAsync", "RequestPinCurrentAppAsync", "RequestPinAppListEntryAsync"]

    /**
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsPinningAllowed {
        get => this.get_IsPinningAllowed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPinningAllowed() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsCurrentAppPinnedAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {AppListEntry} appListEntry_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsAppListEntryPinnedAsync(appListEntry_) {
        result := ComCall(9, this, "ptr", appListEntry_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestPinCurrentAppAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {AppListEntry} appListEntry_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestPinAppListEntryAsync(appListEntry_) {
        result := ComCall(11, this, "ptr", appListEntry_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
