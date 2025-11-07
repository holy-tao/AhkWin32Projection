#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrinterExtensionContext.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionContextCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterExtensionContextCollection
     * @type {Guid}
     */
    static IID => Guid("{fb476970-9bab-4861-811e-3e98b0c5addf}")

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
     * @returns {IPrinterExtensionContext} 
     */
    GetAt(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "ptr*", &ppContext := 0, "HRESULT")
        return IPrinterExtensionContext(ppContext)
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
