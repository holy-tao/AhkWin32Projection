#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change unit to exclude from a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ichangeunitexception
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IChangeUnitException extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChangeUnitException
     * @type {Guid}
     */
    static IID => Guid("{0cd7ee7c-fec0-4021-99ee-f0e5348f2a5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemId", "GetChangeUnitId", "GetClockVector"]

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitexception-getitemid
     */
    GetItemId(pbItemId, pcbIdSize) {
        result := ComCall(3, this, "char*", pbItemId, "uint*", pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitexception-getchangeunitid
     */
    GetChangeUnitId(pbChangeUnitId, pcbIdSize) {
        result := ComCall(4, this, "char*", pbChangeUnitId, "uint*", pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitexception-getclockvector
     */
    GetClockVector(riid, ppUnk) {
        result := ComCall(5, this, "ptr", riid, "ptr*", ppUnk, "HRESULT")
        return result
    }
}
