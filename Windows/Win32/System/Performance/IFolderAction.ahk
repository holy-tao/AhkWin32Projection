#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Specifies the actions that the data manager is to take on each folder under the data collector set's root path if both conditions (age and size) are met. To get this interface, call the IFolderActionCollection::CreateFolderAction method.
 * @remarks
 * 
 * To create the object from a script, use the Pla.FolderAction program identifier.
 * 
 * For an example that shows the XML that you can use to initialize this object if you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setxml">IDataCollectorSet::SetXml</a> method, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a>.  When you specify the XML to create the object, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the set, the XML includes all elements.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-ifolderaction
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IFolderAction extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderAction
     * @type {Guid}
     */
    static IID => Guid("{03837543-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Age", "put_Age", "get_Size", "put_Size", "get_Actions", "put_Actions", "get_SendCabTo", "put_SendCabTo"]

    /**
     * @type {Integer} 
     */
    Age {
        get => this.get_Age()
        set => this.put_Age(value)
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * @type {Integer} 
     */
    Actions {
        get => this.get_Actions()
        set => this.put_Actions(value)
    }

    /**
     * @type {BSTR} 
     */
    SendCabTo {
        get => this.get_SendCabTo()
        set => this.put_SendCabTo(value)
    }

    /**
     * Retrieves or sets the interval to wait between applying the actions.
     * @remarks
     * 
     * The time is determined by the age of the folder.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-get_age
     */
    get_Age() {
        result := ComCall(7, this, "uint*", &pulAge := 0, "HRESULT")
        return pulAge
    }

    /**
     * Retrieves or sets the interval to wait between applying the actions.
     * @remarks
     * 
     * The time is determined by the age of the folder.
     * 
     * 
     * @param {Integer} ulAge 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-put_age
     */
    put_Age(ulAge) {
        result := ComCall(8, this, "uint", ulAge, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the minimum folder size that, when exceeded, initiates the actions.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-get_size
     */
    get_Size() {
        result := ComCall(9, this, "uint*", &pulAge := 0, "HRESULT")
        return pulAge
    }

    /**
     * Retrieves or sets the minimum folder size that, when exceeded, initiates the actions.
     * @param {Integer} ulAge 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-put_size
     */
    put_Size(ulAge) {
        result := ComCall(10, this, "uint", ulAge, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the actions that the data manager is to take if both conditions (age and size) are met.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-get_actions
     */
    get_Actions() {
        result := ComCall(11, this, "int*", &Steps := 0, "HRESULT")
        return Steps
    }

    /**
     * Retrieves or sets the actions that the data manager is to take if both conditions (age and size) are met.
     * @param {Integer} Steps 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-put_actions
     */
    put_Actions(Steps) {
        result := ComCall(12, this, "int", Steps, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the destination of the cabinet file if the action is to send a cabinet file.
     * @remarks
     * 
     * The data manager does not fail if it is not able to send the file.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-get_sendcabto
     */
    get_SendCabTo() {
        pbstrDestination := BSTR()
        result := ComCall(13, this, "ptr", pbstrDestination, "HRESULT")
        return pbstrDestination
    }

    /**
     * Retrieves or sets the destination of the cabinet file if the action is to send a cabinet file.
     * @remarks
     * 
     * The data manager does not fail if it is not able to send the file.
     * 
     * 
     * @param {BSTR} bstrDestination 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderaction-put_sendcabto
     */
    put_SendCabTo(bstrDestination) {
        bstrDestination := bstrDestination is String ? BSTR.Alloc(bstrDestination).Value : bstrDestination

        result := ComCall(14, this, "ptr", bstrDestination, "HRESULT")
        return result
    }
}
