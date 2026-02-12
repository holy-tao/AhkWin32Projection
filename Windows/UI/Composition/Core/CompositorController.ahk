#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositorController.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CompositorController.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a compositor on which intended composition changes must be explicitly committed.
 * @remarks
 * The CompositorController lets you create and control a compositor on which you must explicitly commit your intended composition changes. This is in contrast to the compositor you obtain from a visual returned by a call to ElementCompositionPreview.GetElementVisual, for which commits occur implicitly without requiring a direct call.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.core.compositorcontroller
 * @namespace Windows.UI.Composition.Core
 * @version WindowsRuntime 1.4
 */
class CompositorController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositorController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositorController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the compositor associated with this composition controller.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.core.compositorcontroller.compositor
     * @type {Compositor} 
     */
    Compositor {
        get => this.get_Compositor()
    }

    /**
     * Occurs when the framework needs to call Commit in order for changes to Composition objects to be reflected onscreen.
     * @type {TypedEventHandler<CompositorController, IInspectable>}
    */
    OnCommitNeeded {
        get {
            if(!this.HasProp("__OnCommitNeeded")){
                this.__OnCommitNeeded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e60c8424-3154-566e-9aa2-eec49fce004a}"),
                    CompositorController,
                    IInspectable
                )
                this.__OnCommitNeededToken := this.add_CommitNeeded(this.__OnCommitNeeded.iface)
            }
            return this.__OnCommitNeeded
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the CompositorController class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Core.CompositorController")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCommitNeededToken")) {
            this.remove_CommitNeeded(this.__OnCommitNeededToken)
            this.__OnCommitNeeded.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Compositor} 
     */
    get_Compositor() {
        if (!this.HasProp("__ICompositorController")) {
            if ((queryResult := this.QueryInterface(ICompositorController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorController := ICompositorController(outPtr)
        }

        return this.__ICompositorController.get_Compositor()
    }

    /**
     * Calls commit on the compositor associated with this CompositorController.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.core.compositorcontroller.commit
     */
    Commit() {
        if (!this.HasProp("__ICompositorController")) {
            if ((queryResult := this.QueryInterface(ICompositorController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorController := ICompositorController(outPtr)
        }

        return this.__ICompositorController.Commit()
    }

    /**
     * Ensures the previous commit was completed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.core.compositorcontroller.ensurepreviouscommitcompletedasync
     */
    EnsurePreviousCommitCompletedAsync() {
        if (!this.HasProp("__ICompositorController")) {
            if ((queryResult := this.QueryInterface(ICompositorController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorController := ICompositorController(outPtr)
        }

        return this.__ICompositorController.EnsurePreviousCommitCompletedAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<CompositorController, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CommitNeeded(handler) {
        if (!this.HasProp("__ICompositorController")) {
            if ((queryResult := this.QueryInterface(ICompositorController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorController := ICompositorController(outPtr)
        }

        return this.__ICompositorController.add_CommitNeeded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CommitNeeded(token) {
        if (!this.HasProp("__ICompositorController")) {
            if ((queryResult := this.QueryInterface(ICompositorController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorController := ICompositorController(outPtr)
        }

        return this.__ICompositorController.remove_CommitNeeded(token)
    }

    /**
     * Releases system resources that are used by the CompositorController.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.core.compositorcontroller.close
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
