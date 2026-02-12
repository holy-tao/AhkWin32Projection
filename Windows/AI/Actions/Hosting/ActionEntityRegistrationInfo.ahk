#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionEntityRegistrationInfo.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about an action entity that is accepted as an input to or returned as an output from an app action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionentityregistrationinfo
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class ActionEntityRegistrationInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionEntityRegistrationInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionEntityRegistrationInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of the action entity.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionentityregistrationinfo.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the kind of the action entity.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionentityregistrationinfo.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
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
    get_Name() {
        if (!this.HasProp("__IActionEntityRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IActionEntityRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityRegistrationInfo := IActionEntityRegistrationInfo(outPtr)
        }

        return this.__IActionEntityRegistrationInfo.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IActionEntityRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IActionEntityRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityRegistrationInfo := IActionEntityRegistrationInfo(outPtr)
        }

        return this.__IActionEntityRegistrationInfo.put_Name(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActionEntityRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IActionEntityRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityRegistrationInfo := IActionEntityRegistrationInfo(outPtr)
        }

        return this.__IActionEntityRegistrationInfo.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IActionEntityRegistrationInfo")) {
            if ((queryResult := this.QueryInterface(IActionEntityRegistrationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityRegistrationInfo := IActionEntityRegistrationInfo(outPtr)
        }

        return this.__IActionEntityRegistrationInfo.put_Kind(value)
    }

    /**
     * Closes and releases any resources used by this **ActionEntityRegistrationInfo**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actionentityregistrationinfo.close
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
