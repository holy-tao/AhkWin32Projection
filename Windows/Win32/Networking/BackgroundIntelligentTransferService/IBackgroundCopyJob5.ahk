#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BITS_JOB_PROPERTY_VALUE.ahk
#Include .\IBackgroundCopyJob4.ahk

/**
 * Use this interface to query or set several optional behaviors of a job.
 * @see https://docs.microsoft.com/windows/win32/api//bits5_0/nn-bits5_0-ibackgroundcopyjob5
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob5 extends IBackgroundCopyJob4{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperty", "GetProperty"]

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {BITS_JOB_PROPERTY_VALUE} PropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyjob5-setproperty
     */
    SetProperty(PropertyId, PropertyValue) {
        result := ComCall(53, this, "int", PropertyId, "ptr", PropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropertyId 
     * @returns {BITS_JOB_PROPERTY_VALUE} 
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyjob5-getproperty
     */
    GetProperty(PropertyId) {
        PropertyValue := BITS_JOB_PROPERTY_VALUE()
        result := ComCall(54, this, "int", PropertyId, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
    }
}
