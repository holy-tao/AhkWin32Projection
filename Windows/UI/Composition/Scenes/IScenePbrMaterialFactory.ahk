#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class IScenePbrMaterialFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScenePbrMaterialFactory
     * @type {Guid}
     */
    static IID => Guid("{2e3f3dfe-0b85-5727-b5be-b7d3cbac37fa}")

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
