#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPageReference.ahk
#Include .\IXpsOMVisualCollection.ahk
#Include .\XPS_SIZE.ahk
#Include .\XPS_RECT.ahk
#Include .\IXpsOMDictionary.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk
#Include .\IXpsOMPage.ahk
#Include .\IXpsOMPart.ahk

/**
 * Provides the root node of a tree of objects that hold the contents of a single page.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMPage        *newInterface;
 * // The following values are defined outside of 
 * // this example.
 * //  LPWSTR        language;
 * //  XPS_SIZE      pageDimensions;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
 *     if (SUCCEEDED(hr))
 *     {
 *         hr = xpsFactory->CreatePage (
 *             &pageDimensions,
 *             language,
 *             partUri,
 *             &newInterface);
 * 
 *         if (SUCCEEDED(hr))
 *         {
 *             // use newInterface
 * 
 *             newInterface->Release();
 *         }
 *         partUri->Release();
 *     }
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
 * For information about using this interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372917(v=vs.85)">Navigate the XPS OM</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPage extends IXpsOMPart{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPage
     * @type {Guid}
     */
    static IID => Guid("{d3e18888-f120-4fee-8c68-35296eae91d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetVisuals", "GetPageDimensions", "SetPageDimensions", "GetContentBox", "SetContentBox", "GetBleedBox", "SetBleedBox", "GetLanguage", "SetLanguage", "GetName", "SetName", "GetIsHyperlinkTarget", "SetIsHyperlinkTarget", "GetDictionary", "GetDictionaryLocal", "SetDictionaryLocal", "GetDictionaryResource", "SetDictionaryResource", "Write", "GenerateUnusedLookupKey", "Clone"]

    /**
     * Gets a pointer to the IXpsOMPageReference interface that contains the page.
     * @remarks
     * When the page does not have an owner, a <b>NULL</b> pointer is returned in <i>pageReference</i>.
     * @returns {IXpsOMPageReference} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereference">IXpsOMPageReference</a> interface that contains the page.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &pageReference := 0, "HRESULT")
        return IXpsOMPageReference(pageReference)
    }

    /**
     * Gets a pointer to an IXpsOMVisualCollection interface that contains a collection of the page's visual objects.
     * @returns {IXpsOMVisualCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisualcollection">IXpsOMVisualCollection</a>  interface that contains a collection  of the page's visual objects.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getvisuals
     */
    GetVisuals() {
        result := ComCall(6, this, "ptr*", &visuals := 0, "HRESULT")
        return IXpsOMVisualCollection(visuals)
    }

    /**
     * Gets the page dimensions.
     * @remarks
     * The default page size is passed to <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpage">IXpsOMObjectFactory::CreatePage</a>  in the <i>pageDimensions</i> parameter.
     * @returns {XPS_SIZE} The page dimensions.
     * 
     * Size is described in XPS units. There are 96 XPS units per inch.  For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getpagedimensions
     */
    GetPageDimensions() {
        pageDimensions := XPS_SIZE()
        result := ComCall(7, this, "ptr", pageDimensions, "HRESULT")
        return pageDimensions
    }

    /**
     * Sets dimensions of the page.
     * @param {Pointer<XPS_SIZE>} pageDimensions Dimensions of the page.
     * 
     * Size is described in XPS units. There are 96 XPS units per inch.  For example, the dimensions of an 8.5" by 11.0" page are 816 by 1,056 XPS units.
     * 
     * The  <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size">XPS_SIZE</a> structure has the following properties:
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <i>pageDimensions</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_PAGE_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page size specified in <i>pageDimensions</i> contains one or more  values that are not allowed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setpagedimensions
     */
    SetPageDimensions(pageDimensions) {
        result := ComCall(8, this, "ptr", pageDimensions, "HRESULT")
        return result
    }

    /**
     * Gets the dimensions of the page's content box.
     * @remarks
     * The content box indicates where ink appears on the page.
     * 
     * The default content box of a page is
     * 
     * <table>
     * <tr>
     * <th>
     * <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> field</th>
     * <th>Default value</th>
     * </tr>
     * <tr>
     * <td>x</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>y</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>width</td>
     * <td>pageDimension.width</td>
     * </tr>
     * <tr>
     * <td>height</td>
     * <td>pageDimension.height</td>
     * </tr>
     * </table>
     * @returns {XPS_RECT} The dimensions of the content box.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getcontentbox
     */
    GetContentBox() {
        contentBox := XPS_RECT()
        result := ComCall(9, this, "ptr", contentBox, "HRESULT")
        return contentBox
    }

    /**
     * Sets the dimensions of the page's content box.
     * @remarks
     * The content box specifies where ink appears on the page.
     * 
     * The content box dimensions are not checked against the page dimensions until the page is serialized.
     * @param {Pointer<XPS_RECT>} contentBox The dimensions of the page's content box.
     * 
     * <table>
     * <tr>
     * <th><i>contentBox</i> field</th>
     * <th>Valid values</th>
     * </tr>
     * <tr>
     * <td><i>contentBox.width</i></td>
     * <td>Greater than or equal to 0.0 and less than or equal to  (pageDimensions.width - contentBox.x).</td>
     * </tr>
     * <tr>
     * <td><i>contentBox.height</i></td>
     * <td>Greater than or equal to 0.0 and less than or equal to (pageDimensions.height - contentBox.y).</td>
     * </tr>
     * <tr>
     * <td><i>contentBox.x</i></td>
     * <td>Greater than or equal to 0.0 and less than pageDimensions.width.</td>
     * </tr>
     * <tr>
     * <td><i>contentBox.y</i></td>
     * <td>Greater than or equal to 0.0 and less than pageDimensions.height.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <i>contentBox</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_CONTENT_BOX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle specified by <i>contentBox</i> contains one or more values that are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setcontentbox
     */
    SetContentBox(contentBox) {
        result := ComCall(10, this, "ptr", contentBox, "HRESULT")
        return result
    }

    /**
     * Gets the dimensions of the page's bleed box.
     * @remarks
     * The default bleed box of a page is:
     * 
     * <table>
     * <tr>
     * <th>
     * <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> field</th>
     * <th>Default value</th>
     * </tr>
     * <tr>
     * <td>x</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>y</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>width</td>
     * <td>pageDimension.width</td>
     * </tr>
     * <tr>
     * <td>height</td>
     * <td>pageDimension.height</td>
     * </tr>
     * </table>
     * @returns {XPS_RECT} The dimensions of the bleed box.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getbleedbox
     */
    GetBleedBox() {
        bleedBox := XPS_RECT()
        result := ComCall(11, this, "ptr", bleedBox, "HRESULT")
        return bleedBox
    }

    /**
     * Sets the dimensions of the page's bleed box.
     * @remarks
     * The bleed box dimensions are not checked against the page dimensions until the page is serialized.
     * @param {Pointer<XPS_RECT>} bleedBox The dimensions of the page's bleed box. This parameter must not be <b>NULL</b>.
     * 
     * A valid bleed box has the following properties:
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <i>bleedBox</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_BLEED_BOX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle described by <i>bleedBox</i> contains one or more values that are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setbleedbox
     */
    SetBleedBox(bleedBox) {
        result := ComCall(12, this, "ptr", bleedBox, "HRESULT")
        return result
    }

    /**
     * Gets the Language property of the page.
     * @remarks
     * The default value is the language tag string that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpage">IXpsOMObjectFactory::CreatePage</a>  in the <i>language</i>  parameter.
     * 
     * Internet Engineering Task Force (IETF) RFC 3066 describes the recommended encoding of the language tag string that is returned in <i>language</i>.
     * 
     * This method allocates the memory used by the string that is returned in <i>language</i>.  If <i>language</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} A language tag string that represents the language of the page contents. If the <b>Language</b> property has not been set, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getlanguage
     */
    GetLanguage() {
        result := ComCall(13, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * Sets the Language property of the page.
     * @remarks
     * The language tag string must conform to the language tag syntax that is described in the Internet Engineering Task Force (IETF) RFC 3066. For more information,  go to <a href="http://tools.ietf.org/html/rfc3066">http://tools.ietf.org/html/rfc3066</a>.
     * @param {PWSTR} language A language tag string that represents the language of the page content. A <b>NULL</b> pointer clears the previously assigned language.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_INVALID_LANGUAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The language string contains one or more language strings that are not valid. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setlanguage
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(14, this, "ptr", language, "HRESULT")
        return result
    }

    /**
     * Gets the Name property of the page.
     * @remarks
     * This method allocates the memory used by the string that is returned in <i>name</i>.  If <i>name</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The <b>Name</b> property of the page. A <b>NULL</b> pointer is returned if  the <b>Name</b> property has not been set.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getname
     */
    GetName() {
        result := ComCall(15, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * Sets the Name property of this page.
     * @remarks
     * The <b>Name</b> property identifies the current page as a named, addressable point in a document, allowing the page to be referenced by a hyperlink.
     * @param {PWSTR} name A pointer to the name string to be set as the page's <b>Name</b> property. A <b>NULL</b> pointer clears any previously assigned name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name string contains a character that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setname
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(16, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the page is the target of a hyperlink.
     * @returns {BOOL} A Boolean value that indicates whether the page is the target of a hyperlink. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page is the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page is not the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getishyperlinktarget
     */
    GetIsHyperlinkTarget() {
        result := ComCall(17, this, "int*", &isHyperlinkTarget := 0, "HRESULT")
        return isHyperlinkTarget
    }

    /**
     * Specifies whether the page is the target of a hyperlink.
     * @remarks
     * Only those pages that have this property set to <b>TRUE</b> will be included in the hyperlink targets that are collected by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereference-collectlinktargets">IXpsOMPageReference::CollectLinkTargets</a>.
     * @param {BOOL} isHyperlinkTarget The Boolean value that indicates whether the page is the target of a hyperlink.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRUE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page is the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page is not the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>XPS_E_MISSING_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page has not been named. The hyperlink target status can only be set if the page has a name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setishyperlinktarget
     */
    SetIsHyperlinkTarget(isHyperlinkTarget) {
        result := ComCall(18, this, "int", isHyperlinkTarget, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the resolved IXpsOMDictionary interface that is associated with this page.
     * @remarks
     * Whether the dictionary is local or is contained within a remote dictionary resource, this method returns an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface pointer. <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdictionary-getowner">GetOwner</a> determines whether the dictionary  is remote.
     * 
     * If a page contains a remote dictionary, <b>GetDictionary</b> will deserialize the dictionary. If the page contains a remote dictionary that is not valid, <b>GetDictionary</b> might return a deserialization error code.
     * 
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMDictionary} A pointer to the resolved <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface that is associated with this page.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the dictionary.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>resourceDictionary</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>
     * 
     * 
     * </td>
     * <td>
     * The shared dictionary in the dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionary
     */
    GetDictionary() {
        result := ComCall(19, this, "ptr*", &resourceDictionary := 0, "HRESULT")
        return IXpsOMDictionary(resourceDictionary)
    }

    /**
     * Gets a pointer to the IXpsOMDictionary interface of the local, unshared dictionary that is associated with this page.
     * @returns {IXpsOMDictionary} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface of the local, unshared dictionary that is associated with this page. If no <b>IXpsOMDictionary</b> interface pointer has been set or if a remote dictionary resource has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>resourceDictionary</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionarylocal
     */
    GetDictionaryLocal() {
        result := ComCall(20, this, "ptr*", &resourceDictionary := 0, "HRESULT")
        return IXpsOMDictionary(resourceDictionary)
    }

    /**
     * Sets the IXpsOMDictionary interface pointer of the page's local dictionary resource.
     * @remarks
     * After you call <b>SetDictionaryLocal</b>, the remote dictionary resource is released and <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionaryresource">GetDictionaryResource</a> returns a <b>NULL</b> pointer in the <i>remoteDictionaryResource</i> parameter. The table that follows explains the relationship between the local and remote values of this property.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned  in <i>resourceDictionary</i> by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionary">GetDictionary</a>
     * </th>
     * <th>Object that is returned  in <i>resourceDictionary</i>      by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionarylocal">GetDictionaryLocal</a>
     * </th>
     * <th>Object that is returned  in <i>remoteDictionaryResource</i>  by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionaryresource">GetDictionaryResource</a>
     * </th>
     * </tr>
     * <tr>
     * <td>
     * <b>SetDictionaryLocal</b> (this method)
     * 
     * </td>
     * <td>
     * The local dictionary resource that is set by <b>SetDictionaryLocal</b>.
     * 
     * </td>
     * <td>
     * The local dictionary resource that is set by <b>SetDictionaryLocal</b>.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>
     * 
     * 
     * </td>
     * <td>
     * The shared dictionary in the dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * The remote dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <b>SetDictionaryLocal</b> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IXpsOMDictionary} resourceDictionary The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface pointer to be set for the page. A <b>NULL</b> pointer releases any previously assigned local dictionary.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <i>resourceDictionary</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal
     */
    SetDictionaryLocal(resourceDictionary) {
        result := ComCall(21, this, "ptr", resourceDictionary, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMRemoteDictionaryResource interface of the shared dictionary resource that is used by this page.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMRemoteDictionaryResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface of the shared dictionary resource that is used by this page. If no <b>IXpsOMRemoteDictionaryResource</b> interface has been set or if a local dictionary has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>remoteDictionaryResource</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>
     * 
     * 
     * </td>
     * <td>
     * The remote dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource">SetDictionaryResource</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionaryresource
     */
    GetDictionaryResource() {
        result := ComCall(22, this, "ptr*", &remoteDictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(remoteDictionaryResource)
    }

    /**
     * Sets the IXpsOMRemoteDictionaryResource interface pointer of the page's remote dictionary resource.
     * @remarks
     * Setting this value will cause <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionarylocal">GetDictionaryLocal</a> to return <b>NULL</b>.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>resourceDictionary</i> by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionary">GetDictionary</a>
     * </th>
     * <th>Object that is returned in <i>resourceDictionary</i>  by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionarylocal">GetDictionaryLocal</a>
     * </th>
     * <th>Object that is returned in <i>remoteDictionaryResource</i>   by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-getdictionaryresource">GetDictionaryResource</a>
     * </th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>.
     * 
     * </td>
     * <td>
     * The local dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a>.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>SetDictionaryResource</b> (this method)
     * 
     * </td>
     * <td>
     * The shared dictionary in the dictionary resource that is set by <b>SetDictionaryResource</b>.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * The remote dictionary resource that is set by <b>SetDictionaryResource</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionarylocal">SetDictionaryLocal</a> nor <b>SetDictionaryResource</b> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IXpsOMRemoteDictionaryResource} remoteDictionaryResource The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface pointer to be set for the page. A <b>NULL</b> value releases the previously assigned dictionary resource.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <i>remoteDictionaryResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-setdictionaryresource
     */
    SetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(23, this, "ptr", remoteDictionaryResource, "HRESULT")
        return result
    }

    /**
     * Writes the page to the specified stream.
     * @remarks
     * To examine the XPS markup of a page before it is written to an XPS package, an application can call the <b>Write</b> method to write the page's contents to a stream. The application can then read that stream to examine the XPS markup as it would be serialized when it is written to the XPS package.
     * 
     * The XPS markup that is  written to the stream by this method contains the page markup but none of the page's resources.
     * @param {ISequentialStream} stream The stream that receives the serialized contents of the page.
     * @param {BOOL} optimizeMarkupSize A Boolean value that  indicates whether the document markup of the page is to be optimized for size when the page is written to the stream. 
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
     * The package writer will attempt to optimize the markup for minimum size when writing the page to the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package writer will not attempt any optimization when writing the page to the stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-write
     */
    Write(stream, optimizeMarkupSize) {
        result := ComCall(24, this, "ptr", stream, "int", optimizeMarkupSize, "HRESULT")
        return result
    }

    /**
     * Generates a unique name that can be used as a lookup key by a resource in a resource dictionary.
     * @remarks
     * To be unique in the dictionary, the string generated by <b>GenerateUnusedLookupKey</b> consists of a prefix string that is based on the object type and is followed by four unique alphanumeric characters.
     * 
     * The prefix string for each object type is shown in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Object type</th>
     * <th>Prefix string for this object type</th>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_CANVAS
     * 
     * </td>
     * <td>
     * Canvas_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_GEOMETRY
     * 
     * </td>
     * <td>
     * Geometry_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_GLYPHS
     * 
     * </td>
     * <td>
     * Glyphs_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_IMAGE_BRUSH
     * 
     * </td>
     * <td>
     * IBrush_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_LINEAR_GRADIENT_BRUSH
     * 
     * </td>
     * <td>
     * LGBrush_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_MATRIX_TRANSFORM
     * 
     * </td>
     * <td>
     * MTransform_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_PATH
     * 
     * </td>
     * <td>
     * Path_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_RADIAL_GRADIENT_BRUSH
     * 
     * </td>
     * <td>
     * RGBrush_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_SOLID_COLOR_BRUSH
     * 
     * </td>
     * <td>
     * SCBrush_
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XPS_OBJECT_TYPE_VISUAL_BRUSH
     * 
     * </td>
     * <td>
     * 	VBrush_
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  <p class="note">This method returns a key string that is unique within the context of this page. It is not guaranteed to 
     * 	 return a key that is unique in a remote dictionary resource that could be used by more than one page.
     * 
     * </div>
     * <div> </div>
     * This method allocates the memory used by the string that is returned in <i>key</i>.  If <i>key</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @param {Integer} type The   type of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a> object  for which  the lookup key is generated.
     * @returns {PWSTR} The lookup key string that is generated by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-generateunusedlookupkey
     */
    GenerateUnusedLookupKey(type) {
        result := ComCall(25, this, "int", type, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMPage.Clone)
     * @remarks
     * This method does not update any of the resource pointers in the copy.
     * 
     * The owner of the new interface is <b>NULL</b>.
     * @returns {IXpsOMPage} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompage-clone
     */
    Clone() {
        result := ComCall(26, this, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }
}
