#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IStreamingTextActionEntityTextChangedArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamingTextActionEntityTextChangedArgs
     * @type {Guid}
     */
    static IID => Guid("{2c62011f-3e06-588b-a3bd-d726bd82fb13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Text", "get_IsComplete"]

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
