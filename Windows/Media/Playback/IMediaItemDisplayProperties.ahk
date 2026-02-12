#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\MusicDisplayProperties.ahk
#Include ..\VideoDisplayProperties.ahk
#Include ..\..\Storage\Streams\RandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaItemDisplayProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaItemDisplayProperties
     * @type {Guid}
     */
    static IID => Guid("{1e3c1b48-7097-4384-a217-c1291dfa8c16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "put_Type", "get_MusicProperties", "get_VideoProperties", "get_Thumbnail", "put_Thumbnail", "ClearAll"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {MusicDisplayProperties} 
     */
    MusicProperties {
        get => this.get_MusicProperties()
    }

    /**
     * @type {VideoDisplayProperties} 
     */
    VideoProperties {
        get => this.get_VideoProperties()
    }

    /**
     * @type {RandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_Type(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MusicDisplayProperties} 
     */
    get_MusicProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MusicDisplayProperties(value)
    }

    /**
     * 
     * @returns {VideoDisplayProperties} 
     */
    get_VideoProperties() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoDisplayProperties(value)
    }

    /**
     * 
     * @returns {RandomAccessStreamReference} 
     */
    get_Thumbnail() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {RandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all external keys and related information saved onto the currently running operating system volume that are used to automatically unlock data volumes.
     * @remarks
     * **ClearAllAutoUnlockKeys** achieves the same functionality as running [**DisableAutoUnlock**](disableautounlock-win32-encryptablevolume.md) for every data volume that has ever been associated with the currently running operating system, even data volumes that are not currently connected to the computer. It also removes any stale unlocking information associated with data volumes that no longer exist.
     * 
     * Before calling [**Decrypt**](decrypt-win32-encryptablevolume.md) on the currently running operating system volume, use **ClearAllAutoUnlockKeys** to ensure that information placed in the operating system registry to automatically unlock data volumes is not accessible in the clear on disk.
     * 
     * After **ClearAllAutoUnlockKeys** runs successfully, the methods [**UnlockWithExternalKey**](unlockwithexternalkey-win32-encryptablevolume.md) or [**UnlockWithNumericalPassword**](unlockwithnumericalpassword-win32-encryptablevolume.md) can be used to unlock all data volumes on this computer. Use [**EnableAutoUnlock**](enableautounlock-win32-encryptablevolume.md) to re-enable automatic unlocking of a data volume.
     * 
     * If no other errors are returned, **ClearAllAutoUnlockKeys** removes from the registry any volume protector IDs and external keys used to automatically unlock any data volume that has ever been associated with the currently running operating system volume.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                   | Description                                                                                  |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                   | The method was successful.<br/>                                                        |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl>  | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_OS\_VOLUME**</dt> <dt>2150694952 (0x80310028)</dt> </dl> | The method can only be run for the currently running operating system volume.<br/>     |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/clearallautounlockkeys-win32-encryptablevolume
     */
    ClearAll() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
