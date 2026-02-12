#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotificationData.ahk
#Include .\INotificationDataFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Stores data for display in a [toast notification](toastnotification.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationdata
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class NotificationData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotificationData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotificationData.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [NotificationData](notificationdata.md) that contains the specified values and the specified sequence number.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} initialValues A collection of keys and values for the new [NotificationData](notificationdata.md), such as "progressValue", "0".
     * @param {Integer} sequenceNumber A value greater than or equal to 0 that specifies the sequence number of the new notification data. When multiple [NotificationData](notificationdata.md) objects are received, the system displays the [NotificationData](notificationdata.md) with the greatest non-zero number. Setting this value to 0 causes it to always displays.
     * @returns {NotificationData} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationdata.#ctor
     */
    static CreateNotificationDataWithValuesAndSequenceNumber(initialValues, sequenceNumber) {
        if (!NotificationData.HasProp("__INotificationDataFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.NotificationData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INotificationDataFactory.IID)
            NotificationData.__INotificationDataFactory := INotificationDataFactory(factoryPtr)
        }

        return NotificationData.__INotificationDataFactory.CreateNotificationDataWithValuesAndSequenceNumber(initialValues, sequenceNumber)
    }

    /**
     * Creates a new [NotificationData](notificationdata.md) that contains the specified values.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} initialValues A collection of keys and values for the new [NotificationData](notificationdata.md), such as "progressValue", "0".
     * @returns {NotificationData} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationdata.#ctor
     */
    static CreateNotificationDataWithValues(initialValues) {
        if (!NotificationData.HasProp("__INotificationDataFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.NotificationData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INotificationDataFactory.IID)
            NotificationData.__INotificationDataFactory := INotificationDataFactory(factoryPtr)
        }

        return NotificationData.__INotificationDataFactory.CreateNotificationDataWithValues(initialValues)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of keys and values for the new [NotificationData](notificationdata.md), such as "progressValue", "0".
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationdata.values
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * Gets or sets the sequence number of this notification data. The system uses the sequence number to determine whether the notification data is out-of-date.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationdata.sequencenumber
     * @type {Integer} 
     */
    SequenceNumber {
        get => this.get_SequenceNumber()
        set => this.put_SequenceNumber(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [NotificationData](notificationdata.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.NotificationData")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Values() {
        if (!this.HasProp("__INotificationData")) {
            if ((queryResult := this.QueryInterface(INotificationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationData := INotificationData(outPtr)
        }

        return this.__INotificationData.get_Values()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SequenceNumber() {
        if (!this.HasProp("__INotificationData")) {
            if ((queryResult := this.QueryInterface(INotificationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationData := INotificationData(outPtr)
        }

        return this.__INotificationData.get_SequenceNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SequenceNumber(value) {
        if (!this.HasProp("__INotificationData")) {
            if ((queryResult := this.QueryInterface(INotificationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationData := INotificationData(outPtr)
        }

        return this.__INotificationData.put_SequenceNumber(value)
    }

;@endregion Instance Methods
}
