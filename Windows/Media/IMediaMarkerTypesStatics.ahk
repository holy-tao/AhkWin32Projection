#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMediaMarkerTypesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaMarkerTypesStatics
     * @type {Guid}
     */
    static IID => Guid("{bb198040-482f-4743-8832-45853821ece0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bookmark"]

    /**
     * @type {HSTRING} 
     */
    Bookmark {
        get => this.get_Bookmark()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Bookmark() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
