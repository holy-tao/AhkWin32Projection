#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemTrigger.ahk
#Include .\ISystemTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a system event that triggers a background task to run.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SystemTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of a system event trigger.
     * @param {Integer} triggerType Specifies the system event type.
     * @param {Boolean} oneShot True if the system event trigger will be used once; false if it will be used every time the event occurs.
     * @returns {SystemTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemtrigger.#ctor
     */
    static Create(triggerType, oneShot) {
        if (!SystemTrigger.HasProp("__ISystemTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.SystemTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemTriggerFactory.IID)
            SystemTrigger.__ISystemTriggerFactory := ISystemTriggerFactory(factoryPtr)
        }

        return SystemTrigger.__ISystemTriggerFactory.Create(triggerType, oneShot)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets whether a system event trigger will be used only once.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemtrigger.oneshot
     * @type {Boolean} 
     */
    OneShot {
        get => this.get_OneShot()
    }

    /**
     * Gets the system event type of a system event trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemtrigger.triggertype
     * @type {Integer} 
     */
    TriggerType {
        get => this.get_TriggerType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OneShot() {
        if (!this.HasProp("__ISystemTrigger")) {
            if ((queryResult := this.QueryInterface(ISystemTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemTrigger := ISystemTrigger(outPtr)
        }

        return this.__ISystemTrigger.get_OneShot()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TriggerType() {
        if (!this.HasProp("__ISystemTrigger")) {
            if ((queryResult := this.QueryInterface(ISystemTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemTrigger := ISystemTrigger(outPtr)
        }

        return this.__ISystemTrigger.get_TriggerType()
    }

;@endregion Instance Methods
}
