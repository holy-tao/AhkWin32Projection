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
     * 
     * @param {Pointer<UInt32>} pulCount 
     * @returns {HRESULT} 
     */
    get_Count(pulCount) {
        result := ComCall(7, this, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<IDispatch>} ppVal 
     * @returns {HRESULT} 
     */
    get_Item(ulIndex, ppVal) {
        result := ComCall(8, this, "uint", ulIndex, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppVal) {
        result := ComCall(9, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
