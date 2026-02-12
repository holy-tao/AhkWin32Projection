#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\StorageProviderFileTypeInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSyncRootInfo3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSyncRootInfo3
     * @type {Guid}
     */
    static IID => Guid("{507a6617-bef6-56fd-855e-75ace2e45cf5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FallbackFileTypeInfo"]

    /**
     * @type {IVector<StorageProviderFileTypeInfo>} 
     */
    FallbackFileTypeInfo {
        get => this.get_FallbackFileTypeInfo()
    }

    /**
     * 
     * @returns {IVector<StorageProviderFileTypeInfo>} 
     */
    get_FallbackFileTypeInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(StorageProviderFileTypeInfo, value)
    }
}
