#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IVisualInteractionSourceObjectFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualInteractionSourceObjectFactory
     * @type {Guid}
     */
    static IID => Guid("{b2ca917c-e98a-41f2-b3c9-891c9266c8f6}")

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
