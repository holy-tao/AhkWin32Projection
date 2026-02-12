#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IApplicationTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationTrigger
     * @type {Guid}
     */
    static IID => Guid("{0b468630-9574-492c-9e93-1a3ae6335fe9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAsync", "RequestAsyncWithArguments"]

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {ValueSet} arguments 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAsyncWithArguments(arguments) {
        result := ComCall(7, this, "ptr", arguments, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
