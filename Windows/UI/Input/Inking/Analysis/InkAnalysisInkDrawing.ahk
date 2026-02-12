#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkAnalysisInkDrawing.ahk
#Include .\IInkAnalysisNode.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides access to an [InkAnalysisNode](inkanalysisnode.md) of type [InkAnalysisNodeKind.InkDrawing](inkanalysisnodekind.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalysisInkDrawing extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkAnalysisInkDrawing

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkAnalysisInkDrawing.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [shape](InkAnalysisDrawingKind.md) of the ink input identified by ink analysis of the InkAnalysisInkDrawing object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.drawingkind
     * @type {Integer} 
     */
    DrawingKind {
        get => this.get_DrawingKind()
    }

    /**
     * Gets the X, Y coordinates of the InkAnalysisInkDrawing object, in device-independent pixel (DIP), relative to the upper left-hand corner of the inking area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.center
     * @type {POINT} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * Gets the collection of X, Y coordinates for all [points](../windows.foundation/point.md) used to specify the [shape](InkAnalysisDrawingKind.md) of the InkAnalysisInkDrawing object.
     * @remarks
     * The collection of [points](../windows.foundation/point.md) is dependent on the shape drawn.
     * - Ellipse: four points, one for each end point of the two axes defining the shape
     * - Polyline: one point for each vertex defining the shape
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.points
     * @type {IVectorView<POINT>} 
     */
    Points {
        get => this.get_Points()
    }

    /**
     * Gets the unique identifier of the InkAnalysisInkDrawing object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the [kind](InkAnalysisNodeKind.md) of ink input identified by the InkAnalysisInkDrawing object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the bounding rectangle of the InkAnalysisInkDrawing object.
     * 
     * | Bounding rectangle | Rotated bounding rectangle |
     * | --- | --- |
     * | <img alt="Bounding rectangle" src="images/boundingrect.png" /> | <img alt="Rotated bounding rectangle" src="images/rotatedboundingrect.png" /> |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * Gets the oriented and snapped, bounding rectangle of the InkAnalysisInkDrawing object. 
     * 
     * | Bounding rectangle | Rotated bounding rectangle |
     * | --- | --- |
     * | <img alt="Bounding rectangle" src="images/boundingrect.png" /> | <img alt="Rotated bounding rectangle" src="images/rotatedboundingrect.png" /> |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.rotatedboundingrect
     * @type {IVectorView<POINT>} 
     */
    RotatedBoundingRect {
        get => this.get_RotatedBoundingRect()
    }

    /**
     * Gets all child nodes of the InkAnalysisInkDrawing object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.children
     * @type {IVectorView<IInkAnalysisNode>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Gets the parent node of the InkAnalysisInkDrawing object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.parent
     * @type {IInkAnalysisNode} 
     */
    Parent {
        get => this.get_Parent()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DrawingKind() {
        if (!this.HasProp("__IInkAnalysisInkDrawing")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisInkDrawing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisInkDrawing := IInkAnalysisInkDrawing(outPtr)
        }

        return this.__IInkAnalysisInkDrawing.get_DrawingKind()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Center() {
        if (!this.HasProp("__IInkAnalysisInkDrawing")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisInkDrawing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisInkDrawing := IInkAnalysisInkDrawing(outPtr)
        }

        return this.__IInkAnalysisInkDrawing.get_Center()
    }

    /**
     * 
     * @returns {IVectorView<POINT>} 
     */
    get_Points() {
        if (!this.HasProp("__IInkAnalysisInkDrawing")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisInkDrawing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisInkDrawing := IInkAnalysisInkDrawing(outPtr)
        }

        return this.__IInkAnalysisInkDrawing.get_Points()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IInkAnalysisNode")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisNode := IInkAnalysisNode(outPtr)
        }

        return this.__IInkAnalysisNode.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IInkAnalysisNode")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisNode := IInkAnalysisNode(outPtr)
        }

        return this.__IInkAnalysisNode.get_Kind()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        if (!this.HasProp("__IInkAnalysisNode")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisNode := IInkAnalysisNode(outPtr)
        }

        return this.__IInkAnalysisNode.get_BoundingRect()
    }

    /**
     * 
     * @returns {IVectorView<POINT>} 
     */
    get_RotatedBoundingRect() {
        if (!this.HasProp("__IInkAnalysisNode")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisNode := IInkAnalysisNode(outPtr)
        }

        return this.__IInkAnalysisNode.get_RotatedBoundingRect()
    }

    /**
     * 
     * @returns {IVectorView<IInkAnalysisNode>} 
     */
    get_Children() {
        if (!this.HasProp("__IInkAnalysisNode")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisNode := IInkAnalysisNode(outPtr)
        }

        return this.__IInkAnalysisNode.get_Children()
    }

    /**
     * 
     * @returns {IInkAnalysisNode} 
     */
    get_Parent() {
        if (!this.HasProp("__IInkAnalysisNode")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisNode := IInkAnalysisNode(outPtr)
        }

        return this.__IInkAnalysisNode.get_Parent()
    }

    /**
     * Retrieves the unique identifiers of all nodes belonging to the InkAnalysisInkDrawing object.
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkdrawing.getstrokeids
     */
    GetStrokeIds() {
        if (!this.HasProp("__IInkAnalysisNode")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisNode := IInkAnalysisNode(outPtr)
        }

        return this.__IInkAnalysisNode.GetStrokeIds()
    }

;@endregion Instance Methods
}
