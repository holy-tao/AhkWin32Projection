#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallHistoryEntryQueryOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Options for querying the phone call entries.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryqueryoptions
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntryQueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallHistoryEntryQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallHistoryEntryQueryOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the query filter based on the type of media.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryqueryoptions.desiredmedia
     * @type {Integer} 
     */
    DesiredMedia {
        get => this.get_DesiredMedia()
        set => this.put_DesiredMedia(value)
    }

    /**
     * Get the query filter based on the source ID of the phone call entry.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryqueryoptions.sourceids
     * @type {IVector<HSTRING>} 
     */
    SourceIds {
        get => this.get_SourceIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [PhoneCallHistoryEntryQueryOptions](phonecallhistoryentryqueryoptions.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallHistoryEntryQueryOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredMedia() {
        if (!this.HasProp("__IPhoneCallHistoryEntryQueryOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryQueryOptions := IPhoneCallHistoryEntryQueryOptions(outPtr)
        }

        return this.__IPhoneCallHistoryEntryQueryOptions.get_DesiredMedia()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredMedia(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntryQueryOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryQueryOptions := IPhoneCallHistoryEntryQueryOptions(outPtr)
        }

        return this.__IPhoneCallHistoryEntryQueryOptions.put_DesiredMedia(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SourceIds() {
        if (!this.HasProp("__IPhoneCallHistoryEntryQueryOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryQueryOptions := IPhoneCallHistoryEntryQueryOptions(outPtr)
        }

        return this.__IPhoneCallHistoryEntryQueryOptions.get_SourceIds()
    }

;@endregion Instance Methods
}
