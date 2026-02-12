#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreWindowPopupShowingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a method for setting the desired size of a popup window.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowpopupshowingeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreWindowPopupShowingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreWindowPopupShowingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreWindowPopupShowingEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the desired size of the popup.
     * @param {SIZE} value The desired size of the popup.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowpopupshowingeventargs.setdesiredsize
     */
    SetDesiredSize(value) {
        if (!this.HasProp("__ICoreWindowPopupShowingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowPopupShowingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowPopupShowingEventArgs := ICoreWindowPopupShowingEventArgs(outPtr)
        }

        return this.__ICoreWindowPopupShowingEventArgs.SetDesiredSize(value)
    }

;@endregion Instance Methods
}
