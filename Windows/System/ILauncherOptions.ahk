#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\LauncherUIOptions.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Uri.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherOptions
     * @type {Guid}
     */
    static IID => Guid("{bafa21d8-b071-4cd8-853e-341203e557d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TreatAsUntrusted", "put_TreatAsUntrusted", "get_DisplayApplicationPicker", "put_DisplayApplicationPicker", "get_UI", "get_PreferredApplicationPackageFamilyName", "put_PreferredApplicationPackageFamilyName", "get_PreferredApplicationDisplayName", "put_PreferredApplicationDisplayName", "get_FallbackUri", "put_FallbackUri", "get_ContentType", "put_ContentType"]

    /**
     * @type {Boolean} 
     */
    TreatAsUntrusted {
        get => this.get_TreatAsUntrusted()
        set => this.put_TreatAsUntrusted(value)
    }

    /**
     * @type {Boolean} 
     */
    DisplayApplicationPicker {
        get => this.get_DisplayApplicationPicker()
        set => this.put_DisplayApplicationPicker(value)
    }

    /**
     * @type {LauncherUIOptions} 
     */
    UI {
        get => this.get_UI()
    }

    /**
     * @type {HSTRING} 
     */
    PreferredApplicationPackageFamilyName {
        get => this.get_PreferredApplicationPackageFamilyName()
        set => this.put_PreferredApplicationPackageFamilyName(value)
    }

    /**
     * @type {HSTRING} 
     */
    PreferredApplicationDisplayName {
        get => this.get_PreferredApplicationDisplayName()
        set => this.put_PreferredApplicationDisplayName(value)
    }

    /**
     * @type {Uri} 
     */
    FallbackUri {
        get => this.get_FallbackUri()
        set => this.put_FallbackUri(value)
    }

    /**
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TreatAsUntrusted() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TreatAsUntrusted(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisplayApplicationPicker() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DisplayApplicationPicker(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {LauncherUIOptions} 
     */
    get_UI() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LauncherUIOptions(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PreferredApplicationPackageFamilyName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PreferredApplicationPackageFamilyName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PreferredApplicationDisplayName() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PreferredApplicationDisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FallbackUri() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_FallbackUri(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
