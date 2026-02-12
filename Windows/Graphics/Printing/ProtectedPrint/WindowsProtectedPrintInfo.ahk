#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsProtectedPrintInfoStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides an API for querying whether Windows protected print mode is enabled on the current device.
 * @remarks
 * For information on WPP, see [Windows protected print mode](/windows-hardware/drivers/print/windows-protected-print-mode).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.protectedprint.windowsprotectedprintinfo
 * @namespace Windows.Graphics.Printing.ProtectedPrint
 * @version WindowsRuntime 1.4
 */
class WindowsProtectedPrintInfo extends IInspectable {
;@region Static Properties
    /**
     * Gets a value indicating wether Windows protected print mode is enabled on the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.protectedprint.windowsprotectedprintinfo.isprotectedprintenabled
     * @type {Boolean} 
     */
    static IsProtectedPrintEnabled {
        get => WindowsProtectedPrintInfo.get_IsProtectedPrintEnabled()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsProtectedPrintEnabled() {
        if (!WindowsProtectedPrintInfo.HasProp("__IWindowsProtectedPrintInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.ProtectedPrint.WindowsProtectedPrintInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsProtectedPrintInfoStatics.IID)
            WindowsProtectedPrintInfo.__IWindowsProtectedPrintInfoStatics := IWindowsProtectedPrintInfoStatics(factoryPtr)
        }

        return WindowsProtectedPrintInfo.__IWindowsProtectedPrintInfoStatics.get_IsProtectedPrintEnabled()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
