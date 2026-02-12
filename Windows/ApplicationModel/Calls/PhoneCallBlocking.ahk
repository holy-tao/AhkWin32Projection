#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallBlockingStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Controls the blocking of phone numbers as they are received.
 * @remarks
 * For more information about how communication blocking works, and how to implement it in your application, see [Windows.ApplicationModel.CommunicationBlocking](../windows.applicationmodel.communicationblocking/windows_applicationmodel_communicationblocking.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallblocking
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallBlocking extends IInspectable {
;@region Static Properties
    /**
     * Gets or sets whether the [PhoneCallBlocking](phonecallblocking.md) instance should block unknown numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallblocking.blockunknownnumbers
     * @type {Boolean} 
     */
    static BlockUnknownNumbers {
        get => PhoneCallBlocking.get_BlockUnknownNumbers()
        set => PhoneCallBlocking.put_BlockUnknownNumbers(value)
    }

    /**
     * Gets or sets whether the [PhoneCallBlocking](phonecallblocking.md) instance should block private numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallblocking.blockprivatenumbers
     * @type {Boolean} 
     */
    static BlockPrivateNumbers {
        get => PhoneCallBlocking.get_BlockPrivateNumbers()
        set => PhoneCallBlocking.put_BlockPrivateNumbers(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_BlockUnknownNumbers() {
        if (!PhoneCallBlocking.HasProp("__IPhoneCallBlockingStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallBlocking")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallBlockingStatics.IID)
            PhoneCallBlocking.__IPhoneCallBlockingStatics := IPhoneCallBlockingStatics(factoryPtr)
        }

        return PhoneCallBlocking.__IPhoneCallBlockingStatics.get_BlockUnknownNumbers()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_BlockUnknownNumbers(value) {
        if (!PhoneCallBlocking.HasProp("__IPhoneCallBlockingStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallBlocking")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallBlockingStatics.IID)
            PhoneCallBlocking.__IPhoneCallBlockingStatics := IPhoneCallBlockingStatics(factoryPtr)
        }

        return PhoneCallBlocking.__IPhoneCallBlockingStatics.put_BlockUnknownNumbers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_BlockPrivateNumbers() {
        if (!PhoneCallBlocking.HasProp("__IPhoneCallBlockingStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallBlocking")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallBlockingStatics.IID)
            PhoneCallBlocking.__IPhoneCallBlockingStatics := IPhoneCallBlockingStatics(factoryPtr)
        }

        return PhoneCallBlocking.__IPhoneCallBlockingStatics.get_BlockPrivateNumbers()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_BlockPrivateNumbers(value) {
        if (!PhoneCallBlocking.HasProp("__IPhoneCallBlockingStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallBlocking")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallBlockingStatics.IID)
            PhoneCallBlocking.__IPhoneCallBlockingStatics := IPhoneCallBlockingStatics(factoryPtr)
        }

        return PhoneCallBlocking.__IPhoneCallBlockingStatics.put_BlockPrivateNumbers(value)
    }

    /**
     * Sets the list of numbers that should be blocked.
     * @param {IIterable<HSTRING>} phoneNumberList A list of numbers that should be blocked.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallblocking.setcallblockinglistasync
     */
    static SetCallBlockingListAsync(phoneNumberList) {
        if (!PhoneCallBlocking.HasProp("__IPhoneCallBlockingStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallBlocking")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallBlockingStatics.IID)
            PhoneCallBlocking.__IPhoneCallBlockingStatics := IPhoneCallBlockingStatics(factoryPtr)
        }

        return PhoneCallBlocking.__IPhoneCallBlockingStatics.SetCallBlockingListAsync(phoneNumberList)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
