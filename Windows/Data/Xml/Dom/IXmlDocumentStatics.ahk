#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\XmlDocument.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlDocumentStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlDocumentStatics
     * @type {Guid}
     */
    static IID => Guid("{5543d254-d757-4b79-9539-232b18f50bf1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadFromUriAsync", "LoadFromUriWithSettingsAsync", "LoadFromFileAsync", "LoadFromFileWithSettingsAsync"]

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<XmlDocument>} 
     */
    LoadFromUriAsync(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XmlDocument, asyncInfo)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {XmlLoadSettings} loadSettings 
     * @returns {IAsyncOperation<XmlDocument>} 
     */
    LoadFromUriWithSettingsAsync(uri_, loadSettings) {
        result := ComCall(7, this, "ptr", uri_, "ptr", loadSettings, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XmlDocument, asyncInfo)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<XmlDocument>} 
     */
    LoadFromFileAsync(file_) {
        result := ComCall(8, this, "ptr", file_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XmlDocument, asyncInfo)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {XmlLoadSettings} loadSettings 
     * @returns {IAsyncOperation<XmlDocument>} 
     */
    LoadFromFileWithSettingsAsync(file_, loadSettings) {
        result := ComCall(9, this, "ptr", file_, "ptr", loadSettings, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XmlDocument, asyncInfo)
    }
}
