#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletTransaction.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents a single wallet transaction in the transaction history.
 * @remarks
 * A WalletTransaction object represents the individual items for the [WalletItem.TransactionHistory](walletitem_transactionhistory.md) property.
 * 
 * Most of the APIs for this class can be seen in example usages in the [Quickstart: Using the   APIs](/previous-versions/windows/apps/dn631257(v=win.10)) topic.
 * 
 * If you update the values in any WalletTransaction object, which is contributing to the data of a [WalletItem](walletitem.md) object, make sure to call [WalletItemStore.UpdateAsync](walletitemstore_updateasync_1403447975.md) (passing that [WalletItem](walletitem.md) object) to commit the changes to the backing wallet store.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.wallettransaction
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletTransaction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletTransaction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletTransaction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the summary description (suitable for user UI) of the transaction.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.wallettransaction.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the transaction amount.
     * @remarks
     * This is a string, not a number, and the entity that writes data to the [WalletTransaction](wallettransaction.md) is responsible for currency symbols, decimal forms, other localization considerations and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.wallettransaction.displayamount
     * @type {HSTRING} 
     */
    DisplayAmount {
        get => this.get_DisplayAmount()
        set => this.put_DisplayAmount(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets whether to display the time of the transaction.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.wallettransaction.ignoretimeofday
     * @type {Boolean} 
     */
    IgnoreTimeOfDay {
        get => this.get_IgnoreTimeOfDay()
        set => this.put_IgnoreTimeOfDay(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets a description (suitable for user UI) of the transaction location.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.wallettransaction.displaylocation
     * @type {HSTRING} 
     */
    DisplayLocation {
        get => this.get_DisplayLocation()
        set => this.put_DisplayLocation(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the date and time of the transaction.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.wallettransaction.transactiondate
     * @type {IReference<DateTime>} 
     */
    TransactionDate {
        get => this.get_TransactionDate()
        set => this.put_TransactionDate(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets whether to launch your app when the user taps "see more transaction history".
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.wallettransaction.islaunchable
     * @type {Boolean} 
     */
    IsLaunchable {
        get => this.get_IsLaunchable()
        set => this.put_IsLaunchable(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Initializes a new instance of the [WalletTransaction](wallettransaction.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletTransaction")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayAmount() {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.get_DisplayAmount()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayAmount(value) {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.put_DisplayAmount(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IgnoreTimeOfDay() {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.get_IgnoreTimeOfDay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IgnoreTimeOfDay(value) {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.put_IgnoreTimeOfDay(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayLocation() {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.get_DisplayLocation()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayLocation(value) {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.put_DisplayLocation(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_TransactionDate() {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.get_TransactionDate()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_TransactionDate(value) {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.put_TransactionDate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLaunchable() {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.get_IsLaunchable()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLaunchable(value) {
        if (!this.HasProp("__IWalletTransaction")) {
            if ((queryResult := this.QueryInterface(IWalletTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletTransaction := IWalletTransaction(outPtr)
        }

        return this.__IWalletTransaction.put_IsLaunchable(value)
    }

;@endregion Instance Methods
}
