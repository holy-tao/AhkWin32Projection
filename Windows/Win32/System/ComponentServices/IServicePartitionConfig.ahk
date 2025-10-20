#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures how partitions are used for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicepartitionconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServicePartitionConfig extends IUnknown{
    /**
     * The interface identifier for IServicePartitionConfig
     * @type {Guid}
     */
    static IID => Guid("{80182d03-5ea4-4831-ae97-55beffc2e590}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} partitionConfig 
     * @returns {HRESULT} 
     */
    PartitionConfig(partitionConfig) {
        result := ComCall(3, this, "int", partitionConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPartitionID 
     * @returns {HRESULT} 
     */
    PartitionID(guidPartitionID) {
        result := ComCall(4, this, "ptr", guidPartitionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
