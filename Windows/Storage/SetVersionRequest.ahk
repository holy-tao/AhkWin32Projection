#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISetVersionRequest.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data when an app sets the version of the application data in its app data store.
 * @remarks
 * This object is accessed when you implement a [ApplicationDataSetVersionHandler](applicationdatasetversionhandler.md) delegate to respond to the set version event.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.setversionrequest
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SetVersionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISetVersionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISetVersionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current version.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.setversionrequest.currentversion
     * @type {Integer} 
     */
    CurrentVersion {
        get => this.get_CurrentVersion()
    }

    /**
     * Gets the requested version.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.setversionrequest.desiredversion
     * @type {Integer} 
     */
    DesiredVersion {
        get => this.get_DesiredVersion()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentVersion() {
        if (!this.HasProp("__ISetVersionRequest")) {
            if ((queryResult := this.QueryInterface(ISetVersionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetVersionRequest := ISetVersionRequest(outPtr)
        }

        return this.__ISetVersionRequest.get_CurrentVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredVersion() {
        if (!this.HasProp("__ISetVersionRequest")) {
            if ((queryResult := this.QueryInterface(ISetVersionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetVersionRequest := ISetVersionRequest(outPtr)
        }

        return this.__ISetVersionRequest.get_DesiredVersion()
    }

    /**
     * Requests that the set version request be delayed.
     * @returns {SetVersionDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.setversionrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ISetVersionRequest")) {
            if ((queryResult := this.QueryInterface(ISetVersionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetVersionRequest := ISetVersionRequest(outPtr)
        }

        return this.__ISetVersionRequest.GetDeferral()
    }

;@endregion Instance Methods
}
