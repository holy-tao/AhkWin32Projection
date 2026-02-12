#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallHistoryEntry.ahk
#Include ..\..\..\Guid.ahk

/**
 * A collection of information about a phone call for the call history.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntry extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallHistoryEntry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallHistoryEntry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier for this log entry.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the address book information for this phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.address
     * @type {PhoneCallHistoryEntryAddress} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * Gets or sets the duration of the call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value determining whether the caller ID is blocked for this phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.iscalleridblocked
     * @type {Boolean} 
     */
    IsCallerIdBlocked {
        get => this.get_IsCallerIdBlocked()
        set => this.put_IsCallerIdBlocked(value)
    }

    /**
     * Gets or sets a value that determines whether the call is classified as an emergency.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.isemergency
     * @type {Boolean} 
     */
    IsEmergency {
        get => this.get_IsEmergency()
        set => this.put_IsEmergency(value)
    }

    /**
     * Gets or sets whether a call is an incoming call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.isincoming
     * @type {Boolean} 
     */
    IsIncoming {
        get => this.get_IsIncoming()
        set => this.put_IsIncoming(value)
    }

    /**
     * Gets or sets whether a phone call was missed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.ismissed
     * @type {Boolean} 
     */
    IsMissed {
        get => this.get_IsMissed()
        set => this.put_IsMissed(value)
    }

    /**
     * Gets or sets whether a call is currently ringing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.isringing
     * @type {Boolean} 
     */
    IsRinging {
        get => this.get_IsRinging()
        set => this.put_IsRinging(value)
    }

    /**
     * Gets or sets a whether a phone call is seen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.isseen
     * @type {Boolean} 
     */
    IsSeen {
        get => this.get_IsSeen()
        set => this.put_IsSeen(value)
    }

    /**
     * Gets or sets whether this entry is suppressed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.issuppressed
     * @type {Boolean} 
     */
    IsSuppressed {
        get => this.get_IsSuppressed()
        set => this.put_IsSuppressed(value)
    }

    /**
     * Gets or sets whether the phone call entry is a voicemail message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.isvoicemail
     * @type {Boolean} 
     */
    IsVoicemail {
        get => this.get_IsVoicemail()
        set => this.put_IsVoicemail(value)
    }

    /**
     * Gets or sets the type of media associated with a call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.media
     * @type {Integer} 
     */
    Media {
        get => this.get_Media()
        set => this.put_Media(value)
    }

    /**
     * Gets or sets the level of access provided to other applications.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.otherappreadaccess
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * Gets or sets the remote id for the entry.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets the display name for the source of the phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.sourcedisplayname
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * Gets or sets the identifier for the source of the phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.sourceid
     * @type {HSTRING} 
     */
    SourceId {
        get => this.get_SourceId()
        set => this.put_SourceId(value)
    }

    /**
     * Gets or sets a value that indicates what type of identifier the [SourceId](phonecallhistoryentry_sourceid.md) is.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.sourceidkind
     * @type {Integer} 
     */
    SourceIdKind {
        get => this.get_SourceIdKind()
        set => this.put_SourceIdKind(value)
    }

    /**
     * Gets or sets the start time for this history entry.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentry.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [PhoneCallHistoryEntry](phonecallhistoryentry.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallHistoryEntry")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_Id()
    }

    /**
     * 
     * @returns {PhoneCallHistoryEntryAddress} 
     */
    get_Address() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_Address()
    }

    /**
     * 
     * @param {PhoneCallHistoryEntryAddress} value 
     * @returns {HRESULT} 
     */
    put_Address(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_Address(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_Duration()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_Duration(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCallerIdBlocked() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsCallerIdBlocked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCallerIdBlocked(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsCallerIdBlocked(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEmergency() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsEmergency()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEmergency(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsEmergency(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIncoming() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsIncoming()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIncoming(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsIncoming(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMissed() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsMissed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMissed(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsMissed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRinging() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsRinging()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRinging(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsRinging(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeen() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsSeen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSeen(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsSeen(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuppressed() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsSuppressed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSuppressed(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsSuppressed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVoicemail() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_IsVoicemail()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVoicemail(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_IsVoicemail(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Media() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_Media()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Media(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_Media(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_OtherAppReadAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_OtherAppReadAccess(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_RemoteId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_SourceDisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceId() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_SourceId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SourceId(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_SourceId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceIdKind() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_SourceIdKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SourceIdKind(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_SourceIdKind(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.get_StartTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntry")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntry := IPhoneCallHistoryEntry(outPtr)
        }

        return this.__IPhoneCallHistoryEntry.put_StartTime(value)
    }

;@endregion Instance Methods
}
