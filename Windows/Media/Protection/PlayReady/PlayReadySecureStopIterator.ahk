#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IPlayReadySecureStopServiceRequest.ahk
#Include ..\..\..\Foundation\Collections\IIterator.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides for iteration of the [IPlayReadySecureStopServiceRequest](iplayreadysecurestopservicerequest.md) interface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopiterator
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadySecureStopIterator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIterator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIterator.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current item in the PlayReady secure stop collection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopiterator.current
     * @type {Generic} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * Gets a value that indicates whether there is a current item or the iterator is at the end of the PlayReady secure stop collection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopiterator.hascurrent
     * @type {Boolean} 
     */
    HasCurrent {
        get => this.get_HasCurrent()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Generic} 
     */
    get_Current() {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{77b0419b-3f4b-5ef9-ae0b-881143b172c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IPlayReadySecureStopServiceRequest, outPtr)
        }

        return this.__IIterator.get_Current()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCurrent() {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{77b0419b-3f4b-5ef9-ae0b-881143b172c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IPlayReadySecureStopServiceRequest, outPtr)
        }

        return this.__IIterator.get_HasCurrent()
    }

    /**
     * Advances the enumerator to the next item in the collection.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopiterator.movenext
     */
    MoveNext() {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{77b0419b-3f4b-5ef9-ae0b-881143b172c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IPlayReadySecureStopServiceRequest, outPtr)
        }

        return this.__IIterator.MoveNext()
    }

    /**
     * Retrieves all items in the PlayReady secure stop collection.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The items in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopiterator.getmany
     */
    GetMany(items_length, items) {
        if (!this.HasProp("__IIterator")) {
            piid := Guid("{77b0419b-3f4b-5ef9-ae0b-881143b172c9}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterator := IIterator(IPlayReadySecureStopServiceRequest, outPtr)
        }

        return this.__IIterator.GetMany(items_length, items)
    }

;@endregion Instance Methods
}
