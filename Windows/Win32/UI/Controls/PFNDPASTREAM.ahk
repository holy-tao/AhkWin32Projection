#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the prototype for the callback function used by DPA_LoadStream and DPA_SaveStream.
 * @see https://learn.microsoft.com/windows/win32/api//content/dpa_dsa/nc-dpa_dsa-pfndpastream
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PFNDPASTREAM extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<DPASTREAMINFO>} pinfo 
     * @param {IStream} pstream 
     * @param {Pointer<Void>} pvInstData 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pinfo, pstream, pvInstData) {
        pvInstDataMarshal := pvInstData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pinfo, "ptr", pstream, pvInstDataMarshal, pvInstData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
