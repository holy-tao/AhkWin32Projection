#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class ICryptographicKey extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICryptographicKey
     * @type {Guid}
     */
    static IID => Guid("{ed2a3b70-8e7b-4009-8401-ffd1a62eeb27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeySize", "ExportDefaultPrivateKeyBlobType", "ExportPrivateKeyWithBlobType", "ExportDefaultPublicKeyBlobType", "ExportPublicKeyWithBlobType"]

    /**
     * @type {Integer} 
     */
    KeySize {
        get => this.get_KeySize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeySize() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * An application-defined callback function used with ReadEncryptedFileRaw.
     * @remarks
     * You can use the application-defined context block for internal tracking of information such as the file handle 
     *      and the current offset in the file.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nc-winbase-pfe_export_func
     */
    ExportDefaultPrivateKeyBlobType() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * An application-defined callback function used with ReadEncryptedFileRaw.
     * @remarks
     * You can use the application-defined context block for internal tracking of information such as the file handle 
     *      and the current offset in the file.
     * @param {Integer} BlobType 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nc-winbase-pfe_export_func
     */
    ExportPrivateKeyWithBlobType(BlobType) {
        result := ComCall(8, this, "int", BlobType, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    ExportDefaultPublicKeyBlobType() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {Integer} BlobType 
     * @returns {IBuffer} 
     */
    ExportPublicKeyWithBlobType(BlobType) {
        result := ComCall(10, this, "int", BlobType, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
