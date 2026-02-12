#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ITimeZoneSettingsStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimeZoneSettingsStatics2
     * @type {Guid}
     */
    static IID => Guid("{555c0db8-39a8-49fa-b4f6-a2c7fc2842ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AutoUpdateTimeZoneAsync"]

    /**
     * 
     * @param {TimeSpan} timeout 
     * @returns {IAsyncOperation<Integer>} 
     */
    AutoUpdateTimeZoneAsync(timeout) {
        result := ComCall(6, this, "ptr", timeout, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
