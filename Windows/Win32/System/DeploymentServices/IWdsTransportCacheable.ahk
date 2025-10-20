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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDirty 
     * @returns {HRESULT} 
     */
    get_Dirty(pbDirty) {
        result := ComCall(7, this, "ptr", pbDirty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Discard() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
