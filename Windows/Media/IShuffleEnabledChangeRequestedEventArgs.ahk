#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IShuffleEnabledChangeRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShuffleEnabledChangeRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{49b593fe-4fd0-4666-a314-c0e01940d302}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestedShuffleEnabled"]

    /**
     * @type {Boolean} 
     */
    RequestedShuffleEnabled {
        get => this.get_RequestedShuffleEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequestedShuffleEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
