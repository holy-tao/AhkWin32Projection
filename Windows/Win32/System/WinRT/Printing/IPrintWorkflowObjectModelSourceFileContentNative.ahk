#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintWorkflowObjectModelSourceFileContentNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowObjectModelSourceFileContentNative
     * @type {Guid}
     */
    static IID => Guid("{68c9e477-993e-4052-8ac6-454eff58db9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartXpsOMGeneration", "get_ObjectFactory"]

    /**
     * 
     * @param {IPrintWorkflowXpsReceiver} receiver 
     * @returns {HRESULT} 
     */
    StartXpsOMGeneration(receiver) {
        result := ComCall(3, this, "ptr", receiver, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMObjectFactory1>} value 
     * @returns {HRESULT} 
     */
    get_ObjectFactory(value) {
        result := ComCall(4, this, "ptr*", value, "HRESULT")
        return result
    }
}
