#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePreparationExecutionContext.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DevicePreparationExecutionContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePreparationExecutionContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePreparationExecutionContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Context {
        get => this.get_Context()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Context() {
        if (!this.HasProp("__IDevicePreparationExecutionContext")) {
            if ((queryResult := this.QueryInterface(IDevicePreparationExecutionContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePreparationExecutionContext := IDevicePreparationExecutionContext(outPtr)
        }

        return this.__IDevicePreparationExecutionContext.get_Context()
    }

;@endregion Instance Methods
}
