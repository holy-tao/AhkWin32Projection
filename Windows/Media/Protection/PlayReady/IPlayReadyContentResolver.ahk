#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPlayReadyServiceRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyContentResolver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyContentResolver
     * @type {Guid}
     */
    static IID => Guid("{fbfd2523-906d-4982-a6b8-6849565a7ce8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ServiceRequest"]

    /**
     * 
     * @param {PlayReadyContentHeader} contentHeader 
     * @returns {IPlayReadyServiceRequest} 
     */
    ServiceRequest(contentHeader) {
        result := ComCall(6, this, "ptr", contentHeader, "ptr*", &serviceRequest := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPlayReadyServiceRequest(serviceRequest)
    }
}
