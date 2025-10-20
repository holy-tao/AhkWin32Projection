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
     * 
     * @param {Pointer<UInt32>} pulAge 
     * @returns {HRESULT} 
     */
    get_Age(pulAge) {
        result := ComCall(7, this, "uint*", pulAge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAge 
     * @returns {HRESULT} 
     */
    put_Age(ulAge) {
        result := ComCall(8, this, "uint", ulAge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulAge 
     * @returns {HRESULT} 
     */
    get_Size(pulAge) {
        result := ComCall(9, this, "uint*", pulAge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAge 
     * @returns {HRESULT} 
     */
    put_Size(ulAge) {
        result := ComCall(10, this, "uint", ulAge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Steps 
     * @returns {HRESULT} 
     */
    get_Actions(Steps) {
        result := ComCall(11, this, "int*", Steps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Steps 
     * @returns {HRESULT} 
     */
    put_Actions(Steps) {
        result := ComCall(12, this, "int", Steps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDestination 
     * @returns {HRESULT} 
     */
    get_SendCabTo(pbstrDestination) {
        result := ComCall(13, this, "ptr", pbstrDestination, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDestination 
     * @returns {HRESULT} 
     */
    put_SendCabTo(bstrDestination) {
        bstrDestination := bstrDestination is String ? BSTR.Alloc(bstrDestination).Value : bstrDestination

        result := ComCall(14, this, "ptr", bstrDestination, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
