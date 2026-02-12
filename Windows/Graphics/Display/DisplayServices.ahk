#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayServices.ahk
#Include .\IDisplayServicesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents display-related service methods, such as finding devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayservices
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayServices extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayServices

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayServices.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retreives a collection of attached display devices.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} A collection of display devices.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayservices.findall
     */
    static FindAll(result_) {
        if (!DisplayServices.HasProp("__IDisplayServicesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayServices")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayServicesStatics.IID)
            DisplayServices.__IDisplayServicesStatics := IDisplayServicesStatics(factoryPtr)
        }

        return DisplayServices.__IDisplayServicesStatics.FindAll(result_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
