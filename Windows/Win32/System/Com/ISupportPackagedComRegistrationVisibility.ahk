#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISupportPackagedComRegistrationVisibility extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportPackagedComRegistrationVisibility
     * @type {Guid}
     */
    static IID => Guid("{8dc3444e-c7ee-449a-9fb8-b9173988d66a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
