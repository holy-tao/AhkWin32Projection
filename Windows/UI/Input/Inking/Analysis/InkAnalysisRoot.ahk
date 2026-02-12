#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkAnalysisRoot.ahk
#Include .\IInkAnalysisNode.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides access to an [InkAnalysisNode](inkanalysisnode.md) of type [InkAnalysisNodeKind.Root](inkanalysisnodekind.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalysisRoot extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkAnalysisRoot

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkAnalysisRoot.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the recognized text associated with the InkAnalysisRoot object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.recognizedtext
     * @type {HSTRING} 
     */
    RecognizedText {
        get => this.get_RecognizedText()
    }

    /**
     * Gets the unique identifier of the InkAnalysisRoot object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the [kind](InkAnalysisNodeKind.md) of ink input identified by the InkAnalysisRoot object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the bounding rectangle of the InkAnalysisRoot object.
     * 
     * | Bounding rectangle | Rotated bounding rectangle |
     * | --- | --- |
     * | <img alt="Bounding rectangle" src="images/boundingrect.png" /> | <img alt="Rotated bounding rectangle" src="images/rotatedboundingrect.png" /> |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * Gets the oriented and snapped, bounding rectangle of the InkAnalysisRoot object. 
     * 
     * | Bounding rectangle | Rotated bounding rectangle |
     * | --- | --- |
     * | <img alt="Bounding rectangle" src="images/boundingrect.png" /> | <img alt="Rotated bounding rectangle" src="images/rotatedboundingrect.png" /> |
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.rotatedboundingrect
     * @type {IVectorView<POINT>} 
     */
    RotatedBoundingRect {
        get => this.get_RotatedBoundingRect()
    }

    /**
     * Gets all child nodes of the InkAnalysisRoot object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.children
     * @type {IVectorView<IInkAnalysisNode>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Gets the parent node of the InkAnalysisRoot object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.parent
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
        if (!this.HasProp("__IInkAnalysisRoot")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisRoot := IInkAnalysisRoot(outPtr)
        }

        return this.__IInkAnalysisRoot.get_RecognizedText()
    }

    /**
     * Retrieves the collection of child nodes belonging to the InkAnalysisRoot object.
     * @param {Integer} nodeKind 
     * @returns {IVectorView<IInkAnalysisNode>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.findnodes
     */
    FindNodes(nodeKind) {
        if (!this.HasProp("__IInkAnalysisRoot")) {
            if ((queryResult := this.QueryInterface(IInkAnalysisRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkAnalysisRoot := IInkAnalysisRoot(outPtr)
        }

        return this.__IInkAnalysisRoot.FindNodes(nodeKind)
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
     * Retrieves the unique identifiers of all nodes belonging to the InkAnalysisRoot object.
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisroot.getstrokeids
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
