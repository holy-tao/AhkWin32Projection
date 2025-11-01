#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the ability to add your own data to a variety of objects within the Tablet PC object model.
 * @remarks
 * 
  * Extended properties are application-defined data that can be of whatever form the application requires. The name of the extended property is expressed as a globally unique identifier (GUID).
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkextendedproperty
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkExtendedProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkExtendedProperty
     * @type {Guid}
     */
    static IID => Guid("{db489209-b7c3-411d-90f6-1548cfff271e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Guid", "get_Data", "put_Data"]

    /**
     * 
     * @param {Pointer<BSTR>} Guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperty-get_guid
     */
    get_Guid(Guid) {
        result := ComCall(7, this, "ptr", Guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperty-get_data
     */
    get_Data(Data) {
        result := ComCall(8, this, "ptr", Data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperty-put_data
     */
    put_Data(Data) {
        result := ComCall(9, this, "ptr", Data, "HRESULT")
        return result
    }
}
