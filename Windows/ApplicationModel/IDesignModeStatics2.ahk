#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IDesignModeStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesignModeStatics2
     * @type {Guid}
     */
    static IID => Guid("{80cf8137-b064-4858-bec8-3eba22357535}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesignMode2Enabled"]

    /**
     * @type {Boolean} 
     */
    DesignMode2Enabled {
        get => this.get_DesignMode2Enabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DesignMode2Enabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
