#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IShellImageData.ahk" { IShellImageData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that create IShellImageData instances based on various image sources.
 * @remarks
 * This interface is not expected to be available in later versions of Windows. It is recommended that Windows GDI+ APIs be used in place of <b>IShellImageDataFactory</b> methods.
 * 
 * This interface was not included in a public header file prior to Windows Vista.
 * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nn-shimgdata-ishellimagedatafactory
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellImageDataFactory extends IUnknown {
    /**
     * The interface identifier for IShellImageDataFactory
     * @type {Guid}
     */
    static IID := Guid("{9be8ed5c-edab-4d75-90f3-bd5bdbb21c82}")

    /**
     * The class identifier for ShellImageDataFactory
     * @type {Guid}
     */
    static CLSID := Guid("{66e4e4fb-f385-4dd0-8d74-a2efd1bc6178}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellImageDataFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateIShellImageData : IntPtr
        CreateImageFromFile   : IntPtr
        CreateImageFromStream : IntPtr
        GetDataFormatFromPath : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellImageDataFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of the IShellImageData interface.
     * @returns {IShellImageData} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>**</b>
     * 
     * The address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedatafactory-createishellimagedata
     */
    CreateIShellImageData() {
        result := ComCall(3, this, "ptr*", &ppshimg := 0, "HRESULT")
        return IShellImageData(ppshimg)
    }

    /**
     * Creates an instance of the IShellImageData interface based on a given file.
     * @remarks
     * An access violation occurs if <i>pszPath</i> is <b>NULL</b>.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * The path of the file containing the image. If this parameter is <b>NULL</b>, an unhandled exception results.
     * @returns {IShellImageData} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>**</b>
     * 
     * The address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedatafactory-createimagefromfile
     */
    CreateImageFromFile(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "ptr*", &ppshimg := 0, "HRESULT")
        return IShellImageData(ppshimg)
    }

    /**
     * Creates an instance of the IShellImageData interface based on a given file stream.
     * @remarks
     * If <i>pStream</i> is <b>NULL</b> or an invalid pointer, later calls to <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nf-shimgdata-ishellimagedata-decode">Decode</a> will cause an access violation.
     * @param {IStream} pStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to the image stream.
     * @returns {IShellImageData} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>**</b>
     * 
     * The address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedatafactory-createimagefromstream
     */
    CreateImageFromStream(pStream) {
        result := ComCall(5, this, "ptr", pStream, "ptr*", &ppshimg := 0, "HRESULT")
        return IShellImageData(ppshimg)
    }

    /**
     * Determines a file's format based on its extension.
     * @remarks
     * <b>IShellImageDataFactory::GetDataFormatFromPath</b> should only be used to determine whether data can be saved to a particular format on the current system.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * A path to the file.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer to a GUID identifying the image format of the file.
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedatafactory-getdataformatfrompath
     */
    GetDataFormatFromPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pDataFormat := Guid()
        result := ComCall(6, this, "ptr", pszPath, Guid.Ptr, pDataFormat, "HRESULT")
        return pDataFormat
    }

    Query(iid) {
        if (IShellImageDataFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateIShellImageData := CallbackCreate(GetMethod(implObj, "CreateIShellImageData"), flags, 2)
        this.vtbl.CreateImageFromFile := CallbackCreate(GetMethod(implObj, "CreateImageFromFile"), flags, 3)
        this.vtbl.CreateImageFromStream := CallbackCreate(GetMethod(implObj, "CreateImageFromStream"), flags, 3)
        this.vtbl.GetDataFormatFromPath := CallbackCreate(GetMethod(implObj, "GetDataFormatFromPath"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateIShellImageData)
        CallbackFree(this.vtbl.CreateImageFromFile)
        CallbackFree(this.vtbl.CreateImageFromStream)
        CallbackFree(this.vtbl.GetDataFormatFromPath)
    }
}
