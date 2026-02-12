#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\IStorageFile.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include .\GameModeConfiguration.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class IGameListEntry2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameListEntry2
     * @type {Guid}
     */
    static IID => Guid("{d84a8f8b-8749-4a25-90d3-f6c5a427886d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LaunchableState", "get_LauncherExecutable", "get_LaunchParameters", "SetLauncherExecutableFileAsync", "SetLauncherExecutableFileWithParamsAsync", "get_TitleId", "SetTitleIdAsync", "get_GameModeConfiguration"]

    /**
     * @type {Integer} 
     */
    LaunchableState {
        get => this.get_LaunchableState()
    }

    /**
     * @type {IStorageFile} 
     */
    LauncherExecutable {
        get => this.get_LauncherExecutable()
    }

    /**
     * @type {HSTRING} 
     */
    LaunchParameters {
        get => this.get_LaunchParameters()
    }

    /**
     * @type {HSTRING} 
     */
    TitleId {
        get => this.get_TitleId()
    }

    /**
     * @type {GameModeConfiguration} 
     */
    GameModeConfiguration {
        get => this.get_GameModeConfiguration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaunchableState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_LauncherExecutable() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageFile(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LaunchParameters() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IStorageFile} executableFile 
     * @returns {IAsyncAction} 
     */
    SetLauncherExecutableFileAsync(executableFile) {
        result := ComCall(9, this, "ptr", executableFile, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFile} executableFile 
     * @param {HSTRING} launchParams 
     * @returns {IAsyncAction} 
     */
    SetLauncherExecutableFileWithParamsAsync(executableFile, launchParams) {
        if(launchParams is String) {
            pin := HSTRING.Create(launchParams)
            launchParams := pin.Value
        }
        launchParams := launchParams is Win32Handle ? NumGet(launchParams, "ptr") : launchParams

        result := ComCall(10, this, "ptr", executableFile, "ptr", launchParams, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TitleId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncAction} 
     */
    SetTitleIdAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(12, this, "ptr", id, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {GameModeConfiguration} 
     */
    get_GameModeConfiguration() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameModeConfiguration(value)
    }
}
