#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowCapabilitiesCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowCapabilitiesCollection
     * @type {Guid}
     */
    static IID => Guid("{50305597-5e0d-4ff7-b3af-33d0d9bd52dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt"]

    /**
     * 
     * @param {Pointer<Integer>} out_pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(out_pdwCount) {
        result := ComCall(3, this, "uint*", out_pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} in_dwIndex 
     * @param {Pointer<ISideShowCapabilities>} out_ppCapabilities 
     * @returns {HRESULT} 
     */
    GetAt(in_dwIndex, out_ppCapabilities) {
        result := ComCall(4, this, "uint", in_dwIndex, "ptr*", out_ppCapabilities, "HRESULT")
        return result
    }
}
