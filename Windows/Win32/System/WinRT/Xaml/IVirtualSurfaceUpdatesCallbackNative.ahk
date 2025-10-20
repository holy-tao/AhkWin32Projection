#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IVirtualSurfaceUpdatesCallbackNative extends IUnknown{
    /**
     * The interface identifier for IVirtualSurfaceUpdatesCallbackNative
     * @type {Guid}
     */
    static IID => Guid("{dbf2e947-8e6c-4254-9eee-7738f71386c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdatesNeeded() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
