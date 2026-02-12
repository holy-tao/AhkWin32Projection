#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportSessionInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the current session of the print support settings UI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsessioninfo
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportSessionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportSessionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportSessionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the source app that is performing the print operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsessioninfo.sourceappinfo
     * @type {AppInfo} 
     */
    SourceAppInfo {
        get => this.get_SourceAppInfo()
    }

    /**
     * Gets the printer device for the current session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsessioninfo.printer
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
     * @returns {AppInfo} 
     */
    get_SourceAppInfo() {
        if (!this.HasProp("__IPrintSupportSessionInfo")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSessionInfo := IPrintSupportSessionInfo(outPtr)
        }

        return this.__IPrintSupportSessionInfo.get_SourceAppInfo()
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        if (!this.HasProp("__IPrintSupportSessionInfo")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSessionInfo := IPrintSupportSessionInfo(outPtr)
        }

        return this.__IPrintSupportSessionInfo.get_Printer()
    }

;@endregion Instance Methods
}
