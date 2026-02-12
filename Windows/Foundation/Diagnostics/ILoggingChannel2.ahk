#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingChannel2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingChannel2
     * @type {Guid}
     */
    static IID => Guid("{9f4c3cf3-0bac-45a5-9e33-baf3f3a246a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id"]

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
