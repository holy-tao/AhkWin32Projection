#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Geovisit.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeovisitStateChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeovisitStateChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ceb4d1ff-8b53-4968-beed-4cecd029ce15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Visit"]

    /**
     * @type {Geovisit} 
     */
    Visit {
        get => this.get_Visit()
    }

    /**
     * 
     * @returns {Geovisit} 
     */
    get_Visit() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geovisit(value)
    }
}
