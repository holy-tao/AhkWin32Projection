#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to a constructor string. Use it when you want to specify the parameters during the construction of your object.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectconstructstring
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectConstructString extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectConstructString
     * @type {Guid}
     */
    static IID => Guid("{41c4f8b2-7439-11d2-98cb-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConstructString"]

    /**
     */
    ConstructString {
        get => this.get_ConstructString()
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectconstructstring-get_constructstring
     */
    get_ConstructString(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }
}
