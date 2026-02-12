#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveDeviceAddress.ahk
#Include .\IXboxLiveDeviceAddressStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\XboxLiveDeviceAddress.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the network location of a console or other authenticated device.
  * 
  * Objects of this class represent an opaque collection of connectivity information about a device (in particular, a list of IP addresses). You pass an **XboxLiveDeviceAddress** to one of the **XboxLiveEndpointPairTemplate** class's **CreateEndpointPairAsync** or **CreateEndpointPairForPortsAsync** methods in order to instantiate an **XboxLiveEndpointPair** between the local device and the device at the given **XboxLiveDeviceAddress**.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveDeviceAddress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveDeviceAddress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveDeviceAddress.IID

    /**
     * Gets a value that specifies the maximum number of Bytes required for the array of Bytes passed to **XboxLiveDeviceAddress.GetSnapshotAsBytes**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * This property value is constant.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.maxsnapshotbytessize
     * @type {Integer} 
     */
    static MaxSnapshotBytesSize {
        get => XboxLiveDeviceAddress.get_MaxSnapshotBytesSize()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an **XboxLiveDeviceAddress** object from a snapshot stored in Base64 encoding.
     * 
     * Use this method to create an **XboxLiveDeviceAddress** from the Base64-encoded snapshot returned from an earlier call to **XboxLiveDeviceAddress.GetSnapshotAsBase64**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The Base64-encoded snapshot is expected to originate from a previous call to **GetSnapshotAsBase64** on the local or remote device, without modification. If the contents of the snapshot have been altered or corrupted, then an **XboxLiveDeviceAddress** object is returned, but the **IsValid** property is false; and attempts to use the **XboxLiveDeviceAddress** to create an endpoint pair will fail.
     * @param {HSTRING} base64 A Base64-encoded snapshot representing an **XboxLiveDeviceAddress**.
     * @returns {XboxLiveDeviceAddress} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.createfromsnapshotbase64
     */
    static CreateFromSnapshotBase64(base64) {
        if (!XboxLiveDeviceAddress.HasProp("__IXboxLiveDeviceAddressStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveDeviceAddress")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveDeviceAddressStatics.IID)
            XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics := IXboxLiveDeviceAddressStatics(factoryPtr)
        }

        return XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics.CreateFromSnapshotBase64(base64)
    }

    /**
     * Creates an **XboxLiveDeviceAddress** object from a snapshot stored in a buffer.
     * 
     * Use this method to create an **XboxLiveDeviceAddress** from the snapshot buffer returned from an earlier call to **XboxLiveDeviceAddress.GetSnapshotAsBuffer**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The snapshot buffer is expected to originate from a previous call to **GetSnapshotAsBuffer** on the local or remote device, without modification. If the contents of the snapshot have been altered or corrupted, then an **XboxLiveDeviceAddress** object is returned, but the **IsValid** property is false; and attempts to use the **XboxLiveDeviceAddress** to create an endpoint pair will fail.
     * @param {IBuffer} buffer_ A buffer containing an **XboxLiveDeviceAddress** snapshot.
     * @returns {XboxLiveDeviceAddress} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.createfromsnapshotbuffer
     */
    static CreateFromSnapshotBuffer(buffer_) {
        if (!XboxLiveDeviceAddress.HasProp("__IXboxLiveDeviceAddressStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveDeviceAddress")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveDeviceAddressStatics.IID)
            XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics := IXboxLiveDeviceAddressStatics(factoryPtr)
        }

        return XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics.CreateFromSnapshotBuffer(buffer_)
    }

    /**
     * Creates an **XboxLiveDeviceAddress** from a snapshot stored as an array of bytes.
     * 
     * Use this method to create an **XboxLiveDeviceAddress** object from a saved snapshot retrieved with the **XboxLiveDeviceAddress.GetSnapshotAsBytes** method.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The snapshot bytes are expected to originate from a previous call to **GetSnapshotAsBytes** on the local or remote device, without modification. If the contents of the snapshot have been altered or corrupted, then an **XboxLiveDeviceAddress** object is returned; but the **IsValid** property is false, and attempts to use the **XboxLiveDeviceAddress** to create an endpoint pair will fail.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer The Byte array containing the snapshot.
     * @returns {XboxLiveDeviceAddress} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.createfromsnapshotbytes
     */
    static CreateFromSnapshotBytes(buffer_length, buffer) {
        if (!XboxLiveDeviceAddress.HasProp("__IXboxLiveDeviceAddressStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveDeviceAddress")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveDeviceAddressStatics.IID)
            XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics := IXboxLiveDeviceAddressStatics(factoryPtr)
        }

        return XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics.CreateFromSnapshotBytes(buffer_length, buffer)
    }

    /**
     * Creates an **XboxLiveDeviceAddress** for the local device.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {XboxLiveDeviceAddress} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.getlocal
     */
    static GetLocal() {
        if (!XboxLiveDeviceAddress.HasProp("__IXboxLiveDeviceAddressStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveDeviceAddress")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveDeviceAddressStatics.IID)
            XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics := IXboxLiveDeviceAddressStatics(factoryPtr)
        }

        return XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics.GetLocal()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxSnapshotBytesSize() {
        if (!XboxLiveDeviceAddress.HasProp("__IXboxLiveDeviceAddressStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveDeviceAddress")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveDeviceAddressStatics.IID)
            XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics := IXboxLiveDeviceAddressStatics(factoryPtr)
        }

        return XboxLiveDeviceAddress.__IXboxLiveDeviceAddressStatics.get_MaxSnapshotBytesSize()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a Boolean value indicating whether this **XboxLiveDeviceAddress** is valid.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * Snapshots are expected to originate from previous calls to **GetSnapshotAsBase64**, **GetSnapshotAsBuffer**, or **GetSnapshotAsBytes**, unmodified. If you pass a snapshot to **CreateFromSnapshotBase64**, **CreateFromSnapshotBuffer**, or **CreateFromSnapshotBytes** that has been modified in any way, then an **XboxLiveDeviceAddress** is created, but its **IsValid** property is false.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.isvalid
     * @type {Boolean} 
     */
    IsValid {
        get => this.get_IsValid()
    }

    /**
     * Gets a Boolean value indicating whether this **XboxLiveDeviceAddress** represents the local device.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.islocal
     * @type {Boolean} 
     */
    IsLocal {
        get => this.get_IsLocal()
    }

    /**
     * Gets a value that describes the level of peer-to-peer network access observed for **XboxLiveEndpointPair** communication involving this **XboxLiveDeviceAddress**. The indicated access is applicable only to communication established through the Xbox Live Multiplayer Networking API infrastructure. If you establish your own insecure communication, or implement your own NAT traversal, then you might find that that code encounters a different access kind.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.networkaccesskind
     * @type {Integer} 
     */
    NetworkAccessKind {
        get => this.get_NetworkAccessKind()
    }

    /**
     * Event raised when the snapshot for this **XboxLiveDeviceAddress** has changed.
     * 
     * Snapshots are serialized forms of **XboxLiveDeviceAddress** objects that can be transmitted to remote devices through out-of-band channels such as Xbox Live matchmaking. However, they represent a device's network address information at a particular time, and they can change over time. To avoid unnecessary connectivity problems, you should listen for **XboxLiveDeviceAddress.SnapshotChanged** events on the local device address to know when its snapshot contents have been updated, and refresh the serialized snapshot anywhere you've transmitted or cached it, so that remote devices always have the latest information.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @type {TypedEventHandler<XboxLiveDeviceAddress, IInspectable>}
    */
    OnSnapshotChanged {
        get {
            if(!this.HasProp("__OnSnapshotChanged")){
                this.__OnSnapshotChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7fa76199-d1b8-5494-a042-7002a416adc3}"),
                    XboxLiveDeviceAddress,
                    IInspectable
                )
                this.__OnSnapshotChangedToken := this.add_SnapshotChanged(this.__OnSnapshotChanged.iface)
            }
            return this.__OnSnapshotChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSnapshotChangedToken")) {
            this.remove_SnapshotChanged(this.__OnSnapshotChangedToken)
            this.__OnSnapshotChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<XboxLiveDeviceAddress, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SnapshotChanged(handler) {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.add_SnapshotChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SnapshotChanged(token) {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.remove_SnapshotChanged(token)
    }

    /**
     * Gets a snapshot of the current **XboxLiveDeviceAddress** as a Base64-encoded string.
     * 
     * You can save this snapshot to use later as the base64 parameter in a call to **XboxLiveDeviceAddress.CreateFromSnapshotBase64**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * Snapshots are serialized forms of **XboxLiveDeviceAddress** objects that can be transmitted to remote devices through out-of-band channels such as Xbox Live matchmaking. However, they represent a device's network address information at a particular time, and they can change over time. To avoid unnecessary connectivity problems, you should listen for **XboxLiveDeviceAddress.SnapshotChanged** events on the local device address to know when its snapshot contents have been updated, and refresh the serialized snapshot anywhere you've transmitted or cached it, so that remote devices always have the latest information.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.getsnapshotasbase64
     */
    GetSnapshotAsBase64() {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.GetSnapshotAsBase64()
    }

    /**
     * Gets a snapshot of the current **XboxLiveDeviceAddress** and returns it as an object that implements **IBuffer**.
     * 
     * You can use this method to save a snapshot for later use with the **XboxLiveDeviceAddress.CreateFromSnapshotBuffer** method.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * Snapshots are serialized forms of **XboxLiveDeviceAddress** objects that can be transmitted to remote devices through out-of-band channels such as Xbox Live matchmaking. However, they represent a device's network address information at a particular time, and they can change over time. To avoid unnecessary connectivity problems, you should listen for **XboxLiveDeviceAddress.SnapshotChanged** events on the local device address to know when its snapshot contents have been updated, and refresh the serialized snapshot anywhere you've transmitted or cached it, so that remote devices always have the latest information.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.getsnapshotasbuffer
     */
    GetSnapshotAsBuffer() {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.GetSnapshotAsBuffer()
    }

    /**
     * Saves an **XboxLiveDeviceAddress** to an array of bytes.
     * 
     * You can use this method to save a snapshot for use with the **XboxLiveDeviceAddress.CreateFromSnapshotBytes** method.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * Snapshots are serialized forms of **XboxLiveDeviceAddress** objects that can be transmitted to remote devices through out-of-band channels such as Xbox Live matchmaking. However, they represent a device's network address information at a particular time, and they can change over time. To avoid unnecessary connectivity problems, you should listen for **XboxLiveDeviceAddress.SnapshotChanged** events on the local device address to know when its snapshot contents have been updated, and refresh the serialized snapshot anywhere you've transmitted or cached it, so that remote devices always have the latest information.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer The array of bytes to receive the snapshot.
     * 
     * Use the **XboxLiveDeviceAddress.MaxSnapshotBytesSize** property to determine the proper size of the array you pass.
     * @param {Pointer<UInt32>} bytesWritten On successful completion, the number of bytes in the snapshot. On failure, -1.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.getsnapshotasbytes
     */
    GetSnapshotAsBytes(buffer_length, buffer, bytesWritten) {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.GetSnapshotAsBytes(buffer_length, buffer, bytesWritten)
    }

    /**
     * Compares another **XboxLiveDeviceAddress** object to the current object, to see whether they represent the same device.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * This method compares the invoking object (`this`) with the given **XboxLiveDeviceAddress** object, and returns a value you can use to sort **XboxLiveDeviceAddress** objects. `A.Compare(B)` returns 0 if A and B refer to the same device. If they don't refer to the same device, then if `A.Compare(B)` returns -1, `B.Compare(A)` returns +1. The returned value can thus be used to consistently sort one **XboxLiveDeviceAddress** relative to another.
     * 
     * No connection to either of the **XboxLiveDeviceAddress** objects involved is required; and this method doesn't initiate communication with them.
     * @param {XboxLiveDeviceAddress} otherDeviceAddress The **XboxLiveDeviceAddress** to be compared to this one.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivedeviceaddress.compare
     */
    Compare(otherDeviceAddress) {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.Compare(otherDeviceAddress)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsValid() {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.get_IsValid()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLocal() {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.get_IsLocal()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkAccessKind() {
        if (!this.HasProp("__IXboxLiveDeviceAddress")) {
            if ((queryResult := this.QueryInterface(IXboxLiveDeviceAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveDeviceAddress := IXboxLiveDeviceAddress(outPtr)
        }

        return this.__IXboxLiveDeviceAddress.get_NetworkAccessKind()
    }

;@endregion Instance Methods
}
