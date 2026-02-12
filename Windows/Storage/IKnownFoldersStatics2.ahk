#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IKnownFoldersStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownFoldersStatics2
     * @type {Guid}
     */
    static IID => Guid("{194bd0cd-cf6e-4d07-9d53-e9163a2536e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Objects3D", "get_AppCaptures", "get_RecordedCalls"]

    /**
     * @type {StorageFolder} 
     */
    Objects3D {
        get => this.get_Objects3D()
    }

    /**
     * @type {StorageFolder} 
     */
    AppCaptures {
        get => this.get_AppCaptures()
    }

    /**
     * @type {StorageFolder} 
     */
    RecordedCalls {
        get => this.get_RecordedCalls()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Objects3D() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_AppCaptures() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_RecordedCalls() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
