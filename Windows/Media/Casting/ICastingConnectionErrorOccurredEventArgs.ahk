#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class ICastingConnectionErrorOccurredEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingConnectionErrorOccurredEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a7fb3c69-8719-4f00-81fb-961863c79a32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ErrorStatus", "get_Message"]

    /**
     * @type {Integer} 
     */
    ErrorStatus {
        get => this.get_ErrorStatus()
    }

    /**
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
