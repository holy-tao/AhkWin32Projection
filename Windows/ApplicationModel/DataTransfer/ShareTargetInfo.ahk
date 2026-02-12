#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareTargetInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains information about a share target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetargetinfo
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ShareTargetInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareTargetInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareTargetInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the app user model ID.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetargetinfo.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * Gets the share provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetargetinfo.shareprovider
     * @type {ShareProvider} 
     */
    ShareProvider {
        get => this.get_ShareProvider()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IShareTargetInfo")) {
            if ((queryResult := this.QueryInterface(IShareTargetInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareTargetInfo := IShareTargetInfo(outPtr)
        }

        return this.__IShareTargetInfo.get_AppUserModelId()
    }

    /**
     * 
     * @returns {ShareProvider} 
     */
    get_ShareProvider() {
        if (!this.HasProp("__IShareTargetInfo")) {
            if ((queryResult := this.QueryInterface(IShareTargetInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareTargetInfo := IShareTargetInfo(outPtr)
        }

        return this.__IShareTargetInfo.get_ShareProvider()
    }

;@endregion Instance Methods
}
