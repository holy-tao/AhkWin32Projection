#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusRefObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusRefObject
     * @type {Guid}
     */
    static IID => Guid("{f2e60702-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Handle"]

    /**
     * 
     * @param {Pointer<Pointer>} phandle 
     * @returns {HRESULT} 
     */
    get_Handle(phandle) {
        phandleMarshal := phandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, phandleMarshal, phandle, "HRESULT")
        return result
    }
}
