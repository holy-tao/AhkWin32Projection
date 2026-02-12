#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionEntityDisplayInfo.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the display information for an [ActionEntity](actionentity.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentitydisplayinfo
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionEntityDisplayInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionEntityDisplayInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionEntityDisplayInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the title of an [ActionEntity](actionentity.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentitydisplayinfo.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IActionEntityDisplayInfo")) {
            if ((queryResult := this.QueryInterface(IActionEntityDisplayInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityDisplayInfo := IActionEntityDisplayInfo(outPtr)
        }

        return this.__IActionEntityDisplayInfo.get_Title()
    }

    /**
     * Closes and releases any resources used by this **ActionEntityDisplayInfo**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentitydisplayinfo.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
