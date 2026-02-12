#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeolocatorWithScalarAccuracy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeolocatorWithScalarAccuracy
     * @type {Guid}
     */
    static IID => Guid("{96f5d3c1-b80f-460a-994d-a96c47a51aa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredAccuracyInMeters", "put_DesiredAccuracyInMeters"]

    /**
     * @type {IReference<Integer>} 
     */
    DesiredAccuracyInMeters {
        get => this.get_DesiredAccuracyInMeters()
        set => this.put_DesiredAccuracyInMeters(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesiredAccuracyInMeters() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DesiredAccuracyInMeters(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
