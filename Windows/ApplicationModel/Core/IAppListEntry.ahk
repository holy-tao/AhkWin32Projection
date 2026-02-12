#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\AppDisplayInfo.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class IAppListEntry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppListEntry
     * @type {Guid}
     */
    static IID => Guid("{ef00f07f-2108-490a-877a-8a9f17c25fad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayInfo", "LaunchAsync"]

    /**
     * @type {AppDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * 
     * @returns {AppDisplayInfo} 
     */
    get_DisplayInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppDisplayInfo(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
