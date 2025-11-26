#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMDocumentSequence.ahk
#Include .\IXpsOMCoreProperties.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include .\IXpsOMImageResource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the top-level entry into the XPS object model tree.
 * @remarks
 * 
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMPackage    *newInterface;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *       __uuidof(XpsOMObjectFactory),
 *       NULL, 
 *       CLSCTX_INPROC_SERVER,
 *       __uuidof(IXpsOMObjectFactory),
 *       reinterpret_cast<LPVOID*>(&xpsFactory)
 *       );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreatePackage (&newInterface);
 *     if (SUCCEEDED(hr))
 *     {
 *         // use newInterface
 * 
 *         newInterface->Release();
 *     }
 * 
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * 
 * 
 * For information about using this interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPackage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPackage
     * @type {Guid}
     */
    static IID => Guid("{18c3df65-81e1-4674-91dc-fc452f5a416f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentSequence", "SetDocumentSequence", "GetCoreProperties", "SetCoreProperties", "GetDiscardControlPartName", "SetDiscardControlPartName", "GetThumbnailResource", "SetThumbnailResource", "WriteToFile", "WriteToStream"]

    /**
     * Gets a pointer to the IXpsOMDocumentSequence interface that contains the document sequence of the XPS package.
     * @returns {IXpsOMDocumentSequence} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentsequence">IXpsOMDocumentSequence</a> interface that contains the document sequence of the  XPS package. If an <b>IXpsOMDocumentSequence</b> interface has not been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getdocumentsequence
     */
    GetDocumentSequence() {
        result := ComCall(3, this, "ptr*", &documentSequence := 0, "HRESULT")
        return IXpsOMDocumentSequence(documentSequence)
    }

    /**
     * Sets the IXpsOMDocumentSequence interface of the XPS package.
     * @param {IXpsOMDocumentSequence} documentSequence The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentsequence">IXpsOMDocumentSequence</a> interface pointer to be assigned to the package. This parameter must not be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>documentSequence</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>documentSequence</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setdocumentsequence
     */
    SetDocumentSequence(documentSequence) {
        result := ComCall(4, this, "ptr", documentSequence, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMCoreProperties interface of the XPS package.
     * @returns {IXpsOMCoreProperties} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface of the XPS package. If an <b>IXpsOMCoreProperties</b> interface has not been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getcoreproperties
     */
    GetCoreProperties() {
        result := ComCall(5, this, "ptr*", &coreProperties := 0, "HRESULT")
        return IXpsOMCoreProperties(coreProperties)
    }

    /**
     * Sets the IXpsOMCoreProperties interface of the XPS package.
     * @param {IXpsOMCoreProperties} coreProperties The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties">IXpsOMCoreProperties</a> interface pointer to be assigned to the package.
     *           A <b>NULL</b> pointer releases any previously assigned core properties interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>coreProperties</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setcoreproperties
     */
    SetCoreProperties(coreProperties) {
        result := ComCall(6, this, "ptr", coreProperties, "HRESULT")
        return result
    }

    /**
     * Gets the name of the discard control part in the XPS package.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part in the XPS package. If a discard control part has not been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getdiscardcontrolpartname
     */
    GetDiscardControlPartName() {
        result := ComCall(7, this, "ptr*", &discardControlPartUri := 0, "HRESULT")
        return IOpcPartUri(discardControlPartUri)
    }

    /**
     * Sets the name of the discard control part in the XPS package.
     * @param {IOpcPartUri} discardControlPartUri The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the discard control part to be assigned to the XPS package. A <b>NULL</b> pointer releases any previously assigned discard control part.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setdiscardcontrolpartname
     */
    SetDiscardControlPartName(discardControlPartUri) {
        result := ComCall(8, this, "ptr", discardControlPartUri, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMImageResource interface of the thumbnail resource that is associated with the XPS package.
     * @returns {IXpsOMImageResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface of the thumbnail resource that is associated with the XPS package. If the package does not have a thumbnail resource, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getthumbnailresource
     */
    GetThumbnailResource() {
        result := ComCall(9, this, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * Sets the thumbnail image of the XPS document.
     * @param {IXpsOMImageResource} imageResource The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image that will be assigned to the package. A <b>NULL</b> pointer releases any previously assigned thumbnail image resources.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_THUMBNAIL_IMAGE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image in  <i>imageResource</i> is not a supported image type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>imageResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setthumbnailresource
     */
    SetThumbnailResource(imageResource) {
        result := ComCall(10, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * Writes the XPS package to a specified file.
     * @param {PWSTR} fileName The name of the file to be created. This parameter must not be <b>NULL</b>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure, which contains two distinct but related data members:
     * 
     * <ul>
     * <li><b>lpSecurityDescriptor</b>: an optional security descriptor</li>
     * <li><b>bInheritHandle</b>:  a Boolean value that determines whether the returned handle can be inherited by child processes</li>
     * </ul>
     * If  <b>lpSecurityDescriptor</b> is <b>NULL</b>, the file or device that is associated with the returned handle will be assigned a default security descriptor. 
     * 
     * For more information about the <i>securityAttributes</i> parameter, refer to <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * @param {Integer} flagsAndAttributes Specifies the settings and attributes of the file to be  created. For most files, a value of <b>FILE_ATTRIBUTE_NORMAL</b> can be used. 
     * 
     * 
     * For more information about the <i>flagsAndAttributes</i> parameter, refer to <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * @param {BOOL} optimizeMarkupSize A Boolean value that  indicates whether the document markup is to be optimized for size when it is written to the file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package writer will attempt to optimize the markup for minimum size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package writer will not attempt any optimization.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>fileName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method calls the <a href="/previous-versions/windows/desktop/opc/packaging">Packaging</a> API. For information about the Packaging API return values, see <a href="/previous-versions/windows/desktop/opc/packaging-errors">Packaging Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-writetofile
     */
    WriteToFile(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(11, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "HRESULT")
        return result
    }

    /**
     * Writes the XPS package to a specified stream.
     * @param {ISequentialStream} stream The stream that receives the serialized contents of the package. This parameter must not be <b>NULL</b>.
     * @param {BOOL} optimizeMarkupSize A Boolean value that  indicates whether the document markup is to be optimized for size when it is written to the stream.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package writer will attempt to optimize the markup for minimum size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package writer will not attempt any optimization.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>stream</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method calls the <a href="/previous-versions/windows/desktop/opc/packaging">Packaging</a> API. For information about the Packaging API return values, see <a href="/previous-versions/windows/desktop/opc/packaging-errors">Packaging Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-writetostream
     */
    WriteToStream(stream, optimizeMarkupSize) {
        result := ComCall(12, this, "ptr", stream, "int", optimizeMarkupSize, "HRESULT")
        return result
    }
}
