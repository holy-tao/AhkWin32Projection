#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class IInkAnalysisInkDrawing extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkAnalysisInkDrawing
     * @type {Guid}
     */
    static IID => Guid("{6a85ed1f-1fe4-4e15-898c-8e112377e021}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DrawingKind", "get_Center", "get_Points"]

    /**
     * @type {Integer} 
     */
    DrawingKind {
        get => this.get_DrawingKind()
    }

    /**
     * @type {POINT} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * @type {IVectorView<POINT>} 
     */
    Points {
        get => this.get_Points()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DrawingKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Center() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<POINT>} 
     */
    get_Points() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetPOINT(), value)
    }
}
