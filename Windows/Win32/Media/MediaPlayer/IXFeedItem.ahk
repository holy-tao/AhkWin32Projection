#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedItem
     * @type {Guid}
     */
    static IID => Guid("{e757b2f5-e73e-434e-a1bf-2bd7c3e60fcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Xml", "Title", "Link", "Guid", "Description", "PubDate", "Comments", "Author", "Enclosure", "IsRead", "SetIsRead", "LocalId", "Parent", "Delete", "DownloadUrl", "LastDownloadTime", "Modified"]

    /**
     * Resource string ids set by caller to be returned in xml data for visualizing objects.
     * @param {Integer} fxif 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/direct3dtools/xml-resource-ids
     */
    Xml(fxif) {
        result := ComCall(3, this, "int", fxif, "ptr*", &pps := 0, "HRESULT")
        return IStream(pps)
    }

    /**
     * The Title attribute contains the title of the content in the file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/title
     */
    Title() {
        result := ComCall(4, this, "ptr*", &ppszTitle := 0, "HRESULT")
        return ppszTitle
    }

    /**
     * Registers a window class that allows for the SysLink common control to be used in a window.
     * @remarks
     * This function does not have an associated header or library file so it must be called by ordinal value. Call [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) with the DLL name Shell32.dll to obtain a module handle. Then call [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) with that module handle and the ordinal number 258 to use this function.
     * 
     * Use [**LinkWindow\_UnregisterClass**](linkwindow-unregisterclass.md) to unregister the class after use.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/shell/linkwindow-registerclass
     */
    Link() {
        result := ComCall(5, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * Defines a GUID that can be used in other templates.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/direct3d9/guid
     */
    Guid() {
        result := ComCall(6, this, "ptr*", &ppszGuid := 0, "HRESULT")
        return ppszGuid
    }

    /**
     * Description (Mobile Broadband) - Description
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-description
     */
    Description() {
        result := ComCall(7, this, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(8, this, "ptr", pstPubDate, "HRESULT")
        return pstPubDate
    }

    /**
     * Add comments to metafiles by following Extensible Markup Language (XML) syntax. Comments begin with \ 0034; -- \ 0034; and end with \ 0034;-- \ 0034;.
     * @remarks
     * Comments can appear anywhere except within element content (between element open and close tags, < >). They are not part of the document's character data and are ignored when the metafile is parsed.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/WMP/comments
     */
    Comments() {
        result := ComCall(9, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * The Author attribute contains the name of a media artist or actor associated with the content.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/author
     */
    Author() {
        result := ComCall(10, this, "ptr*", &ppszAuthor := 0, "HRESULT")
        return ppszAuthor
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Enclosure(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsRead() {
        result := ComCall(12, this, "int*", &pbIsRead := 0, "HRESULT")
        return pbIsRead
    }

    /**
     * 
     * @param {BOOL} bIsRead 
     * @returns {HRESULT} 
     */
    SetIsRead(bIsRead) {
        result := ComCall(13, this, "int", bIsRead, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    LocalId() {
        result := ComCall(14, this, "uint*", &puiId := 0, "HRESULT")
        return puiId
    }

    /**
     * Associates a parent object with a child object.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-parentchildrelation
     */
    Parent(riid) {
        result := ComCall(15, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Deletes an access control entry (ACE) from an access control list (ACL).
     * @remarks
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_size_information">ACL_SIZE_INFORMATION</a> structure retrieved by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getaclinformation">GetAclInformation</a> function to discover the size of the ACL and the number of ACEs it contains. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getace">GetAce</a> function retrieves information about an individual ACE.
     * @returns {HRESULT} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-deleteace
     */
    Delete() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(17, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastDownloadTime() {
        pstLastDownloadTime := SYSTEMTIME()
        result := ComCall(18, this, "ptr", pstLastDownloadTime, "HRESULT")
        return pstLastDownloadTime
    }

    /**
     * A string that indicates whether the attributes of the item have been modified by the user.
     * @remarks
     * This attribute is stored only in the digital media file.
     * 
     * To determine whether you can change the value of this attribute, use the [**Media.isReadOnlyItem**](media-isreadonlyitem.md) method.
     * @returns {SYSTEMTIME} 
     * @see https://learn.microsoft.com/windows/win32/WMP/modifiedby-attribute
     */
    Modified() {
        pstModifiedTime := SYSTEMTIME()
        result := ComCall(19, this, "ptr", pstModifiedTime, "HRESULT")
        return pstModifiedTime
    }
}
