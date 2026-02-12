#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyEventReceivedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class KeyEventReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyEventReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyEventReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
    }

    /**
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * @type {HSTRING} 
     */
    Unicode {
        get => this.get_Unicode()
    }

    /**
     * @type {Integer} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {TextEditSession} 
     */
    EditSession {
        get => this.get_EditSession()
    }

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VirtualKey() {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.get_VirtualKey()
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.get_KeyStatus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Unicode() {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.get_Unicode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.get_Source()
    }

    /**
     * 
     * @param {Integer} vkey 
     * @returns {Boolean} 
     */
    IsKeyPressed(vkey) {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.IsKeyPressed(vkey)
    }

    /**
     * 
     * @param {Integer} vkey 
     * @returns {Boolean} 
     */
    IsToggleKeyOn(vkey) {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.IsToggleKeyOn(vkey)
    }

    /**
     * 
     * @returns {TextEditSession} 
     */
    get_EditSession() {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.get_EditSession()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IKeyEventReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventReceivedEventArgs := IKeyEventReceivedEventArgs(outPtr)
        }

        return this.__IKeyEventReceivedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
