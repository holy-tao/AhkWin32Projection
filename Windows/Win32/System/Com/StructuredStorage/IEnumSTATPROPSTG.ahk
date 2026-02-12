#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumSTATPROPSTG.ahk
#Include ..\IUnknown.ahk

/**
 * The IEnumSTATPROPSTG interface iterates through an array of STATPROPSTG structures. The STATPROPSTG structures contain statistical data about properties in a property set.
 * @see https://learn.microsoft.com/windows/win32/api//content/propidl/nn-propidl-ienumstatpropstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IEnumSTATPROPSTG extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSTATPROPSTG
     * @type {Guid}
     */
    static IID => Guid("{00000139-0000-0000-c000-000000000046}")

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
     * The IEnumSTATPROPSTG::Next method retrieves a specified number of STATPROPSTG structures, that follow subsequently in the enumeration sequence.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures requested.
     * @param {Pointer<STATPROPSTG>} rgelt An array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures returned.
     * @param {Pointer<Integer>} pceltFetched The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures  retrieved in the <i>rgelt</i> parameter.
     * @returns {HRESULT} This method supports the following return values.
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
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures returned is equal to the number specified in the <i>celt</i> parameter.
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
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures returned is less than the number specified in the <i>celt</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/propidl/nf-propidl-ienumstatpropstg-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "int")
        return result
    }

    /**
     * The IEnumSTATPROPSTG::Skip method skips the specified number of STATPROPSTG structures in the enumeration sequence. (IEnumSTATPROPSTG.Skip)
     * @remarks
     * A positive value for the <i>celt</i> parameter skips forward in the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structure enumeration. A negative value for the <i>celt</i> parameter skips backward in the <b>STATPROPSTG</b> structure enumeration.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-statpropstg">STATPROPSTG</a> structures to skip.
     * @returns {HRESULT} This method supports the following return values:
     * @see https://learn.microsoft.com/windows/win32/api//content/propidl/nf-propidl-ienumstatpropstg-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * The IEnumSTATPROPSTG::Reset method resets the enumeration sequence to the beginning of the STATPROPSTG structure array.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/propidl/nf-propidl-ienumstatpropstg-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IEnumSTATPROPSTG::Clone method creates an enumerator that contains the same enumeration state as the current STATPROPSTG structure enumerator.
     * @returns {IEnumSTATPROPSTG} A pointer to the variable that receives the  <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropstg">IEnumSTATPROPSTG</a> interface pointer. 
     * 
     * If the method is unsuccessful, the value of the <i>ppenum</i> parameter is undefined.
     * @see https://learn.microsoft.com/windows/win32/api//content/propidl/nf-propidl-ienumstatpropstg-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSTATPROPSTG(ppenum)
    }
}
