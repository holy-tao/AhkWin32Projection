#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manipulate 64-bit integers of the LargeInteger type.
 * @remarks
 * 
  * Handling the <b>IADsLargeInteger</b> in Visual Basic is made difficult by the fact that Visual Basic has no native unsigned numeric data type. This can cause errors in data conversion if either the <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadslargeinteger-property-methods">LowPart</a> or <b>HighPart</b> has the high bit set, which causes Visual Basic to handle the number as negative. The Visual Basic code examples below show how to properly handle the <b>IADsLargeInteger</b> in Visual Basic.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadslargeinteger
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsLargeInteger extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsLargeInteger
     * @type {Guid}
     */
    static IID => Guid("{9068270b-0939-11d1-8be1-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HighPart", "put_HighPart", "get_LowPart", "put_LowPart"]

    /**
     * 
     * @returns {Integer} 
     */
    get_HighPart() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnHighPart 
     * @returns {HRESULT} 
     */
    put_HighPart(lnHighPart) {
        result := ComCall(8, this, "int", lnHighPart, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowPart() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnLowPart 
     * @returns {HRESULT} 
     */
    put_LowPart(lnLowPart) {
        result := ComCall(10, this, "int", lnLowPart, "HRESULT")
        return result
    }
}
