#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IObjectContextInfo.ahk

/**
 * Provides additional information about an object's context. This interface extends the IObjectContextInfo interface.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontextinfo2
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContextInfo2 extends IObjectContextInfo{
    /**
     * The interface identifier for IObjectContextInfo2
     * @type {Guid}
     */
    static IID => Guid("{594be71a-4bc4-438b-9197-cfd176248b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetPartitionId(pGuid) {
        result := ComCall(8, this, "ptr", pGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetApplicationId(pGuid) {
        result := ComCall(9, this, "ptr", pGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetApplicationInstanceId(pGuid) {
        result := ComCall(10, this, "ptr", pGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
