#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BufferProtectUnprotectResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DataProtectionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IDataProtectionManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataProtectionManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{b6149b74-9144-4ee4-8a8a-30b5f361430e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProtectAsync", "UnprotectAsync", "ProtectStreamAsync", "UnprotectStreamAsync", "GetProtectionInfoAsync", "GetStreamProtectionInfoAsync"]

    /**
     * 
     * @param {IBuffer} data 
     * @param {HSTRING} identity 
     * @returns {IAsyncOperation<BufferProtectUnprotectResult>} 
     */
    ProtectAsync(data, identity) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(6, this, "ptr", data, "ptr", identity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BufferProtectUnprotectResult, result_)
    }

    /**
     * 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<BufferProtectUnprotectResult>} 
     */
    UnprotectAsync(data) {
        result := ComCall(7, this, "ptr", data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BufferProtectUnprotectResult, result_)
    }

    /**
     * 
     * @param {IInputStream} unprotectedStream 
     * @param {HSTRING} identity 
     * @param {IOutputStream} protectedStream 
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     */
    ProtectStreamAsync(unprotectedStream, identity, protectedStream) {
        if(identity is String) {
            pin := HSTRING.Create(identity)
            identity := pin.Value
        }
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := ComCall(8, this, "ptr", unprotectedStream, "ptr", identity, "ptr", protectedStream, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DataProtectionInfo, result_)
    }

    /**
     * 
     * @param {IInputStream} protectedStream 
     * @param {IOutputStream} unprotectedStream 
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     */
    UnprotectStreamAsync(protectedStream, unprotectedStream) {
        result := ComCall(9, this, "ptr", protectedStream, "ptr", unprotectedStream, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DataProtectionInfo, result_)
    }

    /**
     * 
     * @param {IBuffer} protectedData 
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     */
    GetProtectionInfoAsync(protectedData) {
        result := ComCall(10, this, "ptr", protectedData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DataProtectionInfo, result_)
    }

    /**
     * 
     * @param {IInputStream} protectedStream 
     * @returns {IAsyncOperation<DataProtectionInfo>} 
     */
    GetStreamProtectionInfoAsync(protectedStream) {
        result := ComCall(11, this, "ptr", protectedStream, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DataProtectionInfo, result_)
    }
}
