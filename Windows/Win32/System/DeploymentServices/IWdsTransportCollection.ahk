#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a collection of Windows Deployment Services (WDS) transport management objects.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportcollection
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportCollection
     * @type {Guid}
     */
    static IID => Guid("{b8ba4b1a-2ff4-43ab-996c-b2b10a91a6eb}")

    /**
     * The class identifier for WdsTransportCollection
     * @type {Guid}
     */
    static CLSID => Guid("{c7f18b09-391e-436e-b10b-c3ef46f2c34f}")

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
     * @param {Pointer<Integer>} pulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get_count
     */
    get_Count(pulCount) {
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulCountMarshal, pulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<IDispatch>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get_item
     */
    get_Item(ulIndex, ppVal) {
        result := ComCall(8, this, "uint", ulIndex, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get__newenum
     */
    get__NewEnum(ppVal) {
        result := ComCall(9, this, "ptr*", ppVal, "HRESULT")
        return result
    }
}
