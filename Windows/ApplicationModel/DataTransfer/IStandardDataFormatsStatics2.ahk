#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IStandardDataFormatsStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStandardDataFormatsStatics2
     * @type {Guid}
     */
    static IID => Guid("{42a254f4-9d76-42e8-861b-47c25dd0cf71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebLink", "get_ApplicationLink"]

    /**
     * @type {HSTRING} 
     */
    WebLink {
        get => this.get_WebLink()
    }

    /**
     * @type {HSTRING} 
     */
    ApplicationLink {
        get => this.get_ApplicationLink()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WebLink() {
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
    get_ApplicationLink() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
