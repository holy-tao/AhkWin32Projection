#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices
 * @version WindowsRuntime 1.4
 */
class ILowLevelDevicesController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLevelDevicesController
     * @type {Guid}
     */
    static IID => Guid("{2ec23dd4-179b-45de-9b39-3ae02527de52}")

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
