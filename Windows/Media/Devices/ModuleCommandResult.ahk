#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IModuleCommandResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of an audio device module command, executed with a call to [AudioDeviceModule.SendCommand](audiodevicemodule_sendcommandasync_78202797.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.modulecommandresult
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ModuleCommandResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IModuleCommandResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IModuleCommandResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies the status of the audio device module command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.modulecommandresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets a buffer containing result of the audio device module command, defined by the audio device module developer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.modulecommandresult.result
     * @type {IBuffer} 
     */
    Result {
        get => this.get_Result()
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
    get_Status() {
        if (!this.HasProp("__IModuleCommandResult")) {
            if ((queryResult := this.QueryInterface(IModuleCommandResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IModuleCommandResult := IModuleCommandResult(outPtr)
        }

        return this.__IModuleCommandResult.get_Status()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Result() {
        if (!this.HasProp("__IModuleCommandResult")) {
            if ((queryResult := this.QueryInterface(IModuleCommandResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IModuleCommandResult := IModuleCommandResult(outPtr)
        }

        return this.__IModuleCommandResult.get_Result()
    }

;@endregion Instance Methods
}
