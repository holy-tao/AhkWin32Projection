#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemKindStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemKindStatics2
     * @type {Guid}
     */
    static IID => Guid("{b9e3a3d0-0466-4749-91e8-65f9d19a96a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Iot", "get_Tablet", "get_Laptop"]

    /**
     * @type {HSTRING} 
     */
    Iot {
        get => this.get_Iot()
    }

    /**
     * @type {HSTRING} 
     */
    Tablet {
        get => this.get_Tablet()
    }

    /**
     * @type {HSTRING} 
     */
    Laptop {
        get => this.get_Laptop()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Iot() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tablet() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Laptop() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
