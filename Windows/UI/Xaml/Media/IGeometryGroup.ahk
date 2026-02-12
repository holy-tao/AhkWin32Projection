#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GeometryCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGeometryGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeometryGroup
     * @type {Guid}
     */
    static IID => Guid("{55225a61-8677-4c8c-8e46-ee3dc355114b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FillRule", "put_FillRule", "get_Children", "put_Children"]

    /**
     * @type {Integer} 
     */
    FillRule {
        get => this.get_FillRule()
        set => this.put_FillRule(value)
    }

    /**
     * @type {GeometryCollection} 
     */
    Children {
        get => this.get_Children()
        set => this.put_Children(value)
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
     * @returns {GeometryCollection} 
     */
    get_Children() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeometryCollection(value)
    }

    /**
     * 
     * @param {GeometryCollection} value 
     * @returns {HRESULT} 
     */
    put_Children(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
