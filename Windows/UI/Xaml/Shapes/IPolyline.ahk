#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\PointCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class IPolyline extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPolyline
     * @type {Guid}
     */
    static IID => Guid("{91dc62f8-42b3-47f3-8476-c55124a7c4c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FillRule", "put_FillRule", "get_Points", "put_Points"]

    /**
     * @type {Integer} 
     */
    FillRule {
        get => this.get_FillRule()
        set => this.put_FillRule(value)
    }

    /**
     * @type {PointCollection} 
     */
    Points {
        get => this.get_Points()
        set => this.put_Points(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FillRule() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_FillRule(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PointCollection} 
     */
    get_Points() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointCollection(value)
    }

    /**
     * 
     * @param {PointCollection} value 
     * @returns {HRESULT} 
     */
    put_Points(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
