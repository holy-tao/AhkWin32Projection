#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionGeometry.ahk
#Include .\CompositionViewBox.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionGeometricClip extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGeometricClip
     * @type {Guid}
     */
    static IID => Guid("{c840b581-81c9-4444-a2c1-ccaece3a50e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Geometry", "put_Geometry", "get_ViewBox", "put_ViewBox"]

    /**
     * @type {CompositionGeometry} 
     */
    Geometry {
        get => this.get_Geometry()
        set => this.put_Geometry(value)
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
     * @returns {CompositionGeometry} 
     */
    get_Geometry() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionGeometry(value)
    }

    /**
     * 
     * @param {CompositionGeometry} value 
     * @returns {HRESULT} 
     */
    put_Geometry(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionViewBox} 
     */
    get_ViewBox() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
