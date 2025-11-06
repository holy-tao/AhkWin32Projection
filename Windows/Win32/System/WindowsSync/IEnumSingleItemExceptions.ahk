#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISingleItemException.ahk
#Include .\IEnumSingleItemExceptions.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates single-item exceptions that are stored in a knowledge object.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumsingleitemexceptions
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSingleItemExceptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSingleItemExceptions
     * @type {Guid}
     */
    static IID => Guid("{e563381c-1b4d-4c66-9796-c86faccdcd40}")

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
     * @param {Pointer<Integer>} pcFetched 
     * @returns {ISingleItemException} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsingleitemexceptions-next
     */
    Next(cExceptions, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cExceptions, "ptr*", &ppSingleItemException := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ISingleItemException(ppSingleItemException)
    }

    /**
     * 
     * @param {Integer} cExceptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsingleitemexceptions-skip
     */
    Skip(cExceptions) {
        result := ComCall(4, this, "uint", cExceptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsingleitemexceptions-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSingleItemExceptions} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsingleitemexceptions-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSingleItemExceptions(ppEnum)
    }
}
