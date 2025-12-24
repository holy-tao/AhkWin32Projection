#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a clock vector element of a knowledge structure.
 * @remarks
 * 
 * The clock vector elements of a clock vector represent the changes that are contained in a knowledge structure. A change that is made by a particular replica is defined to be contained in the knowledge when the tick count for the change occurs between zero and the tick count contained in the <b>IClockVectorElement</b> that tracks that replica.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iclockvectorelement
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IClockVectorElement extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClockVectorElement
     * @type {Guid}
     */
    static IID => Guid("{e71c4250-adf8-4a07-8fae-5669596909c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetReplicaKey", "GetTickCount"]

    /**
     * Gets the replica key for the replica that is associated with this clock vector element.
     * @param {Pointer<Integer>} pdwReplicaKey Returns the replica key for the replica that is associated with this clock vector element.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iclockvectorelement-getreplicakey
     */
    GetReplicaKey(pdwReplicaKey) {
        pdwReplicaKeyMarshal := pdwReplicaKey is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwReplicaKeyMarshal, pdwReplicaKey, "HRESULT")
        return result
    }

    /**
     * Gets the tick count that defines the upper bound on the range of tick counts that are contained in this clock vector element.
     * @param {Pointer<Integer>} pullTickCount Returns the tick count that defines the upper bound on the range of tick counts that are contained in this clock vector element.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iclockvectorelement-gettickcount
     */
    GetTickCount(pullTickCount) {
        pullTickCountMarshal := pullTickCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pullTickCountMarshal, pullTickCount, "HRESULT")
        return result
    }
}
