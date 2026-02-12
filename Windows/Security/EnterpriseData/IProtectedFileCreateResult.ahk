#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include .\FileProtectionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectedFileCreateResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectedFileCreateResult
     * @type {Guid}
     */
    static IID => Guid("{28e3ed6a-e9e7-4a03-9f53-bdb16172699b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_File", "get_Stream", "get_ProtectionInfo"]

    /**
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * @type {IRandomAccessStream} 
     */
    Stream {
        get => this.get_Stream()
    }

    /**
     * @type {FileProtectionInfo} 
     */
    ProtectionInfo {
        get => this.get_ProtectionInfo()
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFile(value)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Stream() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @returns {FileProtectionInfo} 
     */
    get_ProtectionInfo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileProtectionInfo(value)
    }
}
