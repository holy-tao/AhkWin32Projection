#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportEnterpriseManagementUIEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides activation args that allow print support apps to query and update properties of Internet Printing Protocol (IPP) printer devices.
 * @remarks
 * Get an instance of this class by casting the [IActivatedEventArgs](/uwp/api/windows.applicationmodel.activation.iactivatedeventargs) passed into the [OnActivated](/uwp/api/windows.ui.xaml.application.onactivated) event. Verify that the activation [Kind](/uwp/api/windows.applicationmodel.activation.iactivatedeventargs.kind) is [PrintSupportEnterpriseManagementUI](/uwp/api/windows.applicationmodel.activation.activationkind) before casting the args object.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportenterprisemanagementuieventargs
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportEnterpriseManagementUIEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportEnterpriseManagementUIEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportEnterpriseManagementUIEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        if (!this.HasProp("__IPrintSupportEnterpriseManagementUIEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportEnterpriseManagementUIEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportEnterpriseManagementUIEventArgs := IPrintSupportEnterpriseManagementUIEventArgs(outPtr)
        }

        return this.__IPrintSupportEnterpriseManagementUIEventArgs.get_Printer()
    }

;@endregion Instance Methods
}
