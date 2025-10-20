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
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetItemId(pbItemId, pcbIdSize) {
        result := ComCall(3, this, "char*", pbItemId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetChangeUnitId(pbChangeUnitId, pcbIdSize) {
        result := ComCall(4, this, "char*", pbChangeUnitId, "uint*", pcbIdSize, "int")
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
