#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironmentOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironmentOptions
     * @type {Guid}
     */
    static IID => Guid("{b71d98f7-61f0-4008-b207-0bf9eb2d76f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnvironmentOwnerId", "put_EnvironmentOwnerId", "get_AllowedClipboardFormats", "put_AllowedClipboardFormats", "get_ClipboardCopyPasteDirections", "put_ClipboardCopyPasteDirections", "get_AvailablePrinters", "put_AvailablePrinters", "get_SharedHostFolderPath", "get_SharedFolderNameInEnvironment", "ShareHostFolderForUntrustedItems", "get_PersistUserProfile", "put_PersistUserProfile", "get_AllowGraphicsHardwareAcceleration", "put_AllowGraphicsHardwareAcceleration", "get_AllowCameraAndMicrophoneAccess", "put_AllowCameraAndMicrophoneAccess"]

    /**
     * @type {HSTRING} 
     */
    EnvironmentOwnerId {
        get => this.get_EnvironmentOwnerId()
        set => this.put_EnvironmentOwnerId(value)
    }

    /**
     * @type {Integer} 
     */
    AllowedClipboardFormats {
        get => this.get_AllowedClipboardFormats()
        set => this.put_AllowedClipboardFormats(value)
    }

    /**
     * @type {Integer} 
     */
    ClipboardCopyPasteDirections {
        get => this.get_ClipboardCopyPasteDirections()
        set => this.put_ClipboardCopyPasteDirections(value)
    }

    /**
     * @type {Integer} 
     */
    AvailablePrinters {
        get => this.get_AvailablePrinters()
        set => this.put_AvailablePrinters(value)
    }

    /**
     * @type {HSTRING} 
     */
    SharedHostFolderPath {
        get => this.get_SharedHostFolderPath()
    }

    /**
     * @type {HSTRING} 
     */
    SharedFolderNameInEnvironment {
        get => this.get_SharedFolderNameInEnvironment()
    }

    /**
     * @type {Boolean} 
     */
    PersistUserProfile {
        get => this.get_PersistUserProfile()
        set => this.put_PersistUserProfile(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowGraphicsHardwareAcceleration {
        get => this.get_AllowGraphicsHardwareAcceleration()
        set => this.put_AllowGraphicsHardwareAcceleration(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowCameraAndMicrophoneAccess {
        get => this.get_AllowCameraAndMicrophoneAccess()
        set => this.put_AllowCameraAndMicrophoneAccess(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnvironmentOwnerId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_EnvironmentOwnerId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedClipboardFormats() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedClipboardFormats(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClipboardCopyPasteDirections() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClipboardCopyPasteDirections(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AvailablePrinters() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AvailablePrinters(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SharedHostFolderPath() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SharedFolderNameInEnvironment() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} SharedHostFolderPath 
     * @param {HSTRING} ShareFolderNameInEnvironment 
     * @returns {HRESULT} 
     */
    ShareHostFolderForUntrustedItems(SharedHostFolderPath, ShareFolderNameInEnvironment) {
        if(SharedHostFolderPath is String) {
            pin := HSTRING.Create(SharedHostFolderPath)
            SharedHostFolderPath := pin.Value
        }
        SharedHostFolderPath := SharedHostFolderPath is Win32Handle ? NumGet(SharedHostFolderPath, "ptr") : SharedHostFolderPath
        if(ShareFolderNameInEnvironment is String) {
            pin := HSTRING.Create(ShareFolderNameInEnvironment)
            ShareFolderNameInEnvironment := pin.Value
        }
        ShareFolderNameInEnvironment := ShareFolderNameInEnvironment is Win32Handle ? NumGet(ShareFolderNameInEnvironment, "ptr") : ShareFolderNameInEnvironment

        result := ComCall(16, this, "ptr", SharedHostFolderPath, "ptr", ShareFolderNameInEnvironment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PersistUserProfile() {
        result := ComCall(17, this, "int*", &value := 0, "int")
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
    put_PersistUserProfile(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowGraphicsHardwareAcceleration() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_AllowGraphicsHardwareAcceleration(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCameraAndMicrophoneAccess() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_AllowCameraAndMicrophoneAccess(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
