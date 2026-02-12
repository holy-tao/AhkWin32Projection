#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\IBackgroundTaskRegistration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskRegistrationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskRegistrationStatics
     * @type {Guid}
     */
    static IID => Guid("{4c542f69-b000-42ba-a093-6a563c65e3f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllTasks"]

    /**
     * @type {IMapView<Guid, IBackgroundTaskRegistration>} 
     */
    AllTasks {
        get => this.get_AllTasks()
    }

    /**
     * 
     * @returns {IMapView<Guid, IBackgroundTaskRegistration>} 
     */
    get_AllTasks() {
        result := ComCall(6, this, "ptr*", &tasks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetGuid(), IBackgroundTaskRegistration, tasks)
    }
}
