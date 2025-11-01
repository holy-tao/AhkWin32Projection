#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperties-get_count
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} _NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(_NewEnum) {
        result := ComCall(8, this, "ptr*", _NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Identifier 
     * @param {Pointer<IInkExtendedProperty>} Item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperties-item
     */
    Item(Identifier, Item) {
        result := ComCall(9, this, "ptr", Identifier, "ptr*", Item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Guid 
     * @param {VARIANT} Data 
     * @param {Pointer<IInkExtendedProperty>} InkExtendedProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperties-add
     */
    Add(Guid, Data, InkExtendedProperty) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(10, this, "ptr", Guid, "ptr", Data, "ptr*", InkExtendedProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Identifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperties-remove
     */
    Remove(Identifier) {
        result := ComCall(11, this, "ptr", Identifier, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperties-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Guid 
     * @param {Pointer<VARIANT_BOOL>} DoesPropertyExist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperties-doespropertyexist
     */
    DoesPropertyExist(Guid, DoesPropertyExist) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(13, this, "ptr", Guid, "ptr", DoesPropertyExist, "HRESULT")
        return result
    }
}
