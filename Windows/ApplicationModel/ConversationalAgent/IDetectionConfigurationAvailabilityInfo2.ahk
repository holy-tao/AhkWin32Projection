#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IDetectionConfigurationAvailabilityInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDetectionConfigurationAvailabilityInfo2
     * @type {Guid}
     */
    static IID => Guid("{30e06433-38b3-5c4b-84c3-62b6e685b2ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnavailableSystemResources"]

    /**
     * @type {IVectorView<Integer>} 
     */
    UnavailableSystemResources {
        get => this.get_UnavailableSystemResources()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_UnavailableSystemResources() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
