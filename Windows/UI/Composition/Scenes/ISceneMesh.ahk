#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SceneBoundingBox.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneMesh extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneMesh
     * @type {Guid}
     */
    static IID => Guid("{ee9a1530-1155-4c0c-92bd-40020cf78347}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bounds", "get_PrimitiveTopology", "put_PrimitiveTopology", "FillMeshAttribute"]

    /**
     * @type {SceneBoundingBox} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * @type {Integer} 
     */
    PrimitiveTopology {
        get => this.get_PrimitiveTopology()
        set => this.put_PrimitiveTopology(value)
    }

    /**
     * 
     * @returns {SceneBoundingBox} 
     */
    get_Bounds() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneBoundingBox(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrimitiveTopology() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrimitiveTopology(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} semantic 
     * @param {Integer} format 
     * @param {MemoryBuffer} memory 
     * @returns {HRESULT} 
     */
    FillMeshAttribute(semantic, format, memory) {
        result := ComCall(9, this, "int", semantic, "int", format, "ptr", memory, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
