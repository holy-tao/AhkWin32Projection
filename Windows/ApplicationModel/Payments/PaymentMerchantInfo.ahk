#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentMerchantInfo.ahk
#Include .\IPaymentMerchantInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that contains information about a payment merchant.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmerchantinfo
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentMerchantInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentMerchantInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentMerchantInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [PaymentMerchantInfo](paymentmerchantinfo.md) object.
     * @param {Uri} uri_ The uri.
     * @returns {PaymentMerchantInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmerchantinfo.#ctor
     */
    static Create(uri_) {
        if (!PaymentMerchantInfo.HasProp("__IPaymentMerchantInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentMerchantInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentMerchantInfoFactory.IID)
            PaymentMerchantInfo.__IPaymentMerchantInfoFactory := IPaymentMerchantInfoFactory(factoryPtr)
        }

        return PaymentMerchantInfo.__IPaymentMerchantInfoFactory.Create(uri_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The full name of the package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmerchantinfo.packagefullname
     * @type {HSTRING} 
     */
    PackageFullName {
        get => this.get_PackageFullName()
    }

    /**
     * A read-only property containing the URI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmerchantinfo.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [PaymentMerchantInfo](paymentmerchantinfo.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentMerchantInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFullName() {
        if (!this.HasProp("__IPaymentMerchantInfo")) {
            if ((queryResult := this.QueryInterface(IPaymentMerchantInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMerchantInfo := IPaymentMerchantInfo(outPtr)
        }

        return this.__IPaymentMerchantInfo.get_PackageFullName()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IPaymentMerchantInfo")) {
            if ((queryResult := this.QueryInterface(IPaymentMerchantInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMerchantInfo := IPaymentMerchantInfo(outPtr)
        }

        return this.__IPaymentMerchantInfo.get_Uri()
    }

;@endregion Instance Methods
}
