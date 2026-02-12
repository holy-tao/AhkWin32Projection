#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ModuleCommandResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Audio Processing Objects (APOs) implement this interface to obtain a reference to an **IAudioDeviceModulesManager** instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nn-audioenginebaseapo-iaudiodevicemodulesclient
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAudioDeviceModule extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceModule
     * @type {Guid}
     */
    static IID => Guid("{86cfac36-47c1-4b33-9852-8773ec4be123}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClassId", "get_DisplayName", "get_InstanceId", "get_MajorVersion", "get_MinorVersion", "SendCommandAsync"]

    /**
     * @type {HSTRING} 
     */
    ClassId {
        get => this.get_ClassId()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {Integer} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClassId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstanceId() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MajorVersion() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinorVersion() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IBuffer} Command 
     * @returns {IAsyncOperation<ModuleCommandResult>} 
     */
    SendCommandAsync(Command) {
        result := ComCall(11, this, "ptr", Command, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ModuleCommandResult, operation)
    }
}
