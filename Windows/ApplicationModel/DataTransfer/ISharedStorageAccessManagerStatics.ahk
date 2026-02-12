#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ISharedStorageAccessManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharedStorageAccessManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{c6132ada-34b1-4849-bd5f-d09fee3158c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFile", "RedeemTokenForFileAsync", "RemoveFile"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {HSTRING} 
     */
    AddFile(file_) {
        outToken := HSTRING()
        result := ComCall(6, this, "ptr", file_, "ptr", outToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return outToken
    }

    /**
     * 
     * @param {HSTRING} token 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    RedeemTokenForFileAsync(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {HSTRING} token 
     * @returns {HRESULT} 
     */
    RemoveFile(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
