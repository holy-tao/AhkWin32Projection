#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\DeviceInformation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of [DeviceInformation](deviceinformation.md) objects.
 * @remarks
 * Successful completion of [FindAllAsync](deviceinformation_findallasync_1257462890.md) results in a DeviceInformationCollection containing [DeviceInformation](deviceinformation.md) objects.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcollection
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceInformationCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVectorView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVectorView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The number of [DeviceInformation](deviceinformation.md) objects in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcollection.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the [DeviceInformation](deviceinformation.md) object at the specified index.
     * @param {Integer} index The index.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e170688f-3495-5bf6-aab5-9cac17e0f10f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DeviceInformation, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e170688f-3495-5bf6-aab5-9cac17e0f10f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DeviceInformation, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Returns the index of the specified [DeviceInformation](deviceinformation.md) object in the collection.
     * @param {Generic} value The [DeviceInformation](deviceinformation.md) object in the collection.
     * @param {Pointer<UInt32>} index The index.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e170688f-3495-5bf6-aab5-9cac17e0f10f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DeviceInformation, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Gets a range of [DeviceInformation](deviceinformation.md) objects.
     * @param {Integer} startIndex The index at which to start retrieving [DeviceInformation](deviceinformation.md) objects.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The array of [DeviceInformation](deviceinformation.md) objects starting at the index specified by *startIndex*.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{e170688f-3495-5bf6-aab5-9cac17e0f10f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DeviceInformation, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Gets an object that can iterate through the enumerated [DeviceInformation](deviceinformation.md) objects, starting with the first.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationcollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{dd9f8a5d-ec98-5f4b-a3ea-9c8b5ad53c4b}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(DeviceInformation, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
