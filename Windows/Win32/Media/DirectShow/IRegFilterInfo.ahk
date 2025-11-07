#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IRegFilterInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegFilterInfo
     * @type {Guid}
     */
    static IID => Guid("{56a868bb-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "Filter"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR()
        result := ComCall(7, this, "ptr", strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    Filter() {
        result := ComCall(8, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }
}
