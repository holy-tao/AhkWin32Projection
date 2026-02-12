#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PdfDocument.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class IPdfDocumentStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdfDocumentStatics
     * @type {Guid}
     */
    static IID => Guid("{433a0b5f-c007-4788-90f2-08143d922599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadFromFileAsync", "LoadFromFileWithPasswordAsync", "LoadFromStreamAsync", "LoadFromStreamWithPasswordAsync"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<PdfDocument>} 
     */
    LoadFromFileAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PdfDocument, asyncInfo)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {HSTRING} password 
     * @returns {IAsyncOperation<PdfDocument>} 
     */
    LoadFromFileWithPasswordAsync(file_, password) {
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password

        result := ComCall(7, this, "ptr", file_, "ptr", password, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PdfDocument, asyncInfo)
    }

    /**
     * 
     * @param {IRandomAccessStream} inputStream 
     * @returns {IAsyncOperation<PdfDocument>} 
     */
    LoadFromStreamAsync(inputStream) {
        result := ComCall(8, this, "ptr", inputStream, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PdfDocument, asyncInfo)
    }

    /**
     * 
     * @param {IRandomAccessStream} inputStream 
     * @param {HSTRING} password 
     * @returns {IAsyncOperation<PdfDocument>} 
     */
    LoadFromStreamWithPasswordAsync(inputStream, password) {
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password

        result := ComCall(9, this, "ptr", inputStream, "ptr", password, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PdfDocument, asyncInfo)
    }
}
