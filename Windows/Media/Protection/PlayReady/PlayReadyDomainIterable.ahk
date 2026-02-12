#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IPlayReadyDomain.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include .\IPlayReadyDomainIterableFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes the PlayReady [PlayReadyDomain](playreadydomain.md) class iterator.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomainiterable
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyDomainIterable extends IInspectable {
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
     * Initializes a new instance of the [PlayReadyDomainIterable](playreadydomainiterable.md) class using the domain account identifier.
     * @remarks
     * The *domainAccountId* parameter is optional; if the value specified is **GUID_NULL**, all domains to which this client is joined will be enumerated.
     * 
     * The *domainAccountId* parameter is sensitive to the underlying platform's endianness. Carefully test your app on all platforms you intend to support to ensure that correct endianness is used on each platform.
     * @param {Guid} domainAccountId The domain account identifier.
     * @returns {PlayReadyDomainIterable} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomainiterable.#ctor
     */
    static CreateInstance(domainAccountId) {
        if (!PlayReadyDomainIterable.HasProp("__IPlayReadyDomainIterableFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyDomainIterable")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyDomainIterableFactory.IID)
            PlayReadyDomainIterable.__IPlayReadyDomainIterableFactory := IPlayReadyDomainIterableFactory(factoryPtr)
        }

        return PlayReadyDomainIterable.__IPlayReadyDomainIterableFactory.CreateInstance(domainAccountId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns an iterator that iterates over the items in the PlayReady domain collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomainiterable.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{84e98f86-4bee-5f41-93a1-255887122d9f}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IPlayReadyDomain, outPtr)
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
