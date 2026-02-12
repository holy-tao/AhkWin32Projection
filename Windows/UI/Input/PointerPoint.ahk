#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPointerPoint.ahk
#Include .\IPointerPointPhysicalPosition.ahk
#Include .\IPointerPointStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides basic properties for the input pointer associated with a single mouse, pen/stylus, or touch contact.
 * @remarks
 * The PointerPoint class implements IPointerPoint.
 * 
 * See [PointerPointProperties](pointerpointproperties.md) for extended properties accessible through [Properties](pointerpoint_properties.md).
 * 
 * In most cases, we recommend that you get pointer info through the event argument of the pointer event handlers in your chosen language framework.
 * 
 * If the event argument doesn't intrinsically expose the pointer details required by your app, you can get access to extended pointer data through the [GetCurrentPoint](../windows.ui.xaml.input/pointerroutedeventargs_getcurrentpoint_1761708789.md) and [GetIntermediatePoints](../windows.ui.xaml.input/pointerroutedeventargs_getintermediatepoints_1716242609.md) methods of [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md). Use these methods to specify the context of the pointer data.
 * 
 * The static PointerPoint methods, [GetCurrentPoint](pointerpoint_getcurrentpoint_131721878.md) and [GetIntermediatePoints](pointerpoint_getintermediatepoints_143894736.md), always use the app context.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class PointerPoint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerPoint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerPoint.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the transformed information for the specified pointer.
     * 
     * In most cases, we recommend that you get pointer info through the event argument of the pointer event handlers in your chosen language framework (Windows app using JavaScript, UWP app using C++, C#, or Visual Basic, or UWP app using DirectX with C++).
     * 
     * If the event argument doesn't intrinsically expose the pointer details required by your app, you can get access to extended pointer data through the [GetCurrentPoint](../windows.ui.xaml.input/pointerroutedeventargs_getcurrentpoint_1761708789.md) and [GetIntermediatePoints](../windows.ui.xaml.input/pointerroutedeventargs_getintermediatepoints_1716242609.md) methods of [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md). Use these methods to specify the context of the pointer data.
     * 
     * The static [PointerPoint](pointerpoint.md) methods, [GetCurrentPoint](pointerpoint_getcurrentpoint_131721878.md) and [GetIntermediatePoints](pointerpoint_getintermediatepoints_143894736.md), always use the app context.
     * @remarks
     * GetCurrentPoint is a static method.
     * 
     * This method is useful for getting pointer information relative to a specific element.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {PointerPoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.getcurrentpoint
     */
    static GetCurrentPoint(pointerId) {
        if (!PointerPoint.HasProp("__IPointerPointStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.PointerPoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerPointStatics.IID)
            PointerPoint.__IPointerPointStatics := IPointerPointStatics(factoryPtr)
        }

        return PointerPoint.__IPointerPointStatics.GetCurrentPoint(pointerId)
    }

    /**
     * Retrieves the transformed position and state information for the specified pointer, from the last pointer event up to and including the current pointer event.
     * 
     * In most cases, we recommend that you get pointer info through the event argument of the pointer event handlers in your chosen language framework (Windows app using JavaScript, UWP app using C++, C#, or Visual Basic, or UWP app using DirectX with C++).
     * 
     * If the event argument doesn't intrinsically expose the pointer details required by your app, you can get access to extended pointer data through the [GetCurrentPoint](../windows.ui.xaml.input/pointerroutedeventargs_getcurrentpoint_1761708789.md) and [GetIntermediatePoints](../windows.ui.xaml.input/pointerroutedeventargs_getintermediatepoints_1716242609.md) methods of [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md). Use these methods to specify the context of the pointer data.
     * 
     * The static [PointerPoint](pointerpoint.md) methods, [GetCurrentPoint](pointerpoint_getcurrentpoint_131721878.md) and [GetIntermediatePoints](pointerpoint_getintermediatepoints_143894736.md), always use the app context.
     * @remarks
     * GetIntermediatePoints is a static method.
     * 
     * This method is useful for getting pointer information relative to a specific element.
     * 
     * The most recent pointer information retrieved by this method is equivalent to that retrieved by the [GetCurrentPoint](pointerpoint_getcurrentpoint_131721878.md) method.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {IVector<PointerPoint>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.getintermediatepoints
     */
    static GetIntermediatePoints(pointerId) {
        if (!PointerPoint.HasProp("__IPointerPointStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.PointerPoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerPointStatics.IID)
            PointerPoint.__IPointerPointStatics := IPointerPointStatics(factoryPtr)
        }

        return PointerPoint.__IPointerPointStatics.GetIntermediatePoints(pointerId)
    }

    /**
     * Retrieves position and state information for the specified pointer.
     * 
     * In most cases, we recommend that you get pointer info through the event argument of the pointer event handlers in your chosen language framework (Windows app using JavaScript, UWP app using C++, C#, or Visual Basic, or UWP app using DirectX with C++).
     * 
     * If the event argument doesn't intrinsically expose the pointer details required by your app, you can get access to extended pointer data through the [GetCurrentPoint](../windows.ui.xaml.input/pointerroutedeventargs_getcurrentpoint_1761708789.md) and [GetIntermediatePoints](../windows.ui.xaml.input/pointerroutedeventargs_getintermediatepoints_1716242609.md) methods of [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md). Use these methods to specify the context of the pointer data.
     * 
     * The static [PointerPoint](pointerpoint.md) methods, GetCurrentPoint and [GetIntermediatePoints](pointerpoint_getintermediatepoints_143894736.md), always use the app context.
     * @remarks
     * GetCurrentPoint is a static method.
     * @param {Integer} pointerId The ID of the pointer.
     * @param {IPointerPointTransform} transform_ 
     * @returns {PointerPoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.getcurrentpoint
     */
    static GetCurrentPointTransformed(pointerId, transform_) {
        if (!PointerPoint.HasProp("__IPointerPointStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.PointerPoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerPointStatics.IID)
            PointerPoint.__IPointerPointStatics := IPointerPointStatics(factoryPtr)
        }

        return PointerPoint.__IPointerPointStatics.GetCurrentPointTransformed(pointerId, transform_)
    }

    /**
     * Retrieves position and state information for the specified pointer, from the last pointer event up to and including the current pointer event.
     * 
     * In most cases, we recommend that you get pointer info through the event argument of the pointer event handlers in your chosen language framework (Windows app using JavaScript, UWP app using C++, C#, or Visual Basic, or UWP app using DirectX with C++).
     * 
     * If the event argument doesn't intrinsically expose the pointer details required by your app, you can get access to extended pointer data through the [GetCurrentPoint](../windows.ui.xaml.input/pointerroutedeventargs_getcurrentpoint_1761708789.md) and [GetIntermediatePoints](../windows.ui.xaml.input/pointerroutedeventargs_getintermediatepoints_1716242609.md) methods of [PointerRoutedEventArgs](../windows.ui.xaml.input/pointerroutedeventargs.md). Use these methods to specify the context of the pointer data.
     * 
     * The static [PointerPoint](pointerpoint.md) methods, [GetCurrentPoint](pointerpoint_getcurrentpoint_131721878.md) and GetIntermediatePoints, always use the app context.
     * @remarks
     * GetIntermediatePoints is a static method.
     * 
     * The most recent pointer information retrieved by this method is equivalent to that retrieved by the [GetCurrentPoint](pointerpoint_getcurrentpoint_131721878.md) method.
     * @param {Integer} pointerId The ID of the pointer.
     * @param {IPointerPointTransform} transform_ 
     * @returns {IVector<PointerPoint>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.getintermediatepoints
     */
    static GetIntermediatePointsTransformed(pointerId, transform_) {
        if (!PointerPoint.HasProp("__IPointerPointStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.PointerPoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerPointStatics.IID)
            PointerPoint.__IPointerPointStatics := IPointerPointStatics(factoryPtr)
        }

        return PointerPoint.__IPointerPointStatics.GetIntermediatePointsTransformed(pointerId, transform_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets information about the device associated with the input pointer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.pointerdevice
     * @type {PointerDevice} 
     */
    PointerDevice {
        get => this.get_PointerDevice()
    }

    /**
     * Gets the location of the pointer input in client coordinates.
     * @remarks
     * Position contains the client coordinates of the pointer input as interpreted by the system. Under some circumstances, such as input prediction, this data can be modified by the system to compensate for hardware latency or message latency due to inherent delays in sensing and processing the pointer location on the digitizer.
     * 
     * See [RawPosition](pointerpoint_rawposition.md) for information on handling raw input data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the client coordinates of the input pointer as reported by the input device.
     * @remarks
     * Under some circumstances, such as touch targeting near a [UIElement](../windows.ui.xaml/uielement.md), this data might be modified by the system.
     * 
     * If your app supports complex inking, where accuracy and performance is critical, we recommend using the RawPosition data to handle input prediction when managing hardware or message latency due to delays in sensing and processing of the pointer location on the digitizer.
     * 
     * See [Position](pointerpoint_position.md) for more information on handling modified input data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.rawposition
     * @type {POINT} 
     */
    RawPosition {
        get => this.get_RawPosition()
    }

    /**
     * Gets a unique identifier for the input pointer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.pointerid
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

    /**
     * Gets the ID of an input frame.
     * @remarks
     * A frame is a collection of input points at a specific instance in time. The frame ID is a common identifier for each input point in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.frameid
     * @type {Integer} 
     */
    FrameId {
        get => this.get_FrameId()
    }

    /**
     * Gets the time when the input occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.timestamp
     * @type {Integer} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets a value that indicates whether the input device (touch, pen/stylus) is touching the digitizer surface, or a mouse button is pressed down.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.isincontact
     * @type {Boolean} 
     */
    IsInContact {
        get => this.get_IsInContact()
    }

    /**
     * Gets extended information about the input pointer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpoint.properties
     * @type {PointerPointProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {Boolean} 
     */
    IsPhysicalPositionSupported {
        get => this.get_IsPhysicalPositionSupported()
    }

    /**
     * @type {POINT} 
     */
    PhysicalPosition {
        get => this.get_PhysicalPosition()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PointerDevice} 
     */
    get_PointerDevice() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_PointerDevice()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_Position()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RawPosition() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_RawPosition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerId() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_PointerId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameId() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_FrameId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_Timestamp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInContact() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_IsInContact()
    }

    /**
     * 
     * @returns {PointerPointProperties} 
     */
    get_Properties() {
        if (!this.HasProp("__IPointerPoint")) {
            if ((queryResult := this.QueryInterface(IPointerPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPoint := IPointerPoint(outPtr)
        }

        return this.__IPointerPoint.get_Properties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPhysicalPositionSupported() {
        if (!this.HasProp("__IPointerPointPhysicalPosition")) {
            if ((queryResult := this.QueryInterface(IPointerPointPhysicalPosition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointPhysicalPosition := IPointerPointPhysicalPosition(outPtr)
        }

        return this.__IPointerPointPhysicalPosition.get_IsPhysicalPositionSupported()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PhysicalPosition() {
        if (!this.HasProp("__IPointerPointPhysicalPosition")) {
            if ((queryResult := this.QueryInterface(IPointerPointPhysicalPosition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointPhysicalPosition := IPointerPointPhysicalPosition(outPtr)
        }

        return this.__IPointerPointPhysicalPosition.get_PhysicalPosition()
    }

;@endregion Instance Methods
}
