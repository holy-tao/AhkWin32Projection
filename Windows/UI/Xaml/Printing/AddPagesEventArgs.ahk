#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAddPagesEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [AddPages](printdocument_addpages.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.addpageseventargs
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class AddPagesEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAddPagesEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAddPagesEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [PrintTaskOptions](../windows.graphics.printing/printtaskoptions.md) for the pages added.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.addpageseventargs.printtaskoptions
     * @type {PrintTaskOptions} 
     */
    PrintTaskOptions {
        get => this.get_PrintTaskOptions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AddPagesEventArgs](addpageseventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Printing.AddPagesEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintTaskOptions} 
     */
    get_PrintTaskOptions() {
        if (!this.HasProp("__IAddPagesEventArgs")) {
            if ((queryResult := this.QueryInterface(IAddPagesEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPagesEventArgs := IAddPagesEventArgs(outPtr)
        }

        return this.__IAddPagesEventArgs.get_PrintTaskOptions()
    }

;@endregion Instance Methods
}
