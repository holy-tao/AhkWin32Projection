#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Com\IUnknown.ahk

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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "uint*", &pulCount := 0, "HRESULT")
        return pulCount
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get_item
     */
    get_Item(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "ptr*", &ppVal := 0, "HRESULT")
        return IDispatch(ppVal)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }
}
