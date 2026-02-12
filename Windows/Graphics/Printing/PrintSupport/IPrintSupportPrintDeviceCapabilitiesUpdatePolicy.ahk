#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrintDeviceCapabilitiesUpdatePolicy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrintDeviceCapabilitiesUpdatePolicy
     * @type {Guid}
     */
    static IID => Guid("{5f5fc025-8c35-5529-8038-8cdc3634bbcd}")

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
