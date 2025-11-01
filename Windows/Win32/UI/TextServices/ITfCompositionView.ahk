#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCompositionView interface is implemented by the TSF manager and used by an application to obtain data about a composition view. An instance of this interface is provided by one of the ITfContextOwnerCompositionSink methods.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcompositionview
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCompositionView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCompositionView
     * @type {Guid}
     */
    static IID => Guid("{d7540241-f9a1-4364-befc-dbcd2c4395b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwnerClsid", "GetRange"]

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompositionview-getownerclsid
     */
    GetOwnerClsid(pclsid) {
        result := ComCall(3, this, "ptr", pclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITfRange>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompositionview-getrange
     */
    GetRange(ppRange) {
        result := ComCall(4, this, "ptr*", ppRange, "HRESULT")
        return result
    }
}
