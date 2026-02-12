#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimDiscoverResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class representing the result of an eSIM profile discovery operation.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimDiscoverResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimDiscoverResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimDiscoverResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection of the discovery events related to the eSIM profile discovery operation.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverresult.events
     * @type {IVectorView<ESimDiscoverEvent>} 
     */
    Events {
        get => this.get_Events()
    }

    /**
     * Gets the kind of the result object from the eSIM profile discovery operation. Also see [Result](esimdiscoverresult_result.md).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverresult.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the returned profile metadata, if applicable, depending on [Kind](esimdiscoverresult_kind.md).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverresult.profilemetadata
     * @type {ESimProfileMetadata} 
     */
    ProfileMetadata {
        get => this.get_ProfileMetadata()
    }

    /**
     * Gets the result object from the eSIM profile discovery operation. This is a general operation result indicating success or failure. Also see [Kind](esimdiscoverresult_kind.md).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverresult.result
     * @type {ESimOperationResult} 
     */
    Result {
        get => this.get_Result()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<ESimDiscoverEvent>} 
     */
    get_Events() {
        if (!this.HasProp("__IESimDiscoverResult")) {
            if ((queryResult := this.QueryInterface(IESimDiscoverResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDiscoverResult := IESimDiscoverResult(outPtr)
        }

        return this.__IESimDiscoverResult.get_Events()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IESimDiscoverResult")) {
            if ((queryResult := this.QueryInterface(IESimDiscoverResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDiscoverResult := IESimDiscoverResult(outPtr)
        }

        return this.__IESimDiscoverResult.get_Kind()
    }

    /**
     * 
     * @returns {ESimProfileMetadata} 
     */
    get_ProfileMetadata() {
        if (!this.HasProp("__IESimDiscoverResult")) {
            if ((queryResult := this.QueryInterface(IESimDiscoverResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDiscoverResult := IESimDiscoverResult(outPtr)
        }

        return this.__IESimDiscoverResult.get_ProfileMetadata()
    }

    /**
     * 
     * @returns {ESimOperationResult} 
     */
    get_Result() {
        if (!this.HasProp("__IESimDiscoverResult")) {
            if ((queryResult := this.QueryInterface(IESimDiscoverResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDiscoverResult := IESimDiscoverResult(outPtr)
        }

        return this.__IESimDiscoverResult.get_Result()
    }

;@endregion Instance Methods
}
