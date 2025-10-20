#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFilterMapper2.ahk

/**
 * The IFilterMapper3 interface extends the IFilterMapper2 interface. The Filter Mapper object implements this interface.Note  This interface is deprecated. .
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltermapper3
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterMapper3 extends IFilterMapper2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterMapper3
     * @type {Guid}
     */
    static IID => Guid("{b79bb0b1-33c1-11d1-abe1-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetICreateDevEnum"]

    /**
     * 
     * @param {Pointer<ICreateDevEnum>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper3-geticreatedevenum
     */
    GetICreateDevEnum(ppEnum) {
        result := ComCall(7, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
