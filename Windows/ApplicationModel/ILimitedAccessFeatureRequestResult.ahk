#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IReference.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class ILimitedAccessFeatureRequestResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILimitedAccessFeatureRequestResult
     * @type {Guid}
     */
    static IID => Guid("{d45156a6-1e24-5ddd-abb4-6188aba4d5bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FeatureId", "get_Status", "get_EstimatedRemovalDate"]

    /**
     * @type {HSTRING} 
     */
    FeatureId {
        get => this.get_FeatureId()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    EstimatedRemovalDate {
        get => this.get_EstimatedRemovalDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FeatureId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_EstimatedRemovalDate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }
}
