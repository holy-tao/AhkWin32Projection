#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents an item ID range to exclude from a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irangeexception
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRangeException extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRangeException
     * @type {Guid}
     */
    static IID => Guid("{75ae8777-6848-49f7-956c-a3a92f5096e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClosedRangeStart", "GetClosedRangeEnd", "GetClockVector"]

    /**
     * 
     * @param {Pointer<Integer>} pbClosedRangeStart 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irangeexception-getclosedrangestart
     */
    GetClosedRangeStart(pbClosedRangeStart, pcbIdSize) {
        result := ComCall(3, this, "char*", pbClosedRangeStart, "uint*", pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbClosedRangeEnd 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irangeexception-getclosedrangeend
     */
    GetClosedRangeEnd(pbClosedRangeEnd, pcbIdSize) {
        result := ComCall(4, this, "char*", pbClosedRangeEnd, "uint*", pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irangeexception-getclockvector
     */
    GetClockVector(riid, ppUnk) {
        result := ComCall(5, this, "ptr", riid, "ptr*", ppUnk, "HRESULT")
        return result
    }
}
