#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ResourceContext.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceContextStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceContextStatics
     * @type {Guid}
     */
    static IID => Guid("{98be9d6c-6338-4b31-99df-b2b442f17149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMatchingContext"]

    /**
     * 
     * @param {IIterable<ResourceQualifier>} result_ 
     * @returns {ResourceContext} 
     */
    CreateMatchingContext(result_) {
        result := ComCall(6, this, "ptr", result_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceContext(value)
    }
}
