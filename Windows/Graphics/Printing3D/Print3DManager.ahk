#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DManager.ahk
#Include .\IPrint3DManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Print3DManager.ahk
#Include .\Print3DTaskRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Creates the 3D printing experience.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dmanager
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a 3D print manager.
     * @returns {Print3DManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dmanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!Print3DManager.HasProp("__IPrint3DManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Print3DManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrint3DManagerStatics.IID)
            Print3DManager.__IPrint3DManagerStatics := IPrint3DManagerStatics(factoryPtr)
        }

        return Print3DManager.__IPrint3DManagerStatics.GetForCurrentView()
    }

    /**
     * Programmatically initiates the 3D printing user interface.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dmanager.showprintuiasync
     */
    static ShowPrintUIAsync() {
        if (!Print3DManager.HasProp("__IPrint3DManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Print3DManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrint3DManagerStatics.IID)
            Print3DManager.__IPrint3DManagerStatics := IPrint3DManagerStatics(factoryPtr)
        }

        return Print3DManager.__IPrint3DManagerStatics.ShowPrintUIAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTaskRequestedToken")) {
            this.remove_TaskRequested(this.__OnTaskRequestedToken)
            this.__OnTaskRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DManager, Print3DTaskRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_TaskRequested(eventHandler) {
        if (!this.HasProp("__IPrint3DManager")) {
            if ((queryResult := this.QueryInterface(IPrint3DManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DManager := IPrint3DManager(outPtr)
        }

        return this.__IPrint3DManager.add_TaskRequested(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TaskRequested(token) {
        if (!this.HasProp("__IPrint3DManager")) {
            if ((queryResult := this.QueryInterface(IPrint3DManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DManager := IPrint3DManager(outPtr)
        }

        return this.__IPrint3DManager.remove_TaskRequested(token)
    }

;@endregion Instance Methods
}
