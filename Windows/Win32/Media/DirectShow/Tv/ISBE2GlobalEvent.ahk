#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Offers access to global spanning events and their data from the Stream Buffer Source filters. A global spanning event contains state information that applies to all the streams in a pipeline.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2GlobalEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2globalevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2GlobalEvent extends IUnknown{
    /**
     * The interface identifier for ISBE2GlobalEvent
     * @type {Guid}
     */
    static IID => Guid("{caede759-b6b1-11db-a578-0018f3fa24c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} idEvt 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Pointer<BOOL>} pSpanning 
     * @param {Pointer<UInt32>} pcb 
     * @param {Pointer<Byte>} pb 
     * @returns {HRESULT} 
     */
    GetEvent(idEvt, param1, param2, param3, param4, pSpanning, pcb, pb) {
        result := ComCall(3, this, "ptr", idEvt, "uint", param1, "uint", param2, "uint", param3, "uint", param4, "ptr", pSpanning, "uint*", pcb, "char*", pb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
