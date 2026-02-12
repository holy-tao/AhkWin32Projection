#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneComponent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneComponent
     * @type {Guid}
     */
    static IID => Guid("{ae20fc96-226c-44bd-95cb-dd5ed9ebe9a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ComponentType"]

    /**
     * @type {Integer} 
     */
    ComponentType {
        get => this.get_ComponentType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComponentType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
