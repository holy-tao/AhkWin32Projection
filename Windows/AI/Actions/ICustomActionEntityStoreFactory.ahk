#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ICustomActionEntityStoreFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomActionEntityStoreFactory
     * @type {Guid}
     */
    static IID => Guid("{d8b46bdb-68a5-5e07-9113-abb9241aaab1}")

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
