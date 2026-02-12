#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IJournalPrinterCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJournalPrinterCapabilities
     * @type {Guid}
     */
    static IID => Guid("{3b5ccc43-e047-4463-bb58-17b5ba1d8056}")

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
