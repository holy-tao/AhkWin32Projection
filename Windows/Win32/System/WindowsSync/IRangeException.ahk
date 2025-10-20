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
     * 
     * @param {Pointer<Byte>} pbClosedRangeStart 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetClosedRangeStart(pbClosedRangeStart, pcbIdSize) {
        result := ComCall(3, this, "char*", pbClosedRangeStart, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbClosedRangeEnd 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetClosedRangeEnd(pbClosedRangeEnd, pcbIdSize) {
        result := ComCall(4, this, "char*", pbClosedRangeEnd, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    GetClockVector(riid, ppUnk) {
        result := ComCall(5, this, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
