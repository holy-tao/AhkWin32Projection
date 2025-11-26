#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a clock vector in a knowledge structure.
 * @remarks
 * 
 * A clock vector defines the changes that are contained in a knowledge structure by using a list of <b>IClockVectorElement</b> objects. An <b>IClockVectorElement</b> object exists for each replica that has made a change that is contained in the knowledge. A change that is made by a particular replica is defined to be contained in the knowledge when the tick count for the change occurs between zero and the tick count contained in <b>IClockVectorElement</b> that tracks that replica.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IClockVector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClockVector
     * @type {Guid}
     */
    static IID => Guid("{14b2274a-8698-4cc6-9333-f89bd1d47bc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClockVectorElements", "GetClockVectorElementCount"]

    /**
     * Returns an enumerator that iterates through the clock vector elements.
     * @param {Pointer<Guid>} riid The IID of the enumeration interface that is requested. Must be either <b>IID_IEnumClockVector</b> or <b>IID_IEnumFeedClockVector</b>.
     * @param {Pointer<Pointer<Void>>} ppiEnumClockVector Returns an object that implements <i>riid</i> and that can enumerate the clock vector elements.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>riid</i> is not  <b>IID_IEnumClockVector</b> or <b>IID_IEnumFeedClockVector</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iclockvector-getclockvectorelements
     */
    GetClockVectorElements(riid, ppiEnumClockVector) {
        ppiEnumClockVectorMarshal := ppiEnumClockVector is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, ppiEnumClockVectorMarshal, ppiEnumClockVector, "HRESULT")
        return result
    }

    /**
     * Gets the number of elements that are contained in the clock vector.
     * @param {Pointer<Integer>} pdwCount Returns the number of elements that are contained in the clock vector.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iclockvector-getclockvectorelementcount
     */
    GetClockVectorElementCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }
}
