#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ResourceContext.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceContextStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceContextStatics4
     * @type {Guid}
     */
    static IID => Guid("{22eb9ccd-fb31-4bfa-b86b-df9d9d7bdc39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForUIContext"]

    /**
     * 
     * @param {UIContext} context_ 
     * @returns {ResourceContext} 
     */
    GetForUIContext(context_) {
        result := ComCall(6, this, "ptr", context_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceContext(value)
    }
}
