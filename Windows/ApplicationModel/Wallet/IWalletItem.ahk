#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\WalletBarcode.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include .\WalletTransaction.ahk
#Include .\WalletRelevantLocation.ahk
#Include .\WalletItemCustomProperty.ahk
#Include .\WalletVerb.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class IWalletItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletItem
     * @type {Guid}
     */
    static IID => Guid("{20b54be8-118d-4ec4-996c-b963e7bd3e74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "put_DisplayName", "get_Id", "get_IsAcknowledged", "put_IsAcknowledged", "get_IssuerDisplayName", "put_IssuerDisplayName", "get_LastUpdated", "put_LastUpdated", "get_Kind", "get_Barcode", "put_Barcode", "get_ExpirationDate", "put_ExpirationDate", "get_Logo159x159", "put_Logo159x159", "get_Logo336x336", "put_Logo336x336", "get_Logo99x99", "put_Logo99x99", "get_DisplayMessage", "put_DisplayMessage", "get_IsDisplayMessageLaunchable", "put_IsDisplayMessageLaunchable", "get_LogoText", "put_LogoText", "get_HeaderColor", "put_HeaderColor", "get_BodyColor", "put_BodyColor", "get_HeaderFontColor", "put_HeaderFontColor", "get_BodyFontColor", "put_BodyFontColor", "get_HeaderBackgroundImage", "put_HeaderBackgroundImage", "get_BodyBackgroundImage", "put_BodyBackgroundImage", "get_LogoImage", "put_LogoImage", "get_PromotionalImage", "put_PromotionalImage", "get_RelevantDate", "put_RelevantDate", "get_RelevantDateDisplayMessage", "put_RelevantDateDisplayMessage", "get_TransactionHistory", "get_RelevantLocations", "get_IsMoreTransactionHistoryLaunchable", "put_IsMoreTransactionHistoryLaunchable", "get_DisplayProperties", "get_Verbs"]

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    IsAcknowledged {
        get => this.get_IsAcknowledged()
        set => this.put_IsAcknowledged(value)
    }

    /**
     * @type {HSTRING} 
     */
    IssuerDisplayName {
        get => this.get_IssuerDisplayName()
        set => this.put_IssuerDisplayName(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    LastUpdated {
        get => this.get_LastUpdated()
        set => this.put_LastUpdated(value)
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {WalletBarcode} 
     */
    Barcode {
        get => this.get_Barcode()
        set => this.put_Barcode(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
        set => this.put_ExpirationDate(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Logo159x159 {
        get => this.get_Logo159x159()
        set => this.put_Logo159x159(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Logo336x336 {
        get => this.get_Logo336x336()
        set => this.put_Logo336x336(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Logo99x99 {
        get => this.get_Logo99x99()
        set => this.put_Logo99x99(value)
    }

    /**
     * @type {HSTRING} 
     */
    DisplayMessage {
        get => this.get_DisplayMessage()
        set => this.put_DisplayMessage(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDisplayMessageLaunchable {
        get => this.get_IsDisplayMessageLaunchable()
        set => this.put_IsDisplayMessageLaunchable(value)
    }

    /**
     * @type {HSTRING} 
     */
    LogoText {
        get => this.get_LogoText()
        set => this.put_LogoText(value)
    }

    /**
     * @type {Color} 
     */
    HeaderColor {
        get => this.get_HeaderColor()
        set => this.put_HeaderColor(value)
    }

    /**
     * @type {Color} 
     */
    BodyColor {
        get => this.get_BodyColor()
        set => this.put_BodyColor(value)
    }

    /**
     * @type {Color} 
     */
    HeaderFontColor {
        get => this.get_HeaderFontColor()
        set => this.put_HeaderFontColor(value)
    }

    /**
     * @type {Color} 
     */
    BodyFontColor {
        get => this.get_BodyFontColor()
        set => this.put_BodyFontColor(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    HeaderBackgroundImage {
        get => this.get_HeaderBackgroundImage()
        set => this.put_HeaderBackgroundImage(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    BodyBackgroundImage {
        get => this.get_BodyBackgroundImage()
        set => this.put_BodyBackgroundImage(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    LogoImage {
        get => this.get_LogoImage()
        set => this.put_LogoImage(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    PromotionalImage {
        get => this.get_PromotionalImage()
        set => this.put_PromotionalImage(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    RelevantDate {
        get => this.get_RelevantDate()
        set => this.put_RelevantDate(value)
    }

    /**
     * @type {HSTRING} 
     */
    RelevantDateDisplayMessage {
        get => this.get_RelevantDateDisplayMessage()
        set => this.put_RelevantDateDisplayMessage(value)
    }

    /**
     * @type {IMap<HSTRING, WalletTransaction>} 
     */
    TransactionHistory {
        get => this.get_TransactionHistory()
    }

    /**
     * @type {IMap<HSTRING, WalletRelevantLocation>} 
     */
    RelevantLocations {
        get => this.get_RelevantLocations()
    }

    /**
     * @type {Boolean} 
     */
    IsMoreTransactionHistoryLaunchable {
        get => this.get_IsMoreTransactionHistoryLaunchable()
        set => this.put_IsMoreTransactionHistoryLaunchable(value)
    }

    /**
     * @type {IMap<HSTRING, WalletItemCustomProperty>} 
     */
    DisplayProperties {
        get => this.get_DisplayProperties()
    }

    /**
     * @type {IMap<HSTRING, WalletVerb>} 
     */
    Verbs {
        get => this.get_Verbs()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAcknowledged() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAcknowledged(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IssuerDisplayName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IssuerDisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastUpdated() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_LastUpdated(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WalletBarcode} 
     */
    get_Barcode() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WalletBarcode(value)
    }

    /**
     * 
     * @param {WalletBarcode} value 
     * @returns {HRESULT} 
     */
    put_Barcode(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationDate() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationDate(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo159x159() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Logo159x159(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo336x336() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Logo336x336(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo99x99() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Logo99x99(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMessage() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMessage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisplayMessageLaunchable() {
        result := ComCall(28, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDisplayMessageLaunchable(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LogoText() {
        value := HSTRING()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LogoText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_HeaderColor() {
        value := Color()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_HeaderColor(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BodyColor() {
        value := Color()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BodyColor(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_HeaderFontColor() {
        value := Color()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_HeaderFontColor(value) {
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BodyFontColor() {
        value := Color()
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BodyFontColor(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_HeaderBackgroundImage() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_HeaderBackgroundImage(value) {
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_BodyBackgroundImage() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_BodyBackgroundImage(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_LogoImage() {
        result := ComCall(44, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_LogoImage(value) {
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_PromotionalImage() {
        result := ComCall(46, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_PromotionalImage(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RelevantDate() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_RelevantDate(value) {
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RelevantDateDisplayMessage() {
        value := HSTRING()
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RelevantDateDisplayMessage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletTransaction>} 
     */
    get_TransactionHistory() {
        result := ComCall(52, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), WalletTransaction, value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletRelevantLocation>} 
     */
    get_RelevantLocations() {
        result := ComCall(53, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), WalletRelevantLocation, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMoreTransactionHistoryLaunchable() {
        result := ComCall(54, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMoreTransactionHistoryLaunchable(value) {
        result := ComCall(55, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletItemCustomProperty>} 
     */
    get_DisplayProperties() {
        result := ComCall(56, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), WalletItemCustomProperty, value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletVerb>} 
     */
    get_Verbs() {
        result := ComCall(57, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), WalletVerb, value)
    }
}
