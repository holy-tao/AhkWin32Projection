#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageLibraryChangeTrackerOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibraryChangeTrackerOptions
     * @type {Guid}
     */
    static IID => Guid("{bb52bcd4-1a6d-59c0-ad2a-823a20532483}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TrackChangeDetails", "put_TrackChangeDetails"]

    /**
     * @type {Boolean} 
     */
    TrackChangeDetails {
        get => this.get_TrackChangeDetails()
        set => this.put_TrackChangeDetails(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TrackChangeDetails() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TrackChangeDetails(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
