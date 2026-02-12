#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ISystemDiagnosticInfoStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemDiagnosticInfoStatics2
     * @type {Guid}
     */
    static IID => Guid("{79ded189-6af9-4da9-a422-15f73255b3eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsArchitectureSupported", "get_PreferredArchitecture"]

    /**
     * @type {Integer} 
     */
    PreferredArchitecture {
        get => this.get_PreferredArchitecture()
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {Boolean} 
     */
    IsArchitectureSupported(type) {
        result := ComCall(6, this, "int", type, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredArchitecture() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
