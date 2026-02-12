#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatQueryOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the criteria for finding chat messages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatqueryoptions
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatQueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatQueryOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the string to search for the in [ChatMessageStore](chatmessagestore.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatqueryoptions.searchstring
     * @type {HSTRING} 
     */
    SearchString {
        get => this.get_SearchString()
        set => this.put_SearchString(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ChatQueryOptions](chatqueryoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatQueryOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SearchString() {
        if (!this.HasProp("__IChatQueryOptions")) {
            if ((queryResult := this.QueryInterface(IChatQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatQueryOptions := IChatQueryOptions(outPtr)
        }

        return this.__IChatQueryOptions.get_SearchString()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SearchString(value) {
        if (!this.HasProp("__IChatQueryOptions")) {
            if ((queryResult := this.QueryInterface(IChatQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatQueryOptions := IChatQueryOptions(outPtr)
        }

        return this.__IChatQueryOptions.put_SearchString(value)
    }

;@endregion Instance Methods
}
