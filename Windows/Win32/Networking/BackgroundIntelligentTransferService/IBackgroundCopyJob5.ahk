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
     * A generic method for setting BITS job properties.
     * @param {Integer} PropertyId The ID of the property that is being set specified as a <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ne-bits5_0-bits_job_property_id">BITS_JOB_PROPERTY_ID</a> enum value.
     * @param {BITS_JOB_PROPERTY_VALUE} PropertyValue The value of the property that is being set. In order to hold a value whose type is appropriate to the property, this value is specified via the <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ns-bits5_0-bits_job_property_value">BITS_JOB_PROPERTY_VALUE</a> union that is composed of all the known property types.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits5_0/nf-bits5_0-ibackgroundcopyjob5-setproperty
     */
    SetProperty(PropertyId, PropertyValue) {
        result := ComCall(53, this, "int", PropertyId, "ptr", PropertyValue, "HRESULT")
        return result
    }

    /**
     * A generic method for getting BITS job properties.
     * @param {Integer} PropertyId The ID of the property that is being obtained specified as a <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ne-bits5_0-bits_job_property_id">BITS_JOB_PROPERTY_ID</a> enum value.
     * @returns {BITS_JOB_PROPERTY_VALUE} The property value returned as a BITS_JOB_PROPERTY_VALUE union.
     * @see https://docs.microsoft.com/windows/win32/api//bits5_0/nf-bits5_0-ibackgroundcopyjob5-getproperty
     */
    GetProperty(PropertyId) {
        PropertyValue := BITS_JOB_PROPERTY_VALUE()
        result := ComCall(54, this, "int", PropertyId, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
    }
}
