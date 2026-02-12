#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\IStorageFile.ahk
#Include .\TargetFileRequestDeferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class ITargetFileRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetFileRequest
     * @type {Guid}
     */
    static IID => Guid("{42bd3355-7f88-478b-8e81-690b20340678}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetFile", "put_TargetFile", "GetDeferral"]

    /**
     * @type {IStorageFile} 
     */
    TargetFile {
        get => this.get_TargetFile()
        set => this.put_TargetFile(value)
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_TargetFile() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageFile(value)
    }

    /**
     * 
     * @param {IStorageFile} value 
     * @returns {HRESULT} 
     */
    put_TargetFile(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TargetFileRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetFileRequestDeferral(value)
    }
}
