#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SceneNode.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneVisual
     * @type {Guid}
     */
    static IID => Guid("{8e672c1e-d734-47b1-be14-3d694ffa4301}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Root", "put_Root"]

    /**
     * @type {SceneNode} 
     */
    Root {
        get => this.get_Root()
        set => this.put_Root(value)
    }

    /**
     * 
     * @returns {SceneNode} 
     */
    get_Root() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneNode(value)
    }

    /**
     * 
     * @param {SceneNode} value 
     * @returns {HRESULT} 
     */
    put_Root(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
