#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PlayReadyLicenseIterable.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyLicenseAcquisitionServiceRequest3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyLicenseAcquisitionServiceRequest3
     * @type {Guid}
     */
    static IID => Guid("{394e5f4d-7f75-430d-b2e7-7f75f34b2d75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLicenseIterable"]

    /**
     * 
     * @param {PlayReadyContentHeader} contentHeader 
     * @param {Boolean} fullyEvaluated 
     * @returns {PlayReadyLicenseIterable} 
     */
    CreateLicenseIterable(contentHeader, fullyEvaluated) {
        result := ComCall(6, this, "ptr", contentHeader, "int", fullyEvaluated, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyLicenseIterable(result_)
    }
}
