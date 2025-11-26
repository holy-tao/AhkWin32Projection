#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLGenericElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLGenericElement
     * @type {Guid}
     */
    static IID => Guid("{3050f4b7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLGenericElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4b8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_recordset", "namedRecordset"]

    /**
     * @type {IDispatch} 
     */
    recordset {
        get => this.get_recordset()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_recordset() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} dataMember 
     * @param {Pointer<VARIANT>} hierarchy 
     * @returns {IDispatch} 
     */
    namedRecordset(dataMember, hierarchy) {
        dataMember := dataMember is String ? BSTR.Alloc(dataMember).Value : dataMember

        result := ComCall(8, this, "ptr", dataMember, "ptr", hierarchy, "ptr*", &ppRecordset := 0, "HRESULT")
        return IDispatch(ppRecordset)
    }
}
