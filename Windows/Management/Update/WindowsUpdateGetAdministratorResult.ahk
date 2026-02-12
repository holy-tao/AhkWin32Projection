#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateGetAdministratorResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of calling [GetRegisteredAdministrator](./windowsupdateadministrator_getregisteredadministrator_1823331721.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdategetadministratorresult
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateGetAdministratorResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateGetAdministratorResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateGetAdministratorResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Windows update administrator object associated with the requested API call.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdategetadministratorresult.administrator
     * @type {WindowsUpdateAdministrator} 
     */
    Administrator {
        get => this.get_Administrator()
    }

    /**
     * Gets the status of the result of the requested Windows update administrator call.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdategetadministratorresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowsUpdateAdministrator} 
     */
    get_Administrator() {
        if (!this.HasProp("__IWindowsUpdateGetAdministratorResult")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateGetAdministratorResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateGetAdministratorResult := IWindowsUpdateGetAdministratorResult(outPtr)
        }

        return this.__IWindowsUpdateGetAdministratorResult.get_Administrator()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IWindowsUpdateGetAdministratorResult")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateGetAdministratorResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateGetAdministratorResult := IWindowsUpdateGetAdministratorResult(outPtr)
        }

        return this.__IWindowsUpdateGetAdministratorResult.get_Status()
    }

;@endregion Instance Methods
}
