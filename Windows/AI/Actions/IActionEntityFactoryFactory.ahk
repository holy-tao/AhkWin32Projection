#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityFactoryFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityFactoryFactory
     * @type {Guid}
     */
    static IID => Guid("{c9147d8f-88a0-5ec0-a564-47e2a1081412}")

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
