#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemKindStatics.ahk
#Include .\IRemoteSystemKindStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains read-only strings that identify various device types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemKinds extends IInspectable {
;@region Static Properties
    /**
     * Gets the string representation of the **phone** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.phone
     * @type {HSTRING} 
     */
    static Phone {
        get => RemoteSystemKinds.get_Phone()
    }

    /**
     * Gets the string representation of the **hub** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.hub
     * @type {HSTRING} 
     */
    static Hub {
        get => RemoteSystemKinds.get_Hub()
    }

    /**
     * Gets the string representation of the **holographic** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.holographic
     * @type {HSTRING} 
     */
    static Holographic {
        get => RemoteSystemKinds.get_Holographic()
    }

    /**
     * Gets the string representation of the **desktop** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.desktop
     * @type {HSTRING} 
     */
    static Desktop {
        get => RemoteSystemKinds.get_Desktop()
    }

    /**
     * Gets the string representation of the **Xbox** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.xbox
     * @type {HSTRING} 
     */
    static Xbox {
        get => RemoteSystemKinds.get_Xbox()
    }

    /**
     * Gets the string representation of the **Internet of Things (IoT)** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.iot
     * @type {HSTRING} 
     */
    static Iot {
        get => RemoteSystemKinds.get_Iot()
    }

    /**
     * Gets the string representation of the **tablet** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.tablet
     * @type {HSTRING} 
     */
    static Tablet {
        get => RemoteSystemKinds.get_Tablet()
    }

    /**
     * Gets the string representation of the **laptop** device type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkinds.laptop
     * @type {HSTRING} 
     */
    static Laptop {
        get => RemoteSystemKinds.get_Laptop()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Phone() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics := IRemoteSystemKindStatics(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics.get_Phone()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Hub() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics := IRemoteSystemKindStatics(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics.get_Hub()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Holographic() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics := IRemoteSystemKindStatics(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics.get_Holographic()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Desktop() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics := IRemoteSystemKindStatics(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics.get_Desktop()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Xbox() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics := IRemoteSystemKindStatics(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics.get_Xbox()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Iot() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics2.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics2 := IRemoteSystemKindStatics2(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics2.get_Iot()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Tablet() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics2.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics2 := IRemoteSystemKindStatics2(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics2.get_Tablet()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Laptop() {
        if (!RemoteSystemKinds.HasProp("__IRemoteSystemKindStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKinds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindStatics2.IID)
            RemoteSystemKinds.__IRemoteSystemKindStatics2 := IRemoteSystemKindStatics2(factoryPtr)
        }

        return RemoteSystemKinds.__IRemoteSystemKindStatics2.get_Laptop()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
