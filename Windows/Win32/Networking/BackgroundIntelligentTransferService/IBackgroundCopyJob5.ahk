#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob4.ahk

/**
 * Use this interface to query or set several optional behaviors of a job.
 * @see https://docs.microsoft.com/windows/win32/api//bits5_0/nn-bits5_0-ibackgroundcopyjob5
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob5 extends IBackgroundCopyJob4{
    /**
     * The interface identifier for IBackgroundCopyJob5
     * @type {Guid}
     */
    static IID => Guid("{e847030c-bbba-4657-af6d-484aa42bf1fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 53

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {BITS_JOB_PROPERTY_VALUE} PropertyValue 
     * @returns {HRESULT} 
     */
    SetProperty(PropertyId, PropertyValue) {
        result := ComCall(53, this, "int", PropertyId, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {Pointer<BITS_JOB_PROPERTY_VALUE>} PropertyValue 
     * @returns {HRESULT} 
     */
    GetProperty(PropertyId, PropertyValue) {
        result := ComCall(54, this, "int", PropertyId, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
