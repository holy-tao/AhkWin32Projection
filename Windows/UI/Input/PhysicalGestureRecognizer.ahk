#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhysicalGestureRecognizer.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PhysicalGestureRecognizer.ahk
#Include .\ManipulationStartedEventArgs.ahk
#Include .\ManipulationUpdatedEventArgs.ahk
#Include .\ManipulationCompletedEventArgs.ahk
#Include .\TappedEventArgs.ahk
#Include .\HoldingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class PhysicalGestureRecognizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhysicalGestureRecognizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhysicalGestureRecognizer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {Integer} 
     */
    GestureSettings {
        get => this.get_GestureSettings()
        set => this.put_GestureSettings(value)
    }

    /**
     * @type {Integer} 
     */
    TapMinContactCount {
        get => this.get_TapMinContactCount()
        set => this.put_TapMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    TapMaxContactCount {
        get => this.get_TapMaxContactCount()
        set => this.put_TapMaxContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    HoldMinContactCount {
        get => this.get_HoldMinContactCount()
        set => this.put_HoldMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    HoldMaxContactCount {
        get => this.get_HoldMaxContactCount()
        set => this.put_HoldMaxContactCount(value)
    }

    /**
     * @type {Float} 
     */
    HoldRadius {
        get => this.get_HoldRadius()
        set => this.put_HoldRadius(value)
    }

    /**
     * @type {TimeSpan} 
     */
    HoldStartDelay {
        get => this.get_HoldStartDelay()
        set => this.put_HoldStartDelay(value)
    }

    /**
     * @type {Integer} 
     */
    TranslationMinContactCount {
        get => this.get_TranslationMinContactCount()
        set => this.put_TranslationMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    TranslationMaxContactCount {
        get => this.get_TranslationMaxContactCount()
        set => this.put_TranslationMaxContactCount(value)
    }

    OnManipulationStarted {
        get {
            if(!this.HasProp("__OnManipulationStarted")){
                this.__OnManipulationStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{80fefaa0-0335-5b09-8fe1-33854fe7e8c0}"),
                    PhysicalGestureRecognizer,
                    ManipulationStartedEventArgs
                )
                this.__OnManipulationStartedToken := this.add_ManipulationStarted(this.__OnManipulationStarted.iface)
            }
            return this.__OnManipulationStarted
        }
    }

    OnManipulationUpdated {
        get {
            if(!this.HasProp("__OnManipulationUpdated")){
                this.__OnManipulationUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fd08d645-0934-5c84-a498-fe313030966d}"),
                    PhysicalGestureRecognizer,
                    ManipulationUpdatedEventArgs
                )
                this.__OnManipulationUpdatedToken := this.add_ManipulationUpdated(this.__OnManipulationUpdated.iface)
            }
            return this.__OnManipulationUpdated
        }
    }

    OnManipulationCompleted {
        get {
            if(!this.HasProp("__OnManipulationCompleted")){
                this.__OnManipulationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7577ec2c-6f2b-5de1-8dbb-205f02dc46e4}"),
                    PhysicalGestureRecognizer,
                    ManipulationCompletedEventArgs
                )
                this.__OnManipulationCompletedToken := this.add_ManipulationCompleted(this.__OnManipulationCompleted.iface)
            }
            return this.__OnManipulationCompleted
        }
    }

    OnTapped {
        get {
            if(!this.HasProp("__OnTapped")){
                this.__OnTapped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{dde6ff59-be05-528a-947c-da5db69f8e6a}"),
                    PhysicalGestureRecognizer,
                    TappedEventArgs
                )
                this.__OnTappedToken := this.add_Tapped(this.__OnTapped.iface)
            }
            return this.__OnTapped
        }
    }

    OnHolding {
        get {
            if(!this.HasProp("__OnHolding")){
                this.__OnHolding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{adaa5f37-ba59-5c13-83e1-811a8c1c26ee}"),
                    PhysicalGestureRecognizer,
                    HoldingEventArgs
                )
                this.__OnHoldingToken := this.add_Holding(this.__OnHolding.iface)
            }
            return this.__OnHolding
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.PhysicalGestureRecognizer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnManipulationStartedToken")) {
            this.remove_ManipulationStarted(this.__OnManipulationStartedToken)
            this.__OnManipulationStarted.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationUpdatedToken")) {
            this.remove_ManipulationUpdated(this.__OnManipulationUpdatedToken)
            this.__OnManipulationUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnManipulationCompletedToken")) {
            this.remove_ManipulationCompleted(this.__OnManipulationCompletedToken)
            this.__OnManipulationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnTappedToken")) {
            this.remove_Tapped(this.__OnTappedToken)
            this.__OnTapped.iface.Dispose()
        }

        if(this.HasProp("__OnHoldingToken")) {
            this.remove_Holding(this.__OnHoldingToken)
            this.__OnHolding.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_IsActive()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GestureSettings() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_GestureSettings()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GestureSettings(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_GestureSettings(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMinContactCount() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_TapMinContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TapMinContactCount(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_TapMinContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMaxContactCount() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_TapMaxContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TapMaxContactCount(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_TapMaxContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMinContactCount() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_HoldMinContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HoldMinContactCount(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_HoldMinContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMaxContactCount() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_HoldMaxContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HoldMaxContactCount(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_HoldMaxContactCount(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HoldRadius() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_HoldRadius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HoldRadius(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_HoldRadius(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HoldStartDelay() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_HoldStartDelay()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_HoldStartDelay(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_HoldStartDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMinContactCount() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_TranslationMinContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TranslationMinContactCount(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_TranslationMinContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMaxContactCount() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.get_TranslationMaxContactCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TranslationMaxContactCount(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.put_TranslationMaxContactCount(value)
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @returns {HRESULT} 
     */
    ProcessDownEvent(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.ProcessDownEvent(value)
    }

    /**
     * 
     * @param {IVector<PointerPoint>} value 
     * @returns {HRESULT} 
     */
    ProcessMoveEvents(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.ProcessMoveEvents(value)
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @returns {HRESULT} 
     */
    ProcessUpEvent(value) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.ProcessUpEvent(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteGesture() {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.CompleteGesture()
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, ManipulationStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarted(handler) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.add_ManipulationStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationStarted(token) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.remove_ManipulationStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, ManipulationUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationUpdated(handler) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.add_ManipulationUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationUpdated(token) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.remove_ManipulationUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, ManipulationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCompleted(handler) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.add_ManipulationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ManipulationCompleted(token) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.remove_ManipulationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, TappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tapped(handler) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.add_Tapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Tapped(token) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.remove_Tapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, HoldingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Holding(handler) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.add_Holding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Holding(token) {
        if (!this.HasProp("__IPhysicalGestureRecognizer")) {
            if ((queryResult := this.QueryInterface(IPhysicalGestureRecognizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhysicalGestureRecognizer := IPhysicalGestureRecognizer(outPtr)
        }

        return this.__IPhysicalGestureRecognizer.remove_Holding(token)
    }

;@endregion Instance Methods
}
