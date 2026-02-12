#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionShapeCollection.ahk
#Include .\CompositionViewBox.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IShapeVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShapeVisual
     * @type {Guid}
     */
    static IID => Guid("{f2bd13c3-ba7e-4b0f-9126-ffb7536b8176}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Shapes", "get_ViewBox", "put_ViewBox"]

    /**
     * @type {CompositionShapeCollection} 
     */
    Shapes {
        get => this.get_Shapes()
    }

    /**
     * @type {CompositionViewBox} 
     */
    ViewBox {
        get => this.get_ViewBox()
        set => this.put_ViewBox(value)
    }

    /**
     * 
     * @returns {CompositionShapeCollection} 
     */
    get_Shapes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionShapeCollection(value)
    }

    /**
     * 
     * @returns {CompositionViewBox} 
     */
    get_ViewBox() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionViewBox(value)
    }

    /**
     * 
     * @param {CompositionViewBox} value 
     * @returns {HRESULT} 
     */
    put_ViewBox(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
