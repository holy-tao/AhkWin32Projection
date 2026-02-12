#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkAnalysisListItem.ahk
#Include .\IInkAnalysisNode.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides access to an [InkAnalysisNode](inkanalysisnode.md) of type [InkAnalysisNodeKind.ListItem](inkanalysisnodekind.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalysisListItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkAnalysisListItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkAnalysisListItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the recognized text associated with the InkAnalysisListItem object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.recognizedtext
     * @type {HSTRING} 
     */
    RecognizedText {
        get => this.get_RecognizedText()
    }

    /**
     * Gets the unique identifier of the InkAnalysisListItem object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the [kind](InkAnalysisNodeKind.md) of ink input identified by the InkAnalysisListItem object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the bounding rectangle of the InkAnalysisListItem object.
     * 
     * | Bounding rectangle | Rotated bounding rectangle |
     * | --- | --- |
     * | <img alt="Bounding rectangle" src="images/boundingrect.png" /> | <img alt="Rotated bounding rectangle" src="images/rotatedboundingrect.png" /> |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * Gets the oriented and snapped, bounding rectangle of the InkAnalysisListItem object. 
     * 
     * | Bounding rectangle | Rotated bounding rectangle |
     * | --- | --- |
     * | <img alt="Bounding rectangle" src="images/boundingrect.png" /> | <img alt="Rotated bounding rectangle" src="images/rotatedboundingrect.png" /> |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.rotatedboundingrect
     * @type {IVectorView<POINT>} 
     */
    RotatedBoundingRect {
        get => this.get_RotatedBoundingRect()
    }

    /**
     * Gets all child nodes of the InkAnalysisListItem object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.children
     * @type {IVectorView<IInkAnalysisNode>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Gets the parent node of the InkAnalysisListItem object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.parent
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
     * @returns {HSTRING} 
     */
    get_RecognizedText() {
        if (!this.HasProp("__IInkAnalysisListItem")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisListItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisListItem := IInkAnalysisListItem(outPtr)
        }

        return this.__IInkAnalysisListItem.get_RecognizedText()
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
     * Retrieves the unique identifiers of all nodes belonging to the InkAnalysisListItem object.
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysislistitem.getstrokeids
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
