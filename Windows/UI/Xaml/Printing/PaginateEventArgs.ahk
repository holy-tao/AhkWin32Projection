#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaginateEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [Paginate](printdocument_paginate.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.paginateeventargs
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class PaginateEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaginateEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaginateEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [PrintTaskOptions](../windows.graphics.printing/printtaskoptions.md) for the pages involved in the event occurrence.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.paginateeventargs.printtaskoptions
     * @type {PrintTaskOptions} 
     */
    PrintTaskOptions {
        get => this.get_PrintTaskOptions()
    }

    /**
     * Gets the 1-based page number of the current preview page.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.paginateeventargs.currentpreviewpagenumber
     * @type {Integer} 
     */
    CurrentPreviewPageNumber {
        get => this.get_CurrentPreviewPageNumber()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PaginateEventArgs](paginateeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Printing.PaginateEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintTaskOptions} 
     */
    get_PrintTaskOptions() {
        if (!this.HasProp("__IPaginateEventArgs")) {
            if ((queryResult := this.QueryInterface(IPaginateEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaginateEventArgs := IPaginateEventArgs(outPtr)
        }

        return this.__IPaginateEventArgs.get_PrintTaskOptions()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentPreviewPageNumber() {
        if (!this.HasProp("__IPaginateEventArgs")) {
            if ((queryResult := this.QueryInterface(IPaginateEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaginateEventArgs := IPaginateEventArgs(outPtr)
        }

        return this.__IPaginateEventArgs.get_CurrentPreviewPageNumber()
    }

;@endregion Instance Methods
}
