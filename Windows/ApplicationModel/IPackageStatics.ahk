#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\Package.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageStatics
     * @type {Guid}
     */
    static IID => Guid("{4e534bdf-2960-4878-97a4-9624deb72f2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current"]

    /**
     * @type {Package} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(value)
    }
}
