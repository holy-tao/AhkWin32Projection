#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISetVersionDeferral.ahk
#Include ..\..\Guid.ahk

/**
 * Manages a delayed set version operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.setversiondeferral
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SetVersionDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISetVersionDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISetVersionDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has set the version of the application data in its app data store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.setversiondeferral.complete
     */
    Complete() {
        if (!this.HasProp("__ISetVersionDeferral")) {
            if ((queryResult := this.QueryInterface(ISetVersionDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetVersionDeferral := ISetVersionDeferral(outPtr)
        }

        return this.__ISetVersionDeferral.Complete()
    }

;@endregion Instance Methods
}
