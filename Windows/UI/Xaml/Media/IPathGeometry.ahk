#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PathFigureCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPathGeometry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPathGeometry
     * @type {Guid}
     */
    static IID => Guid("{081b9df8-bae6-4bcb-813c-bde0e46dc8b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FillRule", "put_FillRule", "get_Figures", "put_Figures"]

    /**
     * @type {Integer} 
     */
    FillRule {
        get => this.get_FillRule()
        set => this.put_FillRule(value)
    }

    /**
     * @type {PathFigureCollection} 
     */
    Figures {
        get => this.get_Figures()
        set => this.put_Figures(value)
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
     * @returns {PathFigureCollection} 
     */
    get_Figures() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PathFigureCollection(value)
    }

    /**
     * 
     * @param {PathFigureCollection} value 
     * @returns {HRESULT} 
     */
    put_Figures(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
