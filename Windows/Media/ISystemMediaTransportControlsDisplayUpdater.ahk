#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Storage\Streams\RandomAccessStreamReference.ahk
#Include .\MusicDisplayProperties.ahk
#Include .\VideoDisplayProperties.ahk
#Include .\ImageDisplayProperties.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class ISystemMediaTransportControlsDisplayUpdater extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemMediaTransportControlsDisplayUpdater
     * @type {Guid}
     */
    static IID => Guid("{8abbc53e-fa55-4ecf-ad8e-c984e5dd1550}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "put_Type", "get_AppMediaId", "put_AppMediaId", "get_Thumbnail", "put_Thumbnail", "get_MusicProperties", "get_VideoProperties", "get_ImageProperties", "CopyFromFileAsync", "ClearAll", "Update"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {HSTRING} 
     */
    AppMediaId {
        get => this.get_AppMediaId()
        set => this.put_AppMediaId(value)
    }

    /**
     * @type {RandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
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
     * @type {ImageDisplayProperties} 
     */
    ImageProperties {
        get => this.get_ImageProperties()
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
     * @returns {HSTRING} 
     */
    get_AppMediaId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_AppMediaId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * 
     * @returns {MusicDisplayProperties} 
     */
    get_MusicProperties() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoDisplayProperties(value)
    }

    /**
     * 
     * @returns {ImageDisplayProperties} 
     */
    get_ImageProperties() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageDisplayProperties(value)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {StorageFile} source 
     * @returns {IAsyncOperation<Boolean>} 
     */
    CopyFromFileAsync(type, source) {
        result := ComCall(15, this, "int", type, "ptr", source, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
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
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn more about: Update constructor
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/update-constructor
     */
    Update() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
