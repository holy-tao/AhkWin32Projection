#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreAcceleratorKeys.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreDispatcher.ahk
#Include .\AcceleratorKeyEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides the basic behavior for an accelerator key.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreacceleratorkeys
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreAcceleratorKeys extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreAcceleratorKeys

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreAcceleratorKeys.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAcceleratorKeyActivatedToken")) {
            this.remove_AcceleratorKeyActivated(this.__OnAcceleratorKeyActivatedToken)
            this.__OnAcceleratorKeyActivated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreDispatcher, AcceleratorKeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AcceleratorKeyActivated(handler) {
        if (!this.HasProp("__ICoreAcceleratorKeys")) {
            if ((queryResult := this.QueryInterface(ICoreAcceleratorKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAcceleratorKeys := ICoreAcceleratorKeys(outPtr)
        }

        return this.__ICoreAcceleratorKeys.add_AcceleratorKeyActivated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AcceleratorKeyActivated(cookie) {
        if (!this.HasProp("__ICoreAcceleratorKeys")) {
            if ((queryResult := this.QueryInterface(ICoreAcceleratorKeys.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAcceleratorKeys := ICoreAcceleratorKeys(outPtr)
        }

        return this.__ICoreAcceleratorKeys.remove_AcceleratorKeyActivated(cookie)
    }

;@endregion Instance Methods
}
