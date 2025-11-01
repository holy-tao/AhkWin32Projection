#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCollection interface allows Automation client applications, such as those written in Visual Basic, to retrieve collection information.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcollection
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCollection
     * @type {Guid}
     */
    static IID => Guid("{5ec5acf2-9c02-11d0-8362-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} lCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcollection-get_count
     */
    get_Count(lCount) {
        result := ComCall(7, this, "int*", lCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcollection-get_item
     */
    get_Item(Index, pVariant) {
        result := ComCall(8, this, "int", Index, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppNewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcollection-get__newenum
     */
    get__NewEnum(ppNewEnum) {
        result := ComCall(9, this, "ptr*", ppNewEnum, "HRESULT")
        return result
    }
}
