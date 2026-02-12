#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreIndependentInputSourceController.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ICoreIndependentInputSourceControllerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object that creates a CoreIndependentInputSource for the associated visual object and manages the input received by that source.
 * @remarks
 * The input events raised by the controller's [input source](coreindependentinputsourcecontroller_source.md) will occur on the thread where the controller was created.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreIndependentInputSourceController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreIndependentInputSourceController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreIndependentInputSourceController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [CoreIndependentInputSourceController](coreindependentinputsourcecontroller.md) for the specified [Visual](../windows.ui.composition/visual.md).
     * @param {Visual} visual_ The input source visual.
     * @returns {CoreIndependentInputSourceController} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.createforvisual
     */
    static CreateForVisual(visual_) {
        if (!CoreIndependentInputSourceController.HasProp("__ICoreIndependentInputSourceControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.CoreIndependentInputSourceController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreIndependentInputSourceControllerStatics.IID)
            CoreIndependentInputSourceController.__ICoreIndependentInputSourceControllerStatics := ICoreIndependentInputSourceControllerStatics(factoryPtr)
        }

        return CoreIndependentInputSourceController.__ICoreIndependentInputSourceControllerStatics.CreateForVisual(visual_)
    }

    /**
     * Creates a [CoreIndependentInputSourceController](coreindependentinputsourcecontroller.md) for the specified [IVisualElement](../windows.ui.composition/ivisualelement.md).
     * @param {IVisualElement} visualElement_ An object that can resolve to a composition [Visual](/uwp/api/windows.ui.composition.visual).
     * @returns {CoreIndependentInputSourceController} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.createforivisualelement
     */
    static CreateForIVisualElement(visualElement_) {
        if (!CoreIndependentInputSourceController.HasProp("__ICoreIndependentInputSourceControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.CoreIndependentInputSourceController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreIndependentInputSourceControllerStatics.IID)
            CoreIndependentInputSourceController.__ICoreIndependentInputSourceControllerStatics := ICoreIndependentInputSourceControllerStatics(factoryPtr)
        }

        return CoreIndependentInputSourceController.__ICoreIndependentInputSourceControllerStatics.CreateForIVisualElement(visualElement_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the visual associated with the controller's input source should be treated as transparent for input not currently configured to be delivered to the controller.
     * @remarks
     * This property should be set to true only if the visual associated with the controller does not occlude its lower z-order siblings (such as when the visual is painted with a transparent brush). Otherwise, the system hit-test could find a visual that is not visible to the user, and for which the user would not expect to receive input.
     * 
     * This property enables the creation of an overlay that only intercepts specific input, allowing other input to be processed as if the overlay were not present.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.istransparentforuncontrolledinput
     * @type {Boolean} 
     */
    IsTransparentForUncontrolledInput {
        get => this.get_IsTransparentForUncontrolledInput()
        set => this.put_IsTransparentForUncontrolledInput(value)
    }

    /**
     * Gets or sets whether enhanced logic is used to detect accidental touch input when using a pen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.ispalmrejectionenabled
     * @type {Boolean} 
     */
    IsPalmRejectionEnabled {
        get => this.get_IsPalmRejectionEnabled()
        set => this.put_IsPalmRejectionEnabled(value)
    }

    /**
     * Gets the input source object associated with the [CoreIndependentInputSourceController](coreindependentinputsourcecontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.source
     * @type {CoreIndependentInputSource} 
     */
    Source {
        get => this.get_Source()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransparentForUncontrolledInput() {
        if (!this.HasProp("__ICoreIndependentInputSourceController")) {
            if ((queryResult := this.QueryInterface(ICoreIndependentInputSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIndependentInputSourceController := ICoreIndependentInputSourceController(outPtr)
        }

        return this.__ICoreIndependentInputSourceController.get_IsTransparentForUncontrolledInput()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTransparentForUncontrolledInput(value) {
        if (!this.HasProp("__ICoreIndependentInputSourceController")) {
            if ((queryResult := this.QueryInterface(ICoreIndependentInputSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIndependentInputSourceController := ICoreIndependentInputSourceController(outPtr)
        }

        return this.__ICoreIndependentInputSourceController.put_IsTransparentForUncontrolledInput(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPalmRejectionEnabled() {
        if (!this.HasProp("__ICoreIndependentInputSourceController")) {
            if ((queryResult := this.QueryInterface(ICoreIndependentInputSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIndependentInputSourceController := ICoreIndependentInputSourceController(outPtr)
        }

        return this.__ICoreIndependentInputSourceController.get_IsPalmRejectionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPalmRejectionEnabled(value) {
        if (!this.HasProp("__ICoreIndependentInputSourceController")) {
            if ((queryResult := this.QueryInterface(ICoreIndependentInputSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIndependentInputSourceController := ICoreIndependentInputSourceController(outPtr)
        }

        return this.__ICoreIndependentInputSourceController.put_IsPalmRejectionEnabled(value)
    }

    /**
     * 
     * @returns {CoreIndependentInputSource} 
     */
    get_Source() {
        if (!this.HasProp("__ICoreIndependentInputSourceController")) {
            if ((queryResult := this.QueryInterface(ICoreIndependentInputSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIndependentInputSourceController := ICoreIndependentInputSourceController(outPtr)
        }

        return this.__ICoreIndependentInputSourceController.get_Source()
    }

    /**
     * Identifies the [CoreInputDeviceTypes](coreinputdevicetypes.md) that should be delivered to the input source associated with the [CoreIndependentInputSourceController](coreindependentinputsourcecontroller.md).
     * @param {Integer} inputTypes The supported input device types.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.setcontrolledinput
     */
    SetControlledInput(inputTypes) {
        if (!this.HasProp("__ICoreIndependentInputSourceController")) {
            if ((queryResult := this.QueryInterface(ICoreIndependentInputSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIndependentInputSourceController := ICoreIndependentInputSourceController(outPtr)
        }

        return this.__ICoreIndependentInputSourceController.SetControlledInput(inputTypes)
    }

    /**
     * Identifies the [CoreInputDeviceTypes](coreinputdevicetypes.md) that should be delivered to the input source associated with the [CoreIndependentInputSourceController](coreindependentinputsourcecontroller.md), based on the specified filters.
     * @remarks
     * If any filtering criteria are specified, the corresponding input device type must be specified in the *inputTypes* parameter.
     * 
     * Pen-related filtering criteria are only supported in the *excluded* parameter.
     * 
     * The filtering criteria are considered by the system when input is hit tested to determine where it should be routed. In some scenarios, hit testing results in input capture, where subsequent input is delivered to the same target without its own hit test. In these scenarios, the filtering criteria are not considered, as the input destination has already been determined.
     * 
     * For example, if [CoreIndependentInputFilters.MouseButton: 1](/uwp/api/windows.ui.core.coreindependentinputfilters#fields) is set, then the input source will also receive subsequent mouse motion input until the mouse buttons are released (mouse motion while a mouse button is held is captured to the destination of the mouse button).
     * @param {Integer} inputTypes The supported input device types.
     * @param {Integer} required The required filtering criteria for certain input device types.
     * @param {Integer} excluded The filtering criteria for certain input device types to exclude.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.setcontrolledinput
     */
    SetControlledInputWithFilters(inputTypes, required, excluded) {
        if (!this.HasProp("__ICoreIndependentInputSourceController")) {
            if ((queryResult := this.QueryInterface(ICoreIndependentInputSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIndependentInputSourceController := ICoreIndependentInputSourceController(outPtr)
        }

        return this.__ICoreIndependentInputSourceController.SetControlledInputWithFilters(inputTypes, required, excluded)
    }

    /**
     * Closes the [CoreIndependentInputSourceController](coreindependentinputsourcecontroller.md) instance and releases allocated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsourcecontroller.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
