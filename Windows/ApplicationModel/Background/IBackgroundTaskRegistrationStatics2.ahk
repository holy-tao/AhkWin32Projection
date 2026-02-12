#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\BackgroundTaskRegistrationGroup.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskRegistrationStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskRegistrationStatics2
     * @type {Guid}
     */
    static IID => Guid("{174b671e-b20d-4fa9-ad9a-e93ad6c71e01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllTaskGroups", "GetTaskGroup"]

    /**
     * @type {IMapView<HSTRING, BackgroundTaskRegistrationGroup>} 
     */
    AllTaskGroups {
        get => this.get_AllTaskGroups()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, BackgroundTaskRegistrationGroup>} 
     */
    get_AllTaskGroups() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), BackgroundTaskRegistrationGroup, value)
    }

    /**
     * 
     * @param {HSTRING} groupId 
     * @returns {BackgroundTaskRegistrationGroup} 
     */
    GetTaskGroup(groupId) {
        if(groupId is String) {
            pin := HSTRING.Create(groupId)
            groupId := pin.Value
        }
        groupId := groupId is Win32Handle ? NumGet(groupId, "ptr") : groupId

        result := ComCall(7, this, "ptr", groupId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTaskRegistrationGroup(value)
    }
}
