#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssCreateExpressWriterMetadata.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to manage metadata for a VSS express writer.
 * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nl-vswriter-ivssexpresswriter
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssExpressWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssExpressWriter
     * @type {Guid}
     */
    static IID => Guid("{e33affdc-59c7-47b1-97d5-4266598f6235}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMetadata", "LoadMetadata", "Register", "Unregister"]

    /**
     * Creates an express writer metadata object and returns an IVssCreateExpressWriterMetadata interface pointer to it.
     * @remarks
     * The <i>versionMajor</i> and <i>versionMajor</i> parameters are used to specify the writer's major and minor version numbers according to the following VSS conventions:
     * 
     * <ul>
     * <li>A writer's minor version number should be incremented by one whenever a released version of the writer contains minor changes that affect the writer's interaction with requesters. For example, a correction to a file specification in a writer QFE or service pack would justify incrementing the minor version number. However, a change between beta or release candidate versions of a writer would not justify the changing of the minor version number.</li>
     * <li>A writer's major version number should be incremented by one whenever a released version of the writer contains a significant change. For example, if data that is backed up with a new version of a writer cannot be restored using the previous version of the writer, the new writer's major version number should be incremented.</li>
     * <li>Whenever the major version number is incremented, the minor version number should be reset to zero.</li>
     * </ul>
     * If a writer does not specify a version number, VSS will assign a default version number of 0.0.
     * @param {Guid} writerId The globally unique identifier (GUID) of the writer class.
     * @param {PWSTR} writerName A null-terminated wide character string that contains the name of the writer class. This string is not localized.
     * @param {Integer} usageType A <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_usage_type">VSS_USAGE_TYPE</a> enumeration value that indicates how the data that is managed by the writer is used on the host system. The only valid values for this parameter are VSS_UT_BOOTABLESYSTEMSTATE, VSS_UT_SYSTEMSERVICE, and VSS_UT_USERDATA.
     * @param {Integer} versionMajor The major version of the writer application. For more information, see the Remarks section.
     * @param {Integer} versionMinor The minor version of the writer application. For more information, see the Remarks section.
     * @param {Integer} reserved This parameter is reserved for system use.
     * @returns {IVssCreateExpressWriterMetadata} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsscreateexpresswritermetadata">IVssCreateExpressWriterMetadata</a> interface pointer to the newly created express writer metadata.
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivssexpresswriter-createmetadata
     */
    CreateMetadata(writerId, writerName, usageType, versionMajor, versionMinor, reserved) {
        writerName := writerName is String ? StrPtr(writerName) : writerName

        result := ComCall(3, this, "ptr", writerId, "ptr", writerName, "int", usageType, "uint", versionMajor, "uint", versionMinor, "uint", reserved, "ptr*", &ppMetadata := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVssCreateExpressWriterMetadata(ppMetadata)
    }

    /**
     * Causes VSS to load the writer's metadata from a string instead of the express writer metadata store.
     * @param {PWSTR} metadata A null-terminated wide character string that contains the writer's metadata.
     * @param {Integer} reserved This parameter is reserved for system use.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * <dt>0x80042311L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivssexpresswriter-loadmetadata
     */
    LoadMetadata(metadata, reserved) {
        metadata := metadata is String ? StrPtr(metadata) : metadata

        result := ComCall(4, this, "ptr", metadata, "uint", reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Causes VSS to store the writer's metadata in the express writer metadata store.
     * @remarks
     * Before using this method, the caller must have either used the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivssexpresswriter-loadmetadata">LoadMetadata</a> method to load the writer's metadata directly or used the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivssexpresswriter-createmetadata">CreateMetadata</a> method to create a writer metadata object.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_ALREADY_EXISTS</b></dt>
     * <dt>0x8004230DL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Metadata has already been stored for this writer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivssexpresswriter-register
     */
    Register() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Causes VSS to delete the writer's metadata from the express writer metadata store.
     * @remarks
     * Before using this method, the caller must have used the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivssexpresswriter-createmetadata">CreateMetadata</a> method to create a writer metadata object.
     * @param {Guid} writerId The globally unique identifier (GUID) of the writer class.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>writerId</i> parameter specified a writer that does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivssexpresswriter-unregister
     */
    Unregister(writerId) {
        result := ComCall(6, this, "ptr", writerId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
