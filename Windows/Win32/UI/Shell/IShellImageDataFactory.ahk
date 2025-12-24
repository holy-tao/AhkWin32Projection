#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellImageData.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create IShellImageData instances based on various image sources.
 * @remarks
 * 
 * This interface is not expected to be available in later versions of Windows. It is recommended that Windows GDI+ APIs be used in place of <b>IShellImageDataFactory</b> methods.
 * 
 * This interface was not included in a public header file prior to Windows Vista.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nn-shimgdata-ishellimagedatafactory
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellImageDataFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellImageDataFactory
     * @type {Guid}
     */
    static IID => Guid("{9be8ed5c-edab-4d75-90f3-bd5bdbb21c82}")

    /**
     * The class identifier for ShellImageDataFactory
     * @type {Guid}
     */
    static CLSID => Guid("{66e4e4fb-f385-4dd0-8d74-a2efd1bc6178}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateIShellImageData", "CreateImageFromFile", "CreateImageFromStream", "GetDataFormatFromPath"]

    /**
     * Creates an instance of the IShellImageData interface.
     * @returns {IShellImageData} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>**</b>
     * 
     * The address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedatafactory-createishellimagedata
     */
    CreateIShellImageData() {
        result := ComCall(3, this, "ptr*", &ppshimg := 0, "HRESULT")
        return IShellImageData(ppshimg)
    }

    /**
     * Creates an instance of the IShellImageData interface based on a given file.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * The path of the file containing the image. If this parameter is <b>NULL</b>, an unhandled exception results.
     * @returns {IShellImageData} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>**</b>
     * 
     * The address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedatafactory-createimagefromfile
     */
    CreateImageFromFile(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "ptr*", &ppshimg := 0, "HRESULT")
        return IShellImageData(ppshimg)
    }

    /**
     * Creates an instance of the IShellImageData interface based on a given file stream.
     * @param {IStream} pStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to the image stream.
     * @returns {IShellImageData} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>**</b>
     * 
     * The address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedatafactory-createimagefromstream
     */
    CreateImageFromStream(pStream) {
        result := ComCall(5, this, "ptr", pStream, "ptr*", &ppshimg := 0, "HRESULT")
        return IShellImageData(ppshimg)
    }

    /**
     * Determines a file's format based on its extension.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * A path to the file.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer to a GUID identifying the image format of the file.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedatafactory-getdataformatfrompath
     */
    GetDataFormatFromPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pDataFormat := Guid()
        result := ComCall(6, this, "ptr", pszPath, "ptr", pDataFormat, "HRESULT")
        return pDataFormat
    }
}
