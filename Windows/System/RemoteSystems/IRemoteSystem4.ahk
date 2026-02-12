#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystem4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystem4
     * @type {Guid}
     */
    static IID => Guid("{f164ffe5-b987-4ca5-9926-fa0438be6273}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Platform"]

    /**
     * @type {Integer} 
     */
    Platform {
        get => this.get_Platform()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Platform() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
