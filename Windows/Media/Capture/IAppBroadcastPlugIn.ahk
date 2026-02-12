#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppBroadcastProviderSettings.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastPlugIn extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastPlugIn
     * @type {Guid}
     */
    static IID => Guid("{520c1e66-6513-4574-ac54-23b79729615b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppId", "get_ProviderSettings", "get_Logo", "get_DisplayName"]

    /**
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * @type {AppBroadcastProviderSettings} 
     */
    ProviderSettings {
        get => this.get_ProviderSettings()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Logo {
        get => this.get_Logo()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppBroadcastProviderSettings} 
     */
    get_ProviderSettings() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastProviderSettings(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
