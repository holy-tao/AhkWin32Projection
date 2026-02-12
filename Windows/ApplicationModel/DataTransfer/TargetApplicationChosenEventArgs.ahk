#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetApplicationChosenEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the target app the user chose to share content with. To get this object, you must handle the [TargetApplicationChosen](datatransfermanager_targetapplicationchosen.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.targetapplicationchoseneventargs
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class TargetApplicationChosenEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetApplicationChosenEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetApplicationChosenEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains the name of the app that the user chose to share content with.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.targetapplicationchoseneventargs.applicationname
     * @type {HSTRING} 
     */
    ApplicationName {
        get => this.get_ApplicationName()
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
    get_ApplicationName() {
        if (!this.HasProp("__ITargetApplicationChosenEventArgs")) {
            if ((queryResult := this.QueryInterface(ITargetApplicationChosenEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetApplicationChosenEventArgs := ITargetApplicationChosenEventArgs(outPtr)
        }

        return this.__ITargetApplicationChosenEventArgs.get_ApplicationName()
    }

;@endregion Instance Methods
}
