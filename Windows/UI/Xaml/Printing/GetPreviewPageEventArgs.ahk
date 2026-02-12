#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGetPreviewPageEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [GetPreviewPage](printdocument_getpreviewpage.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.getpreviewpageeventargs
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class GetPreviewPageEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGetPreviewPageEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGetPreviewPageEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the page number of the potentially repaginated page involved in the preview.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.getpreviewpageeventargs.pagenumber
     * @type {Integer} 
     */
    PageNumber {
        get => this.get_PageNumber()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [GetPreviewPageEventArgs](getpreviewpageeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Printing.GetPreviewPageEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageNumber() {
        if (!this.HasProp("__IGetPreviewPageEventArgs")) {
            if ((queryResult := this.QueryInterface(IGetPreviewPageEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGetPreviewPageEventArgs := IGetPreviewPageEventArgs(outPtr)
        }

        return this.__IGetPreviewPageEventArgs.get_PageNumber()
    }

;@endregion Instance Methods
}
