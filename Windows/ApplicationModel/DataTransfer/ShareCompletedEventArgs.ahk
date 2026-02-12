#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains the event args for [ShareCompleted](datapackage_sharecompleted.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharecompletedeventargs
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ShareCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the share target.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharecompletedeventargs.sharetarget
     * @type {ShareTargetInfo} 
     */
    ShareTarget {
        get => this.get_ShareTarget()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ShareTargetInfo} 
     */
    get_ShareTarget() {
        if (!this.HasProp("__IShareCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IShareCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareCompletedEventArgs := IShareCompletedEventArgs(outPtr)
        }

        return this.__IShareCompletedEventArgs.get_ShareTarget()
    }

;@endregion Instance Methods
}
