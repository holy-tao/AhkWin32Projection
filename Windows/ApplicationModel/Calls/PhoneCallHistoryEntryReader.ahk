#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallHistoryEntryReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables the calling app to read through the phone call history entries.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryreader
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntryReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallHistoryEntryReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallHistoryEntryReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a list of the [PhoneCallHistoryEntry](phonecallhistoryentry.md) objects.
     * @returns {IAsyncOperation<IVectorView<PhoneCallHistoryEntry>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryreader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IPhoneCallHistoryEntryReader")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryReader := IPhoneCallHistoryEntryReader(outPtr)
        }

        return this.__IPhoneCallHistoryEntryReader.ReadBatchAsync()
    }

;@endregion Instance Methods
}
