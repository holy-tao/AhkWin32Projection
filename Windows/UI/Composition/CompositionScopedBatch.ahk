#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionScopedBatch.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\CompositionBatchCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * An explicitly created group of active animations or effects.
 * @remarks
 * Represents a group of active animations or effects, and triggers a callback when all members of the group have completed. A CompositionScopedBatch is explicitly created and is used to designate specific objects to be included in a single scoped batch.
 * 
 * Multiple CompositionScopedBatch instances can be created and objects can be aggregated in multiple batches at the same time.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionscopedbatch
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionScopedBatch extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionScopedBatch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionScopedBatch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the [CompositionScopedBatch](compositionscopedbatch.md) is currently opened for objects to be aggregated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionscopedbatch.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Indicates whether the [CompositionScopedBatch](compositionscopedbatch.md) has been closed and can no longer accept changes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionscopedbatch.isended
     * @type {Boolean} 
     */
    IsEnded {
        get => this.get_IsEnded()
    }

    /**
     * Event triggered once all animations and effects in the [CompositionScopedBatch](compositionscopedbatch.md) have completed.
     * @type {TypedEventHandler<IInspectable, CompositionBatchCompletedEventArgs>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9df03456-3383-508b-9c75-ee840a7e1a39}"),
                    IInspectable,
                    CompositionBatchCompletedEventArgs
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__ICompositionScopedBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionScopedBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionScopedBatch := ICompositionScopedBatch(outPtr)
        }

        return this.__ICompositionScopedBatch.get_IsActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnded() {
        if (!this.HasProp("__ICompositionScopedBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionScopedBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionScopedBatch := ICompositionScopedBatch(outPtr)
        }

        return this.__ICompositionScopedBatch.get_IsEnded()
    }

    /**
     * Closes the [CompositionScopedBatch](compositionscopedbatch.md). Once the [CompositionScopedBatch](compositionscopedbatch.md) has been closed it cannot be suspended or resumed again.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionscopedbatch.end
     */
    End() {
        if (!this.HasProp("__ICompositionScopedBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionScopedBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionScopedBatch := ICompositionScopedBatch(outPtr)
        }

        return this.__ICompositionScopedBatch.End()
    }

    /**
     * Resumes aggregating objects in the [CompositionScopedBatch](compositionscopedbatch.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionscopedbatch.resume
     */
    Resume() {
        if (!this.HasProp("__ICompositionScopedBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionScopedBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionScopedBatch := ICompositionScopedBatch(outPtr)
        }

        return this.__ICompositionScopedBatch.Resume()
    }

    /**
     * Suspends aggregating objects in the [CompositionScopedBatch](compositionscopedbatch.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionscopedbatch.suspend
     */
    Suspend() {
        if (!this.HasProp("__ICompositionScopedBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionScopedBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionScopedBatch := ICompositionScopedBatch(outPtr)
        }

        return this.__ICompositionScopedBatch.Suspend()
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CompositionBatchCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__ICompositionScopedBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionScopedBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionScopedBatch := ICompositionScopedBatch(outPtr)
        }

        return this.__ICompositionScopedBatch.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Completed(token) {
        if (!this.HasProp("__ICompositionScopedBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionScopedBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionScopedBatch := ICompositionScopedBatch(outPtr)
        }

        return this.__ICompositionScopedBatch.remove_Completed(token)
    }

;@endregion Instance Methods
}
