#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\InkStroke.ahk
#Include ..\InkDrawingAttributes.ahk
#Include ..\..\..\..\Foundation\Numerics\Matrix3x2.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class ICoreIncrementalInkStroke extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreIncrementalInkStroke
     * @type {Guid}
     */
    static IID => Guid("{fda015d3-9d66-4f7d-a57f-cc70b9cfaa76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AppendInkPoints", "CreateInkStroke", "get_DrawingAttributes", "get_PointTransform", "get_BoundingRect"]

    /**
     * @type {InkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * @type {Matrix3x2} 
     */
    PointTransform {
        get => this.get_PointTransform()
    }

    /**
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * 
     * @param {IIterable<InkPoint>} inkPoints 
     * @returns {RECT} 
     */
    AppendInkPoints(inkPoints) {
        result_ := RECT()
        result := ComCall(6, this, "ptr", inkPoints, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {InkStroke} 
     */
    CreateInkStroke() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStroke(result_)
    }

    /**
     * 
     * @returns {InkDrawingAttributes} 
     */
    get_DrawingAttributes() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkDrawingAttributes(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_PointTransform() {
        value := Matrix3x2()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        value := RECT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
