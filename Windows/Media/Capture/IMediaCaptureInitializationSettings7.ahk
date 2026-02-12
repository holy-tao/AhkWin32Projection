#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureInitializationSettings7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureInitializationSettings7
     * @type {Guid}
     */
    static IID => Guid("{41546967-f58a-5d82-9ef4-ed572fb5e34e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceUriPasswordCredential", "put_DeviceUriPasswordCredential", "get_DeviceUri", "put_DeviceUri"]

    /**
     * @type {PasswordCredential} 
     */
    DeviceUriPasswordCredential {
        get => this.get_DeviceUriPasswordCredential()
        set => this.put_DeviceUriPasswordCredential(value)
    }

    /**
     * @type {Uri} 
     */
    DeviceUri {
        get => this.get_DeviceUri()
        set => this.put_DeviceUri(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_DeviceUriPasswordCredential() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_DeviceUriPasswordCredential(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_DeviceUri() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_DeviceUri(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
