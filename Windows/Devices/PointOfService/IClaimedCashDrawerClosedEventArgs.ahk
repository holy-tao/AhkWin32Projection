#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedCashDrawerClosedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedCashDrawerClosedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{cc573f33-3f34-4c5c-baae-deadf16cd7fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
