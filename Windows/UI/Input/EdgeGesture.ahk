#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEdgeGesture.ahk
#Include .\IEdgeGestureStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\EdgeGesture.ahk
#Include .\EdgeGestureEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the events that notify an app of triggers to its edge-based UI.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.edgegesture
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class EdgeGesture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEdgeGesture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEdgeGesture.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of the [EdgeGesture](edgegesture.md) class that is used to add and remove event delegate handlers for the current view.
     * @remarks
     * This method uses the current [CoreWindow](../windows.ui.core/corewindow.md) of your application's [CoreApplication](../windows.applicationmodel.core/coreapplication.md) object to determine the particular instance. That is, there is a 1:1 correspondence between different instances of [EdgeGesture](edgegesture.md) and [CoreWindow](../windows.ui.core/corewindow.md). You cannot obtain an instance of an [EdgeGesture](edgegesture.md) class for another app, nor can an [EdgeGesture](edgegesture.md) instance be obtained for an app without a current [CoreWindow](../windows.ui.core/corewindow.md).
     * @returns {EdgeGesture} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.edgegesture.getforcurrentview
     */
    static GetForCurrentView() {
        if (!EdgeGesture.HasProp("__IEdgeGestureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.EdgeGesture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEdgeGestureStatics.IID)
            EdgeGesture.__IEdgeGestureStatics := IEdgeGestureStatics(factoryPtr)
        }

        return EdgeGesture.__IEdgeGestureStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStartingToken")) {
            this.remove_Starting(this.__OnStartingToken)
            this.__OnStarting.iface.Dispose()
        }

        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnCanceledToken")) {
            this.remove_Canceled(this.__OnCanceledToken)
            this.__OnCanceled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<EdgeGesture, EdgeGestureEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Starting(handler) {
        if (!this.HasProp("__IEdgeGesture")) {
            if ((queryResult := this.QueryInterface(IEdgeGesture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeGesture := IEdgeGesture(outPtr)
        }

        return this.__IEdgeGesture.add_Starting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Starting(token) {
        if (!this.HasProp("__IEdgeGesture")) {
            if ((queryResult := this.QueryInterface(IEdgeGesture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeGesture := IEdgeGesture(outPtr)
        }

        return this.__IEdgeGesture.remove_Starting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EdgeGesture, EdgeGestureEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__IEdgeGesture")) {
            if ((queryResult := this.QueryInterface(IEdgeGesture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeGesture := IEdgeGesture(outPtr)
        }

        return this.__IEdgeGesture.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Completed(token) {
        if (!this.HasProp("__IEdgeGesture")) {
            if ((queryResult := this.QueryInterface(IEdgeGesture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeGesture := IEdgeGesture(outPtr)
        }

        return this.__IEdgeGesture.remove_Completed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<EdgeGesture, EdgeGestureEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Canceled(handler) {
        if (!this.HasProp("__IEdgeGesture")) {
            if ((queryResult := this.QueryInterface(IEdgeGesture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeGesture := IEdgeGesture(outPtr)
        }

        return this.__IEdgeGesture.add_Canceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Canceled(token) {
        if (!this.HasProp("__IEdgeGesture")) {
            if ((queryResult := this.QueryInterface(IEdgeGesture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeGesture := IEdgeGesture(outPtr)
        }

        return this.__IEdgeGesture.remove_Canceled(token)
    }

;@endregion Instance Methods
}
