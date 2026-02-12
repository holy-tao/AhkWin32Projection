#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyLicenseAcquisitionServiceRequest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyLicenseAcquisitionServiceRequest2
     * @type {Guid}
     */
    static IID => Guid("{b7fa5eb5-fe0c-b225-bc60-5a9edd32ceb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionId"]

    /**
     * @type {Guid} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
