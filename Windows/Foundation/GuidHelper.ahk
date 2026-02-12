#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidHelperStatics.ahk
#Include ..\..\Guid.ahk

/**
 * A class containing static helper methods for working with the **Guid** type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.guidhelper
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class GuidHelper extends IInspectable {
;@region Static Properties
    /**
     * Gets an empty, zeroed **Guid**.
     * @remarks
     * In JavaScript, **Guid** is projected as a string.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.guidhelper.empty
     * @type {Guid} 
     */
    static Empty {
        get => GuidHelper.get_Empty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new, unique **Guid**.
     * @remarks
     * In JavaScript, **Guid** is projected as a string.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.guidhelper.createnewguid
     */
    static CreateNewGuid() {
        if (!GuidHelper.HasProp("__IGuidHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.GuidHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidHelperStatics.IID)
            GuidHelper.__IGuidHelperStatics := IGuidHelperStatics(factoryPtr)
        }

        return GuidHelper.__IGuidHelperStatics.CreateNewGuid()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_Empty() {
        if (!GuidHelper.HasProp("__IGuidHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.GuidHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidHelperStatics.IID)
            GuidHelper.__IGuidHelperStatics := IGuidHelperStatics(factoryPtr)
        }

        return GuidHelper.__IGuidHelperStatics.get_Empty()
    }

    /**
     * Determines whether one guid is the same as another guid.
     * @param {Pointer<Guid>} target The guid to test against.
     * @param {Pointer<Guid>} value The guid to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.guidhelper.equals
     */
    static Equals(target, value) {
        if (!GuidHelper.HasProp("__IGuidHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.GuidHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidHelperStatics.IID)
            GuidHelper.__IGuidHelperStatics := IGuidHelperStatics(factoryPtr)
        }

        return GuidHelper.__IGuidHelperStatics.Equals(target, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
