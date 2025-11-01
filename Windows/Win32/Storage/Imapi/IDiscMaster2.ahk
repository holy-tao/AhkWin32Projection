#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to enumerate the CD and DVD devices installed on the computer.
 * @remarks
 * 
  * To create the <b>MsftDiscMaster2</b> object in a script, use IMAPI2.MsftDiscMaster2 as the program identifier when calling <b>CreateObject</b>.
  * 
  * To receive notification when a device is added or removed from the computer, implement the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-ddiscmaster2events">DDiscMaster2Events</a> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscmaster2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscMaster2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscMaster2
     * @type {Guid}
     */
    static IID => Guid("{27354130-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_IsSupportedEnvironment"]

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppunk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get__newenum
     */
    get__NewEnum(ppunk) {
        result := ComCall(7, this, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get_item
     */
    get_Item(index, value) {
        result := ComCall(8, this, "int", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get_count
     */
    get_Count(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get_issupportedenvironment
     */
    get_IsSupportedEnvironment(value) {
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }
}
