#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskBuilderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskBuilderStatics
     * @type {Guid}
     */
    static IID => Guid("{d1eb5046-06f2-55b4-9bb7-a6457ebf3300}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRunningTaskInStandbySupported"]

    /**
     * @type {Boolean} 
     */
    IsRunningTaskInStandbySupported {
        get => this.get_IsRunningTaskInStandbySupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRunningTaskInStandbySupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
