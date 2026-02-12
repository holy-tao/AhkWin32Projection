#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkDrawingAttributes.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\InkStrokeRenderingSegment.ahk
#Include .\InkStroke.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a manager for the collection of [InkStroke](inkstroke.md) objects rendered by the [InkPresenter](inkpresenter.md).
  * 
  * Modifications made to any of the ink strokes in the stroke container are immediately rendered to the drawing surface associated with the [InkPresenter](inkpresenter.md).
 * @remarks
 * For ink recognition, use an [IInkRecognizerContainer](iinkrecognizercontainer.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkstrokecontainer
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStroke extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStroke
     * @type {Guid}
     */
    static IID => Guid("{15144d60-cce3-4fcf-9d52-11518ab6afd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DrawingAttributes", "put_DrawingAttributes", "get_BoundingRect", "get_Selected", "put_Selected", "get_Recognized", "GetRenderingSegments", "Clone"]

    /**
     * @type {InkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
        set => this.put_DrawingAttributes(value)
    }

    /**
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * @type {Boolean} 
     */
    Selected {
        get => this.get_Selected()
        set => this.put_Selected(value)
    }

    /**
     * @type {Boolean} 
     */
    Recognized {
        get => this.get_Recognized()
    }

    /**
     * 
     * @returns {InkDrawingAttributes} 
     */
    get_DrawingAttributes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkDrawingAttributes(value)
    }

    /**
     * 
     * @param {InkDrawingAttributes} value 
     * @returns {HRESULT} 
     */
    put_DrawingAttributes(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        value := RECT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Selected() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Selected(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Recognized() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<InkStrokeRenderingSegment>} 
     */
    GetRenderingSegments() {
        result := ComCall(12, this, "ptr*", &renderingSegments := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkStrokeRenderingSegment, renderingSegments)
    }

    /**
     * Clone Method Example (VC++)
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &clonedStroke := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStroke(clonedStroke)
    }
}
