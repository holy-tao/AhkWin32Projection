#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IToc.ahk
#Include .\ITocCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITocParser interface represents a TOC Parser object. It provides methods for storing tables of contents in a video file and retrieving tables of contents from a video file.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nn-wmcodecdsp-itocparser
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ITocParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITocParser
     * @type {Guid}
     */
    static IID => Guid("{ecfb9a55-9298-4f49-887f-0b36206599d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetTocCount", "GetTocByIndex", "GetTocByType", "AddToc", "RemoveTocByIndex", "RemoveTocByType", "Commit"]

    /**
     * The Init method initializes the TOC Parser object and associates it with a media file.
     * @remarks
     * The path that you pass in <i>pwszFileName</i> must be a long Universal Naming Convention (UNC) file path. A long UNC file path begins with "\\?\". The following line of code shows how to set the path for the file c:\experiment\seattle.wmv.
     * 
     * <c>pTocParser-&gt;Init(L"\\\\?\\c:\\experiment\\seattle.wmv");</c>
     * @param {PWSTR} pwszFileName Pointer to a NULL-terminated wide-character string that specifies the path of the media file. See Remarks.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-init
     */
    Init(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "ptr", pwszFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetTocCount method retrieves the number of tables of contents, of a specified position type, in the TOC Parser object.
     * @param {Integer} enumTocPosType 
     * @param {Pointer<Integer>} pdwTocCount Pointer to a <b>DWORD</b> that receives the number of tables of contents.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-gettoccount
     */
    GetTocCount(enumTocPosType, pdwTocCount) {
        pdwTocCountMarshal := pdwTocCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", enumTocPosType, pdwTocCountMarshal, pdwTocCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetTocByIndex method retrieves a table of contents, specified by an index, from the TOC Parser object.
     * @param {Integer} enumTocPosType 
     * @param {Integer} dwTocIndex The index of the table of contents to be retrieved.
     * @returns {IToc} Pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface that represents the retrieved table of contents.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-gettocbyindex
     */
    GetTocByIndex(enumTocPosType, dwTocIndex) {
        result := ComCall(5, this, "int", enumTocPosType, "uint", dwTocIndex, "ptr*", &ppToc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IToc(ppToc)
    }

    /**
     * The GetTocByType retrieves all tables of contents of a specified type from the TOC Parser object.
     * @remarks
     * You might want to design several different type of tables of contents. In that case, you can distinguish between types by creating a <b>GUID</b> that represents each type. You can identify a table of contents as a particular type by setting the <b>guidType</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/ns-wmcodecdsp-toc_descriptor">TOC_DESCRIPTOR</a> structure and then passing the <b>TOC_DESCRIPTOR</b> structure to <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescriptor">IToc::SetDescriptor</a>.
     * @param {Integer} enumTocPosType 
     * @param {Guid} guidTocType A globally unique identifier (<b>GUID</b>) that specifies the type of table of contents to retrieve. See Remarks.
     * @returns {ITocCollection} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoccollection">ITocCollection</a> interface that represents the collection of retrieved tables of contents.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-gettocbytype
     */
    GetTocByType(enumTocPosType, guidTocType) {
        result := ComCall(6, this, "int", enumTocPosType, "ptr", guidTocType, "ptr*", &ppTocs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITocCollection(ppTocs)
    }

    /**
     * The AddToc method adds a table of contents to the TOC Parser object and assigns an index to the added table of contents.
     * @param {Integer} enumTocPosType 
     * @param {IToc} pToc Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itoc">IToc</a> interface that represents the table of contents to be added.
     * @param {Pointer<Integer>} pdwTocIndex Pointer to a <b>DWORD</b> that receives the index of the added table of contents.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-addtoc
     */
    AddToc(enumTocPosType, pToc, pdwTocIndex) {
        pdwTocIndexMarshal := pdwTocIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "int", enumTocPosType, "ptr", pToc, pdwTocIndexMarshal, pdwTocIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The RemoveTocByIndex method removes a table of contents, specified by an index, from the TOC Parser object.
     * @param {Integer} enumTocPosType 
     * @param {Integer} dwTocIndex The index of the table of contents to be removed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-removetocbyindex
     */
    RemoveTocByIndex(enumTocPosType, dwTocIndex) {
        result := ComCall(8, this, "int", enumTocPosType, "uint", dwTocIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The RemoveTocByType method removes all tables of contents of a specified type from the TOC Parser object.
     * @remarks
     * You might want to design several different type of tables of contents. In that case, you can distinguish between types by creating a <b>GUID</b> that represents each type. You can identify a table of contents as a particular type by setting the <b>guidType</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/ns-wmcodecdsp-toc_descriptor">TOC_DESCRIPTOR</a> structure and then passing the <b>TOC_DESCRIPTOR</b> structure to <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescriptor">IToc::SetDescriptor</a>.
     * @param {Integer} enumTocPosType 
     * @param {Guid} guidTocType A globally unique identifier (<b>GUID</b>) that specifies the type of table of contents to removed. See Remarks.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-removetocbytype
     */
    RemoveTocByType(enumTocPosType, guidTocType) {
        result := ComCall(9, this, "int", enumTocPosType, "ptr", guidTocType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Commit method stores the current state of the TOC Parser object in its associated media file.
     * @remarks
     * You can associate a TOC Parser object with a media file by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-itocparser-init">ITocParser::Init</a>. As you add, modify, or remove tables of contents from the TOC Parser object, those changes are made only to the TOC Parser object in memory, not to the media file. To store your changes in the media file, you must call <b>ITocParser::Commit</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-itocparser-commit
     */
    Commit() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
