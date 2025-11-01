#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to retrieve the minimum size of the shadow copy storage area.
 * @remarks
 * 
  * To obtain an instance of the <b>IVssSnapshotMgmt2</b> 
  *    interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of the 
  *    <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nn-vsmgmt-ivsssnapshotmgmt">IVssSnapshotMgmt</a> interface, passing 
  *    <b>IID_IVssSnapshotMgmt2</b> as the <i>riid</i> parameter.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nn-vsmgmt-ivsssnapshotmgmt2
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssSnapshotMgmt2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssSnapshotMgmt2
     * @type {Guid}
     */
    static IID => Guid("{0f61ec39-fe82-45f2-a3f0-768b5d427102}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMinDiffAreaSize"]

    /**
     * 
     * @param {Pointer<Integer>} pllMinDiffAreaSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt2-getmindiffareasize
     */
    GetMinDiffAreaSize(pllMinDiffAreaSize) {
        pllMinDiffAreaSizeMarshal := pllMinDiffAreaSize is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, pllMinDiffAreaSizeMarshal, pllMinDiffAreaSize, "HRESULT")
        return result
    }
}
