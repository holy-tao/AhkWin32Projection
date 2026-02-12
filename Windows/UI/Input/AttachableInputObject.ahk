#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAttachableInputObject.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAttachableInputObjectFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Base class for an [InputActivationListener](inputactivationlistener.md) object associated with a window, view, or other visual element.
 * @remarks
 * This class does not have a constructor, or any properties, methods, and events.
 * 
 * This class derives from [Windows.Foundation.IClosable](../windows.foundation/iclosable.md), which has a [Close](../windows.foundation/iclosable_close_811482585.md) method that is invoked internally upon the object's destruction, releasing the object's resources and rendering it invalid.
 * 
 * Do not invoke the [Close](../windows.foundation/iclosable_close_811482585.md) method directly, just destroy the object according to the language being used.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.attachableinputobject
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class AttachableInputObject extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAttachableInputObject

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAttachableInputObject.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Terminates the [AttachableInputObject](attachableinputobject.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.attachableinputobject.close
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
