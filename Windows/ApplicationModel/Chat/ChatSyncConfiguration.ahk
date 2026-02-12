#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatSyncConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * The chat messages sync configurations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncconfiguration
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatSyncConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatSyncConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatSyncConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a boolean that indicates whether sync is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncconfiguration.issyncenabled
     * @type {Boolean} 
     */
    IsSyncEnabled {
        get => this.get_IsSyncEnabled()
        set => this.put_IsSyncEnabled(value)
    }

    /**
     * Gets or sets the time span for which messages will be restored.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncconfiguration.restorehistoryspan
     * @type {Integer} 
     */
    RestoreHistorySpan {
        get => this.get_RestoreHistorySpan()
        set => this.put_RestoreHistorySpan(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyncEnabled() {
        if (!this.HasProp("__IChatSyncConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatSyncConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncConfiguration := IChatSyncConfiguration(outPtr)
        }

        return this.__IChatSyncConfiguration.get_IsSyncEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSyncEnabled(value) {
        if (!this.HasProp("__IChatSyncConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatSyncConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncConfiguration := IChatSyncConfiguration(outPtr)
        }

        return this.__IChatSyncConfiguration.put_IsSyncEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RestoreHistorySpan() {
        if (!this.HasProp("__IChatSyncConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatSyncConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncConfiguration := IChatSyncConfiguration(outPtr)
        }

        return this.__IChatSyncConfiguration.get_RestoreHistorySpan()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RestoreHistorySpan(value) {
        if (!this.HasProp("__IChatSyncConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatSyncConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncConfiguration := IChatSyncConfiguration(outPtr)
        }

        return this.__IChatSyncConfiguration.put_RestoreHistorySpan(value)
    }

;@endregion Instance Methods
}
