#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedBarcodeScannerClosedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedBarcodeScannerClosedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{cf7d5489-a22c-4c65-a901-88d77d833954}")

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
