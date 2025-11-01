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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppiEnumClockVector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iclockvector-getclockvectorelements
     */
    GetClockVectorElements(riid, ppiEnumClockVector) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppiEnumClockVector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iclockvector-getclockvectorelementcount
     */
    GetClockVectorElementCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }
}
