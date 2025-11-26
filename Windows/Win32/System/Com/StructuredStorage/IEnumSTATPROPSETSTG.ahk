#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumSTATPROPSETSTG.ahk
#Include ..\IUnknown.ahk

/**
 * Iterates through an array of STATPROPSETSTG structures. The STATPROPSETSTG structures contain statistical data about the property sets managed by the current IPropertySetStorage instance.
 * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nn-propidlbase-ienumstatpropsetstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IEnumSTATPROPSETSTG extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSTATPROPSETSTG
     * @type {Guid}
     */
    static IID => Guid("{0000013b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Retrieves a specified number of STATPROPSETSTG structures that follow subsequently in the enumeration sequence.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures requested.
     * @param {Pointer<STATPROPSETSTG>} rgelt An array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures returned.
     * @param {Pointer<Integer>} pceltFetched The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures  retrieved in the <i>rgelt</i> parameter.
     * @returns {HRESULT} This method supports the following return values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of <a href="/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures returned equals the number specified in the <i>celt</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of <a href="/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures returned is less than the number specified in the <i>celt</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ienumstatpropsetstg-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "int")
        return result
    }

    /**
     * Skips a specified number of STATPROPSETSTG structures in the enumeration sequence.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropsetstg">STATPROPSETSTG</a> structures to skip.
     * @returns {HRESULT} This method supports the following return values:
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ienumstatpropsetstg-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning of the STATPROPSETSTG structure array.
     * @returns {HRESULT} This method supports the S_OK return value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration sequence was successfully reset to the beginning of the enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ienumstatpropsetstg-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator that contains the same enumeration state as the current STATPROPSETSTG structure enumerator.
     * @returns {IEnumSTATPROPSETSTG} A pointer to the variable that receives the  <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropsetstg">IEnumSTATPROPSETSTG</a> interface pointer. 
     * 
     * If the method does not succeed, the value of the <i>ppenum</i> parameter is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nf-propidlbase-ienumstatpropsetstg-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSETSTG(ppenum)
    }
}
