#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGraphicsCaptureItem.ahk
#Include .\IGraphicsCaptureItemStatics.ahk
#Include .\IGraphicsCaptureItemStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GraphicsCaptureItem.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * The target of the capture, chosen with the picker control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureitem
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class GraphicsCaptureItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGraphicsCaptureItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGraphicsCaptureItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a [GraphicsCaptureItem](graphicscaptureitem.md) that represents the given [Visual](../windows.ui.composition/visual.md).
     * @param {Visual} visual_ The **Visual** with which to construct the **GraphicsCaptureItem**.
     * @returns {GraphicsCaptureItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureitem.createfromvisual
     */
    static CreateFromVisual(visual_) {
        if (!GraphicsCaptureItem.HasProp("__IGraphicsCaptureItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.GraphicsCaptureItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGraphicsCaptureItemStatics.IID)
            GraphicsCaptureItem.__IGraphicsCaptureItemStatics := IGraphicsCaptureItemStatics(factoryPtr)
        }

        return GraphicsCaptureItem.__IGraphicsCaptureItemStatics.CreateFromVisual(visual_)
    }

    /**
     * Attempts to create a [GraphicsCaptureItem](graphicscaptureitem.md) that represents the window with the specified [WindowId](../windows.ui/windowid.md).
     * @remarks
     * Before attempting to create a **GraphicsCaptureItem** with this method, you must call [GraphicsCaptureAccess.RequestAccessAsync](graphicscaptureaccess_requestaccessasync_1551329835.md), passing in a value of [GraphicsCaptureAccessKind.Programmatic](graphicscaptureaccesskind.md). To call **RequestAccessAsync** with **GraphicsCaptureAccessKind.Programmatic**, you must declare the **graphicsCaptureProgrammatic** capability in your app's package manifest. For more information, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * @param {WindowId} windowId_ The **WindowId** with which to construct the **GraphicsCaptureItem**.
     * @returns {GraphicsCaptureItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureitem.trycreatefromwindowid
     */
    static TryCreateFromWindowId(windowId_) {
        if (!GraphicsCaptureItem.HasProp("__IGraphicsCaptureItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.GraphicsCaptureItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGraphicsCaptureItemStatics2.IID)
            GraphicsCaptureItem.__IGraphicsCaptureItemStatics2 := IGraphicsCaptureItemStatics2(factoryPtr)
        }

        return GraphicsCaptureItem.__IGraphicsCaptureItemStatics2.TryCreateFromWindowId(windowId_)
    }

    /**
     * Attempts to create a [GraphicsCaptureItem](graphicscaptureitem.md) that represents the display with the specified [DisplayId](../windows.graphics/displayid.md).
     * @remarks
     * Before attempting to create a **GraphicsCaptureItem** with this method, you must call [GraphicsCaptureAccess.RequestAccessAsync](graphicscaptureaccess_requestaccessasync_1551329835.md), passing in a value of [GraphicsCaptureAccessKind.Programmatic](graphicscaptureaccesskind.md). To call **RequestAccessAsync** with **GraphicsCaptureAccessKind.Programmatic**, you must declare the **graphicsCaptureProgrammatic** capability in your app's package manifest. For more information, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * @param {DisplayId} displayId_ The **DisplayId** with which to construct the **GraphicsCaptureItem**.
     * @returns {GraphicsCaptureItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureitem.trycreatefromdisplayid
     */
    static TryCreateFromDisplayId(displayId_) {
        if (!GraphicsCaptureItem.HasProp("__IGraphicsCaptureItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.GraphicsCaptureItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGraphicsCaptureItemStatics2.IID)
            GraphicsCaptureItem.__IGraphicsCaptureItemStatics2 := IGraphicsCaptureItemStatics2(factoryPtr)
        }

        return GraphicsCaptureItem.__IGraphicsCaptureItemStatics2.TryCreateFromDisplayId(displayId_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The display name of the target of the capture (for example, the application title).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureitem.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * The size of the target of the capture.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureitem.size
     * @type {SizeInt32} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * An event raised when the target of the capture has been closed.
     * @remarks
     * Note that some apps may seamlessly replace the targeted window with a new one, which will end any ongoing capture and raise this event even though the target window does not appear to have closed.
     * @type {TypedEventHandler<GraphicsCaptureItem, IInspectable>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e9c610c0-a68c-5bd9-8021-8589346eeee2}"),
                    GraphicsCaptureItem,
                    IInspectable
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IGraphicsCaptureItem")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureItem := IGraphicsCaptureItem(outPtr)
        }

        return this.__IGraphicsCaptureItem.get_DisplayName()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_Size() {
        if (!this.HasProp("__IGraphicsCaptureItem")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureItem := IGraphicsCaptureItem(outPtr)
        }

        return this.__IGraphicsCaptureItem.get_Size()
    }

    /**
     * 
     * @param {TypedEventHandler<GraphicsCaptureItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IGraphicsCaptureItem")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureItem := IGraphicsCaptureItem(outPtr)
        }

        return this.__IGraphicsCaptureItem.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IGraphicsCaptureItem")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureItem := IGraphicsCaptureItem(outPtr)
        }

        return this.__IGraphicsCaptureItem.remove_Closed(token)
    }

;@endregion Instance Methods
}
