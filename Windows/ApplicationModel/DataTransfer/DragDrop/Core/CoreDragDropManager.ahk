#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreDragDropManager.ahk
#Include .\ICoreDragDropManagerStatics.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreDragDropManager.ahk
#Include .\CoreDropOperationTargetRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Manages access for drag and drop within and between apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragdropmanager
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class CoreDragDropManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreDragDropManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreDragDropManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the core drag and drop manager associated with the currently visible application window.
     * @returns {CoreDragDropManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragdropmanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!CoreDragDropManager.HasProp("__ICoreDragDropManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragDropManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreDragDropManagerStatics.IID)
            CoreDragDropManager.__ICoreDragDropManagerStatics := ICoreDragDropManagerStatics(factoryPtr)
        }

        return CoreDragDropManager.__ICoreDragDropManagerStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether concurrent drag and drop operations are enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragdropmanager.areconcurrentoperationsenabled
     * @type {Boolean} 
     */
    AreConcurrentOperationsEnabled {
        get => this.get_AreConcurrentOperationsEnabled()
        set => this.put_AreConcurrentOperationsEnabled(value)
    }

    /**
     * Occurs when a drag and drop target is requested.
     * @type {TypedEventHandler<CoreDragDropManager, CoreDropOperationTargetRequestedEventArgs>}
    */
    OnTargetRequested {
        get {
            if(!this.HasProp("__OnTargetRequested")){
                this.__OnTargetRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a4c3b1c1-b8ad-58cb-acc0-8ef37eae4ed4}"),
                    CoreDragDropManager,
                    CoreDropOperationTargetRequestedEventArgs
                )
                this.__OnTargetRequestedToken := this.add_TargetRequested(this.__OnTargetRequested.iface)
            }
            return this.__OnTargetRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTargetRequestedToken")) {
            this.remove_TargetRequested(this.__OnTargetRequestedToken)
            this.__OnTargetRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreDragDropManager, CoreDropOperationTargetRequestedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TargetRequested(value) {
        if (!this.HasProp("__ICoreDragDropManager")) {
            if ((queryResult := this.QueryInterface(ICoreDragDropManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragDropManager := ICoreDragDropManager(outPtr)
        }

        return this.__ICoreDragDropManager.add_TargetRequested(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_TargetRequested(value) {
        if (!this.HasProp("__ICoreDragDropManager")) {
            if ((queryResult := this.QueryInterface(ICoreDragDropManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragDropManager := ICoreDragDropManager(outPtr)
        }

        return this.__ICoreDragDropManager.remove_TargetRequested(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreConcurrentOperationsEnabled() {
        if (!this.HasProp("__ICoreDragDropManager")) {
            if ((queryResult := this.QueryInterface(ICoreDragDropManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragDropManager := ICoreDragDropManager(outPtr)
        }

        return this.__ICoreDragDropManager.get_AreConcurrentOperationsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreConcurrentOperationsEnabled(value) {
        if (!this.HasProp("__ICoreDragDropManager")) {
            if ((queryResult := this.QueryInterface(ICoreDragDropManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragDropManager := ICoreDragDropManager(outPtr)
        }

        return this.__ICoreDragDropManager.put_AreConcurrentOperationsEnabled(value)
    }

;@endregion Instance Methods
}
