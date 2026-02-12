#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IWebAccountProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProvider2
     * @type {Guid}
     */
    static IID => Guid("{4a01eb05-4e42-41d4-b518-e008a5163614}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayPurpose", "get_Authority"]

    /**
     * @type {HSTRING} 
     */
    DisplayPurpose {
        get => this.get_DisplayPurpose()
    }

    /**
     * @type {HSTRING} 
     */
    Authority {
        get => this.get_Authority()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayPurpose() {
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
    get_Authority() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
