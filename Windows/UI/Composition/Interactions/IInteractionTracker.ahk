#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CompositionInteractionSourceCollection.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include .\IInteractionTrackerOwner.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains callbacks that will be triggered by InteractionTracker events.
  * 
  * Implementing this interface enables receiving callbacks regarding the state and values of the [InteractionTracker](interactiontracker.md), as well as whether requested updates to the [InteractionTracker](interactiontracker.md) ’s properties are honored.
 * @remarks
 * Implementing IInteractionTrackerOwner is required if the application needs to have updates on the state or values of the [InteractionTracker](interactiontracker.md). Due to the asynchronous nature of this model, these callbacks are the best way to update application logic. To learn more about the [InteractionTracker](interactiontracker.md) states and transitions, see [InteractionTracker](interactiontracker.md).
 * 
 * An [InteractionTracker](interactiontracker.md) can be created with or without an owner. Creating the [InteractionTracker](interactiontracker.md) with an owner is required for registering for callbacks. If these callbacks are not important for application state, then creating an [InteractionTracker](interactiontracker.md) without an owner is appropriate.
 * 
 * Creating an [InteractionTracker](interactiontracker.md) with an owner also requires appropriately disposing the [InteractionTracker](interactiontracker.md) when appropriate.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.iinteractiontrackerowner
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTracker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTracker
     * @type {Guid}
     */
    static IID => Guid("{2a8e8cb1-1000-4416-8363-cc27fb877308}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InteractionSources", "get_IsPositionRoundingSuggested", "get_MaxPosition", "put_MaxPosition", "get_MaxScale", "put_MaxScale", "get_MinPosition", "put_MinPosition", "get_MinScale", "put_MinScale", "get_NaturalRestingPosition", "get_NaturalRestingScale", "get_Owner", "get_Position", "get_PositionInertiaDecayRate", "put_PositionInertiaDecayRate", "get_PositionVelocityInPixelsPerSecond", "get_Scale", "get_ScaleInertiaDecayRate", "put_ScaleInertiaDecayRate", "get_ScaleVelocityInPercentPerSecond", "AdjustPositionXIfGreaterThanThreshold", "AdjustPositionYIfGreaterThanThreshold", "ConfigurePositionXInertiaModifiers", "ConfigurePositionYInertiaModifiers", "ConfigureScaleInertiaModifiers", "TryUpdatePosition", "TryUpdatePositionBy", "TryUpdatePositionWithAnimation", "TryUpdatePositionWithAdditionalVelocity", "TryUpdateScale", "TryUpdateScaleWithAnimation", "TryUpdateScaleWithAdditionalVelocity"]

    /**
     * @type {CompositionInteractionSourceCollection} 
     */
    InteractionSources {
        get => this.get_InteractionSources()
    }

    /**
     * @type {Boolean} 
     */
    IsPositionRoundingSuggested {
        get => this.get_IsPositionRoundingSuggested()
    }

    /**
     * @type {Vector3} 
     */
    MaxPosition {
        get => this.get_MaxPosition()
        set => this.put_MaxPosition(value)
    }

    /**
     * @type {Float} 
     */
    MaxScale {
        get => this.get_MaxScale()
        set => this.put_MaxScale(value)
    }

    /**
     * @type {Vector3} 
     */
    MinPosition {
        get => this.get_MinPosition()
        set => this.put_MinPosition(value)
    }

    /**
     * @type {Float} 
     */
    MinScale {
        get => this.get_MinScale()
        set => this.put_MinScale(value)
    }

    /**
     * @type {Vector3} 
     */
    NaturalRestingPosition {
        get => this.get_NaturalRestingPosition()
    }

    /**
     * @type {Float} 
     */
    NaturalRestingScale {
        get => this.get_NaturalRestingScale()
    }

    /**
     * @type {IInteractionTrackerOwner} 
     */
    Owner {
        get => this.get_Owner()
    }

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {IReference<Vector3>} 
     */
    PositionInertiaDecayRate {
        get => this.get_PositionInertiaDecayRate()
        set => this.put_PositionInertiaDecayRate(value)
    }

    /**
     * @type {Vector3} 
     */
    PositionVelocityInPixelsPerSecond {
        get => this.get_PositionVelocityInPixelsPerSecond()
    }

    /**
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
    }

    /**
     * @type {IReference<Float>} 
     */
    ScaleInertiaDecayRate {
        get => this.get_ScaleInertiaDecayRate()
        set => this.put_ScaleInertiaDecayRate(value)
    }

    /**
     * @type {Float} 
     */
    ScaleVelocityInPercentPerSecond {
        get => this.get_ScaleVelocityInPercentPerSecond()
    }

    /**
     * 
     * @returns {CompositionInteractionSourceCollection} 
     */
    get_InteractionSources() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionInteractionSourceCollection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPositionRoundingSuggested() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_MaxPosition() {
        value := Vector3()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_MaxPosition(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxScale() {
        result := ComCall(10, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxScale(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_MinPosition() {
        value := Vector3()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_MinPosition(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinScale() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinScale(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_NaturalRestingPosition() {
        value := Vector3()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NaturalRestingScale() {
        result := ComCall(17, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInteractionTrackerOwner} 
     */
    get_Owner() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInteractionTrackerOwner(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        value := Vector3()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Vector3>} 
     */
    get_PositionInertiaDecayRate() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetVector3(), value)
    }

    /**
     * 
     * @param {IReference<Vector3>} value 
     * @returns {HRESULT} 
     */
    put_PositionInertiaDecayRate(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_PositionVelocityInPixelsPerSecond() {
        value := Vector3()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        result := ComCall(23, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ScaleInertiaDecayRate() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_ScaleInertiaDecayRate(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleVelocityInPercentPerSecond() {
        result := ComCall(26, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} adjustment 
     * @param {Float} positionThreshold 
     * @returns {HRESULT} 
     */
    AdjustPositionXIfGreaterThanThreshold(adjustment, positionThreshold) {
        result := ComCall(27, this, "float", adjustment, "float", positionThreshold, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} adjustment 
     * @param {Float} positionThreshold 
     * @returns {HRESULT} 
     */
    AdjustPositionYIfGreaterThanThreshold(adjustment, positionThreshold) {
        result := ComCall(28, this, "float", adjustment, "float", positionThreshold, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<InteractionTrackerInertiaModifier>} modifiers_ 
     * @returns {HRESULT} 
     */
    ConfigurePositionXInertiaModifiers(modifiers_) {
        result := ComCall(29, this, "ptr", modifiers_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<InteractionTrackerInertiaModifier>} modifiers_ 
     * @returns {HRESULT} 
     */
    ConfigurePositionYInertiaModifiers(modifiers_) {
        result := ComCall(30, this, "ptr", modifiers_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<InteractionTrackerInertiaModifier>} modifiers_ 
     * @returns {HRESULT} 
     */
    ConfigureScaleInertiaModifiers(modifiers_) {
        result := ComCall(31, this, "ptr", modifiers_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {Integer} 
     */
    TryUpdatePosition(value) {
        result := ComCall(32, this, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Vector3} amount 
     * @returns {Integer} 
     */
    TryUpdatePositionBy(amount) {
        result := ComCall(33, this, "ptr", amount, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {CompositionAnimation} animation 
     * @returns {Integer} 
     */
    TryUpdatePositionWithAnimation(animation) {
        result := ComCall(34, this, "ptr", animation, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Vector3} velocityInPixelsPerSecond 
     * @returns {Integer} 
     */
    TryUpdatePositionWithAdditionalVelocity(velocityInPixelsPerSecond) {
        result := ComCall(35, this, "ptr", velocityInPixelsPerSecond, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Float} value 
     * @param {Vector3} centerPoint 
     * @returns {Integer} 
     */
    TryUpdateScale(value, centerPoint) {
        result := ComCall(36, this, "float", value, "ptr", centerPoint, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {CompositionAnimation} animation 
     * @param {Vector3} centerPoint 
     * @returns {Integer} 
     */
    TryUpdateScaleWithAnimation(animation, centerPoint) {
        result := ComCall(37, this, "ptr", animation, "ptr", centerPoint, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Float} velocityInPercentPerSecond 
     * @param {Vector3} centerPoint 
     * @returns {Integer} 
     */
    TryUpdateScaleWithAdditionalVelocity(velocityInPercentPerSecond, centerPoint) {
        result := ComCall(38, this, "float", velocityInPercentPerSecond, "ptr", centerPoint, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
