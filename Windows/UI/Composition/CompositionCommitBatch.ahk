#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionCommitBatch.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\CompositionBatchCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A group of active animations or effects.
 * @remarks
 * Represents a group of active animations or effects and triggers a callback when all members of the group have completed. A CompositionCommitBatch is implicitly created but must be retrieved in order declare the completed event. A Commit batch will be implicitly closed at the end of each commit cycle.
 * 
 * For an animation batch type, the callback triggers when the combined delay and duration of the longest animation in the batch has elapsed. For an effect [batch type](compositionbatchtypes.md), the callback triggers when the processing of all the effects in the batch have completed.
 * 
 * The current Commit batch can be retrieved by calling [Compositor.GetCommitBatch](compositor_getcommitbatch_1103907014.md) at any time during the commit cycle. The commit cycle is defined as the time between updates from the compositor. Updates are queued until the system is ready to process the changes and draw bits to the screen. The Commit batch will aggregate all objects within the commit cycle, those before and after [GetCommitBatch](compositor_getcommitbatch_1103907014.md) was called.   The Commit batch is implicitly created on the composition thread, the thread which the compositor is created on. There can only be one compositor per thread hence one Commit batch per thread. A Commit batch must be retrieved in order declare the completed event. A Commit batch will be implicitly closed at the end of each commit cycle and cannot be suspended or resumed, this will result in an error if attempted.
 * 
 * See [Composition Animations Overview](/windows/uwp/composition/composition-animation) for more information on composition batches.
 * 
 * <!--
 *       <rem><p>There are two types of CompositionBatches, commit batches and scoped batches.</p>
 *         
 *         <p>Commit Batch: A batch that is implicitly created during the commit cycle.  
 *         The batch must be retrieved using <xref targtype="method_winrt" rid="w_ui_comp.compositor_getcommitbatch">Compositor.GetCommitBatch</xref> in order to declare the completed event.  
 *         A commit batch remains open between commit cycles, and will be implicitly closed at the end of each commit cycle.</p>
 *         <snippet devlang="csharp" type="code">CompositionCommitBatch commitBatch = Compositor.GetCommitBatch(CompositionBatchTypes.Animation);</snippet>
 *         
 *         <p>Scoped Batch: A batch that is explicitly created using <xref targtype="method_winrt" rid="w_ui_comp.compositor_createscopedbatch">Compositor.CreateScopedBatch</xref> and is used to designate specific objects to be included in a single batch.  
 *         A scoped batch can be created off the composition thread and can only aggregate objects with the thread it is created.</p>
 *         <snippet devlang="csharp" type="code">CompositionScopedBatch scopedBatch = Compositor.CreateScopedBatch(CompositionBatchTypes.Animation);</snippet>
 *  
 *         <p>A Scoped batch must be explicitly closed using <xref targtype="method_winrt" rid="w_ui_comp.compositionscopedbatch_end">End</xref>. </p>
 *  
 *         <p>Multiple Scoped batches can be created and can span across commit cycles. This means a Scoped batched can be created in one commit cycle and ended in a later commit cycle. 
 *         When a CompositionBatch is open and actively collecting objects it is possible to overlap with several other batches.  Batch finish events are orthogonal to one another and are not chained.</p></rem>
 *       -->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncommitbatch
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionCommitBatch extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionCommitBatch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionCommitBatch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the [CompositionCommitBatch](compositioncommitbatch.md) is currently opened for objects to be aggregated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncommitbatch.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Indicates whether the [CompositionCommitBatch](compositioncommitbatch.md) has been closed and can no longer accept changes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncommitbatch.isended
     * @type {Boolean} 
     */
    IsEnded {
        get => this.get_IsEnded()
    }

    /**
     * Event that is triggered when all objects in a [CompositionCommitBatch](compositioncommitbatch.md) have completed.
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
        if (!this.HasProp("__ICompositionCommitBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionCommitBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCommitBatch := ICompositionCommitBatch(outPtr)
        }

        return this.__ICompositionCommitBatch.get_IsActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnded() {
        if (!this.HasProp("__ICompositionCommitBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionCommitBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCommitBatch := ICompositionCommitBatch(outPtr)
        }

        return this.__ICompositionCommitBatch.get_IsEnded()
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CompositionBatchCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__ICompositionCommitBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionCommitBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCommitBatch := ICompositionCommitBatch(outPtr)
        }

        return this.__ICompositionCommitBatch.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Completed(token) {
        if (!this.HasProp("__ICompositionCommitBatch")) {
            if ((queryResult := this.QueryInterface(ICompositionCommitBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCommitBatch := ICompositionCommitBatch(outPtr)
        }

        return this.__ICompositionCommitBatch.remove_Completed(token)
    }

;@endregion Instance Methods
}
