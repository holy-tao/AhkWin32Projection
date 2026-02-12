#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareUIOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class represents the options that are available to the user when showing the ShareUI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareuioptions
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ShareUIOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareUIOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareUIOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the share UI theme.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareuioptions.theme
     * @type {Integer} 
     */
    Theme {
        get => this.get_Theme()
        set => this.put_Theme(value)
    }

    /**
     * Gets or sets the selection rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareuioptions.selectionrect
     * @type {IReference<RECT>} 
     */
    SelectionRect {
        get => this.get_SelectionRect()
        set => this.put_SelectionRect(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new ShareUIOptions object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.ShareUIOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Theme() {
        if (!this.HasProp("__IShareUIOptions")) {
            if ((queryResult := this.QueryInterface(IShareUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareUIOptions := IShareUIOptions(outPtr)
        }

        return this.__IShareUIOptions.get_Theme()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Theme(value) {
        if (!this.HasProp("__IShareUIOptions")) {
            if ((queryResult := this.QueryInterface(IShareUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareUIOptions := IShareUIOptions(outPtr)
        }

        return this.__IShareUIOptions.put_Theme(value)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_SelectionRect() {
        if (!this.HasProp("__IShareUIOptions")) {
            if ((queryResult := this.QueryInterface(IShareUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareUIOptions := IShareUIOptions(outPtr)
        }

        return this.__IShareUIOptions.get_SelectionRect()
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_SelectionRect(value) {
        if (!this.HasProp("__IShareUIOptions")) {
            if ((queryResult := this.QueryInterface(IShareUIOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareUIOptions := IShareUIOptions(outPtr)
        }

        return this.__IShareUIOptions.put_SelectionRect(value)
    }

;@endregion Instance Methods
}
