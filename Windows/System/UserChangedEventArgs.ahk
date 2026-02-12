#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserChangedEventArgs.ahk
#Include .\IUserChangedEventArgs2.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for a user changed event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userchangedeventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userchangedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Describes the kinds of changes that triggered the UserChangedEvent.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userchangedeventargs.changedpropertykinds
     * @type {IVectorView<Integer>} 
     */
    ChangedPropertyKinds {
        get => this.get_ChangedPropertyKinds()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IUserChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserChangedEventArgs := IUserChangedEventArgs(outPtr)
        }

        return this.__IUserChangedEventArgs.get_User()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ChangedPropertyKinds() {
        if (!this.HasProp("__IUserChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IUserChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserChangedEventArgs2 := IUserChangedEventArgs2(outPtr)
        }

        return this.__IUserChangedEventArgs2.get_ChangedPropertyKinds()
    }

;@endregion Instance Methods
}
