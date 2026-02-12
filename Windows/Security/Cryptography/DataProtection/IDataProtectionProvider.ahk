#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.DataProtection
 * @version WindowsRuntime 1.4
 */
class IDataProtectionProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataProtectionProvider
     * @type {Guid}
     */
    static IID => Guid("{09639948-ed22-4270-bd1c-6d72c00f8787}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProtectAsync", "UnprotectAsync", "ProtectStreamAsync", "UnprotectStreamAsync"]

    /**
     * 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    ProtectAsync(data) {
        result := ComCall(6, this, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, value)
    }

    /**
     * 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    UnprotectAsync(data) {
        result := ComCall(7, this, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, value)
    }

    /**
     * 
     * @param {IInputStream} src 
     * @param {IOutputStream} dest 
     * @returns {IAsyncAction} 
     */
    ProtectStreamAsync(src, dest) {
        result := ComCall(8, this, "ptr", src, "ptr", dest, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {IInputStream} src 
     * @param {IOutputStream} dest 
     * @returns {IAsyncAction} 
     */
    UnprotectStreamAsync(src, dest) {
        result := ComCall(9, this, "ptr", src, "ptr", dest, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }
}
