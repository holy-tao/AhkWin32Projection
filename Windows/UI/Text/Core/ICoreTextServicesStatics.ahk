#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextServicesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextServicesStatics
     * @type {Guid}
     */
    static IID => Guid("{91859a46-eccf-47a4-8ae7-098a9c6fbb15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HiddenCharacter"]

    /**
     * @type {Integer} 
     */
    HiddenCharacter {
        get => this.get_HiddenCharacter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HiddenCharacter() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
