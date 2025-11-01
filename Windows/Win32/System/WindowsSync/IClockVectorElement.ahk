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
     * 
     * @param {Pointer<Integer>} pdwReplicaKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iclockvectorelement-getreplicakey
     */
    GetReplicaKey(pdwReplicaKey) {
        pdwReplicaKeyMarshal := pdwReplicaKey is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwReplicaKeyMarshal, pdwReplicaKey, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of milliseconds that have elapsed since the system was started, up to 49.7 days.
     * @param {Pointer<Integer>} pullTickCount 
     * @returns {HRESULT} The return value is the number of milliseconds that have elapsed since the system was started.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-gettickcount
     */
    GetTickCount(pullTickCount) {
        pullTickCountMarshal := pullTickCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pullTickCountMarshal, pullTickCount, "HRESULT")
        return result
    }
}
