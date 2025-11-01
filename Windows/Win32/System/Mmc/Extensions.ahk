#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecCertEnroll/extensions
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Extensions extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Extensions
     * @type {Guid}
     */
    static IID => Guid("{82dbea43-8ca4-44bc-a2ca-d18741059ec8}")

    /**
     * The class identifier for Extensions
     * @type {Guid}
     */
    static CLSID => Guid("{82dbea43-8ca4-44bc-a2ca-d18741059ec8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count"]

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Extension>} Extension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/SecCrypto/extensions-item
     */
    Item(Index, Extension) {
        result := ComCall(8, this, "int", Index, "ptr*", Extension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(9, this, "int*", Count, "HRESULT")
        return result
    }
}
