#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveEndpointPairStateChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveEndpointPairStateChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{592e3b55-de08-44e7-ac3b-b9b9a169583a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldState", "get_NewState"]

    /**
     * @type {Integer} 
     */
    OldState {
        get => this.get_OldState()
    }

    /**
     * @type {Integer} 
     */
    NewState {
        get => this.get_NewState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
