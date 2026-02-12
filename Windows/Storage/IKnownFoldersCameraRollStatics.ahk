#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IKnownFoldersCameraRollStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownFoldersCameraRollStatics
     * @type {Guid}
     */
    static IID => Guid("{5d115e66-27e8-492f-b8e5-2f90896cd4cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CameraRoll"]

    /**
     * @type {StorageFolder} 
     */
    CameraRoll {
        get => this.get_CameraRoll()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_CameraRoll() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
