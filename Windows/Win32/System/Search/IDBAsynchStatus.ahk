#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBAsynchStatus extends IUnknown{
    /**
     * The interface identifier for IDBAsynchStatus
     * @type {Guid}
     */
    static IID => Guid("{0c733a95-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @returns {HRESULT} 
     */
    Abort(hChapter, eOperation) {
        result := ComCall(3, this, "ptr", hChapter, "uint", eOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {Pointer<UIntPtr>} pulProgress 
     * @param {Pointer<UIntPtr>} pulProgressMax 
     * @param {Pointer<UInt32>} peAsynchPhase 
     * @param {Pointer<PWSTR>} ppwszStatusText 
     * @returns {HRESULT} 
     */
    GetStatus(hChapter, eOperation, pulProgress, pulProgressMax, peAsynchPhase, ppwszStatusText) {
        result := ComCall(4, this, "ptr", hChapter, "uint", eOperation, "ptr*", pulProgress, "ptr*", pulProgressMax, "uint*", peAsynchPhase, "ptr", ppwszStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
