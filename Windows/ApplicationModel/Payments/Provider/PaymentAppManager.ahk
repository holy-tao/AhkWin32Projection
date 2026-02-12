#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentAppManager.ahk
#Include .\IPaymentAppManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class is used to register an app as a payment provider app so that it can start processing [PaymentTransactions](paymenttransaction.md) that were submitted through the Payment Request APIs ([Windows.ApplicationModel.Payments](windows_applicationmodel_payments_provider.md)).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymentappmanager
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class PaymentAppManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentAppManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentAppManager.IID

    /**
     * The current PaymentAppManager object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymentappmanager.current
     * @type {PaymentAppManager} 
     */
    static Current {
        get => PaymentAppManager.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {PaymentAppManager} 
     */
    static get_Current() {
        if (!PaymentAppManager.HasProp("__IPaymentAppManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.Provider.PaymentAppManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentAppManagerStatics.IID)
            PaymentAppManager.__IPaymentAppManagerStatics := IPaymentAppManagerStatics(factoryPtr)
        }

        return PaymentAppManager.__IPaymentAppManagerStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Registers this app as a payment provider.
     * @param {IIterable<HSTRING>} supportedPaymentMethodIds The supported payment method IDs.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymentappmanager.registerasync
     */
    RegisterAsync(supportedPaymentMethodIds) {
        if (!this.HasProp("__IPaymentAppManager")) {
            if ((queryResult := this.QueryInterface(IPaymentAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAppManager := IPaymentAppManager(outPtr)
        }

        return this.__IPaymentAppManager.RegisterAsync(supportedPaymentMethodIds)
    }

    /**
     * Unregisters this app as a payment provider.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymentappmanager.unregisterasync
     */
    UnregisterAsync() {
        if (!this.HasProp("__IPaymentAppManager")) {
            if ((queryResult := this.QueryInterface(IPaymentAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAppManager := IPaymentAppManager(outPtr)
        }

        return this.__IPaymentAppManager.UnregisterAsync()
    }

;@endregion Instance Methods
}
