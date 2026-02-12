#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IPlayReadySecureStopServiceRequest.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include .\IPlayReadySecureStopIterableFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enumerates PlayReady secure stop service requests.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopiterable
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadySecureStopIterable extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIterable

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIterable.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} publisherCertBytes_length 
     * @param {Pointer<Integer>} publisherCertBytes 
     * @returns {PlayReadySecureStopIterable} 
     */
    static CreateInstance(publisherCertBytes_length, publisherCertBytes) {
        if (!PlayReadySecureStopIterable.HasProp("__IPlayReadySecureStopIterableFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadySecureStopIterable")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadySecureStopIterableFactory.IID)
            PlayReadySecureStopIterable.__IPlayReadySecureStopIterableFactory := IPlayReadySecureStopIterableFactory(factoryPtr)
        }

        return PlayReadySecureStopIterable.__IPlayReadySecureStopIterableFactory.CreateInstance(publisherCertBytes_length, publisherCertBytes)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns an iterator that iterates over the items in the PlayReady secure stop collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysecurestopiterable.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{8d8ac279-b07d-5308-9c78-1c5c996ca03c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IPlayReadySecureStopServiceRequest, outPtr)
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
