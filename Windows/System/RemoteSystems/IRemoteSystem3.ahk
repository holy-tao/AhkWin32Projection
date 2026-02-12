#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystem3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystem3
     * @type {Guid}
     */
    static IID => Guid("{72b4b495-b7c6-40be-831b-73562f12ffa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ManufacturerDisplayName", "get_ModelDisplayName"]

    /**
     * @type {HSTRING} 
     */
    ManufacturerDisplayName {
        get => this.get_ManufacturerDisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    ModelDisplayName {
        get => this.get_ModelDisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ManufacturerDisplayName() {
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
    get_ModelDisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
