#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IPlatformAutomaticAppSignInManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlatformAutomaticAppSignInManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{1ac9afce-8dd5-5c2d-b420-767d1f3b7d03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Policy"]

    /**
     * @type {Integer} 
     */
    Policy {
        get => this.get_Policy()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Policy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
