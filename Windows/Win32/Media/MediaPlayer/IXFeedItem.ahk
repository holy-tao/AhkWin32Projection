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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dtools/xml-resource-ids
     */
    Xml(fxif) {
        result := ComCall(3, this, "int", fxif, "ptr*", &pps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(pps)
    }

    /**
     * The Title attribute contains the title of the content in the file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/title
     */
    Title() {
        result := ComCall(4, this, "ptr*", &ppszTitle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszTitle
    }

    /**
     * These methods add linked items to a database, get the name of an item for a linked item, get items linked to an item, and set a catalog item for a linked item.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/reporting-services/report-server-web-service/methods/linked-reports-methods
     */
    Link() {
        result := ComCall(5, this, "ptr*", &ppszUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszUrl
    }

    /**
     * Defines a GUID that can be used in other templates.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3d9/guid
     */
    Guid() {
        result := ComCall(6, this, "ptr*", &ppszGuid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszGuid
    }

    /**
     * Description (Mobile Broadband) - Description
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/mbn/element-description
     */
    Description() {
        result := ComCall(7, this, "ptr*", &ppszDescription := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszDescription
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(8, this, "ptr", pstPubDate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstPubDate
    }

    /**
     * Add comments to metafiles by following Extensible Markup Language (XML) syntax. Comments begin with \ 0034; -- \ 0034; and end with \ 0034;-- \ 0034;.
     * @remarks
     * Comments can appear anywhere except within element content (between element open and close tags, < >). They are not part of the document's character data and are ignored when the metafile is parsed.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/comments
     */
    Comments() {
        result := ComCall(9, this, "ptr*", &ppszUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszUrl
    }

    /**
     * The Author attribute contains the name of a media artist or actor associated with the content.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/author
     */
    Author() {
        result := ComCall(10, this, "ptr*", &ppszAuthor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszAuthor
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    Enclosure(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * IsReadOnly Property (SqlServiceAdvancedProperty Class)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/sqlserviceadvancedproperty-class/isreadonly-property-sqlserviceadvancedproperty-class
     */
    IsRead() {
        result := ComCall(12, this, "int*", &pbIsRead := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsRead
    }

    /**
     * 
     * @param {BOOL} bIsRead 
     * @returns {HRESULT} 
     */
    SetIsRead(bIsRead) {
        result := ComCall(13, this, "int", bIsRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    LocalId() {
        result := ComCall(14, this, "uint*", &puiId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiId
    }

    /**
     * Parent Property (ADO MD)
     * @remarks
     * A member that is at the top level of a hierarchy (the root) has no parent. This property is supported only on **Member** objects belonging to a [Level](./level-object-ado-md.md) object. An error occurs when this property is referenced from **Member** objects belonging to a [Position](./position-object-ado-md.md) object.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/parent-property-ado-md
     */
    Parent(riid) {
        result := ComCall(15, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(17, this, "ptr*", &ppszUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastDownloadTime() {
        pstLastDownloadTime := SYSTEMTIME()
        result := ComCall(18, this, "ptr", pstLastDownloadTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstLastDownloadTime
    }

    /**
     * A string that indicates whether the attributes of the item have been modified by the user.
     * @remarks
     * This attribute is stored only in the digital media file.
     * 
     * To determine whether you can change the value of this attribute, use the [**Media.isReadOnlyItem**](media-isreadonlyitem.md) method.
     * @returns {SYSTEMTIME} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/modifiedby-attribute
     */
    Modified() {
        pstModifiedTime := SYSTEMTIME()
        result := ComCall(19, this, "ptr", pstModifiedTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstModifiedTime
    }
}
