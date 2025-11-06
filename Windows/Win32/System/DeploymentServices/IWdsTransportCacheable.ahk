#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides caching for objects that handle persistent data. This interface can be inherited by other interfaces that represent persisted objects.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportcacheable
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportCacheable extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportCacheable
     * @type {Guid}
     */
    static IID => Guid("{46ad894b-0bab-47dc-84b2-7b553f1d8f80}")

    /**
     * The class identifier for WdsTransportCacheable
     * @type {Guid}
     */
    static CLSID => Guid("{70590b16-f146-46bd-bd9d-4aaa90084bf5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Dirty", "Discard", "Refresh", "Commit"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-get_dirty
     */
    get_Dirty() {
        result := ComCall(7, this, "short*", &pbDirty := 0, "HRESULT")
        return pbDirty
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-discard
     */
    Discard() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-commit
     */
    Commit() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
