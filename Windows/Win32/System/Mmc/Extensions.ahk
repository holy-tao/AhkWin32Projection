#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\Extension.ahk
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
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Extension} 
     * @see https://learn.microsoft.com/windows/win32/SecCrypto/extensions-item
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &Extension := 0, "HRESULT")
        return Extension(Extension)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "HRESULT")
        return Count
    }
}
