#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaTypeInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTypeInfo
     * @type {Guid}
     */
    static IID => Guid("{56a868bc-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Subtype"]

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    Subtype {
        get => this.get_Subtype()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        strType := BSTR()
        result := ComCall(7, this, "ptr", strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Subtype() {
        strType := BSTR()
        result := ComCall(8, this, "ptr", strType, "HRESULT")
        return strType
    }
}
