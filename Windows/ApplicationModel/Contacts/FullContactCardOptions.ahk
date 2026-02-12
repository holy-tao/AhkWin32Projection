#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFullContactCardOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the options for displaying the full contact card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.fullcontactcardoptions
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class FullContactCardOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFullContactCardOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFullContactCardOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that describes the desired view size for the full contact card.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.fullcontactcardoptions.desiredremainingview
     * @type {Integer} 
     */
    DesiredRemainingView {
        get => this.get_DesiredRemainingView()
        set => this.put_DesiredRemainingView(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FullContactCardOptions](fullcontactcardoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.FullContactCardOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredRemainingView() {
        if (!this.HasProp("__IFullContactCardOptions")) {
            if ((queryResult := this.QueryInterface(IFullContactCardOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFullContactCardOptions := IFullContactCardOptions(outPtr)
        }

        return this.__IFullContactCardOptions.get_DesiredRemainingView()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredRemainingView(value) {
        if (!this.HasProp("__IFullContactCardOptions")) {
            if ((queryResult := this.QueryInterface(IFullContactCardOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFullContactCardOptions := IFullContactCardOptions(outPtr)
        }

        return this.__IFullContactCardOptions.put_DesiredRemainingView(value)
    }

;@endregion Instance Methods
}
