#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportExtensionTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides additional information associated with a [PrintSupportExtensionSession](printsupportextensionsession.md) instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportextensiontriggerdetails
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportExtensionTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportExtensionTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportExtensionTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the current session of the print support extension.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportextensiontriggerdetails.session
     * @type {PrintSupportExtensionSession} 
     */
    Session {
        get => this.get_Session()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintSupportExtensionSession} 
     */
    get_Session() {
        if (!this.HasProp("__IPrintSupportExtensionTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPrintSupportExtensionTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportExtensionTriggerDetails := IPrintSupportExtensionTriggerDetails(outPtr)
        }

        return this.__IPrintSupportExtensionTriggerDetails.get_Session()
    }

;@endregion Instance Methods
}
