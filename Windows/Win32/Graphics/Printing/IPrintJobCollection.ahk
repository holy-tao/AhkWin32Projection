#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintJob.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintJobCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintJobCollection
     * @type {Guid}
     */
    static IID => Guid("{72b82a24-a598-4e87-895f-cdb23a49e9dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "GetAt", "get__NewEnum"]

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
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "uint*", &pulCount := 0, "HRESULT")
        return pulCount
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {IPrintJob} 
     */
    GetAt(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "ptr*", &ppJob := 0, "HRESULT")
        return IPrintJob(ppJob)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
