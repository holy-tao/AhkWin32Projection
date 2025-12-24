#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IInkExtendedProperty.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a collection of IInkExtendedProperty objects that contain application-defined data.
 * @remarks
 * 
 * The extended property data is indexed by an application-specific globally unique identifier (GUID).
 * 
 * <div class="alert"><b>Note</b>  You cannot store an empty <b>IInkExtendedProperties</b> object. The object must contain data before it can be stored. For example, if you try to add extended properties to a stroke for later use, an exception is thrown if the extended property contains no data.</div>
 * <div> </div>
 * <b>IInkExtendedProperties</b> collections may be added to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a>, the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdrawingattributes-class">InkDrawingAttributes</a>, and the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> objects.
 * 
 * For more information about collections in Automation, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkextendedproperties
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkExtendedProperties extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkExtendedProperties
     * @type {Guid}
     */
    static IID => Guid("{89f2a8be-95a9-4530-8b8f-88e971e3e25f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Item", "Add", "Remove", "Clear", "DoesPropertyExist"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Gets the number of objects or collections contained in a collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkextendedproperties-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * Retrieves the IInkExtendedProperty object at the specified index within the IInkExtendedProperties collection.
     * @param {VARIANT} Identifier The zero-based index or GUID of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkextendedproperty">IInkExtendedProperty</a> object to get.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkExtendedProperty} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkextendedproperty">IInkExtendedProperty</a> object at the specified index within the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkextendedproperties">IInkExtendedProperties</a> collection.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkextendedproperties-item
     */
    Item(Identifier) {
        result := ComCall(9, this, "ptr", Identifier, "ptr*", &Item := 0, "HRESULT")
        return IInkExtendedProperty(Item)
    }

    /**
     * Creates and adds an IInkExtendedProperty object to the IInkExtendedProperties collection.
     * @param {BSTR} Guid The name of the new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkextendedproperty">IInkExtendedProperty</a> object. The name is expressed as a BSTR that represents the globally unique identifier (GUID) in the following format:
     * 
     * {dfc71f44-354b-4ca1-93d7-7459410b6343} (Including curly braces)
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @param {VARIANT} Data The data for the new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkextendedproperty">IInkExtendedProperty</a> object.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {IInkExtendedProperty} When this method returns, contains a poitner to the new extended property.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkextendedproperties-add
     */
    Add(Guid, Data) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(10, this, "ptr", Guid, "ptr", Data, "ptr*", &InkExtendedProperty := 0, "HRESULT")
        return IInkExtendedProperty(InkExtendedProperty)
    }

    /**
     * Removes the IInkExtendedProperty object from the IInkExtendedProperties collection.
     * @param {VARIANT} Identifier The identifier of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkextendedproperty">IInkExtendedProperty</a> object to remove from the collection. The identifier can be a globally unique identifier (GUID), an index, or an extended property object.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
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
     * A parameter contained an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CLASSSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid GUID format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INVALID_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Property could not be found (invalid GUID or index).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid display handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkextendedproperties-remove
     */
    Remove(Identifier) {
        result := ComCall(11, this, "ptr", Identifier, "HRESULT")
        return result
    }

    /**
     * Clears all of the IInkExtendedProperty objects from the IInkExtendedProperties collection.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INK_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred inside the method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkextendedproperties-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether an IInkExtendedProperty object exists within an IInkExtendedProperties collection.
     * @param {BSTR} Guid Specifies the globally unique identifier (GUID) of the property to be checked.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {VARIANT_BOOL} When this method returns, contains <b>VARIANT_TRUE</b> if the property exists within the collection; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkextendedproperties-doespropertyexist
     */
    DoesPropertyExist(Guid) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(13, this, "ptr", Guid, "short*", &DoesPropertyExist := 0, "HRESULT")
        return DoesPropertyExist
    }
}
