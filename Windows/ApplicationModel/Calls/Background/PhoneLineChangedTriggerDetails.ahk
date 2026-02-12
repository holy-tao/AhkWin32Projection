#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLineChangedTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used to provide the details about a change to the properties of a phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonelinechangedtriggerdetails
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneLineChangedTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLineChangedTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLineChangedTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the phone line that was added, removed, or changed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonelinechangedtriggerdetails.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * Gets a [PhoneLineChangeKind](phonelinechangekind.md) value that indicates if the phone line was added, removed, or changed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonelinechangedtriggerdetails.changetype
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LineId() {
        if (!this.HasProp("__IPhoneLineChangedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineChangedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineChangedTriggerDetails := IPhoneLineChangedTriggerDetails(outPtr)
        }

        return this.__IPhoneLineChangedTriggerDetails.get_LineId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        if (!this.HasProp("__IPhoneLineChangedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineChangedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineChangedTriggerDetails := IPhoneLineChangedTriggerDetails(outPtr)
        }

        return this.__IPhoneLineChangedTriggerDetails.get_ChangeType()
    }

    /**
     * Checks a phone line against a set of flags to see if any of the specified properties of the phone line have changed.
     * @param {Integer} lineProperty A set of flags which indicate the phone line properties to query for changes.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonelinechangedtriggerdetails.haslinepropertychanged
     */
    HasLinePropertyChanged(lineProperty) {
        if (!this.HasProp("__IPhoneLineChangedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneLineChangedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineChangedTriggerDetails := IPhoneLineChangedTriggerDetails(outPtr)
        }

        return this.__IPhoneLineChangedTriggerDetails.HasLinePropertyChanged(lineProperty)
    }

;@endregion Instance Methods
}
