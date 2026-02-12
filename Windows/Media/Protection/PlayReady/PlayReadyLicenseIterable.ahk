#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IPlayReadyLicense.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include .\IPlayReadyLicenseIterableFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes the PlayReadyLicense class iterator.
 * @remarks
 * The **PlayReadyLicenseIterable** class doesn't support in-memory licenses or headers with multiple KIDs (Key Identifiers).
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseiterable
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyLicenseIterable extends IInspectable {
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
     * Initializes a new instance of the [PlayReadyLicenseIterable](playreadylicenseiterable.md) class.
     * @param {PlayReadyContentHeader} contentHeader The content header used to locate associated licenses.
     * @param {Boolean} fullyEvaluated Indicates whether evaluated license chains should be enumerated or if all licenses (including those that are unusable) should be enumerated. This parameter is **true** if evaluated license chains should be enumerated, or **false** if all licenses should be enumerated.
     * @returns {PlayReadyLicenseIterable} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseiterable.#ctor
     */
    static CreateInstance(contentHeader, fullyEvaluated) {
        if (!PlayReadyLicenseIterable.HasProp("__IPlayReadyLicenseIterableFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyLicenseIterable")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyLicenseIterableFactory.IID)
            PlayReadyLicenseIterable.__IPlayReadyLicenseIterableFactory := IPlayReadyLicenseIterableFactory(factoryPtr)
        }

        return PlayReadyLicenseIterable.__IPlayReadyLicenseIterableFactory.CreateInstance(contentHeader, fullyEvaluated)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Initializes a new instance of the [PlayReadyLicenseIterable](playreadylicenseiterable.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyLicenseIterable")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns an iterator that iterates over the items in the PlayReady license collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicenseiterable.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{9f28f6b7-b5ea-5073-ba3d-8cb2f07291a1}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IPlayReadyLicense, outPtr)
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
