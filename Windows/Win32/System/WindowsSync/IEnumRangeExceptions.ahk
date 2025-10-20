#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates range exceptions that are stored in a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumrangeexceptions
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumRangeExceptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumRangeExceptions
     * @type {Guid}
     */
    static IID => Guid("{0944439f-ddb1-4176-b703-046ff22a2386}")

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
     * 
     * @param {Integer} cExceptions 
     * @param {Pointer<IRangeException>} ppRangeException 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumrangeexceptions-next
     */
    Next(cExceptions, ppRangeException, pcFetched) {
        result := ComCall(3, this, "uint", cExceptions, "ptr*", ppRangeException, "uint*", pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cExceptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumrangeexceptions-skip
     */
    Skip(cExceptions) {
        result := ComCall(4, this, "uint", cExceptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumrangeexceptions-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumRangeExceptions>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumrangeexceptions-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
