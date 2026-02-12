#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebProviderTokenRequest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebProviderTokenRequest2
     * @type {Guid}
     */
    static IID => Guid("{b5d72e4c-10b1-4aa6-88b1-0b6c9e0c1e46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApplicationTokenBindingKeyIdAsync"]

    /**
     * 
     * @param {Integer} keyType 
     * @param {Uri} target 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    GetApplicationTokenBindingKeyIdAsync(keyType, target) {
        result := ComCall(6, this, "int", keyType, "ptr", target, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, asyncInfo)
    }
}
