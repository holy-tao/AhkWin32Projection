#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LocalLocationRatingInfo.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\LocalLocationHoursOfOperationItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class ILocalLocation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocalLocation2
     * @type {Guid}
     */
    static IID => Guid("{6e9e307c-ecb5-4ffc-bb8c-ba50ba8c2dc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Category", "get_RatingInfo", "get_HoursOfOperation"]

    /**
     * @type {HSTRING} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * @type {LocalLocationRatingInfo} 
     */
    RatingInfo {
        get => this.get_RatingInfo()
    }

    /**
     * @type {IVectorView<LocalLocationHoursOfOperationItem>} 
     */
    HoursOfOperation {
        get => this.get_HoursOfOperation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Category() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {LocalLocationRatingInfo} 
     */
    get_RatingInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LocalLocationRatingInfo(value)
    }

    /**
     * 
     * @returns {IVectorView<LocalLocationHoursOfOperationItem>} 
     */
    get_HoursOfOperation() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(LocalLocationHoursOfOperationItem, value)
    }
}
