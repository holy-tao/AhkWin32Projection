#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneMeshMaterialAttributeMap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneMeshMaterialAttributeMap
     * @type {Guid}
     */
    static IID => Guid("{ce843171-3d43-4855-aa69-31ff988d049d}")

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
